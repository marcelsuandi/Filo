# Local Development

You can develop with hot reload **without** Docker for frontend/backend, while
optionally running MariaDB in Docker.

## Database only (Docker)

```bash
cp .env.example .env
docker compose up -d mariadb phpmyadmin
```

## Backend

```bash
cd backend
cp .env.example .env       # set DB_HOST=localhost
npm install
npm run dev                # http://localhost:3000  (node --watch)
```

## Frontend

```bash
cd frontend
cp .env.example .env
npm install
npm run dev                # http://localhost:5173 (Vite, proxies /api)
```

Vite proxies `/api` to `http://localhost:3000`, so the frontend and backend
talk to each other exactly as they do behind nginx in production.
