CREATE TABLE `time_exec` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `id_absensi_log` int(11) NOT NULL,
  `waktu_proses_absensi` int NOT NULL
) ENGINE=InnoDB;

ALTER TABLE `time_exec` ADD INDEX(`id_absensi_log`);

ALTER TABLE `time_exec` ADD CONSTRAINT `fk_id_absensi_log` FOREIGN KEY (`id_absensi_log`) REFERENCES `absensi_log`(`id_absensi_log`) ON DELETE RESTRICT ON UPDATE RESTRICT;
