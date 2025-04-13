#!/bin/bash
echo "Starting Flutter Web Build"

flutter channel stable
flutter upgrade
flutter config --enable-web
flutter clean  # Clean the build before building again

# Build the web project and check if the build folder is created
flutter build web --release

if [ -d "build/web" ]; then
  echo "Build was successful, build/web directory exists"
else
  echo "Build failed or build/web directory does not exist"
  exit 1  # Exit with error if the build directory is not found
fi
