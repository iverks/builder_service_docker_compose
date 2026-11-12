FROM debian:latest AS application_builder

WORKDIR /app

# Make empty file with timestamp including nanoseconds
# if the build properly runs only once, then all the three services will have the same timestamp
# This is just for the example, do not include in the final setup
RUN touch $(date +"%T.%N")

# Make mock program
RUN echo "echo 'Hello'" > program.sh
RUN chmod +x program.sh

# tail -f is used as an entrypoint in order for the container to not instantly die
# this is useful for debugging, since you can go into the idling container
# a production container should have ENTRYPOINt ["/bin/true"] which will immediately exit
ENTRYPOINT ["tail", "-f", "/dev/null"]
