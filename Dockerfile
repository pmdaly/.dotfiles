# Use an official Ubuntu as the base image
FROM ubuntu:latest

# Install required packages
RUN apt-get update && apt-get install -y \
    software-properties-common \
    make

# Set the working directory in the container
WORKDIR /app

# Copy all files from your repository to the container
COPY . /app

# Run 'make install' to test the installation
RUN make install
