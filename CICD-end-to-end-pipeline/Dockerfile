# Use the official Python image
FROM python:3.10

# Copy the rest of application code
COPY . .

# Install dependencies
RUN pip install -r requirement.txt

# Run migrate command to apply changes to models
RUN python manage.py migrate

# Expose the port
EXPOSE 8000

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
