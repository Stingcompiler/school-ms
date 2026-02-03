#!/usr/bin/env bash
# exit on error
set -o errexit

echo "Deploying..."

# 1. Skip Frontend Build (You already did this locally!)

# 2. Go into the backend folder
cd backend

# 3. Install Python requirements
pip install -r requirements.txt

# 4. Collect static files
# (This will take your uploaded 'frontend_build' and move it to 'staticfiles')
python manage.py collectstatic --noinput

# 5. Run DB migrations
python manage.py migrate
