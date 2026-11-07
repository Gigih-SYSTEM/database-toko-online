
# DATABASE TOKO ONLINE

## Deskripsi
Database Toko Online dibuat untuk mengelola data produk,
stok barang, kategori, ukuran, pembayaran, dan transaksi
penjualan secara terstruktur.

## Nama Database
db_toko_online

## Daftar Tabel
1. brand
2. detail_pembayaran
3. distributor
4. foto
5. kategori
6. keranjang_belanja
7. pembayaran
8. produk
9. stok_produk
10. ukuran
11. user
12. warna

## Struktur Tabel Produk
- kd_produk
- kd_ukuran
- kd_brand
- kd_kategori
- kd_warna
- kd_foto
- kd_distributor
- nama_produk
- harga_jual
- harga_beli
- deskripsi
- stok

## Struktur Tabel Detail Pembayaran
- kd_detail_pembayaran
- kd_pembayaran
- kd_produk
- harga_jual
- harga_beli
- qty

## Software yang Digunakan
- XAMPP
- MySQL / MariaDB
- phpMyAdmin
- GitHub

## Cara Import Database
1. Buka phpMyAdmin.
2. Buat database db_toko_online.
3. Pilih menu Import.
4. Pilih file db_toko_online.sql.
5. Klik Import.
