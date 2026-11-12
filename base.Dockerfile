FROM debian:latest AS application_builder

WORKDIR /app
RUN touch $(date +%s)
RUN echo "echo 'Hello'" > program.sh
RUN chmod +x program.sh

# tail -f is used as an entrypoint in order for the container to not instantly die
# this is useful for debugging, since you can go into the idling container
# a production container should have ENTRYPOINt ["/bin/true"] which will immediately exit
ENTRYPOINT ["tail", "-f", "/dev/null"]
