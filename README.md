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
