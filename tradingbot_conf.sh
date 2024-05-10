```bash

#!/bin/bash

# Function to print step info
print_step() {
  echo -e "\n--- $1 ---\n"
}

# Add Freqtrade and OctoBot users, grant sudo permission
print_step "Adding Freqtrade user and configuring sudo permissions"
sudo adduser --gecos "" --disabled-password freqtrade
echo "freqtrade ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/freqtrade
echo "Freqtrade user added and sudo permissions granted."

print_step "Adding OctoBot user and configuring sudo permissions"
sudo adduser --gecos "" --disabled-password octobot
echo "octobot ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/octobot
echo "OctoBot user added and sudo permissions granted."

# Function to secure server with additional ports
secure_server() {
  print_step "Securing server and configuring firewall"

  # Configure Firewall
  sudo ufw default deny incoming
  echo "Denied all incoming connections by default."
  
  sudo ufw default allow outgoing
  echo "Allowed all outgoing connections."

  # Allow SSH (port 22)
  sudo ufw allow ssh
  echo "Allowed SSH connections (port 22)."

  # Allow HTTP/HTTPS (Nginx Full)
  sudo ufw allow "Nginx Full"
  echo "Allowed HTTP/HTTPS (Nginx Full)."

  # Allow Freqtrade Web UI ports
  for port in 8080 8081 8082 8083 8084; do
    sudo ufw allow "$port/tcp"
    echo "Allowed Freqtrade Web UI port $port."
  done

  # Allow OctoBot Web UI port
  sudo ufw allow 5000/tcp
  echo "Allowed OctoBot Web UI port 5000."

  # Enable the firewall
  sudo ufw enable
  echo "Firewall enabled."
}

# Function to install a single Freqtrade bot with a specified service name and port
install_freqtrade_instance() {
  local instance=$1
  local port=$2

  print_step "Installing Freqtrade instance $instance on port $port"
  
  sudo -i -u freqtrade bash << EOF
  mkdir -p /home/freqtrade/freqtrade_$instance
  echo "Created directory /home/freqtrade/freqtrade_$instance."

  git clone https://github.com/freqtrade/freqtrade.git /home/freqtrade/freqtrade_$instance
  echo "Cloned Freqtrade repository into /home/freqtrade/freqtrade_$instance."

  cd /home/freqtrade/freqtrade_$instance
  git checkout stable
  echo "Checked out the stable branch."

  ./setup.sh -i
  echo "Completed Freqtrade setup script."

  source .venv/bin/activate
  freqtrade create-userdir --userdir /home/freqtrade/freqtrade_$instance/user_data
  echo "Created Freqtrade user directory."

  freqtrade new-config --config /home/freqtrade/freqtrade_$instance/config.json
  echo "Generated new configuration for Freqtrade instance $instance."
EOF

  print_step "Configuring Freqtrade instance $instance as a service"
  
  # Configure the Freqtrade instance as a service
  sudo tee /etc/systemd/system/freqtrade_$instance.service << EOF
[Unit]
Description=Freqtrade Bot $instance
After=network.target

[Service]
WorkingDirectory=/home/freqtrade/freqtrade_$instance
ExecStart=/home/freqtrade/freqtrade_$instance/.venv/bin/freqtrade trade --config /home/freqtrade/freqtrade_$instance/config.json --port $port
User=freqtrade
Restart=always

[Install]
WantedBy=multi-user.target
EOF
  echo "Created systemd service for Freqtrade instance $instance."

  sudo systemctl daemon-reload
  echo "Reloaded systemd daemon."

  sudo systemctl enable freqtrade_$instance.service
  echo "Enabled Freqtrade service for instance $instance."

  sudo systemctl start freqtrade_$instance.service
  echo "Started Freqtrade service for instance $instance."
}

# Function to install and configure OctoBot
install_octobot() {
  print_step "Installing dependencies for OctoBot"
  sudo apt-get update && sudo apt-get install -y python3-pip python3-venv python3-dev git nginx
  echo "Installed dependencies for OctoBot."

  print_step "Installing OctoBot"
  
  sudo -i -u octobot bash << EOF
  git clone https://github.com/Drakkar-Software/OctoBot.git /home/octobot/octobot
  echo "Cloned OctoBot repository."

  cd /home/octobot/octobot
  python3 -m pip install -U pip
  echo "Upgraded pip."

  python3 -m pip install -U -r requirements.txt
  echo "Installed Python requirements for OctoBot."
EOF

  print_step "Configuring OctoBot as a service"
  
  # Configure OctoBot as a service
  sudo tee /etc/systemd/system/octobot.service << EOF
[Unit]
Description=OctoBot
After=network.target

[Service]
WorkingDirectory=/home/octobot/octobot
ExecStart=/usr/bin/python3 /home/octobot/octobot/octobot.py
User=octobot
Restart=always

[Install]
WantedBy=multi-user.target
EOF
  echo "Created systemd service for OctoBot."

  sudo systemctl daemon-reload
  echo "Reloaded systemd daemon."

  sudo systemctl enable octobot.service
  echo "Enabled OctoBot service."

  sudo systemctl start octobot.service
  echo "Started OctoBot service."
}

# Secure server and configure firewall ports
echo "Securing server and configuring firewall ports."
secure_server

# Install five Freqtrade instances with different ports
echo "Installing five Freqtrade instances with different ports."
install_freqtrade_instance 1 8080
install_freqtrade_instance 2 8081
install_freqtrade_instance 3 8082
install_freqtrade_instance 4 8083
install_freqtrade_instance 5 8084

# Install and configure OctoBot
echo "Installing and configuring OctoBot."
install_octobot
```

```bash
#!/bin/bash

# update repository
sudo apt-get update
echo "Update sucessfully."

# install packages
sudo apt install -y python3-pip python3-venv python3-dev python3-pandas git curl
echo "Installing Packages sucessfully."

# Download `develop` branch of freqtrade repository
sudo git clone https://github.com/freqtrade/freqtrade.git
echo "Clone freqtrade Git Repository sucessfully."

# Enter downloaded directory
cd freqtrade
echo "Change working directory."

# your choice (1): novice user
sudo git checkout stable
echo "Git check out stable."

# --install, Install freqtrade from scratch
sudo ./setup.sh -i
echo "Setup freqtrade sucessfully."

```
