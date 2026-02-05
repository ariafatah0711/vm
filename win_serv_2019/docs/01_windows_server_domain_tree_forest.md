# windows server
## fitur yang ada pada windows server
Fitur/Komponen	Fungsi Utama	Keterangan
Server Manager	Pusat administrasi Windows Server	Dashboard, konfigurasi roles, monitoring
Windows Admin Center	Pusat administrasi lanjutan	Integrasi dengan Server Manager (tidak dibahas)
Roles and Features	Menambah/menghapus peran server	Contoh: Active Directory, file sharing
Tools	Alat bantu manajemen dan troubleshooting	Computer Management, Services, Event Viewer
Services	Layanan yang berjalan di background Windows Server	Startup otomatis/manual, penting untuk stabilitas
Task Scheduler	Menjadwalkan program berjalan otomatis	Pengaturan jadwal tugas
Disk Management	Manajemen partisi dan disk penyimpanan	Melihat kapasitas dan status disk
PowerShell	Konsol manajemen Windows yang kuat	Pengelolaan server tanpa GUI
Control Panel	Konfigurasi sistem dasar	Pengaturan waktu, jaringan

---

# Konsep Domain, Trees, dan Forests pada Active Directory
- **Domain** dalam dunia internet adalah nama yang mengidentifikasi alamat web, misalnya *yahoo.com*, *facebook.com*, dengan ekstensi seperti *.com*, *.id*, *.co.id*, atau *.org*.
- Sebuah domain bisa memiliki **subdomain**, contohnya *sales.suka-suka.com*, yang merepresentasikan divisi atau bagian dalam sebuah organisasi/perusahaan besar.

### Penjelasan Domain dan Subdomain
- **Domain utama** adalah identitas organisasi di internet dan dalam Microsoft Network.
- **Subdomain** adalah bagian yang lebih spesifik dari domain utama, digunakan untuk mengorganisasi divisi atau unit kerja.
- Contoh:
  - Domain utama: *suka-suka.com*
  - Subdomain: *sales.suka-suka.com* dan *teknik.suka-suka.com*
- Dalam Microsoft Network, domain merupakan kumpulan objek seperti user, komputer, grup, printer, dan lain-lain yang dikelola bersama.

### Konsep Tree (Pohon) dalam Microsoft Network
- **Tree** adalah kumpulan domain yang saling terhubung secara hierarkis, digambarkan seperti pohon dengan cabang-cabang domain.
- Tree memiliki domain utama (root domain) dan subdomain yang menjadi cabang pohon.
- Contoh struktur tree:
  - Root domain: *suka-suka.com*
  - Subdomain: *sales.suka-suka.com*, *finance.suka-suka.com*
- Tree merepresentasikan organisasi yang memiliki banyak divisi dan domain terkait.

### Objek dalam Domain dan Tree
- Domain dan tree berisi **objek-objek** seperti:
  - Organizational Unit (OU)
  - User (pengguna)
  - Computer (komputer/client)
  - Group (grup pengguna)
  - Contact (kontak)
  - Shared folder (folder bersama)
  - Printer
- Semua objek ini dikelola dalam **Active Directory** yang menjadi pusat manajemen domain dan keamanan.
- Contoh dalam domain *suka-suka.com*:
  - Server pusat
  - Client komputer
  - Database server
  - Printer
  - Daftar user

### Trust Relationship dalam Tree
- Antar domain dalam tree saling terhubung melalui **trust relationship** yang membangun kepercayaan antar domain.
- Trust relationship memungkinkan berbagi sumber daya dan informasi antar domain yang berbeda dalam satu tree.
- Pengelompokan domain dan subdomain ini membentuk sebuah **forest**.

### Pengertian Forest dan Global Catalog
- **Forest** adalah kumpulan dari satu atau lebih tree yang memiliki hubungan trust dan berbagi skema Active Directory yang sama.
- Di dalam forest terdapat **Global Catalog**, yaitu database yang berisi informasi objek-objek dari semua domain dan tree yang ada di forest tersebut.
- Forest menjadi sebuah lingkungan kerja jaringan yang terpadu untuk satu perusahaan atau organisasi besar.

### Studi Kasus Merger Perusahaan dan Forest
- Contoh kasus: dua perusahaan berbeda dengan domain dan tree masing-masing bergabung karena merger atau akuisisi.
- Contoh:
  - Perusahaan A dengan domain *suka-suka.com*
  - Perusahaan B dengan domain *sayasuka.com*
- Meskipun memiliki domain dan tree sendiri-sendiri, keduanya dapat bergabung dalam satu forest dengan membangun trust relationship antar domain.
- Setelah trust relationship terbentuk, kedua perusahaan berbagi Global Catalog dan skema Active Directory yang sama, sehingga menjadi satu forest terpadu.

### Visualisasi dan Penjelasan Joining Forest
- Masing-masing domain memiliki objek seperti user, server, database server, dan lain-lain.
- Dengan trust relationship, kedua tree berbeda ini bisa beroperasi dalam satu forest yang sama.
- Forest baru ini mengintegrasikan dua domain dengan domain dan tree yang berbeda menjadi lingkungan jaringan yang saling terhubung dan terpercaya.

### Kesimpulan
- **Domain** adalah unit dasar dalam Microsoft Network yang berisi objek-objek yang dikelola dalam Active Directory.
- **Tree** adalah kumpulan domain yang saling berhubungan secara hierarkis dengan domain utama dan subdomain.
- **Forest** adalah kumpulan tree yang saling berhubungan melalui trust relationship dan berbagi Global Catalog serta skema Active Directory.
- Trust relationship memungkinkan organisasi besar, atau perusahaan yang bergabung, untuk saling berbagi sumber daya dan informasi secara aman dalam satu forest.

### Tabel Definisi Konsep

| Istilah            | Definisi                                                                                  |
|--------------------|-------------------------------------------------------------------------------------------|
| Domain             | Identitas organisasi dalam jaringan, berisi objek-objek seperti user, komputer, grup.     |
| Subdomain          | Bagian dari domain utama yang mewakili divisi atau unit kerja.                            |
| Tree (Pohon)       | Sekumpulan domain yang saling terhubung secara hierarkis membentuk struktur pohon.        |
| Forest (Hutan)     | Sekumpulan tree yang saling terkait melalui trust relationship, berbagi Global Catalog.   |
| Trust Relationship | Hubungan kepercayaan antar domain yang memungkinkan berbagi sumber daya dan informasi.   |
| Global Catalog     | Database yang berisi informasi seluruh objek dari semua domain dan tree dalam forest.     |
| Active Directory   | Layanan direktori yang mengelola objek dan sumber daya di dalam domain Microsoft Network. |
