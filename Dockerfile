# Use official Python 3.9 from docker hub
# So you know you are running the same version
FROM python:3.9-alpine

# Change to root of container
COPY . /app
WORKDIR /app

# Install requirements
# RUN pip install --no-cache-dir -r requirements.txt
