# Используем лёгкий официальный образ
FROM nginx:alpine

# Удаляем стандартные HTTP-конфиги nginx
RUN rm -rf /etc/nginx/conf.d/*

# Копируем наш TCP-конфиг (stream proxy)
COPY nginx.conf /etc/nginx/nginx.conf

# Указываем порт, который слушает nginx внутри контейнера
EXPOSE 8080

# Запускаем nginx на переднем плане (требуется Railway)
CMD ["nginx", "-g", "daemon off;"]
