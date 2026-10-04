@echo off

echo ========================================
echo Starting Automated Deployment
echo ========================================

echo.
echo Pulling latest code from GitHub...
git pull origin main

echo.
echo Building Docker image...
docker build -t automated-deployment-app .

echo.
echo Stopping old container...
docker stop automated-deployment 2>nul

echo.
echo Removing old container...
docker rm automated-deployment 2>nul

echo.
echo Starting new container...
docker run -d -p 8080:80 --name automated-deployment automated-deployment-app

echo.
echo ========================================
echo Deployment Completed Successfully!
echo ========================================

docker ps
