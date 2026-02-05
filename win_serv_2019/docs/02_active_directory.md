[00:00:01]
### Ringkasan Pengantar dan Konsep Dasar Active Directory
- Video ini disampaikan oleh Mirza Ratriadi dalam konteks tutorial administrasi Windows Server 2019.
- Fokus pembahasan adalah **Active Directory (AD)** sebagai kelanjutan dari materi sebelumnya tentang domain, trust, dan forest.
- **Domain** dijelaskan sebagai wilayah teritorial atau kedaulatan dalam sebuah organisasi, perusahaan, atau negara di ranah teknologi jaringan.
- **Active Directory** adalah layanan direktori yang berperan sebagai pusat manajemen pengguna, komputer, dan berbagai objek pada jaringan yang terhubung dalam satu domain.

[00:00:41]
### Fungsi Utama Active Directory dan Domain Controller
- Active Directory berfungsi untuk **mengautentikasi dan memberikan otoritas** kepada pengguna, komputer, dan perangkat di dalam jaringan domain Windows.
- Domain Controller (DC) adalah server yang menjalankan layanan Active Directory dan mengatur proses autentikasi tersebut.
- AD memungkinkan pengaturan kebijakan kapan pengguna boleh login, logout, atau akses perangkat tertentu dalam organisasi.
- Contohnya, AD dapat menentukan apakah seorang karyawan masih berhak login ke sistem atau tidak.

[00:01:25]
### Pengaturan Akses Perangkat dan Server oleh Active Directory
- Dalam satu organisasi, AD dapat mengatur hak akses terhadap perangkat seperti laptop, desktop, dan server.
- Contoh: Pengguna tertentu bisa diberi atau dibatasi akses ke database server tertentu.
- AD mengelola server mana yang dapat diakses oleh pengguna, memungkinkan kontrol yang terpusat dan terstruktur.

[00:02:58]
### Istilah-istilah Penting dalam Active Directory
- **Active Directory Domain Services (AD DS)** adalah layanan utama AD yang berjalan pada domain controller.
- Domain dalam konteks Microsoft Network dianalogikan seperti wilayah dengan aturan, kebijakan, dan regulasi yang mengatur sumber daya di dalamnya.
- AD DS memfasilitasi pengelolaan objek-objek yang terdapat di domain tersebut.

[00:04:33]
### Objek dalam Active Directory: Definisi dan Contoh
- Objek adalah grup atribut yang merepresentasikan sumber daya dalam domain.
- Contoh objek di Active Directory meliputi:
  - **Organizational Unit (OU)**: wadah yang dapat berisi objek lain seperti user, komputer, dan grup.
  - **User**: akun pengguna.
  - **Computer**: perangkat keras di jaringan.
  - **Group**: kumpulan user yang memiliki aturan atau kebijakan khusus.
  - **Contact**: informasi kontak seperti alamat email.
  - **Shared Folder**: folder yang dapat diakses bersama dalam jaringan.
  - **Shared Printer**: printer yang dapat digunakan bersama oleh grup pengguna.

[00:05:26]
### Security Identifier (SID) dan Fungsi Uniknya
- Setiap objek di AD memiliki **Security Identifier (SID)**, yang merupakan pengenal unik seperti nomor induk kependudukan atau sidik jari dalam dunia nyata.
- SID digunakan untuk mengidentifikasi objek secara unik dan menentukan hak akses serta izin dalam domain.
- Penggunaan SID menjamin tidak ada duplikasi identitas objek di dalam domain, memastikan keamanan dan konsistensi manajemen akses.

[00:07:00]
### Penjelasan Lebih Lanjut Tentang Objek dan Grup dalam AD
- **Organizational Unit (OU)** dapat mengelompokkan berbagai objek di dalam domain yang sama, seperti user account, komputer, dan grup.
- **Grup** adalah kumpulan user yang dikategorikan berdasarkan fungsi atau departemen dalam organisasi.
- Grup terbagi menjadi dua jenis:
  | Jenis Grup           | Fungsi Utama                                          |
  |----------------------|------------------------------------------------------|
  | Security Group       | Memberikan akses ke resource dalam domain             |
  | Distribution Group  | Digunakan untuk distribusi email (email distribution list) |
- Contoh grup dalam perusahaan: finance, sales, HR, technical.

[00:08:42]
### Objek Kontak, Folder, dan Printer dalam AD
- **Contact** berisi informasi alamat dan email pengguna atau entitas lain dalam domain.
- **Shared Folder** memungkinkan berbagi file secara terpusat dan dapat diakses oleh pengguna tertentu atau seluruh karyawan.
- **Shared Printer** memungkinkan penggunaan printer secara bersama-sama dalam jaringan organisasi.

[00:10:44]
### Fungsi Utama Active Directory: Sentralisasi Pengelolaan Objek
- AD berperan sebagai sistem sentralisasi yang mengelola berbagai objek di dalam domain, seperti user, komputer, grup, kontak, shared folder, dan printer.
- Dengan AD, pengelolaan akses dan kebijakan menjadi lebih terstruktur dan mudah dikendalikan.

[00:11:27]
### Rangkuman Konsep Forest, Domain, Subdomain, dan Trust Relationship
- **Forest** adalah kumpulan satu atau lebih domain yang terhubung secara hierarkis.
- **Domain** adalah unit utama dalam forest, dan dapat memiliki subdomain di dalamnya.
- Contoh domain dan subdomain:
  | Level      | Contoh Nama Domain               | Keterangan                 |
  |------------|--------------------------------|----------------------------|
  | Forest     | *Satu kumpulan domain*          | Seluruh lingkungan AD      |
  | Domain     | suka-suka.com                  | Domain utama/top level      |
  | Subdomain  | sales.suka-suka.com, finance.suka-suka.com | Cabang domain di bawah domain utama |
- **Trust Relationship** adalah hubungan kepercayaan antar domain/subdomain yang memungkinkan akses sumber daya lintas domain.
- Contohnya, domain sales dan finance memiliki trust relationship dengan domain utama untuk berbagi sumber daya.

[00:12:57]
### Peran Active Directory dalam Forest dan Domain
- AD adalah layanan yang berjalan dalam satu forest dan domain, mengatur dan mengelola user, grup, dan objek lain secara keseluruhan.
- AD memungkinkan pengelolaan terpusat untuk satu forest/domain yang mencakup:
  - Organizational Units (OU)
  - User accounts
  - Groups (Security dan Distribution)
  - Computers (server dan client)
  - Contacts
  - Shared folders dan printers

[00:14:17]
### Penutup dan Harapan
- Video ini menyimpulkan pembahasan konsep Active Directory sebagai kelanjutan dari materi domain, forest, dan trust.
- Penjelasan ini bertujuan memberikan pemahaman dasar tentang fungsi dan struktur Active Directory dalam lingkungan Windows Server 2019.
- Pengguna diajak untuk berlangganan channel untuk mendapatkan tutorial selanjutnya.

**Kesimpulan Utama:**
- **Active Directory adalah layanan kunci dalam pengelolaan sumber daya jaringan berbasis domain.**
- AD menyediakan sistem otentikasi, otorisasi, dan manajemen objek yang terpusat dan aman.
- Struktur domain dan forest serta trust relationship membangun kerangka kerja yang memungkinkan integrasi dan pengelolaan sumber daya secara efektif.
- Penggunaan objek seperti OU, user, grup, kontak, shared folder, dan printer memperkuat fleksibilitas dan kontrol dalam jaringan organisasi.
