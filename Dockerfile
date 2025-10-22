FROM nginx:latest

# Удаляем стандартную конфигурацию
RUN rm /etc/nginx/conf.d/default.conf

# Копируем свои конфиги
COPY nginx2.conf /etc/nginx/nginx.conf
COPY health.conf /etc/nginx/conf.d/health.conf
COPY proxy.conf /etc/nginx/conf.d/proxy.conf

# Контейнер слушает 8080
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
