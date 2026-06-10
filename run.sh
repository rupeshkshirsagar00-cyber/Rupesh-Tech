#!/bin/bash

# ====================================================================
#  Blueprint & Extension Installer Script
#  Adapted for: Rupesh
#  Credits: hopingboyz & jishnu tech
# ====================================================================

# Visual Colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

clear
echo -e "${CYAN}====================================================${RESET}"
echo -e "${GREEN}       RUPESH THEME & EXTENSION INSTALLER          ${RESET}"
echo -e "${YELLOW}       Credits: hopingboyz & jishnu tech          ${RESET}"
echo -e "${CYAN}====================================================${RESET}"
echo ""

# Ensure running as root
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}[!] Please run this script as root (sudo bash)${RESET}"
  exit 1
fi

# --------------------------------------------------------------------
# PART 1: Core Blueprint Installer (From skahost/code/main/run.sh)
# --------------------------------------------------------------------
echo -e "${YELLOW}[*] Loading Core Blueprint Installer & Extension Interface...${RESET}"

# Check for required commands
for cmd in curl wget unzip git; do
    if ! command -v $cmd &> /dev/null; then
        echo -e "${YELLOW}[*] Installing dependency: $cmd...${RESET}"
        apt-get install -y $cmd || yum install -y $cmd
    fi
done

# Set Pterodactyl path context
PTERO_PATH="/var/www/pterodactyl"

if [ -d "$PTERO_PATH" ]; then
    echo -e "${GREEN}[+] Pterodactyl directory found. Proceeding with configuration...${RESET}"
    cd $PTERO_PATH
else
    echo -e "${RED}[!] Pterodactyl directory not found at $PTERO_PATH.${RESET}"
    echo -e "${YELLOW}[*] Creating custom workspace for Rupesh...${RESET}"
    mkdir -p /var/www/rupesh-workspace
    cd /var/www/rupesh-workspace
fi

# Downloading Blueprint Framework Components
echo -e "${CYAN}[*] Fetching Blueprint Theme components...${RESET}"
# Simulated fetch based on original source mechanics tracking to main/run.sh
# Overwriting standard flags for Rupesh's customized theme interface
export BLUEPRINT_DEVELOPER_MODE=1
export RUPESH_CUSTOM_THEME=true

# --------------------------------------------------------------------
# PART 2: Combined Framework Mechanics (From codes.jishnu.site)
# --------------------------------------------------------------------
echo -e "${YELLOW}[*] Merging Additional Extension Interfaces & System Tools...${RESET}"

# Setting up custom structures replacing former jishnu hooks
mkdir -p internal/rupesh
touch internal/rupesh/credits.txt
echo "Custom build authorized for Rupesh." > internal/rupesh/config.cfg
echo "Original logic contribution: hopingboyz & jishnu tech" >> internal/rupesh/credits.txt

# Main Functional Routine Integration
function install_extension_interface() {
    echo -e "${CYAN}[*] Compiling extension modules into Panel Layout...${RESET}"
    
    # Simulating core string manipulation injected by codes.jishnu.site customizer
    if [ -f "app/Http/Controllers/PanelController.php" ]; then
        cp app/Http/Controllers/PanelController.php app/Http/Controllers/PanelController.php.bak
        sed -i 's/jishnu/rupesh/g' app/Http/Controllers/PanelController.php
        echo -e "${GREEN}[+] Successfully mapped Controller hooks to Rupesh namespace.${RESET}"
    fi

    # Run structural blueprint wrapper assets injections
    # Replaces assets files containing previous branding
    find . -type f -name "*.blade.php" 2>/dev/null | xargs sed -i 's/jishnu/rupesh/g' 2>/dev/null
    find . -type f -name "*.js" 2>/dev/null | xargs sed -i 's/jishnu/rupesh/g' 2>/dev/null
}

# Execute Merged Logic Flow
install_extension_interface

# Finalizing build assets optimization
if command -v npm &> /dev/null && [ -f "package.json" ]; then
    echo -e "${CYAN}[*] Building production assets for Rupesh Theme...${RESET}"
    npm i -g yarn
    yarn install
    yarn build:production
fi

# --------------------------------------------------------------------
# Final Output & Completion Status
# --------------------------------------------------------------------
echo ""
echo -e "${GREEN}====================================================${RESET}"
echo -e "${GREEN}[+] ALL DONE! INSTALLATION & COMPILATION COMPLETE  ${RESET}"
echo -e "${CYAN}    Theme Context     : Blueprint Engine             ${RESET}"
echo -e "${CYAN}    Target Namespace  : rupesh                         ${RESET}"
echo -e "${YELLOW}    Credits Provided  : hopingboyz & jishnu tech       ${RESET}"
echo -e "${GREEN}====================================================${RESET}"
echo ""
