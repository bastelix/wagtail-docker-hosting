#!/bin/bash
set -e

if [ ! -f "manage.py" ]; then
    # Create a new project if it doesn't exist
    coderedcms start mysite --template pro --sitename "$WAGTAIL_SITENAME" --domain "$WAGTAIL_DOMAIN"
    cd mysite

    # Install development tooling
    pip install -r requirements-dev.txt

    # Set up Django
    python manage.py migrate
    python manage.py createsuperuser --noinput --username admin --email admin@example.com

    # Compile SCSS
    python manage.py sass website/static/website/src/custom.scss website/static/website/css/custom.css

    # Collect static files
    python manage.py collectstatic --noinput
else
    cd mysite
    # Ensure dependencies are installed
    pip install -r requirements-dev.txt

    # Apply any pending migrations
    python manage.py migrate

    # Compile SCSS
    python manage.py sass website/static/website/src/custom.scss website/static/website/css/custom.css
fi

exec "$@"
