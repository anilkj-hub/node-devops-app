# Use an official Node.js runtime as a base image
FROM node:20-alpine

# Set working directory inside the container
WORKDIR /app

# Copy dependency files first to leverage Docker cache
COPY package*.json ./

# Install production dependencies
RUN npm install --omit=dev

# Copy application source
COPY . .

# Expose application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]