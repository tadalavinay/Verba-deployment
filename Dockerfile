# Use a specific, slim base image
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /app

# Copy all project files into the container's /app directory
COPY . .

# Upgrade pip and install the verba application as an editable package
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -e .

# Expose the port the Verba application runs on
EXPOSE 8000

# The command to run when the container starts
CMD ["uvicorn", "verba.main:app", "--host", "0.0.0.0", "--port", "8000"]

