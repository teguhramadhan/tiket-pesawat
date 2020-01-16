-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Jan 2020 pada 16.26
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiketing-pesawat_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bandara`
--

CREATE TABLE `tb_bandara` (
  `id_bandara` varchar(11) NOT NULL,
  `kode` varchar(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_bandara`
--

INSERT INTO `tb_bandara` (`id_bandara`, `kode`, `nama`, `kota`) VALUES
('BAN180001', 'SRG', ' Bandar Udara Internasional Achmad Yani', 'Semarang'),
('BAN180002', 'CGK ', ' Bandar Udara Internasional Soekarno-Hatta', 'Tangerang'),
('BAN180003', 'HLP', 'Bandar Udara Internasional Halim Perdanakusuma', 'Jakarta'),
('BAN180004', 'DPS ', ' Bandar Udara Internasional Ngurah Rai', 'Denpasar'),
('BAN180005', 'BPN', ' Bandar Udara Sultan Aji Muhammad Sulaiman', 'Balik Papan'),
('BAN180006', 'JOG', ' Bandar Udara Internasional Adisutjipto', 'Seleman'),
('BAN180007', 'BDO', 'Bandar Udara Internasional Husein Sastranegara', 'Bandung'),
('BAN180008', 'SUB', 'Bandar Udara Internasional Juanda', 'Sidoarjo'),
('BAN180009', 'MDC ', ' Bandar Udara Internasional Sam Ratulangi', 'Manado'),
('BAN180010', 'DJJ', ' Bandar Udara Internasional Sentani', 'Jayapura');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_booking`
--

CREATE TABLE `tb_booking` (
  `id_booking` varchar(11) NOT NULL,
  `id_customer` varchar(11) NOT NULL,
  `tgl_booking` date NOT NULL,
  `jumlah_penumpang` int(11) NOT NULL,
  `total_tarif` varchar(255) NOT NULL,
  `status_bayar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_booking`
--

INSERT INTO `tb_booking` (`id_booking`, `id_customer`, `tgl_booking`, `jumlah_penumpang`, `total_tarif`, `status_bayar`) VALUES
('BOO200001', 'CUS200001', '2020-01-11', 1, '0', 'belum bayar'),
('BOO200002', 'CUS200001', '2020-01-15', 2, '0', 'belum bayar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_customer`
--

