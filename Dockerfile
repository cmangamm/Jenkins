# Use the official Python image
FROM python:3.10

# Setting the work directory
WORKDIR /app

# COPY requirement.txt file to /app
COPY requirement.txt .

# Install dependencies
RUN pip install -r requirement.txt

# Copy the rest of application code
COPY . .

# Expose the port
EXPOSE 8000

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
