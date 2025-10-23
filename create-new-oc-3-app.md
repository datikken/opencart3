# Access MySQL container
docker-compose exec db bash

# Inside the container, run:
mysql -u root -prootpassword

# Execute these SQL commands:
CREATE DATABASE opencart;
CREATE USER 'opencart'@'%' IDENTIFIED BY 'opencartpass';
GRANT ALL PRIVILEGES ON opencart.* TO 'opencart'@'%';
FLUSH PRIVILEGES;
EXIT;