#!/usr/bin/env bash

set -euo pipefail

# ====== CONFIG ======
THEME_URL="https://raw.githubusercontent.com/ariafatah0711/win_aria/refs/heads/main/oh-my-posh/avit.omp-aria.json"
THEME_DIR="${HOME}/.config/oh-my-posh"
THEME_FILE="${THEME_DIR}/avit.omp-aria.json"

# Warna
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
RESET="\033[0m"

SHELL_RC="${HOME}/.bashrc"
if [[ -n "${ZSH_VERSION:-}" ]]; then
  SHELL_RC="${HOME}/.zshrc"
fi
SHELL_NAME=$(basename "${SHELL}")

# ====== FUNCTIONS ======
install_oh_my_posh() {
  echo -e "${BLUE}🔍 Mengecek Oh My Posh...${RESET}"
  if ! command -v oh-my-posh &> /dev/null; then
    echo -e "${YELLOW}⚙️  Menginstal Oh My Posh...${RESET}"
    curl -s https://api.github.com/repos/JanDeDobbeleer/oh-my-posh/releases/latest \
      | grep "browser_download_url.*linux-amd64" \
      | cut -d '"' -f 4 \
      | wget -qi - -O ~/omp
    chmod +x ~/omp
    sudo mv ~/omp /usr/local/bin/oh-my-posh
    echo -e "${GREEN}✅ Oh My Posh berhasil diinstal.${RESET}"
  else
    echo -e "${GREEN}✅ Oh My Posh sudah terpasang.${RESET}"
  fi
}

download_theme() {
  echo -e "${BLUE}📥 Mengunduh tema...${RESET}"
  mkdir -p "${THEME_DIR}"
  curl -fsSL "${THEME_URL}" -o "${THEME_FILE}"
  echo -e "${GREEN}✅ Tema disimpan di ${THEME_FILE}.${RESET}"
}

update_shell_rc() {
  if ! grep -q "oh-my-posh.*avit.omp-aria.json" "${SHELL_RC}"; then
    {
      echo ""
      echo "# Inisiasi Oh My Posh dengan tema avit.omp-aria"
      echo "clear"
      echo "eval \"\$(oh-my-posh --init --shell ${SHELL_NAME} --config ${THEME_FILE})\""
    } >> "${SHELL_RC}"
    echo -e "${GREEN}✅ Baris inisialisasi ditambahkan ke ${SHELL_RC}.${RESET}"
  else
    echo -e "${YELLOW}ℹ️  Konfigurasi sudah ada di ${SHELL_RC}.${RESET}"
  fi
}

remove_oh_my_posh() {
  echo -e "${BLUE}🗑 Menghapus Oh My Posh dan konfigurasi...${RESET}"

  # Hapus binary
  # if command -v oh-my-posh &> /dev/null; then
  #   sudo rm -f "$(command -v oh-my-posh)"
  #   echo -e "${GREEN}✅ Binary Oh My Posh dihapus.${RESET}"
  # else
  #   echo -e "${YELLOW}ℹ️  Oh My Posh tidak ditemukan.${RESET}"
  # fi

  # Hapus tema
  rm -rf "${THEME_DIR}"
  echo -e "${GREEN}✅ Tema dihapus.${RESET}"

  # Hapus konfigurasi dari shell RC (cara aman)
  if [[ -f "${SHELL_RC}" ]]; then
    grep -v "oh-my-posh" "${SHELL_RC}" | grep -v "# Inisiasi Oh My Posh" > "${SHELL_RC}.tmp" || true
    mv "${SHELL_RC}.tmp" "${SHELL_RC}"
    echo -e "${GREEN}✅ Konfigurasi dihapus dari ${SHELL_RC}.${RESET}"
  fi

  echo -e "${YELLOW}⚠️  Silakan jalankan: ${RESET}source ${SHELL_RC} ${YELLOW}atau restart terminal untuk menghindari error.${RESET}"
}

# ====== MAIN ======
case "${1:-}" in
  install)
    install_oh_my_posh
    download_theme
    update_shell_rc
    echo -e "${GREEN}🎉 Instalasi selesai! Silakan jalankan 'source ${SHELL_RC}' atau buka terminal baru.${RESET}"
    ;;
  uninstall)
    remove_oh_my_posh
    echo -e "${GREEN}🗑 Uninstall selesai.${RESET}"
    ;;
  *)
    echo -e "${YELLOW}Usage:${RESET} $0 {install|uninstall}"
    exit 1
    ;;
esac
