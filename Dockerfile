# Use nginx base image
FROM nginx:latest

# Copy all your project files to nginx default folder
COPY . /usr/share/nginx/html

# Expose port 80 (nginx default)
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]
# this chandra is the docker file for fds app. it uses nginx as the base image and copies all the project files to the default nginx folder. it exposes port 80 and starts the nginx server.
# to build the docker image, run the following command in the terminal:
# docker build -t fds-app:latest .