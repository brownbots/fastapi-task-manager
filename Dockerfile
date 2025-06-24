# Use official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy only necessary files
COPY app/ ./app/
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port
EXPOSE 8000

# Run uvicorn using the correct path to app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
