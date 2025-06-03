#!/bin/bash

# Exit on error
set -e

echo "🔧 Starting build for doctordashboard..."

# Clean previous builds (optional)
echo "🧹 Cleaning previous builds..."
rm -rf dist build out

# Clone the repo if not already present (optional)
if [ ! -d "doctordashboard" ]; then
  echo "📥 Cloning repository..."
  git clone -b master https://github.com/<your-org-or-username>/doctordashboard.git
fi

cd doctordashboard

# Pull latest code
echo "📦 Pulling latest code from master..."
git checkout master
git pull origin master

# Example: Node.js build
if [ -f "package.json" ]; then
  echo "📦 Installing dependencies..."
  npm install

  echo "🛠️ Building project..."
  npm run build
fi

# Example: Java/Maven build
if [ -f "pom.xml" ]; then
  echo "☕ Building Maven project..."
  mvn clean package
fi

echo "✅ Build completed!"
