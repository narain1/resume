# Start from the latest Ubuntu image
FROM ubuntu:latest

# Set environment variables to avoid interactive prompts during package installations
ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies: TeX Live, Pandoc, and GitHub CLI
RUN apt-get update && apt-get install -y \
    texlive-full \
    pandoc \
    gh \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a directory for the LaTeX files
RUN mkdir /workspace

# Set the working directory to the new directory
WORKDIR /workspace

# Copy the LaTeX files to the container
COPY . /workspace

# Default command to run when the container starts (can be overridden)
CMD ["bash"]

