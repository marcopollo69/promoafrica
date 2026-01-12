@echo off
REM Skiza Spin & Win - Quick Setup Script for Windows
REM This script automates the setup process

echo ========================================
echo   Skiza Spin ^& Win - Setup Script
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not installed or not in PATH
    echo Please install Python 3.8+ from https://www.python.org/downloads/
    echo Make sure to check "Add Python to PATH" during installation
    pause
    exit /b 1
)

echo [1/6] Python found!
python --version
echo.

REM Create virtual environment
echo [2/6] Creating virtual environment...
if not exist "venv" (
    python -m venv venv
    echo Virtual environment created successfully!
) else (
    echo Virtual environment already exists, skipping...
)
echo.

REM Activate virtual environment
echo [3/6] Activating virtual environment...
call venv\Scripts\activate.bat
echo.

REM Install dependencies
echo [4/6] Installing dependencies...
pip install -r requirements.txt
echo.

REM Run migrations
echo [5/6] Setting up database...
python manage.py makemigrations
python manage.py migrate
echo.

REM Create superuser prompt
echo [6/6] Create admin superuser
echo You'll need this to access the admin panel at /admin/
echo.
python manage.py createsuperuser
echo.

echo ========================================
echo   Setup Complete! 
echo ========================================
echo.
echo To start the development server, run:
echo   python manage.py runserver
echo.
echo Then visit:
echo   Website: http://127.0.0.1:8000/
echo   Admin:   http://127.0.0.1:8000/admin/
echo.
pause
