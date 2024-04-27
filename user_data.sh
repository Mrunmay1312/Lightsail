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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            text-align: center;
            font-family: Arial, sans-serif;
            background-color: #f4ebf0; /* Set background color */
        }
 
        .header {
            background: #ff6b6b; /* Change header background color */
            padding: 20px;
        }
 
        #logo-container {
            background-color: white; /* Set background color of logo container to white */
            padding: 10px; /* Add padding to create space around the logo */
            display: inline-block; /* Ensure the container wraps around the logo */
            border-radius: 10px; /* Add border radius for a rounded look */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add box shadow for depth */
            animation: pulse 2s infinite; /* Add pulse animation */
        }
       
        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
            100% {
                transform: scale(1);
            }
        }
 
        #logo {
            width: 300px; /* Adjust the width of the logo */
            height: auto;
            border-radius: 10px; /* Add border radius for a rounded look */
        }
 
        h1 {
            margin: 15px 0; /* Add top margin to shift the h1 element down */
            background: linear-gradient(to right, #ff7e5f, #feb47b); /* Gradient background color */
            -webkit-background-clip: text; /* Apply text gradient */
            -webkit-text-fill-color: transparent; /* Hide original text color */
            animation: slide-in 2s ease-out; /* Add slide-in animation */
        }
       
        @keyframes slide-in {
            0% {
                opacity: 0;
                transform: translateY(-50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
 
        .icon {
            width: 50px;
            height: auto;
            margin: 10px;
            animation: spin 2s linear infinite; /* Add spin animation */
        }
       
        @keyframes spin {
            100% {
                transform: rotate(360deg);
            }
        }
 
        h3 {
            font-weight: bold; /* Make the text within <p> elements bold */
        }
        p {
            margin: 5px 0; /* Add margin to paragraphs for better spacing */
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
 
    <!-- Additional images related to AWS and AWS Lightsail -->
    <img src="https://www.logo.wine/a/logo/Amazon_Web_Services/Amazon_Web_Services-Logo.wine.svg" alt="AWS Logo" width="150">
   <br>
 
    <!-- Add some animated icons -->
    <i class="fas fa-heart"></i> <!-- Example of a solid heart icon -->
    <i class="far fa-envelope"></i> <!-- Example of a regular envelope icon -->
    <i class="fab fa-twitter"></i> <!-- Example of a Twitter icon from the brands set -->
</body>
</html>
EOL

#start nginx server
sudo systemctl start nginx

# Restart nginx to apply changes (if necessary)
#sudo systemctl restart nginx

--//--
