# Dockerfile

FROM busybox:latest

RUN mkdir -p /usr/src/assignment && \
    sudo touch /usr/src/assignment/log.txt

VOLUME ["/usr/src/assignment"]

WORKDIR /usr/src/app
COPY entrypoint.sh .

CMD ["./entrypoint.sh", "../assignment/log.txt"]