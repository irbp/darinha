FROM debian:stable-slim
WORKDIR /app
COPY . .
RUN apt-get update && \
    apt-get -y install apt-transport-https wget gpg && \
    wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/dart.gpg && \
    echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | tee /etc/apt/sources.list.d/dart_stable.list && \
    apt-get update && \
    apt-get -y install dart && \
    echo 'export PATH="$PATH:/usr/lib/dart/bin"' >> ~/.profile && \
    dart compile exe bin/main.dart -o bin/main
ENTRYPOINT ["./bin/main", "/var/rinha/source.rinha.json"]