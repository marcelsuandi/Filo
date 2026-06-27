-- =============================================================================
-- Filomena — Seed Data
-- Minimal, realistic starter data. Runs after 02-schema.sql on first startup.
-- Remove this file if you do not want sample rows in production.
-- =============================================================================
SET NAMES utf8mb4;

-- 1) Baby ---------------------------------------------------------------------
INSERT INTO babies
  (id, slug, name, birth_date, birth_time, weight_grams, length_cm, birth_place, birth_city, description)
VALUES
  (1, 'filomena', 'Filomena', '2026-05-10', '08:42:00', 3200, 49.5,
   'RS Bunda Jakarta', 'Jakarta',
   'Selamat datang ke dunia, Filomena. Hadiah terindah untuk keluarga kami.');

-- 7) Parents ------------------------------------------------------------------
INSERT INTO parents
  (baby_id, role, full_name, nickname, instagram_handle, sort_order)
VALUES
  (1, 'father', 'Marcel Suandi', 'Papa', 'marcelsuandi', 1),
  (1, 'mother', 'Maria Suandi',  'Mama', NULL, 2);

-- 4) Pregnancy timeline -------------------------------------------------------
INSERT INTO pregnancy_timeline
  (baby_id, title, description, event_date, week_number, sort_order)
VALUES
  (1, 'Garis dua pertama', 'Hari kami tahu kamu hadir.', '2025-09-01', 5,  1),
  (1, 'USG pertama',       'Detak jantung pertama terdengar.', '2025-10-15', 12, 2),
  (1, 'Mengetahui jenis kelamin', 'Ternyata kamu perempuan!', '2025-12-20', 20, 3),
  (1, 'Hari kelahiran',    'Filomena lahir dengan sehat.', '2026-05-10', 40, 4);

-- 2) Gallery ------------------------------------------------------------------
INSERT INTO gallery_photos
  (baby_id, image_url, thumbnail_url, caption, sort_order, is_featured)
VALUES
  (1, '/uploads/gallery/filo-01.jpg', '/uploads/gallery/thumbs/filo-01.jpg', 'Pertama kali di rumah', 1, 1),
  (1, '/uploads/gallery/filo-02.jpg', '/uploads/gallery/thumbs/filo-02.jpg', 'Tidur pulas',           2, 0),
  (1, '/uploads/gallery/filo-03.jpg', '/uploads/gallery/thumbs/filo-03.jpg', 'Senyum kecil',          3, 0);

-- 6) Music --------------------------------------------------------------------
INSERT INTO music_tracks
  (baby_id, title, artist, file_url, is_active, sort_order)
VALUES
  (1, 'Lullaby', 'Instrumental', '/uploads/music/lullaby.mp3', 1, 1);

-- 8) Gifts --------------------------------------------------------------------
INSERT INTO gifts
  (baby_id, type, provider_name, account_name, account_number, qris_image_url, note, sort_order)
VALUES
  (1, 'bank_transfer', 'BCA',  'Marcel Suandi', '1234567890', NULL, 'Terima kasih atas doa dan kasihnya.', 1),
  (1, 'e_wallet',      'GoPay','Marcel Suandi', '081234567890', NULL, NULL, 2),
  (1, 'qris',          'QRIS', 'Keluarga Suandi', NULL, '/uploads/gift/qris.png', 'Scan untuk memberi hadiah.', 3);

-- 5) Greetings ----------------------------------------------------------------
INSERT INTO greetings
  (baby_id, guest_name, guest_relation, message, status)
VALUES
  (1, 'Tante Rina', 'Keluarga', 'Selamat ya! Semoga Filomena tumbuh sehat dan bahagia.', 'approved'),
  (1, 'Budi',       'Teman Papa', 'Welcome to the world, little one!', 'approved'),
  (1, 'Anonim',     NULL, 'Doa terbaik untuk Filomena dan keluarga.', 'pending');

-- 5) Visitor logs (sample) ----------------------------------------------------
INSERT INTO visitor_logs
  (baby_id, session_id, page_path, country, visited_at)
VALUES
  (1, 'a1b2c3d4-0001-0000-0000-000000000001', '/', 'Indonesia', '2026-05-11 09:00:00'),
  (1, 'a1b2c3d4-0001-0000-0000-000000000001', '/gallery', 'Indonesia', '2026-05-11 09:02:00'),
  (1, 'a1b2c3d4-0002-0000-0000-000000000002', '/', 'Indonesia', '2026-05-11 10:15:00');
