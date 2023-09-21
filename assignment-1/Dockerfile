# Dockerfile

FROM ubuntu:latest

RUN apt-get update && apt-get install -y docker.io && \
    sudo systemctl start docker && \
    sudo systemctl enable docker && \
    mkdir -p /usr/src/assignment && \
    touch /usr/src/assignment/log.txt

VOLUME ["/usr/src/assignment"]

WORKDIR /usr/src/app
COPY entrypoint.sh .

CMD ["./entrypoint.sh", "../assignment/log.txt"]