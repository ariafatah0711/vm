# recovery password os
## kali linux
1. masuk ke boot menu
2. pilih opsi advanced options for kali linux
3. pilih opsi recovery mode
4. ubah ro menjadi rw dan tambahkan init=/bin/bash
5. tekan ctrl + x atau f10 untuk melanjutkan booting
6. setelah masuk ke shell bash, ketik perintah berikut untuk mereset password:
   ```
   passwd nama_user
   ```
7. masukkan password baru dan konfirmasi
8. setelah berhasil mereset password, ketik perintah berikut untuk reboot sistem:\
   ```
   exec /sbin/init
   ```
9. sistem akan reboot dan kamu bisa login dengan password baru

## ubuntu
1. masuk ke boot menu
2. pilih opsi advanced options for ubuntu
3. pilih opsi recovery mode
4. pilih opsi root untuk masuk ke shell root
5. ketik perintah berikut untuk meremount filesystem dengan hak akses baca tulis:
   ```
   mount -o remount,rw /
   ```
6. ketik perintah berikut untuk mereset password:
   ```
    passwd nama_user
    ```
7. masukkan password baru dan konfirmasi
8. setelah berhasil mereset password, ketik perintah berikut untuk reboot sistem:\
   ```
   reboot
   ```

## windows
1. masukkan media instalasi windows (USB/DVD) dan boot dari media tersebut
2. pada layar instalasi windows, tekan Shift + F10 untuk membuka command prompt
3. ketik perintah berikut untuk mengganti utilman.exe dengan cmd.exe:
   ```
   move c:\windows\system32\utilman.exe c:\
   copy c:\windows\system32\cmd.exe c:\windows\system32\utilman.exe
   ```
4. reboot komputer dan biarkan boot ke layar login windows
5. pada layar login, klik ikon aksesibilitas di pojok kanan bawah untuk membuka command prompt
6. ketik perintah berikut untuk mereset password:
   ```
   net user nama_user password_baru
   ```
7. setelah berhasil mereset password, reboot komputer kembali ke media instalasi windows dan kembalikan utilman.exe:
   ```
   copy c:\utilman.exe c:\windows\system32\utilman.exe
   ```
8. reboot komputer dan login dengan password baru
