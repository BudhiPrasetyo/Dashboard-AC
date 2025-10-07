-- --------------------------------------------------------
-- Database: ac_control
-- --------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `ac_control`
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE `ac_control`;

-- --------------------------------------------------------
-- Table structure for table `unit_ac`
-- --------------------------------------------------------
CREATE TABLE `unit_ac` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `zona` VARCHAR(100) NOT NULL,
  `ac` VARCHAR(50) NOT NULL,
  `status_ac` ENUM('on','off') NOT NULL DEFAULT 'off',
  `status_alat` ENUM('on','off') NOT NULL DEFAULT 'on',
  `avg_aktif` VARCHAR(20) NOT NULL,
  `suhu` VARCHAR(10) NOT NULL,
  `daya` INT(11) NOT NULL,
  `voltage` INT(11) NOT NULL,
  `biaya` VARCHAR(20) NOT NULL,
  `arus` INT(11) NOT NULL,
  `last_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `ac_history`
-- --------------------------------------------------------
CREATE TABLE `ac_history` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `ac_unit_id` INT(11) NOT NULL,
  `timestamp` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_ac` ENUM('on','off') NOT NULL,
  `suhu` VARCHAR(10) DEFAULT NULL,
  `daya` INT(11) DEFAULT NULL,
  `voltage` INT(11) DEFAULT NULL,
  `arus` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_unit_id` (`ac_unit_id`),
  CONSTRAINT `ac_history_ibfk_1` FOREIGN KEY (`ac_unit_id`)
    REFERENCES `unit_ac` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Insert initial data into `unit_ac`
-- --------------------------------------------------------
INSERT INTO `unit_ac`
(`id`, `zona`, `ac`, `status_ac`, `status_alat`, `avg_aktif`, `suhu`, `daya`, `voltage`, `biaya`, `arus`, `last_updated`) VALUES
(1, 'Musholah 1', '1 AC', 'on', 'on', '3 AC/Jam', '24°C', 274, 249, 'Rp136.000', 0, NOW()),
(2, 'Stand Batik 1', '2 AC', 'on', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(3, 'Stand Batik 2', '2 AC', 'off', 'on', '3 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(4, 'Stand Batik 3', '1 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(5, 'Stand Batik 4', '2 AC', 'on', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(6, 'Stand Batik 5', '1 AC', 'on', 'on', '3 AC/Jam', '24°C', 274, 249, 'Rp136.000', 0, NOW()),
(7, 'Stand Batik 6', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(8, 'Stand Batik 7', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(9, 'Kasir EDU 1', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(10, 'Kasir Stand Batik Premium 1', '1 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(11, 'Stand Batik Premium 1', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(12, 'Stand Batik Premium 2', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(13, 'Stand Batik 8', '1 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(14, 'Stand Batik 9', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(15, 'Stand Batik 10', '1 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(16, 'Stand Batik 11', '1 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(17, 'Stand Batik 12', '1 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(18, 'Stand Batik 13', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(19, 'Stand Batik 14', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(20, 'Stand Batik 15', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(21, 'Stand Batik 16', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(22, 'Stand Batik 17', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(23, 'Stand Batik 18', '1 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(24, 'Stand Batik 19', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(25, 'Stand Batik 20', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(26, 'Stand Batik 21', '1 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(27, 'Stand Batik 22', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(28, 'Stand Batik 23', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(29, 'Stand Batik 24', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(30, 'Stand Batik 25', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(31, 'Stand Batik 26', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(32, 'Stand Batik 27', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(33, 'Stand Batik 28', '1 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(34, 'Stand Batik Kitchen 1', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(35, 'Stand Batik Kitchen 2', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(36, 'Stand Batik Kitchen 3', '1 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(37, 'Stand Batik Kitchen 4', '1 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(38, 'Stand Batik Kitchen 5', '1 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(39, 'Stand Batik Kitchen 6', '1 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(40, 'Stand Batik Kitchen 7', '1 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(41, 'Kasir Stand Batik Utama 1', '1 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(42, 'Kasir Stand Batik Utama 2', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW()),
(43, 'Stand Makanan 1', '2 AC', 'off', 'on', '4 AC/Jam', '24°C', 274, 249, 'Rp136.000', 200, NOW());
