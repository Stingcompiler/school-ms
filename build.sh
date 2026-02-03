#!/usr/bin/env bash
# exit on error
set -o errexit

echo "Deploying..."

cd backend

# Install requirements
pip install -r requirements.txt

# CRITICAL FIX: We explicitly tell Django to use production settings
# This ensures it sees the 'frontend_build' folder and 'STATIC_ROOT'
export DJANGO_SETTINGS_MODULE=core.settings_production

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Running migrations..."
python manage.py migrate
