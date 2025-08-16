#!/bin/bash
# Create folder inside ec2-user's home
mkdir -p /home/ec2-user/test

# Create a test file inside the folder
touch /home/ec2-user/test/test.txt

# Ensure ownership so ec2-user can access it
chown -R ec2-user:ec2-user /home/ec2-user/test

