-- =============================================================================
-- Data pra-kelahiran Filomena (menggantikan 2026-07-02-doctor-data.sql;
-- sudah mencakup dokter). Aman dijalankan berulang.
-- Cara pakai (dari root repo di server, stack harus RUNNING):
--   set -a; . ./.env; set +a
--   docker compose exec -T mariadb mariadb -u root -p"$DB_ROOT_PASSWORD" "$DB_NAME" \
--     < database/migrations/2026-07-02-prelaunch-data.sql
-- =============================================================================

-- 1) Role 'doctor' (tidak berefek bila sudah ada)
ALTER TABLE parents
  MODIFY role ENUM('mother','father','guardian','doctor') NOT NULL;

-- 2) Profil bayi: rencana lahir 7 Juli 2026 di RS Mitra Keluarga Jatiasih.
--    Jam/berat/panjang dikosongkan (belum lahir) -> otomatis tersembunyi di situs.
UPDATE babies
SET birth_date   = '2026-07-07',
    birth_time   = NULL,
    weight_grams = NULL,
    length_cm    = NULL,
    birth_place  = 'RS Mitra Keluarga Jatiasih',
    birth_city   = 'Bekasi',
    description  = 'Dengan penuh doa dan sukacita, kami menantikan kehadiran putri kecil kami, Filomena.'
WHERE id = 1;

-- 3) Nama lengkap orang tua + foto (file /papa.jpg & /mama.jpg sudah di repo)
UPDATE parents SET full_name = 'Marcel Suandi Tambing',    photo_url = '/papa.jpg'
WHERE baby_id = 1 AND role = 'father';

UPDATE parents SET full_name = 'Priscilla Frananda Rumabi', photo_url = '/mama.jpg'
WHERE baby_id = 1 AND role = 'mother';

-- 4) Dokter (dilewati bila sudah pernah dimasukkan)
INSERT INTO parents (baby_id, role, full_name, nickname, photo_url, bio, sort_order)
SELECT 1, 'doctor',
       'dr. Febri Rahadian, Sp.OG, M.Kes.',
       'Spesialis Obstetri & Ginekologi',
       '/dokter.jpg',
       'Dokter kandungan RS Mitra Keluarga Jatiasih yang akan menangani persalinan Filomena.',
       10
WHERE NOT EXISTS (
  SELECT 1 FROM parents
  WHERE baby_id = 1 AND role = 'doctor'
    AND full_name = 'dr. Febri Rahadian, Sp.OG, M.Kes.'
);
