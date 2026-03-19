#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
BACKUP_FILE="${BACKUP_FILE:-${APP_DIR}/backups/backup.sql.enc}"
DATA_DIR="${DATA_DIR:-${APP_DIR}/postgres16_data}"

ensure_prereqs() {
  if ! command -v docker >/dev/null 2>&1; then
    echo "docker no esta instalado"
    exit 1
  fi

  if ! docker compose version >/dev/null 2>&1; then
    echo "docker compose no esta disponible"
    exit 1
  fi

  if ! command -v openssl >/dev/null 2>&1; then
    echo "openssl no esta instalado"
    exit 1
  fi

  if ! docker network inspect edge >/dev/null 2>&1; then
    docker network create edge >/dev/null
  fi
}

resolve_env_file() {
  local mode="${1:-production}"

  if [[ "${mode}" == "development" && -f "${APP_DIR}/.env.development" ]]; then
    printf '%s\n' "${APP_DIR}/.env.development"
    return 0
  fi

  if [[ "${mode}" == "production" && -f "${APP_DIR}/.env.production" ]]; then
    printf '%s\n' "${APP_DIR}/.env.production"
    return 0
  fi

  if [[ -f "${APP_DIR}/.env" ]]; then
    printf '%s\n' "${APP_DIR}/.env"
    return 0
  fi

  if [[ -f "${APP_DIR}/.env.example" ]]; then
    cp "${APP_DIR}/.env.example" "${APP_DIR}/.env"
    echo "Se creo ${APP_DIR}/.env desde .env.example. Ajusta credenciales si hace falta."
    printf '%s\n' "${APP_DIR}/.env"
    return 0
  fi

  echo "No se encontro .env ni .env.example en ${APP_DIR}" >&2
  exit 1
}

load_env_file() {
  local env_file="$1"

  set -a
  # shellcheck disable=SC1090
  source "${env_file}"
  set +a

  : "${POSTGRES_USER:?Falta POSTGRES_USER en ${env_file}}"
  : "${POSTGRES_PASSWORD:?Falta POSTGRES_PASSWORD en ${env_file}}"
  : "${POSTGRES_DB:?Falta POSTGRES_DB en ${env_file}}"
  : "${BACKUP_ENCRYPTION_PASSPHRASE:?Falta BACKUP_ENCRYPTION_PASSPHRASE en ${env_file}}"
}

compose_cmd() {
  local env_file="$1"
  shift

  (
    cd "${APP_DIR}"
    docker compose --env-file "${env_file}" "$@"
  )
}

wait_for_db() {
  local env_file="$1"
  local attempts="${2:-60}"
  local i

  for ((i = 1; i <= attempts; i++)); do
    if compose_cmd "${env_file}" exec -T db pg_isready -U "${POSTGRES_USER}" -d postgres >/dev/null 2>&1; then
      return 0
    fi
    sleep 1
  done

  echo "PostgreSQL no quedo listo a tiempo" >&2
  exit 1
}

reset_data_dir() {
  mkdir -p "${DATA_DIR}"

  if [[ "${DATA_DIR}" == "/" || "${DATA_DIR}" == "${APP_DIR}" || "${DATA_DIR}" == "" ]]; then
    echo "DATA_DIR invalido: ${DATA_DIR}" >&2
    exit 1
  fi

  find "${DATA_DIR}" -mindepth 1 -maxdepth 1 -exec rm -rf -- {} +
}

normalize_dump_stream() {
  sed \
    -e '/^DROP ROLE IF EXISTS postgres;$/d' \
    -e '/^CREATE ROLE postgres;$/d' \
    -e '/^ALTER ROLE postgres WITH /d'
}

encrypt_backup_stream() {
  openssl enc -aes-256-cbc -pbkdf2 -salt -pass env:BACKUP_ENCRYPTION_PASSPHRASE
}

decrypt_backup_stream() {
  openssl enc -d -aes-256-cbc -pbkdf2 -pass env:BACKUP_ENCRYPTION_PASSPHRASE
}
