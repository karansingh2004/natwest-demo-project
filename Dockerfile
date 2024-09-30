# Stage 1: Build
FROM python:3-slim as build

# Create a directory for our HTML file
RUN mkdir -p /app

# Copy the HTML file into the container
COPY index.html /app/



# Stage 2: Run
FROM python:3-alpine

# Create a directory for our HTML file
RUN mkdir -p /app

# Copy the HTML file from the build stage
COPY --from=build /app/index.html /app/

# Expose the port 8000 for the web server
EXPOSE 8000

# Start the python http server when the container starts & serve index.html file on browser
CMD ["python3", "-m", "http.server","--directory","/app", "8000"]
