# --- Stage 1: Build ---
FROM node:18-slim AS builder
WORKDIR /app

# Gunakan cache untuk npm install
COPY package*.json ./
RUN npm ci

# Copy semua file dan build
COPY . .
RUN npm run build

# --- Stage 2: Production (Nginx) ---
FROM nginx:alpine AS runner

# Salin hasil build Astro ke folder standar Nginx
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy custom config jika ingin menangani routing (Opsional)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# run perintah berikut untuk membangun image:
# docker build -t cv-astro .
# docker run -d -p 3000:80 --name cv-astro-app cv-astro

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
