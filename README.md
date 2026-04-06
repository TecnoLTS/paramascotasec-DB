# Base de datos `paramascostas-DB`

Servicio PostgreSQL usado por el stack de ParaMascotas.

## Flujo normal

Script unico:

```bash
cd /home/admincenter/contenedores/paramascostas-DB
./scripts/deploy.sh development
./scripts/deploy.sh production
```

Los scripts `deploy-development.sh` y `deploy-production.sh` siguen existiendo solo por compatibilidad.

## Configuracion

El archivo principal es:

- [.env.example](/home/admincenter/contenedores/paramascostas-DB/.env.example)

Y la logica compartida de scripts vive en:

- [common.sh](/home/admincenter/contenedores/paramascostas-DB/scripts/common.sh)

Variables clave:

- `POSTGRES_USER`
- `POSTGRES_PASSWORD`
- `POSTGRES_DB`
- `POSTGRES_BIND_IP`
  En desarrollo puedes usar `0.0.0.0` para conectarte desde pgAdmin en otra máquina de tu red.
  En producción mantén `127.0.0.1` y entra por túnel SSH o desde la misma máquina.
- `POSTGRES_PORT`
- `BACKUP_ENCRYPTION_PASSPHRASE`

## Backups

Generar snapshot cifrado y detener la DB:

```bash
cd /home/admincenter/contenedores/paramascostas-DB
./scripts/backup-and-stop.sh production
```

## Verificacion

```bash
cd /home/admincenter/contenedores/paramascostas-DB
docker compose ps
docker compose logs -f db
```











Te dejé un script listo en reset_test_data.sh.

Por defecto hace una limpieza segura para pruebas:

borra productos, variantes, imágenes, lotes, compras, pedidos, descuentos y POS
conserva User, Setting y Tenant para no perder acceso ni configuración

Uso normal:
cd /home/admincenter/contenedores/paramascotasec-backend
./scripts/reset_test_data.sh development

Sin confirmación interactiva:
cd /home/admincenter/contenedores/paramascotasec-backend
./scripts/reset_test_data.sh development --yes

Limpieza total, incluyendo usuarios:
cd /home/admincenter/contenedores/paramascotasec-backend
./scripts/reset_test_data.sh development --yes --full
Lo validé con bash -n y --help. Si quieres, el siguiente paso útil es dejar otro script hermano que además vuelva a sembrar datos mínimos de prueba después de limpiar.















---------------------------------------------------------------------------------------------------------------------------
Lista nueva de despliegues

Workspace completo

cd /home/admincenter/contenedores
./scripts/deploy-workspace.sh development
./scripts/deploy-workspace.sh production
paramascotasec

cd /home/admincenter/contenedores/paramascotasec
./scripts/deploy-development.sh
./scripts/deploy-production.sh
paramascotasec-backend

cd /home/admincenter/contenedores/paramascotasec-backend
./scripts/deploy-development.sh
./scripts/deploy-production.sh
Si necesitas instalar dependencias PHP y preparar base de datos:

cd /home/admincenter/contenedores/paramascotasec-backend
RUN_COMPOSER_INSTALL=1 RUN_DB_SETUP=1 ./scripts/deploy-development.sh
RUN_COMPOSER_INSTALL=1 RUN_DB_SETUP=1 ./scripts/deploy-production.sh
paramascostas-DB

cd /home/admincenter/contenedores/paramascostas-DB
./scripts/deploy.sh development
./scripts/deploy.sh production
tecnolts

cd /home/admincenter/contenedores/tecnolts
./scripts/deploy-development.sh
./scripts/deploy-production.sh
gateway

cd /home/admincenter/contenedores/gateway
./scripts/setup-ssl-local.sh
./scripts/deploy-gateway-production.sh
./scripts/renew-letsencrypt.sh
Facturador

cd /home/admincenter/contenedores/Facturador
./scripts/deploy.sh

