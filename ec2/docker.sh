#!/bin/bash

sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
status=$(sudo systemctl status docker)

echo "Docker service status is: $status"

if ["$status" = "active" ]; then
echo "Docker is running fine"
else
echo "docker is not running"
fi
