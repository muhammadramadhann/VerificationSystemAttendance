CREATE TABLE `mahasiswa` (
  `id_mahasiswa` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelas` varchar(30) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB;
 
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`);

CREATE TABLE `absensi_log` (
  `id_absensi_log` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `id_mahasiswa` varchar(10) NOT NULL,
  `status_kehadiran` varchar(30) NOT NULL DEFAULT 'Belum Melakukan Absen',
  `waktu_kehadiran` datetime NOT NULL
) ENGINE=InnoDB;
