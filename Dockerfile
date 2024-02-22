# Use the official Node.js 18 base image
FROM node:18

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy .env.list to the working directory
COPY env.list .env.list

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Source environment variables from the .env.list file
ENV $(cat .env.list | xargs)

# Start the application
CMD ["npm", "start"]

# Set metadata for an image
LABEL name="blackhevean/auto_trade_backpack" tag="1.0"