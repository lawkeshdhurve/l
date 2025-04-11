```dockerfile
# Choose a Python base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file first to leverage Docker cache
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code (index.html, api/, lrd/, etc.)
COPY . .

# Expose the port the app will run on (e.g., 7860)
# MAKE SURE THIS MATCHES your app.py and README.md
# In your Dockerfile

# ... other instructions ...

EXPOSE 7860 
# Or whatever port you choose

# Use this CMD line for FastAPI
CMD ["uvicorn", "api.app:app", "--host", "0.0.0.0", "--port", "7860"]

# OR Command for FastAPI (using Uvicorn)
# Replace api.app:app if your file is not api/app.py or variable is not app
# CMD ["uvicorn", "api.app:app", "--host", "0.0.0.0", "--port", "7860"]
```