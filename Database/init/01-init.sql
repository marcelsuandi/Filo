-- =============================================================================
-- Database initialisation
-- This script runs automatically on FIRST MariaDB container startup
-- (mounted into /docker-entrypoint-initdb.d). The database itself and the
-- application user are created by the MariaDB image from environment vars,
-- so here we only set defaults and reserve space for future schema/seeds.
-- =============================================================================

-- Ensure UTF-8 (full unicode, incl. emoji) for the application database.
ALTER DATABASE `filo_db`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

-- No tables yet — foundation only.
-- Future migrations / schema definitions go here or in numbered files
-- such as 02-schema.sql, 03-seed.sql, executed in alphabetical order.
