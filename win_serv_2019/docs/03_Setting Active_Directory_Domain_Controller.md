# Setting Active Directory Domain Controller
## note
Winserver 2019 DC - Domain Controller
hostname: JKT-DC01
domain: ariaf.my.id
ip: 192.168.56.10

user: Administrator
pass: P@ssw0rd123
DSRM: P@ssw0rd123

---

WinServer 2019 SRV - Server
hostname: JKT-SRV01
domain: ariaf.my.id
ip: 192.168.56.11

user: Administrator
pass: P@ssw0rd123
DSRM: P@ssw0rd123

## catatan
[00:00:01]
### Ringkasan Pembukaan dan Persiapan
- Video ini merupakan tutorial administrasi Windows Server 2019 oleh Mirza Ratriani yang fokus pada **praktik pembuatan Active Directory Domain Controller (AD DC)**.
- Pada pertemuan sebelumnya sudah dibahas konsep Active Directory, domain, tree, dan forest.
- Untuk praktek, digunakan **virtual mesin Windows Server 2019** yang sudah terinstall di VirtualBox.
- Nama server diubah menjadi **“Windows Server 2019 DC”** untuk menandakan fungsinya sebagai domain controller.
- Pembuat tutorial menyarankan untuk membuat catatan konfigurasi penting seperti:
  - Nama server: JKT-DC1
  - Domain: suka-suka.com
  - User administrator dan password: rahasia DC 2023
- Jaringan disiapkan menggunakan **Host-Only Adapter** di VirtualBox agar server berada di jaringan internal khusus.

[00:02:04]
### Konfigurasi Jaringan dan IP Static
- Adapter jaringan diatur menggunakan **Host-Only Adapter** dengan rentang IP 192.168.56.101 sampai 254.
- IP server diatur secara **static** agar mudah dikelola, contohnya IP 192.168.56.11.
- DNS server pada konfigurasi IP diisi dengan alamat server itu sendiri (127.0.0.1) karena belum ada DNS server lain.
- Pengaturan IP static dilakukan melalui Control Panel > Network and Sharing Center > Properties adapter jaringan > IPv4 Settings.
- Setelah pengaturan IP, hostname server diubah sesuai catatan menjadi **JKT-DC1**, kemudian server direstart untuk menerapkan perubahan.

[00:06:26]
### Instalasi Role Active Directory Domain Services (AD DS)
- Setelah restart, login dan buka **Server Manager**.
- Klik **Manage > Add Roles and Features** untuk menambahkan peran server sebagai **Domain Controller**.
- Prasyarat yang harus dipenuhi:
  - Password administrator yang kuat
  - IP address sudah static
  - Windows Server sudah update versi terbaru (jika memungkinkan)
- Pilih instalasi **Role-based or feature-based installation** karena server lokal.
- Pilih server yang ingin dipasang role (dalam hal ini hanya satu server yaitu JKT-DC1).
- Pilih role **Active Directory Domain Services (AD DS)**.
- Fitur tambahan yang wajib diinstall termasuk **Group Policy Management**. Fitur lain seperti Web Server, BitLocker adalah opsional dan tidak diperlukan untuk tutorial ini.
- Klik Next dan lanjutkan instalasi AD DS, proses ini memakan beberapa menit.

[00:10:52]
### Promosi Server Menjadi Domain Controller
- Setelah instalasi selesai, muncul notifikasi di Server Manager untuk **promote this server to a domain controller**.
- Klik notifikasi tersebut untuk memulai konfigurasi domain controller.
- Pilihan deployment configuration:
  - Add a domain controller to an existing domain (tidak dipilih karena ini domain baru)
  - Add a new domain to an existing forest (juga tidak dipilih)
  - **Add a new forest** dipilih karena ini setup domain baru.
- Masukkan nama domain root: **suka-suka.com** sesuai catatan.
- Klik Next untuk melanjutkan.

