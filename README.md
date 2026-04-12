# paramascostas-DB (Capa de Base de Datos) 🐘

Contenedor que provisiona la versión Postgres al resto de microservicios usando túneles seguros dedicados.

## 🏭 1. Entorno de Producción
Prioriza máxima seguridad restringiendo los saltos de IPs a lo estrictamente interno.

```bash
cd /home/admincenter/contenedores/paramascostas-DB
./scripts/deploy-production.sh
```

---

## 🛠️ 2. Entorno de Desarrollo
Extiende un canal abierto para visores externos o desarrolladores conectados por red de LAN/VPN.

```bash
cd /home/admincenter/contenedores/paramascostas-DB
./scripts/deploy-development.sh
```

---

## 📌 3. Datos Relevantes y Contexto a Tomar en Cuenta

### 🔒 Backups y Restauración (Snapshots Asegurados)
El proceso de captura y recuperación de datos es vital y está completamente automatizado, pero requiere tu atención:

**A) Proceso para sacar un Snapshot (Backup Cifrado):**
Para resguardar el ecosistema de la base de datos de manera inviolable (cifrado AES) antes de hacer actualizaciones peligrosas del servidor, se ejecuta el siguiente comando:
```bash
cd /home/admincenter/contenedores/paramascostas-DB
./scripts/backup-and-stop.sh production
```
*Este proceso generará un snapshot encapsulado y luego detendrá la base de datos de forma segura para evitar escritura residual.*

**B) Proceso para levantar la DB usando el Snapshot (Restauración):**
Si el servidor fue formateado, la base de datos destruida (por ejemplo usando `docker volume rm`) o estás clonando el servidor en otra máquina, **la restauración se hace de forma auto-mágica al levantar el sistema por primera vez**.

No necesitas comandos manuales de importación de SQL; el proceso es simplemente desplegar el entorno en una base limpia:
```bash
cd /home/admincenter/contenedores/paramascostas-DB
./scripts/deploy-development.sh   # O deploy-production.sh
```
*¿Qué ocurre internamente?*
1. Al levantar, el motor Postgres notará que no tiene volumen (tablas en cero).
2. Buscará automáticamente si existe el snapshot maestro almacenado en `/backups/backup.sql.enc`.
3. Pedirá desencriptar el archivo (si la llave existe en las variables).
4. **Levantará e inyectará absolutamente toda la información estructurada que guardaste.**

### 🌐 Bind IP y Acceso a Base de Datos
*   **Modo Local (Development):** Variable `POSTGRES_BIND_IP=0.0.0.0` para poder espiarla con software (e.g., DBeaver o PgAdmin).
*   **Modo Producción:** Enquista herméticamente la comunicación bajo capa local cruzando en IP unida `127.0.0.1`.
*   Para revisar los logs si la restauración falla:
    ```bash
    docker compose logs -f db
    ```
