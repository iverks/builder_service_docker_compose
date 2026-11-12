FROM debian:latest AS application_builder

WORKDIR /app
RUN touch $(date +%s)
RUN echo "echo 'Hello'" > program.sh
RUN chmod +x program.sh

ENTRYPOINT ["tail", "-f", "/dev/null"]