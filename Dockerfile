FROM alpine:latest

# Устанавливаем зависимости
RUN apk add --no-cache ca-certificates wget gcompat

# Скачиваем готовый бинарник сервера версии 1.3
RUN wget https://github.com/jaykaiperson/lionheart/releases/download/v1.3/lionheart-1.3-linux-amd64 -O /lionheart && \
    chmod +x /lionheart

# Запуск (Railway сам подставит порт в переменную $PORT)
CMD /lionheart -server -listen :$PORT -forward 127.0.0.1:8080 -smart-key ${SMART_KEY:-default}
