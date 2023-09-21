# Dockerfile

FROM busybox:latest

RUN mkdir -p /usr/src/assignment2 && \
    touch /usr/src/assignment2/log.txt

VOLUME ["/usr/src/assignment2"]

WORKDIR /usr/src/app
COPY entrypoint.sh .

CMD ["./entrypoint.sh", "../assignment2/log.txt"]