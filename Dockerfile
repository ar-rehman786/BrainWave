# Use an official Node.js runtime as a parent image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application files to the working directory
COPY . .

# Build the React app for production
RUN npm run build

# Install an HTTP server to serve the static files
RUN npm install -g serve

# Expose the port that the app will run on
EXPOSE 3000

# Command to run the app
CMD ["serve", "-s", "build"]
