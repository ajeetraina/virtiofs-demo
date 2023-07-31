# Create a Dockerfile that mounts the directory into the container
FROM ubuntu:latest

# Mount the data directory into the container
VOLUME /data

# Start a bash shell
CMD ["bash"]
