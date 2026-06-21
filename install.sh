#!/bin/bash

clear
echo "================================="
echo "     Tree Glass Installer"
echo "================================="

PANEL="/var/www/pterodactyl"

if [ ! -d "$PANEL" ]; then
    echo "Pterodactyl not found!"
    exit 1
fi

cd /tmp || exit

rm -rf TreeHost

git clone https://github.com/sarupya50-eng/TreeHost.git

cp -r TreeHost/resources/* $PANEL/resources/ 2>/dev/null
cp -r TreeHost/public/* $PANEL/public/ 2>/dev/null

cd $PANEL || exit

npm install
npm run build

php artisan optimize:clear

echo ""
echo "Tree Glass Installed Successfully!"
