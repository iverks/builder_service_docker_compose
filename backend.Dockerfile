FROM debian:latest AS backend

WORKDIR /app

COPY --from=application_builder /app/program.sh ./program.sh

ENTRYPOINT ["tail", "-f", "/dev/null"]