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
            background-color: #f4ebf0; /* Set background color */
        }

        .header { 
            background: white
            padding: 20px;
        }

        #logo-container {
            background-color: white; /* Set background color of logo container to white */
            padding: 10px; /* Add padding to create space around the logo */
            display: inline-block; /* Ensure the container wraps around the logo */
            margin-top: 20px; /* Add margin to the top */
        }

        #logo {
            width: 300px; /* Adjust the width of the logo */
            height: auto;
        }

        h1 {
            margin: 30px 0; /* Add top margin to shift the h1 element down */
			linear-gradient(to right, #ffffff, #ffffff); /* Gradient background color */
        }
		h3 {
            font-weight: bold; /* Make the text within <p> elements bold */
        }
    </style>
</head>
<body>
    <div class="header">
        <div id="logo-container">
            <img id="logo" src="https://miro.medium.com/v2/resize:fit:3200/1*QiHBlwnNjmRVnF7EiVsviQ.jpeg">
        </div>
    </div>
    <h1>This is from AWS Lightsail</h1>
	
    <h2>Welcome to our website. We are glad to have you here!</h2>
	<h3> Group No - 15 </h3>
	<p> Mrunmay Nandanwar </p>
	<p> Archita Nawale </p>
	<p> Lavanya K </p>
	<p> Sushma K R </p>
	<p> Shweta Jadhav </p>
    <p>Hostname: $hostname</p>
</body>
</html>
EOL

#start nginx server
sudo systemctl start nginx

# Restart nginx to apply changes (if necessary)
#sudo systemctl restart nginx

--//--