# Use the official Golang image as a builder
FROM golang:1.22-alpine AS builder

RUN mkdir -p /app

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source code into the container
COPY . /app

# Build the Go app
RUN go build -o main ./cmd/main.go

# Use a minimal Docker image for the final output
FROM alpine:latest

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy the binary from the builder stage
COPY --from=builder /app/main .

# Copy the configuration files
COPY config ./config

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./main"]
