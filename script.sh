#!/bin/bash

# Update and install necessary packages
sudo apt update
sudo apt install -y python3 python3-pip python3-venv docker.io git

# Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Run Ollama container
sudo docker run -d -p 11434:11434 --name ollama ollama/ollama

# Wait for the container to be fully up before pulling the model
sleep 60
sudo docker exec -it ollama ollama pull nomic-embed-text

# Clone your app repository
git clone https://github.com/ahmedovelshan/AICHatBot.git
sudo chown -R ubuntu:ubuntu /AICHatBot
cd AICHatBot

# Setup Python virtual environment and install requirements
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install "unstructured[md]"
pip install -r requirements.txt
