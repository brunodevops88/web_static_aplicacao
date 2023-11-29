# Use the official Nginx image as the base image
FROM nginx:latest

# Copy the content of the local "app" directory to the default Nginx public folder
COPY web/ /usr/share/nginx/html

# Expose port 80 to allow incoming traffic
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
