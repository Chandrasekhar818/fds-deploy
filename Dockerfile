# Use nginx base image
FROM nginx:latest

# Copy all your project files to nginx default folder
COPY . /usr/share/nginx/html

# Expose port 80 (nginx default)
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]
