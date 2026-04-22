FROM alpine:latest

# Устанавливаем библиотеку совместимости
RUN apk add --no-cache gcompat ca-certificates

# Копируем файл (имя теперь в точности как ты загрузил)
COPY lionheart-1.3-linux-x64 /lionheart

# Даем права на запуск
RUN chmod +x /lionheart

# Запуск сервера
CMD /lionheart -server -listen :$PORT -forward 127.0.0.1:8080 -smart-key ${SMART_KEY:-default}
