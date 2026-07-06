-- =============================================================================
-- Update konten Filomena (pra-kelahiran) — aman dijalankan berulang.
-- Cara pakai (stack HARUS running):
--   set -a; . ./.env; set +a
--   docker compose exec -T mariadb mariadb -u root -p"$DB_ROOT_PASSWORD" "$DB_NAME" \
--     < database/migrations/2026-07-06-content-update.sql
-- =============================================================================

-- 1) Role dokter
ALTER TABLE parents
  MODIFY role ENUM('mother','father','guardian','doctor') NOT NULL;

-- 2) Profil bayi: rencana lahir 7 Juli 2026 @ RS Mitra Keluarga Jatiasih
UPDATE babies
SET birth_date   = '2026-07-07',
    birth_time   = NULL,
    weight_grams = NULL,
    length_cm    = NULL,
    birth_place  = 'RS Mitra Keluarga Pratama Jatiasih',
    birth_city   = 'Bekasi',
    description  = 'Dengan penuh doa dan sukacita, kami menantikan kehadiran putri kecil kami, Filomena.'
WHERE id = 1;

-- 3) Orang tua (nama lengkap + foto)
UPDATE parents SET full_name = 'Marcel Suandi Tambing',     photo_url = '/papa.jpg'
WHERE baby_id = 1 AND role = 'father';
UPDATE parents SET full_name = 'Priscilla Frananda Rumabi', photo_url = '/mama.jpg'
WHERE baby_id = 1 AND role = 'mother';

-- 4) Dokter (guarded — tidak dobel)
INSERT INTO parents (baby_id, role, full_name, nickname, photo_url, bio, sort_order)
SELECT 1, 'doctor',
       'dr. Febri Rahadian, Sp.OG, M.Kes.',
       'Spesialis Obstetri & Ginekologi',
       '/dokter.jpg',
       'Dokter kandungan RS Mitra Keluarga Jatiasih yang akan menangani persalinan Filomena.',
       10
WHERE NOT EXISTS (
  SELECT 1 FROM parents
  WHERE baby_id = 1 AND role = 'doctor' AND full_name = 'dr. Febri Rahadian, Sp.OG, M.Kes.'
);

-- 5) Timeline: pasang foto 6 bulan pada momen "Mengetahui jenis kelamin"
UPDATE pregnancy_timeline SET image_url = '/filo_6_bulan.jpeg'
WHERE baby_id = 1 AND title = 'Mengetahui jenis kelamin';

-- 6) Galeri: buang foto seed yang rusak (path /uploads/... tidak ada), isi foto asli
DELETE FROM gallery_photos WHERE baby_id = 1 AND image_url LIKE '/uploads/gallery/%';
INSERT INTO gallery_photos (baby_id, image_url, caption, sort_order, is_featured, is_published)
SELECT 1, '/filo_6_bulan.jpeg', 'Filomena 6 bulan dalam kandungan', 1, 1, 1
WHERE NOT EXISTS (
  SELECT 1 FROM gallery_photos WHERE baby_id = 1 AND image_url = '/filo_6_bulan.jpeg'
);
