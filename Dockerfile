# Use Python 3.9.6 to match runtime.txt
FROM python:3.9.6-slim

# Install system dependencies
RUN apt-get update \
    && apt-get install -y \
        gcc \
        default-libmysqlclient-dev \
        pkg-config \
        curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements file and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Flask app code
COPY . .

# Expose port 5000
EXPOSE 5000

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# Command to run the Flask application
CMD ["python", "app.py"]