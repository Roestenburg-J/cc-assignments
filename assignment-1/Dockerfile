# Dockerfile

FROM busybox:latest

RUN mkdir -p /usr/src/assignment2 && \
    touch /usr/src/assignment/log.txt

VOLUME ["/usr/src/assignment"]

WORKDIR /usr/src/app
COPY entrypoint.sh .

CMD ["./entrypoint.sh", "../assignment/log.txt"]