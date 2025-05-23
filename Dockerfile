# Use the official Python image from DockerHub
FROM python:3.9-slim

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose the port your app runs on
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
