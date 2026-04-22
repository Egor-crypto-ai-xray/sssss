FROM alpine:latest

# Устанавливаем библиотеку совместимости
RUN apk add --no-cache gcompat ca-certificates

# Просто копируем файл, который ты только что загрузил в GitHub
COPY lionheart-1.3-linux-amd64 /lionheart

# Даем права
RUN chmod +x /lionheart

# Запуск
CMD /lionheart -server -listen :$PORT -forward 127.0.0.1:8080 -smart-key ${SMART_KEY:-default}
