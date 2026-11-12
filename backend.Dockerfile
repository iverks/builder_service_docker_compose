FROM debian:latest AS backend

WORKDIR /app

# Copy the timestamp file and the program from the builder
COPY --from=application_builder /app/* .

ENTRYPOINT ["tail", "-f", "/dev/null"]