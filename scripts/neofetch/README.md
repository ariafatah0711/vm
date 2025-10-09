# Neofetch Setup

Simple neofetch installation with custom ASCII art.

## Fast Setup
```bash
curl -s https://raw.githubusercontent.com/ariafatah0711/vm/refs/heads/main/scripts/neofetch/setup.sh | bash -s install
```
atau
```bash
wget -qO- https://raw.githubusercontent.com/ariafatah0711/vm/refs/heads/main/scripts/neofetch/setup.sh | bash -s install
```

## Fast Setup for Other User
```bash
sudo -u vagrant bash -c "curl -s https://raw.githubusercontent.com/ariafatah0711/vm/refs/heads/main/scripts/neofetch/setup.sh | bash -s install"
```

## Files

- `setup.sh` - Installation script with remote fallback
- `config.conf` - Neofetch configuration
- `logo/3.txt` - Custom ASCII art logo

## Usage

### Manual Install
```bash
wget https://raw.githubusercontent.com/ariafatah0711/vm/refs/heads/main/scripts/neofetch/setup.sh
chmod +x setup.sh
./setup.sh install
neofetch
```

### Uninstall
```bash
./setup.sh uninstall
```

## What it does

1. Installs neofetch (if not already installed)
2. Copies config to `~/.config/neofetch/config.conf` (local first, remote fallback)
3. Copies your custom logo to `~/.config/neofetch/logo.txt` (local first, remote fallback)
4. Config is set to use the custom logo automatically

Now just run `neofetch` and it will show your custom ASCII art! 🎉

---

# termux
```bash
curl -s https://raw.githubusercontent.com/ariafatah0711/vm/refs/heads/main/scripts/neofetch/termux.sh | bash -s install
```
