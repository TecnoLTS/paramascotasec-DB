# Base de datos `paramascostas-DB`

Servicio PostgreSQL usado por el stack de ParaMascotas.

## Flujo normal

Script único:

```bash
cd /home/admincenter/contenedores/paramascostas-DB
./scripts/deploy.sh development
./scripts/deploy.sh production
```

Los scripts `deploy-development.sh` y `deploy-production.sh` siguen existiendo solo por compatibilidad.

## Configuración

Archivo principal:
- `.env`

Base de referencia:
- [.env.example](/home/admincenter/contenedores/paramascostas-DB/.env.example)

Lógica compartida:
- [common.sh](/home/admincenter/contenedores/paramascostas-DB/scripts/common.sh)

Variables clave:
- `POSTGRES_USER`
- `POSTGRES_PASSWORD`
- `POSTGRES_DB`
- `POSTGRES_BIND_IP`
- `POSTGRES_PORT`
- `BACKUP_ENCRYPTION_PASSPHRASE`

Recomendación:
- en desarrollo usa `POSTGRES_BIND_IP=0.0.0.0` si te conectarás desde otra máquina de tu red;
- en producción mantén `127.0.0.1`.

## Backups

Generar snapshot cifrado y detener la DB:

```bash
cd /home/admincenter/contenedores/paramascostas-DB
./scripts/backup-and-stop.sh production
```

## Verificación

```bash
cd /home/admincenter/contenedores/paramascostas-DB
docker compose ps
docker compose logs -f db
```



Qué hace:

borra Order, OrderItem, PosShift, PosMovement
borra InventoryLotAllocation
borra DiscountAudit ligado a pedidos
borra AuthSecurityEvent de order_pricing_tamper
restaura cada lote a initial_quantity
recompone Product.quantity desde lotes
pone Product.sold = 0
deja intactos catálogo, compras, usuarios, settings y tenants
Uso:

cd /home/admincenter/contenedores/paramascotasec-backend
./scripts/reset_sales_data.sh development


Sin confirmación interactiva:
cd /home/admincenter/contenedores/paramascotasec-backend
./scripts/reset_sales_data.sh development --yes