[00:12:13]
### Konfigurasi Functional Level dan Fitur Tambahan
- Tentukan **Forest Functional Level** dan **Domain Functional Level**. Pilihan disesuaikan dengan versi server yang digunakan.
- Karena server adalah Windows Server 2019, dipilih level kompatibilitas **Windows Server 2016** (tidak ada opsi 2019 di menu).
- Aktifkan fitur:
  - Domain Name System (DNS) Server
  - Global Catalog (GC) aktif secara default
- Masukkan password untuk **Directory Services Restore Mode (DSRM)** yang berguna untuk pemulihan server jika terjadi masalah. Password ini case sensitive dan sesuai catatan: **Rahasia2023**.
- Abaikan peringatan terkait DNS karena konfigurasi DNS server akan dilakukan otomatis nanti.
- Klik Next.

[00:14:45]
### Konfigurasi NetBIOS dan Lokasi Database
- NetBIOS name (nama lama komputer yang dikenali sistem lama) disesuaikan dengan hostname, biasanya maksimal 12 karakter untuk kompatibilitas dengan OS lama (Windows 95/98).
- Lokasi folder database Active Directory, log files, dan SYSVOL sudah otomatis diatur, bisa dicek tapi biasanya tidak perlu diubah.
- Klik Next untuk melanjutkan.

[00:16:20]
### Review dan Pengecekan Kebutuhan Instalasi
- Review konfigurasi yang sudah dibuat:
  - Forest and Domain functional level: Windows Server 2016
  - DNS Server dan Global Catalog aktif
  - Lokasi database dan log files
- Skrip instalasi PowerShell juga disediakan secara otomatis oleh Windows Server sebagai dokumentasi.
- Lakukan pengecekan persyaratan instalasi, biasanya muncul peringatan minor yang dapat diabaikan, misalnya terkait DNS delegation yang belum dikonfigurasi.
- Klik Install untuk memulai proses promosi server menjadi domain controller utama.

[00:18:02]
### Proses Instalasi dan Restart Server
- Instalasi berjalan beberapa menit dan setelah selesai, server akan otomatis **restart**.
- Setelah restart, login pertama kali mungkin terasa lama karena server sedang melakukan konfigurasi Active Directory. Harap bersabar.
- Setelah login, buka Server Manager dan cek konfigurasi, seperti nama komputer, nama domain, status firewall, dan remote management.

[00:20:33]
### Verifikasi Domain Controller dan DNS Server
- Sebelum konfigurasi domain controller, user login hanya administrator lokal.
- Setelah konfigurasi, login menjadi **administrator@suka-suka.com** yang menandakan server sudah menjadi bagian dari domain.
- Cek di Server Manager > Tools > DNS Manager:
  - Terlihat konfigurasi DNS server yang mengelola domain suka-suka.com.
  - DNS Zone seperti **Forward Lookup Zones**, **Reverse Zones**, dan record terkait domain controller (mdc, msdcs).
- Server Windows ini berfungsi ganda sebagai **Active Directory Domain Controller dan DNS Server**.

[00:22:13]
### Kesimpulan dan Penutup
- Tutorial telah berhasil menunjukkan langkah-langkah lengkap membuat **Active Directory Domain Controller di Windows Server 2019**.
- Penjelasan mencakup persiapan virtual machine, konfigurasi IP static, instalasi role AD DS, promosi server menjadi domain controller, konfigurasi DNS, dan verifikasi.
- Pengguna diharapkan mencoba praktek sendiri mengikuti langkah-langkah yang telah dicontohkan.
- Penutup video mengingatkan untuk subscribe dan berharap tutorial bermanfaat.

---

### Tabel Ringkasan Langkah Utama Instalasi AD DC

