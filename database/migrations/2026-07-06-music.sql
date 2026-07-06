-- =============================================================================
-- Set lagu latar ke file yang sudah diupload. Aman dijalankan berulang.
--   set -a; . ./.env; set +a
--   docker compose exec -T mariadb mariadb -u root -p"$DB_ROOT_PASSWORD" "$DB_NAME" \
--     < database/migrations/2026-07-06-music.sql
-- =============================================================================

UPDATE music_tracks
SET title    = 'Never Grow Up',
    artist   = 'Taylor Swift',
    file_url = '/music/Taylor_Swift_-_Never_Grow_Up.mp3',
    is_active = 1
WHERE baby_id = 1;

-- Bila belum ada baris musik sama sekali, buat satu.
INSERT INTO music_tracks (baby_id, title, artist, file_url, is_active, sort_order)
SELECT 1, 'Never Grow Up', 'Taylor Swift',
       '/music/Taylor_Swift_-_Never_Grow_Up.mp3', 1, 1
WHERE NOT EXISTS (SELECT 1 FROM music_tracks WHERE baby_id = 1);
