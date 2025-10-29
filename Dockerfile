FROM nginx:alpine

# Удаляем дефолтные конфиги
RUN rm -rf /etc/nginx/conf.d/*

# Копируем наш конфиг
COPY nginx.conf /etc/nginx/nginx.conf

# Добавляем healthcheck (опционально)
HEALTHCHECK CMD wget -qO- http://127.0.0.1:${PORT:-8080}/ || exit 1

# Основной процесс — foreground (важно для Railway)
CMD ["nginx", "-g", "daemon off;"]
