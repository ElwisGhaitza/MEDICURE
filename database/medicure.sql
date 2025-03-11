-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 29, 2024 at 08:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medicure`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$AIy0X1Ep6alaHDTofiChGeqq7k/d1Kc8vKQf1JZo0mKrzkkj6M626');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `kode_customer` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telp` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`kode_customer`, `nama`, `email`, `username`, `password`, `telp`) VALUES
('C0005', 'Elwis', 'elwisghaitsa12@gmail.com', 'Elwis', '$2y$10$o0uhXIOY0FL5tq7WXpcbkuOlsd7x7MaLgT5ToT7C0iLFDsgkfkkbS', '085865812314847'),
('C0006', 'Nana', 'nana@gmail.com', 'Nana', '$2y$10$2uaUWTh/78eWGah0aiXYR.0jtn1jpCz0ZwBA5iTWjWhA9LMuX6EOy', '08581231823');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `kode_customer` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `kode_produk` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `image` text NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`kode_produk`, `nama`, `image`, `deskripsi`, `harga`) VALUES
('P0001', 'Paracetamol', '65df5d4a84480.jpg', 'Parasetamol atau asetaminofen adalah obat analgesik dan antipiretik yang banyak dipakai untuk meredakan sakit kepala ringan akut, nyeri ringan hingga sedang, serta demam. Manfaatnya dalam penanganan demam kurang tepercaya.', 25000),
('P0003', 'F.G Troches Tablet', '65df73cf4fbe8.jpeg', '\r\nFG TROCHES merupakan tablet hisap Antibiotik yang memiliki kandungan Fradiomycin Sulfate dan Gramicidin-S HCl yang berfungsi untuk mengobati gingivitis, stomatitis, faringitis, bronkitis, tonsilitis, angina vincent, difteri faringeal, priodontitis. Dalam penggunaan obat ini harus SESUAI DENGAN PETUNJUK DOKTER. Pembelian obat ini memerlukan edukasi terkait penggunaan atau pengonsumsian obat yang tepat dan aman yang akan dikenakan biaya.', 20000),
('P0005', 'Promag', '65df7ea1eb0ed.jpg', '\r\nPROMAG merupakan obat dengan kandungan Hydrotalcite, Mg(OH)2, Simethicone dalam bentuk tablet. Obat ini digunakan untuk mengurangi gejala-gejala yang berhubungan dengan kelebihan asam lambung, gastritis, tukak lambung, tukak usus 12 jari. Gejala seperti mual, nyeri lambung, nyeri ulu hati, kembung dan perasaan penuh pada lambung.', 10000),
('P0006', 'Tolak Angin', '65df7f6cc7f2c.jpeg', '\r\nTOLAK ANGIN CAIR PLUS MADU merupakan obat herbal terstandar yang mengandung kombinasi berbagai herbal alami yang dapat digunakan untuk membantu memelihara atau menjaga daya tahan tubuh dan meringankan gejala masuk angin.\r\n			', 20000),
('P0007', 'Natur-E Skin Start Natural Vitamin E 100', '65df80085cdea.jpg', '\r\nNATUR-E 100 IU 16 KAPSUL merupakan suplemen yang mengandung Vitamin E alami yang berguna untuk membantu memelihara kesehatan kulit. Suplemen ini digunakan untuk membantu memenuhi kebutuhan vitamin E.\r\n			', 22000),
('P0008', 'Salonpas Koyo 12 Lembar', '65e0c558bcf15.jpg', '								\r\nSALONPAS KOYO merupakan plester dengan kandungan mentol, camphor, dan metil salisilat yang mambantu meredakan rasa nyeri yang disebabkan oleh nyeri otot, nyeri sendi, terkilir, dan punggung pegal.						', 8000),
('P0009', 'Insto Reguler Eye Drops', '65e09bf3ba4df.jpeg', '\r\nINSTO REGULAR EYE DROP mengandung zat aktif Tetrahidrozolin HCl dan Benzalkonium Klorida, digunakan untuk mengatasi mata merah dan rasa perih akibat iritasi mata ringan yang dapat disebabkan karena asap, debu dan lainnya.', 24000),
('P0010', 'Betadine Solution 15 ml', '65e0c66927556.jpeg', '				BETADINE SOLUTION mengandung zat aktif Povidone Iodine 10%. Betadine solution merupakan antiseptik pada luka untuk membunuh kuman penyebab infeksi.			', 18000),
('P0011', 'Freshcare Roll On', '65e0c701c5da6.jpeg', '\r\nFRESHCARE ROLL ON MINYAK ANGIN GREEN TEA adalah minyak angin yang digunakan untuk meredakan perut kembung, pusing, masuk angin dan mabuk perjalanan. Produk ini mengandung olive oil sebagai anti iritasi bila dipakai berulang, Menthol dan camphor yang memberikan efek relaxasasi.', 15000),
('P0012', 'Bodrex', '65e0cba4b5f38.jpg', 'BODREX merupakan obat dengan kandungan Paracetamol dan Caffeine. Obat ini digunakan untuk meringankan sakit kepala, sakit gigi, dan menurunkan demam.', 10000),
('P0013', 'Imboost Force', '65e0cc69c7c92.jpg', '\r\nIMBOOST FORCE TABLET merupakan produk suplemen kesehatan yang mengandung Echinacea purpurea herb dry extract, Black elderberry fruit dry extract, Zn Picolinate dalam bentuk kaplet salut selaput. Suplemen ini digunakan untuk membantu memelihara daya tahan tubuh.', 55000),
('P0014', 'Dulcolax', '65e0cd6f3d4cb.png', '				\r\nDULCOLAX TABLET merupakan obat dengan kandungan Bisacodyl dalam bentuk tablet salut enterik. Obat ini digunakan untuk untuk mengatasi masalah sembelit/susah BAB/konstipasi. Selain itu obat ini juga digunakan sebagai salah satu persiapan prosedur terapi diagnostic, terapi sebelum dan sesudah operasi dan dalam kondisi untuk mempercepat defekasi. DULCOLAX 5 MG TABLET bekerja dengan cara merangsang pergerakan pada usus besar dan membantu jalan keluar nya feses.			', 12000);

