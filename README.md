# Base de datos (`paramascostas-DB`)

Servicio PostgreSQL usado por frontend/backend de Paramascotas.

## Requisitos
- Docker y Docker Compose.
- Red Docker `edge` creada:

```bash
docker network create edge || true
```

## Variables de entorno
Crea un `.env` en este directorio (opcional) para sobreescribir:
- `POSTGRES_USER`
- `POSTGRES_PASSWORD`
- `POSTGRES_DB`

## Despliegue en desarrollo
Desde `/home/admincenter/contenedores/paramascostas-DB`:

```bash
docker compose up -d --build
```

## Despliegue en produccion
Desde `/home/admincenter/contenedores/paramascostas-DB`:

```bash
docker compose up -d --build
```

Nota: en este proyecto no hay perfiles separados; dev/prod se diferencian por credenciales, backups y politicas operativas del servidor.

## Verificacion y logs
```bash
docker compose ps
docker compose logs -f db
docker exec -it next-test-db pg_isready -U ${POSTGRES_USER:-postgres}
```





Workspace completo en /home/admincenter/contenedores:

cd /home/admincenter/contenedores
./scripts/deploy-workspace.sh development
./scripts/deploy-workspace.sh production
paramascotasec:

cd /home/admincenter/contenedores/paramascotasec
./scripts/deploy-development.sh
./scripts/deploy-production.sh
paramascotasec-backend:

cd /home/admincenter/contenedores/paramascotasec-backend
./scripts/deploy-development.sh
./scripts/deploy-production.sh
RUN_COMPOSER_INSTALL=1 RUN_DB_BOOTSTRAP=1 ./scripts/deploy-development.sh
RUN_COMPOSER_INSTALL=1 RUN_DB_BOOTSTRAP=1 ./scripts/deploy-production.sh
tecnolts:

cd /home/admincenter/contenedores/tecnolts
./scripts/deploy-development.sh
./scripts/deploy-production.sh
gateway:

cd /home/admincenter/contenedores/gateway
./scripts/setup-ssl-local.sh
./scripts/deploy-gateway-production.sh
./scripts/renew-letsencrypt.sh

