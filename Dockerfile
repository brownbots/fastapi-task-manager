# Use official Python base image
FROM python:3.11

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all source code
COPY . .

# TEMPORARY DEBUG: list files/folders to debug structure
CMD ["ls", "-R", "."]
