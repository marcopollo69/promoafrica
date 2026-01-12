#!/bin/bash
# Skiza Spin & Win - Quick Setup Script for Mac/Linux
# This script automates the setup process

echo "========================================"
echo "  Skiza Spin & Win - Setup Script"
echo "========================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "[ERROR] Python 3 is not installed"
    echo "Please install Python 3.8+ from https://www.python.org/downloads/"
    exit 1
fi

echo "[1/6] Python found!"
python3 --version
echo ""

# Create virtual environment
echo "[2/6] Creating virtual environment..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo "Virtual environment created successfully!"
else
    echo "Virtual environment already exists, skipping..."
fi
echo ""

# Activate virtual environment
echo "[3/6] Activating virtual environment..."
source venv/bin/activate
echo ""

# Install dependencies
echo "[4/6] Installing dependencies..."
pip install -r requirements.txt
echo ""

# Run migrations
echo "[5/6] Setting up database..."
python manage.py makemigrations
python manage.py migrate
echo ""

# Create superuser prompt
echo "[6/6] Create admin superuser"
echo "You'll need this to access the admin panel at /admin/"
echo ""
python manage.py createsuperuser
echo ""

echo "========================================"
echo "  Setup Complete!"
echo "========================================"
echo ""
echo "To start the development server, run:"
echo "  python manage.py runserver"
echo ""
echo "Then visit:"
echo "  Website: http://127.0.0.1:8000/"
echo "  Admin:   http://127.0.0.1:8000/admin/"
echo ""
