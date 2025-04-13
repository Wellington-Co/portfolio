#!/bin/bash

echo "🔧 Setting up Flutter"
flutter channel stable
flutter upgrade
flutter config --enable-web

echo "🧹 Cleaning build"
flutter clean

echo "🚀 Building Flutter Web"
flutter build web --release

echo "📦 Moving build to public folder"
mkdir -p public
cp -r build/web/* public/

echo "✅ Build complete"
