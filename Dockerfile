FROM python:latest

ENV PYTHONUNBUFFERED 1

# Set the Django settings to use.
ENV DJANGO_ENV "dev"
ENV DJANGO_SETTINGS_MODULE "mysite.settings.dev"

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    curl

# Install Python dependencies
RUN pip install coderedcms

# Create a user for running the application
RUN useradd -ms /bin/bash coderedcms

# Set the working directory
WORKDIR /app

# Copy entrypoint script
COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Change to non-root privilege
USER coderedcms

# Expose port 8000
EXPOSE 8000

# Define the entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]