-- --------------------------------------------------------

--
-- Table structure for table `produksi`
--

CREATE TABLE `produksi` (
  `id_order` int(11) NOT NULL,
  `invoice` varchar(200) NOT NULL,
  `kode_customer` varchar(200) NOT NULL,
  `kode_produk` varchar(200) NOT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `status` varchar(200) NOT NULL,
  `tanggal` date NOT NULL,
  `provinsi` varchar(200) NOT NULL,
  `kota` varchar(200) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `kode_pos` varchar(200) NOT NULL,
  `terima` varchar(200) NOT NULL,
  `tolak` varchar(200) NOT NULL,
  `cek` int(11) NOT NULL,
  `bayar` enum('Transfer Bank','Kartu Kredit','E-Wallet','COD') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produksi`
--

INSERT INTO `produksi` (`id_order`, `invoice`, `kode_customer`, `kode_produk`, `nama_produk`, `qty`, `harga`, `status`, `tanggal`, `provinsi`, `kota`, `alamat`, `kode_pos`, `terima`, `tolak`, `cek`, `bayar`) VALUES
(14, 'INV0005', 'C0005', 'P0001', 'Paracetamol', 1, 25000, '0', '2424-02-28', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '1', '0', 0, 'Transfer Bank'),
(15, 'INV0006', 'C0005', 'P0005', 'Promag', 1, 10000, 'Pesanan Baru', '2424-02-28', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '2', '1', 0, 'Transfer Bank'),
(16, 'INV0006', 'C0005', 'P0003', 'F.G Troches Tablet', 1, 20000, 'Pesanan Baru', '2424-02-28', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '2', '1', 0, 'Transfer Bank'),
(17, 'INV0007', 'C0005', 'P0002', 'Salonpas', 1, 8000, '0', '2424-02-28', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '1', '0', 0, 'Transfer Bank'),
(18, 'INV0008', 'C0005', 'P0002', 'Salonpas', 1, 8000, '0', '2424-02-28', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '1', '0', 0, 'Transfer Bank'),
(19, 'INV0009', 'C0005', 'P0002', 'Salonpas', 1, 8000, '0', '2424-02-28', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '1', '0', 0, 'Transfer Bank'),
(20, 'INV0010', 'C0005', 'P0001', 'Paracetamol', 1, 25000, '0', '2424-02-29', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '1', '0', 0, 'Transfer Bank'),
(21, 'INV0011', 'C0005', 'P0005', 'Promag', 1, 10000, 'Pesanan Baru', '2424-02-29', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '0', '0', 0, 'Transfer Bank'),
(22, 'INV0012', 'C0005', 'P0003', 'F.G Troches Tablet', 4, 20000, 'Pesanan Baru', '2424-02-29', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '0', '0', 0, 'Transfer Bank'),
(23, 'INV0013', 'C0005', 'P0005', 'Promag', 1, 10000, 'Pesanan Baru', '2424-02-29', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '0', '0', 0, 'Transfer Bank'),
(24, 'INV0014', 'C0005', 'P0003', 'F.G Troches Tablet', 1, 20000, 'Pesanan Baru', '2424-02-29', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '0', '0', 0, 'Transfer Bank'),
(25, 'INV0015', 'C0005', 'P0003', 'F.G Troches Tablet', 1, 20000, 'Pesanan Baru', '2424-02-29', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '0', '0', 0, 'Transfer Bank'),
(26, 'INV0016', 'C0005', 'P0001', 'Paracetamol', 1, 25000, 'Pesanan Baru', '2424-02-29', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '0', '0', 0, 'Transfer Bank'),
(27, 'INV0017', 'C0005', 'P0003', 'F.G Troches Tablet', 1, 20000, 'Pesanan Baru', '2424-02-29', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '0', '0', 0, 'Transfer Bank'),
(28, 'INV0018', 'C0005', 'P0003', 'F.G Troches Tablet', 1, 20000, 'Pesanan Baru', '2424-02-29', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '0', '0', 0, 'Transfer Bank'),
(29, 'INV0019', 'C0005', 'P0003', 'F.G Troches Tablet', 1, 20000, 'Pesanan Baru', '2424-02-29', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '0', '0', 0, 'Transfer Bank'),
(36, 'INV0023', 'C0006', 'P0006', 'Tolak Angin', 1, 20000, 'Pesanan Baru', '2024-02-29', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '0', '0', 0, 'COD'),
(37, 'INV0023', 'C0006', 'P0009', 'Insto Reguler Eye Drops', 1, 24000, 'Pesanan Baru', '2024-02-29', 'Jombang', 'Jombang', 'JLN WAHIDIN SUDIRO HUSODO NO. 68, RT/11, RW/04, SENGON, JOMBANG, JAWA TIMUR', '61418', '0', '0', 0, 'COD');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`kode_customer`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`kode_produk`);

--
-- Indexes for table `produksi`
--
ALTER TABLE `produksi`
  ADD PRIMARY KEY (`id_order`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `produksi`
--
ALTER TABLE `produksi`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
