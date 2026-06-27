import axios from 'axios';

// Pre-configured Axios instance. Components/stores import this, not axios.
const http = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL || '/api',
  timeout: 15000,
  headers: {
    'Content-Type': 'application/json',
  },
});

// Response interceptor: normalise errors in one place.
http.interceptors.response.use(
  (response) => response,
  (error) => {
    // Centralised error handling hook (logging, auth redirect, etc.)
    return Promise.reject(error);
  }
);

export default http;