CREATE TABLE `tb_customer` (
  `id_customer` varchar(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `negara` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_customer`
--

INSERT INTO `tb_customer` (`id_customer`, `nama`, `email`, `kota`, `negara`) VALUES
('CUS200001', 'teguh ramadhan', 'teguhrmdhn@gmail.com', 'bandung', 'indonesia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_dtl_booking`
--

CREATE TABLE `tb_dtl_booking` (
  `id_detail` int(11) NOT NULL,
  `id_tarif` varchar(11) NOT NULL,
  `id_booking` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_dtl_booking`
--

INSERT INTO `tb_dtl_booking` (`id_detail`, `id_tarif`, `id_booking`) VALUES
(1, '', 'BOO200001'),
(2, '', 'BOO200002');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_passenger`
--

CREATE TABLE `tb_passenger` (
  `id_passenger` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `no_kursi` varchar(50) NOT NULL,
  `id_detail` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_passenger`
--

INSERT INTO `tb_passenger` (`id_passenger`, `nama`, `no_kursi`, `id_detail`) VALUES
(1, 'teguh ramadhan', 'BIS', 1),
(2, 'teguh', 'BIS001', 2),
(3, 'ramadhan', 'BIS002', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penerbangan`
--

CREATE TABLE `tb_penerbangan` (
  `id_penerbangan` varchar(11) NOT NULL,
  `id_bandara` varchar(11) NOT NULL,
  `id_pesawat` varchar(11) NOT NULL,
  `tgl_penerbangan` date NOT NULL,
  `asal` varchar(255) NOT NULL,
  `tujuan` varchar(255) NOT NULL,
  `jam_berangkat` time NOT NULL,
  `jam_tiba` time NOT NULL,
  `bandara_tujuan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_penerbangan`
--

INSERT INTO `tb_penerbangan` (`id_penerbangan`, `id_bandara`, `id_pesawat`, `tgl_penerbangan`, `asal`, `tujuan`, `jam_berangkat`, `jam_tiba`, `bandara_tujuan`) VALUES
('PEN200001', 'BAN180003', 'PES180001', '2020-01-25', 'Jakarta', 'Denpasar', '12:00:00', '13:00:00', ' Bandar Udara Internasional Ngurah Rai'),
('PEN200002', 'BAN180004', 'PES180007', '2020-01-26', 'Denpasar', 'Bandung', '06:00:00', '08:00:00', 'Bandar Udara Internasional Husein Sastranegara'),
('PEN200003', 'BAN180001', 'PES180006', '2020-01-31', 'Semarang', 'Jakarta', '06:00:00', '07:00:00', 'Bandar Udara Internasional Halim Perdanakusuma');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesawat`
--

CREATE TABLE `tb_pesawat` (
  `id_pesawat` varchar(11) NOT NULL,
  `tipe_pesawat` varchar(255) NOT NULL,
  `jml_kursi_ekonomi` varchar(255) NOT NULL,
  `jml_kursi_bisnis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pesawat`
--

INSERT INTO `tb_pesawat` (`id_pesawat`, `tipe_pesawat`, `jml_kursi_ekonomi`, `jml_kursi_bisnis`) VALUES
('PES180001', 'Airbus A330-300', '213', '34'),
('PES180002', 'Boeing 737 Max 8', '162', '8'),
('PES180003', 'Airbus A330-200', '186', '36'),
('PES180004', 'Bombardier CRJ1000 NextGen', '96', '0'),
('PES180005', 'ATR 72-600', '66', '0'),
('PES180006', 'Boeing 777-300ER', '26', '367');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tarif_penerbangan`
--

CREATE TABLE `tb_tarif_penerbangan` (
  `id_tarif` varchar(11) NOT NULL,
  `id_penerbangan` varchar(11) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `tarif` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_tarif_penerbangan`
--

INSERT INTO `tb_tarif_penerbangan` (`id_tarif`, `id_penerbangan`, `kelas`, `tarif`) VALUES
('TAR200001', 'PEN200001', 'Ekonomi', '200000'),
('TAR200002', 'PEN200002', 'Bisnis', '500000'),
('TAR200003', 'PEN200003', 'Bisnis', '600000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `level`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(2, 'manager', '1d0258c2440a8d19e716292b231e3190', 'manager'),
(3, 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', 'petugas'),
(4, 'su', '0b180078d994cb2b5ed89d7ce8e7eea2', 'superuser');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_bandara`
--
ALTER TABLE `tb_bandara`
  ADD PRIMARY KEY (`id_bandara`);

--
-- Indeks untuk tabel `tb_booking`
--
ALTER TABLE `tb_booking`
  ADD PRIMARY KEY (`id_booking`);

--
-- Indeks untuk tabel `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indeks untuk tabel `tb_dtl_booking`
--
ALTER TABLE `tb_dtl_booking`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indeks untuk tabel `tb_passenger`
--
ALTER TABLE `tb_passenger`
  ADD PRIMARY KEY (`id_passenger`);

--
-- Indeks untuk tabel `tb_penerbangan`
--
ALTER TABLE `tb_penerbangan`
  ADD PRIMARY KEY (`id_penerbangan`);

--
-- Indeks untuk tabel `tb_pesawat`
--
ALTER TABLE `tb_pesawat`
  ADD PRIMARY KEY (`id_pesawat`);

--
-- Indeks untuk tabel `tb_tarif_penerbangan`
--
ALTER TABLE `tb_tarif_penerbangan`
  ADD PRIMARY KEY (`id_tarif`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_dtl_booking`
--
ALTER TABLE `tb_dtl_booking`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_passenger`
--
ALTER TABLE `tb_passenger`
  MODIFY `id_passenger` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
