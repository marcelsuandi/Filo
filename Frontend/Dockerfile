# =============================================================================
# Frontend Dockerfile - build Vue with Vite, serve static files with Nginx
# =============================================================================

# ---- Stage 1: build ----
FROM node:20-alpine AS build
WORKDIR /app

# Install dependencies (cached layer)
COPY package*.json ./
RUN npm install

# Build-time API base URL (passed from docker-compose)
ARG VITE_API_BASE_URL=/api
ENV VITE_API_BASE_URL=$VITE_API_BASE_URL

# Build
COPY . .
RUN npm run build

# ---- Stage 2: serve ----
FROM nginx:1.27-alpine AS serve
# SPA-friendly nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf
# Static build output
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
