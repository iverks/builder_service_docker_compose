FROM debian:latest AS frontend

WORKDIR /app

COPY --from=application_builder /app/program.sh ./program.sh

ENTRYPOINT ["tail", "-f", "/dev/null"]