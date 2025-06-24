# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy everything to /app in the container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose FastAPI's default port
EXPOSE 8000

# Launch the app correctly using the subfolder path
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

