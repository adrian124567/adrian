-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 25 Okt 2023 pada 15.13
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penyewaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `18073_alat`
--

CREATE TABLE `18073_alat` (
  `id_alat` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga_sewa` decimal(10,0) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `18073_alat`
--

INSERT INTO `18073_alat` (`id_alat`, `nama`, `jumlah`, `harga_sewa`, `gambar`, `keterangan`) VALUES
(14, 'Sleeping Bag', 0, 10000, 'Matras-Gunung.jpg', ''),
(15, 'Rain Cover', 2, 14000, 'sepatu-gunung-hiking-boot-mid-snta-497-grey-red-1.jpg', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `18073_d_sewa`
--

CREATE TABLE `18073_d_sewa` (
  `id_sewa` char(10) DEFAULT NULL,
  `id_alat` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `18073_d_sewa`
--

INSERT INTO `18073_d_sewa` (`id_sewa`, `id_alat`, `jumlah`, `keterangan`) VALUES
('sewa03', 14, 1, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `18073_pembayaran`
--

CREATE TABLE `18073_pembayaran` (
  `id_bayar` int(11) NOT NULL,
  `id_sewa` char(10) DEFAULT NULL,
  `tgl_bayar` datetime DEFAULT NULL,
  `jml_uang` decimal(10,0) DEFAULT NULL,
  `total_bayar` decimal(10,0) DEFAULT NULL,
  `kembalian` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `18073_penyewaan`
--

CREATE TABLE `18073_penyewaan` (
  `id_sewa` char(10) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `tgl_sewa` datetime DEFAULT NULL,
  `tgl_kembali` datetime DEFAULT NULL,
  `lama_sewa` int(11) NOT NULL,
  `jaminan` varchar(50) DEFAULT NULL,
  `biaya_sewa` decimal(10,0) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `uang_muka` decimal(10,0) DEFAULT NULL,
  `status` enum('pre-sewa','disewa','selesai','temp') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `18073_user`
--

CREATE TABLE `18073_user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `telp` varchar(15) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` enum('admin','penyewa') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `18073_user`
--

INSERT INTO `18073_user` (`id_user`, `nama`, `telp`, `alamat`, `username`, `password`, `role`) VALUES
(1, 'admin', '082335685138', '-', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(14, 'user', '08937483728', 'User', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'penyewa');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `18073_alat`
--
ALTER TABLE `18073_alat`
  ADD PRIMARY KEY (`id_alat`);

--
-- Indeks untuk tabel `18073_d_sewa`
--
ALTER TABLE `18073_d_sewa`
  ADD KEY `id_sewa` (`id_sewa`),
  ADD KEY `id_alat` (`id_alat`);

--
-- Indeks untuk tabel `18073_pembayaran`
--
ALTER TABLE `18073_pembayaran`
  ADD PRIMARY KEY (`id_bayar`),
  ADD KEY `id_sewa` (`id_sewa`);

--
-- Indeks untuk tabel `18073_penyewaan`
--
ALTER TABLE `18073_penyewaan`
  ADD PRIMARY KEY (`id_sewa`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `18073_user`
--
ALTER TABLE `18073_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `18073_alat`
--
ALTER TABLE `18073_alat`
  MODIFY `id_alat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `18073_pembayaran`
--
ALTER TABLE `18073_pembayaran`
  MODIFY `id_bayar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `18073_user`
--
ALTER TABLE `18073_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `18073_d_sewa`
--
ALTER TABLE `18073_d_sewa`
  ADD CONSTRAINT `18073_d_sewa_ibfk_1` FOREIGN KEY (`id_sewa`) REFERENCES `18073_penyewaan` (`id_sewa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `18073_d_sewa_ibfk_2` FOREIGN KEY (`id_alat`) REFERENCES `18073_alat` (`id_alat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `18073_pembayaran`
--
ALTER TABLE `18073_pembayaran`
  ADD CONSTRAINT `18073_pembayaran_ibfk_1` FOREIGN KEY (`id_sewa`) REFERENCES `18073_penyewaan` (`id_sewa`);

--
-- Ketidakleluasaan untuk tabel `18073_penyewaan`
--
ALTER TABLE `18073_penyewaan`
  ADD CONSTRAINT `18073_penyewaan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `18073_user` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
