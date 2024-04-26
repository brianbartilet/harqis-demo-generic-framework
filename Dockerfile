# Set arguments for the Dockerfile
ARG PYTHON_VERSION=3.12

# Use an official Python runtime as a parent image as interpreter
FROM python:${PYTHON_VERSION}-slim AS base
RUN apt-get update && apt-get install -y git

# Create a mount point for the volume
VOLUME /app/data

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    linux-headers-generic \
    wget \
    gnupg \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Install Google Chrome
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google-chrome-keyring.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome-keyring.gpg] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
    && apt-get install -y google-chrome-stable

# Load virtual environment
RUN python -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

# Install Python packages
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt

# Set environment variables
ENV GH_TOKEN ${GH_TOKEN}
ENV ENV "TEST"

# Initialize application
RUN python get_started.py

FROM base as tests
# Set up the Chrome path environment variable
ENV CHROME_BIN=/usr/bin/google-chrome
ENV PATH="/usr/lib/chromium/:$PATH"

# Set additional environment variables
ENV PYTHONPATH "${PYTHONPATH}:/app"
ENV ENV_ROOT_DIRECTORY "/app"
ENV DISPLAY=:99
WORKDIR /app
CMD ["pytest"]

FROM base as behave
# Set additional environment variables
ENV PYTHONPATH "${PYTHONPATH}:/app:/app/demo"
ENV ENV_ROOT_DIRECTORY "/app"
WORKDIR /app/demo/testing/example_features_webdriver
CMD ["behave"]
