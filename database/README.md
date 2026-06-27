# Database

MariaDB schema, initialisation scripts, and migrations.

## Initialisation order

Files in `init/` are executed by the MariaDB container in alphabetical order
**only on the first run** (i.e. when the `mariadb_data` volume is empty):

- `01-init.sql` — charset/collation defaults.

Add further numbered files for schema and seed data, e.g. `02-schema.sql`.

## Resetting the database

```bash
docker compose down -v   # WARNING: -v deletes the data volume
docker compose up -d
```
