FROM alpine:latest
RUN apk add --no-cache gcompat ca-certificates

COPY lionheart-1.3-linux-x64 /lionheart
RUN chmod +x /lionheart

# Используем (echo 1; sleep 1; echo 123456) чтобы сначала выбрать режим, 
# подождать секунду и ввести ключ, если он его спросит.
CMD sh -c "(echo 1; sleep 1; echo 123456) | /lionheart -server -listen :$PORT -forward 127.0.0.1:8080 -smart-key 123456"
