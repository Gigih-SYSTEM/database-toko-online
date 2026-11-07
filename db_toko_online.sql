-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Nov 2026 pada 07.31
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_toko_online`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `brand`
--

CREATE TABLE `brand` (
  `kd_brand` int(11) NOT NULL,
  `nm_brand` varchar(225) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `brand`
--

INSERT INTO `brand` (`kd_brand`, `nm_brand`, `keterangan`) VALUES
(1, 'Nike', 'Brand olahraga'),
(2, 'Adidas', 'Brand olahraga'),
(3, 'Puma', 'Brand fashion dan olahraga'),
(4, 'Converse', 'Brand sepatu casual'),
(5, 'Vans', 'Brand sepatu dan pakaian');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pembayaran`
--

CREATE TABLE `detail_pembayaran` (
  `kd_detail_pembayaran` int(11) NOT NULL,
  `kd_pembayaran` int(11) NOT NULL,
  `kd_produk` int(11) NOT NULL,
  `harga_jual` decimal(10,2) DEFAULT NULL,
  `harga_beli` decimal(10,2) DEFAULT NULL,
  `qty` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `distributor`
--

CREATE TABLE `distributor` (
  `kd_distributor` int(11) NOT NULL,
  `nm_distributor` varchar(225) NOT NULL,
  `alamat` text DEFAULT NULL,
  `no_telp` varchar(13) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `nm_sales` varchar(225) DEFAULT NULL,
  `hp_sales` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `distributor`
--

INSERT INTO `distributor` (`kd_distributor`, `nm_distributor`, `alamat`, `no_telp`, `email`, `nm_sales`, `hp_sales`) VALUES
(1, 'PT Sumber Fashion', 'Jakarta', '021123456', 'sumber@gmail.com', 'Andi', '081234567890'),
(2, 'CV Berkah Sport', 'Bandung', '022123456', 'berkah@gmail.com', 'Budi', '082345678901'),
(3, 'PT Fashion Jaya', 'Surabaya', '031123456', 'fashion@gmail.com', 'Rudi', '083456789012'),
(4, 'CV Maju Bersama', 'Tangerang', '021987654', 'maju@gmail.com', 'Doni', '084567890123'),
(5, 'PT Global Store', 'Bekasi', '021765432', 'global@gmail.com', 'Agus', '085678901234');

-- --------------------------------------------------------

--
-- Struktur dari tabel `foto`
--

CREATE TABLE `foto` (
  `kd_foto` int(11) NOT NULL,
  `nm_foto` varchar(225) DEFAULT NULL,
  `path` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `kd_kategori` int(11) NOT NULL,
  `nm_kategori` varchar(225) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`kd_kategori`, `nm_kategori`, `keterangan`) VALUES
(1, 'Sepatu', 'Kategori produk sepatu'),
(2, 'Baju', 'Kategori pakaian'),
(3, 'Celana', 'Kategori celana pria dan wanita'),
(4, 'Tas', 'Kategori tas fashion'),
(5, 'Aksesoris', 'Kategori aksesoris fashion');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang_belanja`
--

CREATE TABLE `keranjang_belanja` (
  `kd_keranjang_belanja` int(11) NOT NULL,
  `kd_user` int(11) NOT NULL,
  `tgl_keranjang` date DEFAULT NULL,
  `kd_produk` int(11) NOT NULL,
  `qty` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `kd_pembayaran` int(11) NOT NULL,
  `invoice` varchar(6) DEFAULT NULL,
  `tgl_bayar` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `kd_produk` int(11) NOT NULL,
  `kd_ukuran` int(11) DEFAULT NULL,
  `kd_brand` int(11) DEFAULT NULL,
  `kd_kategori` int(11) DEFAULT NULL,
  `kd_warna` int(11) DEFAULT NULL,
  `kd_foto` int(11) DEFAULT NULL,
  `kd_distributor` int(11) DEFAULT NULL,
  `nama_produk` varchar(225) NOT NULL,
  `harga_jual` decimal(10,2) DEFAULT NULL,
  `harga_beli` decimal(10,2) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `stok` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok_produk`
--

CREATE TABLE `stok_produk` (
  `kd_stok` int(11) NOT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `kd_barang` int(11) DEFAULT NULL,
  `harga_beli` decimal(10,2) DEFAULT NULL,
  `harga_jual` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ukuran`
--

CREATE TABLE `ukuran` (
  `kd_ukuran` int(11) NOT NULL,
  `nm_ukuran` varchar(225) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ukuran`
--

INSERT INTO `ukuran` (`kd_ukuran`, `nm_ukuran`, `keterangan`) VALUES
(1, 'S', 'Ukuran Small'),
(2, 'M', 'Ukuran Medium'),
(3, 'L', 'Ukuran Large'),
(4, 'XL', 'Ukuran Extra Large'),
(5, 'XXL', 'Ukuran Double Extra Large'),
(6, '39', 'Ukuran sepatu 39'),
(7, '40', 'Ukuran sepatu 40'),
(8, '41', 'Ukuran sepatu 41'),
(9, '42', 'Ukuran sepatu 42'),
(10, '43', 'Ukuran sepatu 43'),
(11, 'S', 'Small'),
(12, 'M', 'Medium'),
(13, 'L', 'Large'),
(14, 'XL', 'Extra Large'),
(15, 'XXL', 'Double Extra Large'),
(16, '39', 'Ukuran sepatu 39'),
(17, '40', 'Ukuran sepatu 40'),
(18, '41', 'Ukuran sepatu 41'),
(19, '42', 'Ukuran sepatu 42'),
(20, '43', 'Ukuran sepatu 43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `kd_user` int(11) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(225) DEFAULT NULL,
  `no_telpon` varchar(225) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `foto_ktp` varchar(225) DEFAULT NULL,
  `nik` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `warna`
--

CREATE TABLE `warna` (
  `kd_warna` int(11) NOT NULL,
  `nm_warna` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `warna`
--

INSERT INTO `warna` (`kd_warna`, `nm_warna`) VALUES
(1, 'Hitam'),
(2, 'Putih'),
(3, 'Merah'),
(4, 'Biru'),
(5, 'Abu-abu'),
(6, 'Hijau'),
(7, 'Cokelat'),
(8, 'Kuning'),
(9, 'Navy'),
(10, 'Cream');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`kd_brand`);

--
-- Indeks untuk tabel `detail_pembayaran`
--
ALTER TABLE `detail_pembayaran`
  ADD PRIMARY KEY (`kd_detail_pembayaran`),
  ADD KEY `kd_pembayaran` (`kd_pembayaran`),
  ADD KEY `kd_produk` (`kd_produk`);

--
-- Indeks untuk tabel `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`kd_distributor`);

--
-- Indeks untuk tabel `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`kd_foto`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kd_kategori`);

--
-- Indeks untuk tabel `keranjang_belanja`
--
ALTER TABLE `keranjang_belanja`
  ADD PRIMARY KEY (`kd_keranjang_belanja`),
  ADD KEY `kd_user` (`kd_user`),
  ADD KEY `kd_produk` (`kd_produk`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`kd_pembayaran`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`kd_produk`),
  ADD KEY `kd_ukuran` (`kd_ukuran`),
  ADD KEY `kd_brand` (`kd_brand`),
  ADD KEY `kd_kategori` (`kd_kategori`),
  ADD KEY `kd_warna` (`kd_warna`),
  ADD KEY `kd_foto` (`kd_foto`),
  ADD KEY `kd_distributor` (`kd_distributor`);

--
-- Indeks untuk tabel `stok_produk`
--
ALTER TABLE `stok_produk`
  ADD PRIMARY KEY (`kd_stok`);

--
-- Indeks untuk tabel `ukuran`
--
ALTER TABLE `ukuran`
  ADD PRIMARY KEY (`kd_ukuran`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`kd_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `warna`
--
ALTER TABLE `warna`
  ADD PRIMARY KEY (`kd_warna`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `brand`
--
ALTER TABLE `brand`
  MODIFY `kd_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `detail_pembayaran`
--
ALTER TABLE `detail_pembayaran`
  MODIFY `kd_detail_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `distributor`
--
ALTER TABLE `distributor`
  MODIFY `kd_distributor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `foto`
--
ALTER TABLE `foto`
  MODIFY `kd_foto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kd_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `keranjang_belanja`
--
ALTER TABLE `keranjang_belanja`
  MODIFY `kd_keranjang_belanja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `kd_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `kd_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `stok_produk`
--
ALTER TABLE `stok_produk`
  MODIFY `kd_stok` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ukuran`
--
ALTER TABLE `ukuran`
  MODIFY `kd_ukuran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `kd_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `warna`
--
ALTER TABLE `warna`
  MODIFY `kd_warna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_pembayaran`
--
ALTER TABLE `detail_pembayaran`
  ADD CONSTRAINT `detail_pembayaran_ibfk_1` FOREIGN KEY (`kd_pembayaran`) REFERENCES `pembayaran` (`kd_pembayaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pembayaran_ibfk_2` FOREIGN KEY (`kd_produk`) REFERENCES `produk` (`kd_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `keranjang_belanja`
--
ALTER TABLE `keranjang_belanja`
  ADD CONSTRAINT `keranjang_belanja_ibfk_1` FOREIGN KEY (`kd_user`) REFERENCES `user` (`kd_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `keranjang_belanja_ibfk_2` FOREIGN KEY (`kd_produk`) REFERENCES `produk` (`kd_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kd_ukuran`) REFERENCES `ukuran` (`kd_ukuran`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `produk_ibfk_2` FOREIGN KEY (`kd_brand`) REFERENCES `brand` (`kd_brand`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `produk_ibfk_3` FOREIGN KEY (`kd_kategori`) REFERENCES `kategori` (`kd_kategori`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `produk_ibfk_4` FOREIGN KEY (`kd_warna`) REFERENCES `warna` (`kd_warna`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `produk_ibfk_5` FOREIGN KEY (`kd_foto`) REFERENCES `foto` (`kd_foto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `produk_ibfk_6` FOREIGN KEY (`kd_distributor`) REFERENCES `distributor` (`kd_distributor`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
