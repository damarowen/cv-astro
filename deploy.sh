#!/bin/bash

# Stop the Astro app using PM2
pm2 stop astro-app

# Pull the latest changes from the Git repository
git pull

# Start the Astro app using PM2
pm2 start ecosystem.config.cjs
