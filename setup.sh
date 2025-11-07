#!/bin/bash

# Exit on any error
set -e

# Update and install python
echo "Updating package list and installing Python..."
sudo apt-get update
sudo apt-get install -y python3 python3-venv

echo "Removing old virtual environment if it exists..."
rm -rf .venv

# Create virtual environment
echo "Creating virtual environment..."
python3 -m venv .venv

export INSTALL_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install dependencies using the venv's pip
echo "Installing dependencies..."
.venv/bin/pip install -r requirements.txt

# Run the python setup script using the venv's python
echo "Running python setup script..."
.venv/bin/python tools/setup.py

echo "Setup finished."