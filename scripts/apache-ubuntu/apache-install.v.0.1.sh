#!/bin/bash

# Update the system
sudo apt update
sudo apt upgrade -y

# Install Apache2
sudo apt install apache2 -y

# Enable necessary modules
sudo a2enmod rewrite

# Edit the main configuration file
sudo bash -c "echo 'ServerTokens Prod' >> /etc/apache2/apache2.conf"
sudo bash -c "echo 'ServerSignature Off' >> /etc/apache2/apache2.conf"
sudo bash -c "echo 'KeepAlive On' >> /etc/apache2/apache2.conf"
sudo bash -c "echo 'KeepAliveTimeout 15' >> /etc/apache2/apache2.conf"
sudo bash -c "echo 'MaxKeepAliveRequests 100' >> /etc/apache2/apache2.conf"

# Disable directory listing
sudo sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/Options Indexes FollowSymLinks/Options -Indexes +FollowSymLinks/' /etc/apache2/apache2.conf

# Set the server name to localhost
sudo bash -c "echo 'ServerName localhost' >> /etc/apache2/apache2.conf"

# Enable the SSL module
sudo a2enmod ssl

# Restart Apache2 service
sudo systemctl restart apache2

echo "Apache2 installed and configured successfully."

# End of script
