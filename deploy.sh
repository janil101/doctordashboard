#!/bin/bash

# Exit on error
set -e

echo "🚀 Starting deployment for doctordashboard..."

cd doctordashboard

# Example: Node.js deployment (start server)
if [ -f "package.json" ]; then
  echo "📦 Starting Node.js app..."
  npm install --production
  npm run start &
fi

# Example: Java JAR deployment
if ls target/*.jar 1> /dev/null 2>&1; then
  echo "☕ Running JAR file..."
  java -jar target/*.jar &
fi

# Example: Python app
if [ -f "app.py" ]; then
  echo "🐍 Starting Python app..."
  pip install -r requirements.txt
  python app.py &
fi

echo "✅ Deployment complete!"
