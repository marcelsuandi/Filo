import 'dotenv/config';

const config = {
  env: process.env.NODE_ENV || 'development',
  port: parseInt(process.env.PORT, 10) || 3000,
  cors: {
    origin:
      process.env.CORS_ORIGIN && process.env.CORS_ORIGIN !== '*'
        ? process.env.CORS_ORIGIN.split(',').map((o) => o.trim())
        : '*',
  },
  db: {
    host: process.env.DB_HOST || 'localhost',
    port: parseInt(process.env.DB_PORT, 10) || 3306,
    name: process.env.DB_NAME || 'filo_db',
    user: process.env.DB_USER || 'filo_user',
    password: process.env.DB_PASSWORD || '',
    dialect: process.env.DB_DIALECT || 'mariadb',
    sync: String(process.env.DB_SYNC).toLowerCase() === 'true',
  },
  app: {
    ipHashSalt: process.env.IP_HASH_SALT || 'filo-default-salt',
    defaultBabySlug: process.env.DEFAULT_BABY_SLUG || 'filomena',
  },
};

export default config;
