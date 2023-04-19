#!/bin/bash

# Go to app folder
cd /var/www/html/myServer

# start again
pm2 start pm2-apps.json
pm2 save