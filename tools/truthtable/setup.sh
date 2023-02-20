if [ "$1" = "install" ]; then
    echo "Installing truthtable..."
    sudo mv truthtable.py /usr/bin/
    sudo touch /usr/bin/truthtable
    sudo chmod o+w /usr/bin/truthtable
    echo "python3 /usr/bin/truthtable.py \"\$1\"" > /usr/bin/truthtable
    sudo chmod o-w /usr/bin/truthtable
    sudo chmod +x /usr/bin/truthtable
    echo "Done. You can now delete this file or keep it to uninstall truthtable."
    echo "You can now run truthtable by typing 'truthtable' in the terminal."
elif [ "$1" = "uninstall" ]; then
    echo "Uninstalling truthtable..."
    sudo rm /usr/bin/truthtable.py
    sudo rm /usr/bin/truthtable
    echo "Done."
else
    echo "Usage: ./setup.sh [install|uninstall]"
fi