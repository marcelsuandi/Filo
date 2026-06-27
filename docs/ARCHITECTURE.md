# Architecture

## Overview

Filomena is a containerised full-stack application. A single Nginx reverse
proxy is the public entry point and routes traffic to the frontend and the
backend API. The backend talks to MariaDB.

```
                         ┌─────────────────────────────┐
   Browser  ───►  :80    │           nginx             │  (reverse proxy)
                         │   /        ─► frontend:80    │
                         │   /api/    ─► backend:3000   │
                         └──────┬───────────────┬───────┘
                                │               │
                       ┌────────▼──────┐ ┌──────▼────────┐
                       │   frontend    │ │    backend    │
                       │  Vue + Nginx  │ │ Express (MVC) │
                       └───────────────┘ └──────┬────────┘
                                                 │
                                          ┌──────▼────────┐
                                          │   mariadb     │
                                          └──────┬────────┘
                                                 │
                                          ┌──────▼────────┐
                                          │  phpmyadmin   │  :8080
                                          └───────────────┘
```

## Components

| Service     | Tech                         | Internal port | Public port |
|-------------|------------------------------|---------------|-------------|
| nginx       | Nginx (reverse proxy)        | 80            | 80          |
| frontend    | Vue 3 + Vite, served by Nginx| 80            | —           |
| backend     | Node.js + Express (MVC)      | 3000          | —           |
| mariadb     | MariaDB 11                   | 3306          | —           |
| phpmyadmin  | phpMyAdmin                   | 80            | 8080        |

Only `nginx` (80) and `phpmyadmin` (8080) are exposed to the host. Everything
else communicates over the private `filo_network` bridge.

## Backend (MVC)

```
backend/src/
├── config/        # configuration + database pool
├── controllers/   # request handlers (the "C")
├── models/        # data access layer (the "M")
├── routes/        # URL -> controller mapping
├── middlewares/   # cross-cutting concerns (errors, 404, ...)
├── utils/         # helpers (logger, ApiError)
├── app.js         # Express app wiring
└── server.js      # process entry point
```

Views ("V") in this REST API are JSON responses produced by controllers;
the visual layer lives entirely in the Vue frontend.
