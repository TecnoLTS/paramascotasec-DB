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
