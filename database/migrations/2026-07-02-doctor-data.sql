-- =============================================================================
-- Data dokter + koreksi lokasi lahir (dijalankan MANUAL pada database berjalan)
-- Aman dijalankan lebih dari sekali:
--   - ALTER: tidak berefek jika enum sudah memuat 'doctor'
--   - INSERT: dilewati jika dr. Febri sudah ada di tabel
-- Cara pakai (dari root repo di server):
--   set -a; . ./.env; set +a
--   docker compose exec -T mariadb mariadb -u root -p"$DB_ROOT_PASSWORD" "$DB_NAME" \
--     < database/migrations/2026-07-02-doctor-data.sql
-- =============================================================================

ALTER TABLE parents
  MODIFY role ENUM('mother','father','guardian','doctor') NOT NULL;

INSERT INTO parents (baby_id, role, full_name, nickname, photo_url, bio, sort_order)
SELECT 1, 'doctor',
       'dr. Febri Rahadian, Sp.OG, M.Kes.',
       'Spesialis Obstetri & Ginekologi',
       '/dokter.jpg',
       'Dokter kandungan RS Mitra Keluarga Jatiasih yang menangani kehamilan hingga persalinan Filomena.',
       10
WHERE NOT EXISTS (
  SELECT 1 FROM parents
  WHERE baby_id = 1 AND role = 'doctor'
    AND full_name = 'dr. Febri Rahadian, Sp.OG, M.Kes.'
);

UPDATE babies
SET birth_place = 'RS Mitra Keluarga Jatiasih',
    birth_city  = 'Bekasi'
WHERE id = 1;
