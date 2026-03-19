# Base de datos (`paramascostas-DB`)

Servicio PostgreSQL usado por frontend/backend de Paramascotas.

## Requisitos
- Docker y Docker Compose.
- Red Docker `edge` creada:

```bash
docker network create edge || true
```

## Variables de entorno
Crea `.env` desde `.env.example` en este directorio. Ese archivo es la unica fuente de verdad para:
- `POSTGRES_USER`
- `POSTGRES_PASSWORD`
- `POSTGRES_DB`
- `POSTGRES_BIND_IP`
- `POSTGRES_PORT`

Configuracion recomendada:

```env
POSTGRES_USER=postgres
POSTGRES_PASSWORD=change-this-to-a-strong-password
POSTGRES_DB=paramascotasec
POSTGRES_BIND_IP=127.0.0.1
POSTGRES_PORT=5432
BACKUP_ENCRYPTION_PASSPHRASE=change-this-to-a-long-random-passphrase
```

La exposicion recomendada es `127.0.0.1`. Si necesitas acceso remoto, hazlo por tunel SSH o VPN; no dejes PostgreSQL publicado abiertamente por defecto.

## Despliegue en desarrollo
Desde `/home/admincenter/contenedores/paramascostas-DB`:

```bash
./scripts/deploy-development.sh
```

## Despliegue en produccion
Desde `/home/admincenter/contenedores/paramascostas-DB`:

```bash
./scripts/deploy-production.sh
```

Nota: en este proyecto no hay perfiles separados; dev/prod se diferencian por credenciales, backups y politicas operativas del servidor.

## Versionado de datos
El estado compartible del cluster se guarda en `backups/backup.sql.enc` y si se versiona en Git.
El snapshot mantiene todos los datos y se cifra con `BACKUP_ENCRYPTION_PASSPHRASE`. El restore lo descifra al vuelo; el `.env` real nunca se versiona.

Para capturar un snapshot completo del cluster y apagar la DB:

```bash
./scripts/backup-and-stop.sh production
```

Para levantar el servicio desde cero y restaurar exactamente ese snapshot:

```bash
./scripts/deploy-production.sh
```

El despliegue borra el contenido de `postgres16_data/`, recrea el cluster y restaura `backups/backup.sql`.

## Verificacion y logs
```bash
docker compose ps
docker compose logs -f db
docker exec -it next-test-db pg_isready -U "$(grep '^POSTGRES_USER=' .env | cut -d= -f2-)"
```





Workspace completo en /home/admincenter/contenedores:

cd /home/admincenter/contenedores
./scripts/deploy-workspace.sh development
./scripts/deploy-workspace.sh production


-----------------------------------------------------------------------------
# Base de datos: generar snapshot completo del cluster y detener el servicio
cd /home/admincenter/contenedores/paramascostas-DB
./scripts/backup-and-stop.sh production

# Base de datos: levantar PostgreSQL desde cero y restaurar backups/backup.sql
cd /home/admincenter/contenedores/paramascostas-DB
./scripts/deploy-production.sh
-----------------------------------------------------------------------------


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
