#!/bin/bash
set -e
if [ "$ENV" = "DEV" ]; then
	echo "RUNNING DEVELOPMENT SERVER"
	exec python identidock.py
else
	echo "RUNNING PRODUCTION SERVER"
	exec uwsgi --http 0.0.0.0:5000 --wsgi-file /app/identidock.py --callable app --stats 0.0.0.0:9191
fi
