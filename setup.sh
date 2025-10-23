# Stop and remove everything
docker-compose down -v

# Remove all OpenCart files
rm -rf html/*

# Download OpenCart fresh
wget https://github.com/opencart/opencart/releases/download/3.0.3.8/opencart-3.0.3.8.zip
unzip opencart-3.0.3.8.zip
cp -r upload/* html/

# Set permissions
find html/ -type f -exec chmod 644 {} \;
find html/ -type d -exec chmod 755 {} \;
chmod 777 html/config.php
chmod 777 html/admin/config.php
chmod 777 -R html/image/
chmod 777 -R html/system/storage/

# Start fresh
docker-compose up -d

# Wait for database to initialize, then test connection
sleep 30
docker-compose exec db mysql -u root -prootpassword -e "SHOW DATABASES;"
