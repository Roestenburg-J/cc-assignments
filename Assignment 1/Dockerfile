<<<<<<< HEAD
# Dockerfile

FROM busybox:latest

RUN mkdir -p /usr/src/assignment && \
    touch /usr/src/assignment/log.txt

VOLUME ["/usr/src/assignment"]

WORKDIR /usr/src/app
COPY entrypoint.sh .

=======
# Dockerfile

FROM busybox:latest

RUN mkdir -p /usr/src/assignment && \
    touch /usr/src/assignment/log.txt

VOLUME ["/usr/src/assignment"]

WORKDIR /usr/src/app
COPY entrypoint.sh .

>>>>>>> 131ea354a20034e3061a3247d9116179a7cd4f5f
CMD ["./entrypoint.sh", "../assignment/log"]