# From an existing Docker image
FROM alpine

# Run some commands
RUN apk add --update redis
RUN apk add --update gcc

# Startup command
CMD ["redis-server"]