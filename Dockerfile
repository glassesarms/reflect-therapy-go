# Use the offical Go image to build the binary
FROM golang:1.20-alpine AS builder

WORKDIR /app

# Cache dependencies by copying go.mod and go.sum
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application source code
COPY . .

# Build the application (the -o flag sets the output binary name)
RUN go build -o main .

# Use a minimal image to run the application
FROM alpine:latest
WORKDIR /app

# Copy the binary from the builder stage
COPY --from=builder /app/main .

# Expose the port your application listens on
EXPOSE 8080

# Run the binary
CMD ["./main"]
