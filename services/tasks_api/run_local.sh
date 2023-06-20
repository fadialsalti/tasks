#!/bin/bash

# Set AWS environment variables
export AWS_ACCESS_KEY_ID=abc
export AWS_SECRET_ACCESS_KEY=abc
export AWS_DEFAULT_REGION=eu-central-1
export TABLE_NAME="local-tasks-api-table"
export DYNAMODB_URL=http://localhost:9999
export ALLOWED_ORIGINS=*

# Start Docker containers
docker-compose up -d

# Run FastAPI server with auto-reloading
poetry run uvicorn main:app --reload &

# Navigate to the frontend folder
cd ../tasks_ui/

# Run the frontend development server
npm run dev