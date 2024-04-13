# Use a base image with Python installed
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the necessary files and directories into the container
COPY . .

# Install Flask
RUN pip install -r requirements.txt

# Expose the port on which your Flask app runs
EXPOSE 5003

# Command to run your application
CMD ["python3", "app.py"]