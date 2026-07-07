-- =============================================================================
-- Update nama anak, deskripsi (menantikan->menyambut), & hapus ucapan.
--   set -a; . ./.env; set +a
--   docker compose exec -T mariadb mariadb -u root -p"$DB_ROOT_PASSWORD" "$DB_NAME" \
--     < database/migrations/2026-07-06-update.sql
-- =============================================================================

-- 1) Nama lengkap anak
UPDATE babies
SET name = 'Filomena Lioranda Tambing'
WHERE id = 1;

-- 2) Deskripsi: "menantikan" -> "menyambut" (dipakai di Profil & Cerita)
UPDATE babies
SET description = 'Dengan penuh doa dan sukacita, kami menyambut kehadiran putri kecil kami, Filomena.'
WHERE id = 1;

-- 3) Hapus SEMUA ucapan pengunjung (kosongkan tabel greetings utk bayi ini)
DELETE FROM greetings WHERE baby_id = 1;
