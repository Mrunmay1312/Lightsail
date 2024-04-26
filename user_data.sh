Content-Type: multipart/mixed; boundary="//"
MIME-Version: 1.0 

--//
Content-Type: text/cloud-config; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cloud-config.txt"

#cloud-config
cloud_final_modules:
- [scripts-user, always]

--//
Content-Type: text/x-shellscript; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="userdata.txt"

#!/bin/bash

# Update packages
sudo apt update -y

# Install Nginx
sudo apt install nginx -y

# Enable nginx service
sudo systemctl enable nginx

# Define the path to the index.html file
html_file="/var/www/html/index.nginx-debian.html"

# Get the hostname
hostname=$(hostname)

# Create or edit the index.html file
sudo tee "$html_file" > /dev/null <<EOL
<!DOCTYPE html>
<html>
<head>
    <title>Hello Everyone</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            text-align: center;
            font-family: Arial, sans-serif;
        }

        .header {
            background: linear-gradient(to right, ##e20074, #f4ebf0); /* Gradient background color */
            padding: 20px;
        }

        #logo {
            width: 150px; /* Adjust the width to make the logo smaller */
            height: auto;
        }

        h1 {
            margin: 30px 0; /* Add top margin to shift the h1 element down */
        }
    </style>
</head>
<body>
    <div class="header">
        <img id="logo" src="https://miro.medium.com/v2/resize:fit:3200/1*QiHBlwnNjmRVnF7EiVsviQ.jpeg"
    </div>
    <h1>This is from AWS Lightsail"
    <p>Welcome to our website. We are glad to have you here!</p>
    <p>Hostname: $hostname</p>
</body>
</html>
EOL

#start nginx server
sudo systemctl start nginx

# Restart nginx to apply changes (if necessary)
#sudo systemctl restart nginx

--//--