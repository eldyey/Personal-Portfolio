#!/bin/bash

echo "🚀 Building Flutter Web..."

cd frontend

flutter build web --base-href "/Personal-Portfolio/" --pwa-strategy=none

echo "✅ Build complete."

cd ..

echo "🧹 Cleaning docs folder..."

rm -rf docs/*

echo "📁 Copying new build to docs..."

cp -r frontend/build/web/* docs/

echo "📤 Pushing to GitHub..."

git add .
git commit -m "deploy update"
git push

echo "✅ Deployment complete!"
