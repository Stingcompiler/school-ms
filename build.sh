#!/usr/bin/env bash
# exit on error
set -o errexit

echo "Deploying..."

# 1. Enter the backend folder
cd backend

# 2. Install Python requirements
pip install -r requirements.txt

# 3. Collect static files
# We FORCE it to use 'core.settings_production' here
python manage.py collectstatic --noinput --settings=core.settings_production

# 4. Run Migrations
python manage.py migrate --settings=core.settings_production
