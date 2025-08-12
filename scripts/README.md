## fast setup
```bash
curl -s https://raw.githubusercontent.com/ariafatah0711/vm/refs/heads/main/scripts/setup.sh | bash -s install
```
atau
```bash
wget -qO- https://raw.githubusercontent.com/ariafatah0711/vm/refs/heads/main/scripts/setup.sh | bash -s install
```

## fast setup for other user
```bash
sudo -u vagrant bash -c "curl -s https://raw.githubusercontent.com/ariafatah0711/vm/refs/heads/main/scripts/setup.sh | bash -s install"
```

## setup
```bash
wget https://raw.githubusercontent.com/ariafatah0711/vm/refs/heads/main/scripts/setup.sh
chmod +x setup.sh
./setup.sh install
```
Setelah selesai, jalankan:
```bash
source ~/.bashrc
```

## uninstall
```bash
./setup.sh uninstall
```
