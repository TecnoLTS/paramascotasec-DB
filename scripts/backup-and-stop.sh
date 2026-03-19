#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=./common.sh
source "${SCRIPT_DIR}/common.sh"

umask 077

MODE="${1:-production}"
ENV_FILE="$(resolve_env_file "${MODE}")"

ensure_prereqs
load_env_file "${ENV_FILE}"

TMP_FILE="${BACKUP_FILE}.tmp"
mkdir -p "$(dirname "${BACKUP_FILE}")"

echo "Levantando PostgreSQL para exportar el cluster..."
compose_cmd "${ENV_FILE}" up -d --remove-orphans db
wait_for_db "${ENV_FILE}"

echo "Generando snapshot completo cifrado en ${BACKUP_FILE}..."
compose_cmd "${ENV_FILE}" exec -T db pg_dumpall -U "${POSTGRES_USER}" --clean --if-exists | normalize_dump_stream | encrypt_backup_stream > "${TMP_FILE}"
mv "${TMP_FILE}" "${BACKUP_FILE}"
chmod 600 "${BACKUP_FILE}"

echo "Apagando servicio de base de datos..."
compose_cmd "${ENV_FILE}" down --remove-orphans

echo "Snapshot listo y servicio detenido"
