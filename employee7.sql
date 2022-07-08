-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Jul 2022 pada 18.24
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee7`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `department`
--

CREATE TABLE `department` (
  `Dname` text NOT NULL,
  `Dnumber` int(1) NOT NULL,
  `Dmgr_ssn` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `department`
--

INSERT INTO `department` (`Dname`, `Dnumber`, `Dmgr_ssn`) VALUES
('Headquarters', 1, 888665555),
('Administration', 4, 987654321),
('Research', 5, 333445555);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dept_locations`
--

CREATE TABLE `dept_locations` (
  `Dnumber` int(1) NOT NULL,
  `Dlocation` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dept_locations`
--

INSERT INTO `dept_locations` (`Dnumber`, `Dlocation`) VALUES
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Houston'),
(5, 'Sugarland');

-- --------------------------------------------------------

--
-- Struktur dari tabel `empolye`
--

CREATE TABLE `empolye` (
  `Ename` text NOT NULL,
  `Ssn` int(9) NOT NULL,
  `Bdate` date NOT NULL,
  `Address` text NOT NULL,
  `Dnumber` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `empolye`
--

INSERT INTO `empolye` (`Ename`, `Ssn`, `Bdate`, `Address`, `Dnumber`) VALUES
('Smith, John B.', 123456789, '1965-01-09', '731 Fondren, Houston, TX', 5),
('Wong, Franklin T.', 333445555, '1955-12-08', '638 Voss, Houston, TX', 5),
('English, Joyce A.', 453453453, '1972-07-31', '5631 Rice, Houston, TX', 5),
('Narayan, Ramesh K.', 666884444, '1962-09-15', '975 Fire Oak, Humble, TX', 5),
('Borg, James E.', 888665555, '1937-11-10', '450 Stone, Houston, TX', 1),
('Wallace, Jennifer S.', 987654321, '1941-06-20', '291 Berry, Bellaire, TX', 4),
('Jabbar, Ahmad V.', 987987987, '1969-03-29', '980 Dallas, Houston, TX', 4),
('Zelaya, Alicia J.', 999887777, '1968-07-19', '3321 Castle, Spring, TX', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `project`
--

CREATE TABLE `project` (
  `Pname` text NOT NULL,
  `Pnumber` int(2) NOT NULL,
  `Plocation` varchar(10) NOT NULL,
  `Dnum` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `project`
--

INSERT INTO `project` (`Pname`, `Pnumber`, `Plocation`, `Dnum`) VALUES
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `works_on`
--

CREATE TABLE `works_on` (
  `Ssn` int(9) NOT NULL,
  `Pnumber` int(2) NOT NULL,
  `Hours` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `works_on`
--

INSERT INTO `works_on` (`Ssn`, `Pnumber`, `Hours`) VALUES
(123456789, 1, 33),
(123456789, 2, 8),
(333445555, 2, 10),
(333445555, 3, 10),
(333445555, 10, 10),
(333445555, 20, 10),
(453453453, 1, 20),
(453453453, 2, 20),
(666884444, 3, 40),
(888665555, 20, 0),
(987654321, 20, 15),
(987654321, 30, 20),
(987987987, 10, 35),
(987987987, 30, 5),
(999887777, 10, 10),
(999887777, 30, 30);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Dnumber`);

--
-- Indeks untuk tabel `dept_locations`
--
ALTER TABLE `dept_locations`
  ADD PRIMARY KEY (`Dnumber`,`Dlocation`);

--
-- Indeks untuk tabel `empolye`
--
ALTER TABLE `empolye`
  ADD PRIMARY KEY (`Ssn`),
  ADD KEY `Dnumber` (`Dnumber`);

--
-- Indeks untuk tabel `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`Pnumber`),
  ADD KEY `Dnum` (`Dnum`);

--
-- Indeks untuk tabel `works_on`
--
ALTER TABLE `works_on`
  ADD PRIMARY KEY (`Ssn`,`Pnumber`),
  ADD KEY `Pnumber` (`Pnumber`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dept_locations`
--
ALTER TABLE `dept_locations`
  ADD CONSTRAINT `dept_locations_ibfk_1` FOREIGN KEY (`Dnumber`) REFERENCES `department` (`Dnumber`);

--
-- Ketidakleluasaan untuk tabel `empolye`
--
ALTER TABLE `empolye`
  ADD CONSTRAINT `empolye_ibfk_1` FOREIGN KEY (`Dnumber`) REFERENCES `department` (`Dnumber`);

--
-- Ketidakleluasaan untuk tabel `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`Dnum`) REFERENCES `department` (`Dnumber`);

--
-- Ketidakleluasaan untuk tabel `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`Ssn`) REFERENCES `empolye` (`Ssn`),
  ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`Pnumber`) REFERENCES `project` (`Pnumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
