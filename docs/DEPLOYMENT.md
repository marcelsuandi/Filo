# Deployment (Ubuntu Server)

## 1. Prerequisites

```bash
sudo apt update && sudo apt upgrade -y

# Install Docker Engine + Compose plugin
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER   # re-login afterwards
```

## 2. Clone & configure

```bash
git clone https://github.com/marcelsuandi/Filo.git
cd Filo
cp .env.example .env
nano .env        # set strong DB passwords, CORS_ORIGIN, etc.
```

## 3. Build & run

```bash
docker compose up -d --build
docker compose ps
```

The site is served on port 80. Put a TLS-terminating proxy (or extend the
nginx service with certbot/Let's Encrypt) in front for HTTPS in production.

## 4. Updating

```bash
git pull
docker compose up -d --build
```

## 5. Logs & maintenance

```bash
docker compose logs -f backend
docker compose restart backend
docker compose down          # stop (keeps data)
docker compose down -v       # stop + delete database volume
```

## Security notes for production

- Set real, strong values for `DB_PASSWORD` and `DB_ROOT_PASSWORD`.
- Restrict `CORS_ORIGIN` to your real domain.
- Do not expose `phpmyadmin` publicly; bind it to localhost or use a firewall.
- Terminate HTTPS at nginx and redirect HTTP -> HTTPS.
