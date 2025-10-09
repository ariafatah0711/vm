#!/usr/bin/env bash

set -euo pipefail

# ====== CONFIG ======
NEOFETCH_CONFIG_DIR="${HOME}/.config/neofetch_termux"
SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]:-${0}}")" 2>/dev/null || echo "$(pwd)")"

# Remote URLs
REMOTE_CONFIG_URL="https://raw.githubusercontent.com/ariafatah0711/vm/main/scripts/neofetch_termux/config.conf"
REMOTE_LOGO_URL="https://raw.githubusercontent.com/ariafatah0711/vm/main/scripts/neofetch/logo/2_color.txt"

# Local files
LOCAL_CONFIG="${SCRIPT_DIR}/config.conf"
LOCAL_LOGO="${SCRIPT_DIR}/logo/2_color.txt"

# Colors
GREEN="\033[32m"
BLUE="\033[34m"
RED="\033[31m"
YELLOW="\033[33m"
RESET="\033[0m"

# ====== FUNCTIONS ======
install_neofetch() {
  echo -e "${BLUE}Installing Neofetch...${RESET}"
  if ! command -v neofetch &> /dev/null; then
    if command -v pkg &> /dev/null; then
      pkg update -y && pkg install -y neofetch
    elif command -v apt &> /dev/null; then
      apt update -y && apt install -y neofetch
    elif command -v yum &> /dev/null; then
      yum install -y neofetch
    elif command -v dnf &> /dev/null; then
      dnf install -y neofetch
    elif command -v pacman &> /dev/null; then
      pacman -S --noconfirm neofetch
    elif command -v zypper &> /dev/null; then
      zypper install -y neofetch
    else
      echo -e "${RED}❌ Package manager not supported${RESET}"
      exit 1
    fi
  fi
  echo -e "${GREEN}✅ Neofetch ready${RESET}"
}

setup_config() {
  echo -e "${BLUE}Setting up config...${RESET}"
  mkdir -p "${NEOFETCH_CONFIG_DIR}"

  # Copy or download config
  if [[ -f "${LOCAL_CONFIG}" ]]; then
    echo -e "${GREEN}✅ Using local config${RESET}"
    cp "${LOCAL_CONFIG}" "${NEOFETCH_CONFIG_DIR}/config.conf"
  else
    echo -e "${YELLOW}⚠️  Local config not found, downloading from remote...${RESET}"
    if command -v curl &> /dev/null; then
      curl -fsSL "${REMOTE_CONFIG_URL}" -o "${NEOFETCH_CONFIG_DIR}/config.conf"
    elif command -v wget &> /dev/null; then
      wget -q "${REMOTE_CONFIG_URL}" -O "${NEOFETCH_CONFIG_DIR}/config.conf"
    else
      echo -e "${RED}❌ No curl or wget available${RESET}"
      exit 1
    fi
    echo -e "${GREEN}✅ Config downloaded${RESET}"
  fi

  # Copy or download logo
  if [[ -f "${LOCAL_LOGO}" ]]; then
    echo -e "${GREEN}✅ Using local logo${RESET}"
    cp "${LOCAL_LOGO}" "${NEOFETCH_CONFIG_DIR}/logo.txt"
  else
    echo -e "${YELLOW}⚠️  Local logo not found, downloading from remote...${RESET}"
    if command -v curl &> /dev/null; then
      curl -fsSL "${REMOTE_LOGO_URL}" -o "${NEOFETCH_CONFIG_DIR}/logo.txt"
    elif command -v wget &> /dev/null; then
      wget -q "${REMOTE_LOGO_URL}" -O "${NEOFETCH_CONFIG_DIR}/logo.txt"
    else
      echo -e "${RED}❌ No curl or wget available${RESET}"
      exit 1
    fi
    echo -e "${GREEN}✅ Logo downloaded${RESET}"
  fi

  # Fix line endings
  if command -v dos2unix &> /dev/null; then
    dos2unix "${NEOFETCH_CONFIG_DIR}/config.conf" 2>/dev/null || true
  elif command -v sed &> /dev/null; then
    sed -i 's/\r$//' "${NEOFETCH_CONFIG_DIR}/config.conf" 2>/dev/null || true
  else
    tr -d '\r' < "${NEOFETCH_CONFIG_DIR}/config.conf" > "${NEOFETCH_CONFIG_DIR}/config.tmp" && mv "${NEOFETCH_CONFIG_DIR}/config.tmp" "${NEOFETCH_CONFIG_DIR}/config.conf"
  fi

  echo -e "${GREEN}✅ Config and logo ready${RESET}"
}

remove_setup() {
  echo -e "${BLUE}Removing setup...${RESET}"

  # Remove config
  rm -rf "${NEOFETCH_CONFIG_DIR}"
  echo -e "${GREEN}✅ Config removed${RESET}"

  # Uninstall neofetch
  if command -v neofetch &> /dev/null; then
    echo -e "${BLUE}Uninstalling neofetch package...${RESET}"
    if command -v pkg &> /dev/null; then
      pkg uninstall -y neofetch || true
    elif command -v apt &> /dev/null; then
      apt remove -y neofetch || true
    elif command -v yum &> /dev/null; then
      yum remove -y neofetch || true
    elif command -v dnf &> /dev/null; then
      dnf remove -y neofetch || true
    elif command -v pacman &> /dev/null; then
      pacman -R --noconfirm neofetch || true
    elif command -v zypper &> /dev/null; then
      zypper remove -y neofetch || true
    else
      echo -e "${YELLOW}⚠️  Please remove neofetch manually${RESET}"
    fi
    echo -e "${GREEN}✅ Neofetch package removed${RESET}"
  else
    echo -e "${YELLOW}ℹ️  Neofetch not installed${RESET}"
  fi

  echo -e "${GREEN}✅ Complete removal finished${RESET}"
}

# ====== MAIN ======
case "${1:-}" in
  install)
    install_neofetch
    setup_config
    echo -e "${GREEN}🎉 Done! Run: neofetch${RESET}"
    ;;
  uninstall)
    remove_setup
    echo -e "${GREEN}🗑 Uninstalled${RESET}"
    ;;
  *)
    echo "Usage: $0 {install|uninstall}"
    exit 1
    ;;
esac