| Tahap                                    | Deskripsi                                                                                      | Catatan Penting                           |
|------------------------------------------|------------------------------------------------------------------------------------------------|------------------------------------------|
| Persiapan VM dan Catatan Konfigurasi     | Siapkan Windows Server 2019 di VirtualBox, buat catatan nama server, domain, user, password     | Nama server: JKT-DC1, domain: suka-suka.com |
| Konfigurasi Jaringan                     | Gunakan Host-Only Adapter, atur IP static (misal 192.168.56.11), DNS pointing ke 127.0.0.1      | IP static wajib untuk server              |
| Ubah Hostname Server                     | Ganti hostname sesuai catatan (JKT-DC1) dan restart server                                     | Restart wajib setelah ubah hostname       |
| Instalasi Role AD DS                     | Tambahkan role Active Directory Domain Services melalui Server Manager > Add Roles and Features | Sertakan Group Policy Management          |
| Promosi Server Jadi Domain Controller   | Jalankan Promote this server to domain controller, buat domain baru (add new forest), masukkan nama domain suka-suka.com | Pilih functional level Windows Server 2016 |
| Konfigurasi Fitur Tambahan               | Aktifkan DNS Server, Global Catalog, buat password DSRM                                        | Password DSRM case sensitive               |
| Konfigurasi NetBIOS dan Lokasi Database | Sesuaikan NetBIOS name, biarkan lokasi database default                                        | NetBIOS max 12 karakter untuk kompatibilitas OS lama |
| Review dan Pengecekan                   | Cek konfigurasi dan requirements, abaikan warning minor, mulai instalasi                      | Review penting sebelum instalasi          |
| Proses Instalasi dan Restart             | Instalasi berjalan, server akan restart otomatis setelah selesai                               | Login pertama kali agak lama               |
| Verifikasi                              | Cek login domain, cek DNS Manager di Server Manager                                           | Pastikan domain controller dan DNS berfungsi |

---

### Insight Kunci
- **IP Static** adalah keharusan agar server domain controller dapat diakses dan dikelola dengan stabil.
- **Role Active Directory Domain Services** harus diinstal terlebih dahulu sebelum server dapat dipromosikan menjadi domain controller.
- **Promosi server ke domain controller utama** memerlukan konfigurasi domain baru (forest baru) jika belum ada domain sebelumnya.
- Penentuan **functional level** menyesuaikan kompatibilitas dengan versi Windows Server yang digunakan.
- Server Windows Server 2019 berfungsi sebagai **domain controller sekaligus DNS Server**, yang penting untuk resolusi nama dalam domain.
- Password untuk **Directory Services Restore Mode (DSRM)** wajib diingat dengan baik untuk proses recovery.
- Proses promosi domain controller memakan waktu dan restart server otomatis, sehingga perlu kesabaran saat login pertama kali.

---

### Kata Kunci
- Windows Server 2019
- Active Directory Domain Controller (AD DC)
- Host-Only Adapter
- IP Static
- DNS Server
- Forest Functional Level
- Directory Services Restore Mode (DSRM)
- Server Manager
- Promote to Domain Controller
- Domain suka-suka.com

---

### FAQ (Pertanyaan yang Sering Muncul)

| Pertanyaan                                            | Jawaban                                                                                       |
|------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| Kenapa harus menggunakan IP static untuk server?    | Agar alamat IP tidak berubah dan server domain controller bisa diakses secara konsisten.       |
| Apa itu DSRM password?                               | Password untuk mode pemulihan Active Directory jika terjadi masalah pada domain controller.    |
| Apa fungsi DNS pada domain controller?               | DNS membantu resolusi nama domain agar komputer dan perangkat lain dapat menemukan server.     |
| Kenapa pilih functional level Windows Server 2016?  | Karena kompatibilitas dengan versi server yang digunakan; versi 2019 belum tersedia opsi-nya.  |
| Apa itu NetBIOS name?                                | Nama komputer lama yang dikenali oleh sistem operasi lama, maksimal 12 karakter untuk kompatibilitas OS lama. |

---

Ringkasan ini mencakup seluruh isi video tutorial secara mendetail dan sesuai dengan isi asli tanpa tambahan informasi yang tidak didukung.
