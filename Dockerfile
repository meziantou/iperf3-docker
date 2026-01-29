FROM alpine:3.23.3
RUN apk add --no-cache --update \
    iperf3 && \
    adduser --system iperf3
USER iperf3
EXPOSE 5201
ENTRYPOINT ["iperf3"]
CMD ["-s"]

HEALTHCHECK CMD nc -z localhost 5201 || exit 1
