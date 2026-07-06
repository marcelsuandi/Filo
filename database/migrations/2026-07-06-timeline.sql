-- =============================================================================
-- Update tanggal & gambar Timeline Kehamilan. Aman dijalankan berulang.
--   set -a; . ./.env; set +a
--   docker compose exec -T mariadb mariadb -u root -p"$DB_ROOT_PASSWORD" "$DB_NAME" \
--     < database/migrations/2026-07-06-timeline.sql
-- =============================================================================

-- 1) Garis dua pertama -> 6 November 2025
UPDATE pregnancy_timeline
SET event_date = '2025-11-06'
WHERE baby_id = 1 AND title = 'Garis dua pertama';

-- 2) USG pertama -> 8 November 2025
UPDATE pregnancy_timeline
SET event_date = '2025-11-08'
WHERE baby_id = 1 AND title = 'USG pertama';

-- 3) Mengetahui jenis kelamin -> 30 Maret 2026 + ganti gambar
UPDATE pregnancy_timeline
SET event_date = '2026-03-30',
    image_url  = '/filo_6_bulan_(1).jpeg'
WHERE baby_id = 1 AND title = 'Mengetahui jenis kelamin';

-- 4) Hari kelahiran -> 7 Juli 2026
UPDATE pregnancy_timeline
SET event_date = '2026-07-07'
WHERE baby_id = 1 AND title = 'Hari kelahiran';
