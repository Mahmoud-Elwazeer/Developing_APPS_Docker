#!/bin/bash

set -e

if [ "$ENV" = 'DEV' ]; then
 echo "Running Development Server"
 exec python "app.py"
else
 echo "Running Production Server"
 exec uwsgi --http 0.0.0.0:5000 --wsgi-file /app/app.py \
 --callable app --stats 0.0.0.0:6000
fi
