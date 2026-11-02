#!/bin/bash
echo "=================================================="
echo "       Installing Merks Converter CLI Command"
echo "=================================================="

if ! command -v python3 &> /dev/null
then
    echo "[ERROR] python3 could not be found. Please install Python 3."
    exit 1
fi

echo "[1/3] Upgrading pip and installing dependencies..."
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt

echo "[2/3] Creating global terminal command link..."
INSTALL_DIR="/usr/local/bin"
SCRIPT_PATH="$(pwd)/main.py"

if [ -w "$INSTALL_DIR" ]; then
    ln -sf "$SCRIPT_PATH" "$INSTALL_DIR/convert-merks"
    ln -sf "$SCRIPT_PATH" "$INSTALL_DIR/convert_merks"
    chmod +x "$SCRIPT_PATH"
else
    echo "Requires administrator permissions to link to $INSTALL_DIR..."
    sudo ln -sf "$SCRIPT_PATH" "$INSTALL_DIR/convert-merks"
    sudo ln -sf "$SCRIPT_PATH" "$INSTALL_DIR/convert_merks"
    sudo chmod +x "$SCRIPT_PATH"
fi

echo ""
echo "=================================================="
echo "   Installation Complete!"
echo "=================================================="
echo "You can now open any terminal window and type:"
echo ""
echo "    convert-merks  (or convert_merks)"
echo ""
echo "to launch the app instantly!"
