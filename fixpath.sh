#!/bin/bash
clear
echo Fixing PATH...
read -d '' PATH < /etc/environment
export $PATH
echo Done...
clear
if command -v neofetch > /dev/null; then
    neofetch
    bash
else
    bash
fi
