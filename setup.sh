#!/bin/bash

echo "============================================"
echo "   Anonymous Chat Application Setup"
echo "============================================"
echo

echo "[1/3] Installing server dependencies..."
cd server
npm install
if [ $? -ne 0 ]; then
    echo "Error: Failed to install server dependencies"
    exit 1
fi

echo
echo "[2/3] Server dependencies installed successfully!"
echo

echo "[3/3] Starting the server..."
echo
echo "Server will start on http://localhost:3000"
echo "Open client/index.html in your browser to test the chat"
echo
echo "Press Ctrl+C to stop the server"
echo

npm start
