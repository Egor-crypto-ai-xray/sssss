FROM alpine:latest
RUN apk add --no-cache gcompat ca-certificates

# Имя файла должно быть в точности как ты загрузил
COPY lionheart-1.3-linux-x64 /lionheart
RUN chmod +x /lionheart

# Принудительный запуск в режиме сервера (Mode 1) без лишних вопросов
CMD /lionheart -server -listen :$PORT -forward 127.0.0.1:8080 -smart-key ${SMART_KEY:-123456}
