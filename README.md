# Base de datos `paramascostas-DB`

Servicio PostgreSQL usado por el stack de ParaMascotas.

## Flujo normal

Desarrollo:

```bash
cd /home/admincenter/contenedores/paramascostas-DB
./scripts/deploy-development.sh
```

Produccion:

```bash
cd /home/admincenter/contenedores/paramascostas-DB
./scripts/deploy-production.sh
```

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