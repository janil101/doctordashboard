#!/bin/bash

# Exit on any error
set -e

REPO_URL="https://github.com/<your-org-or-username>/doctordashboard.git"
PROJECT_NAME="doctordashboard"
BRANCH="master"

echo "🔧 Starting build and deployment for $PROJECT_NAME..."

# Clone the repo if it doesn't exist
if [ ! -d "$PROJECT_NAME" ]; then
  echo "📥 Cloning $PROJECT_NAME..."
  git clone -b "$BRANCH" "$REPO_URL"
fi

cd "$PROJECT_NAME"

# Pull latest changes
echo "📦 Pulling latest code from $BRANCH..."
git checkout "$BRANCH"
git pull origin "$BRANCH"

# Build section
if [ -f "package.json" ]; then
  echo "📦 Detected Node.js project..."
  npm install
  npm run build
elif [ -f "pom.xml" ]; then
  echo "☕ Detected Maven project..."
  mvn clean package
elif [ -f "requirements.txt" ]; then
  echo "🐍 Detected Python project..."
  pip install -r requirements.txt
fi

# Deploy section
echo "🚀 Deploying..."

if [ -f "package.json" ]; then
  echo "📦 Starting Node.js app..."
  npm run start &
elif ls target/*.jar 1> /dev/null 2>&1; then
  echo "☕ Running JAR..."
  java -jar target/*.jar &
elif [ -f "app.py" ]; then
  echo "🐍 Starting Python app..."
  python app.py &
else
  echo "⚠️ No known start command found!"
fi

echo "✅ Build and deployment completed!"
