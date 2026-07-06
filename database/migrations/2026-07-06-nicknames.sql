-- =============================================================================
-- Update nickname orang tua & dokter + pastikan musik. Aman diulang.
--   set -a; . ./.env; set +a
--   docker compose exec -T mariadb mariadb -u root -p"$DB_ROOT_PASSWORD" "$DB_NAME" \
--     < database/migrations/2026-07-06-nicknames.sql
-- =============================================================================

UPDATE parents SET nickname = 'Marcel'   WHERE baby_id = 1 AND role = 'father';
UPDATE parents SET nickname = 'Nada'     WHERE baby_id = 1 AND role = 'mother';
UPDATE parents SET nickname = 'dr. Febri' WHERE baby_id = 1 AND role = 'doctor';

-- Pastikan lagu latar menunjuk file yang benar (bila belum dijalankan)
UPDATE music_tracks
SET title = 'Never Grow Up', artist = 'Taylor Swift',
    file_url = '/music/Taylor_Swift_-_Never_Grow_Up.mp3', is_active = 1
WHERE baby_id = 1;
INSERT INTO music_tracks (baby_id, title, artist, file_url, is_active, sort_order)
SELECT 1, 'Never Grow Up', 'Taylor Swift', '/music/Taylor_Swift_-_Never_Grow_Up.mp3', 1, 1
WHERE NOT EXISTS (SELECT 1 FROM music_tracks WHERE baby_id = 1);
