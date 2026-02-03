#!/usr/bin/env bash
set -o errexit

# Build Frontend
cd frontend
npm install
npm run build
cd ..

# Setup Backend
cd backend

# Install Python requirements
pip install -r requirements.txt

# Collect static files (Images + React build)
python manage.py collectstatic --noinput

# Run DB migrations
python manage.py migrate