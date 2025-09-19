# Dockerfile for building Android APK
FROM beevelop/cordova:latest

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN npm install

# Build Android APK
RUN cordova platform add android
RUN cordova build android

# The APK will be in platforms/android/app/build/outputs/apk/debug/