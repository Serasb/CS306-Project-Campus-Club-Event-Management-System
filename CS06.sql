-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3307
-- Üretim Zamanı: 28 Ara 2025, 21:51:21
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `cs306_phase2`
--

DELIMITER $$
--
-- Yordamlar
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `list_club_events` (IN `p_club_id` CHAR(10))   BEGIN
    SELECT e.e_id, e.e_name, e.e_date, e.time, v.v_name
    FROM EVENT e
    JOIN VENUE v ON e.v_id = v.v_id
    WHERE e.c_id = p_club_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `register_student_to_event` (IN `p_student_id` CHAR(11), IN `p_event_id` CHAR(10), IN `p_date` DATE)   BEGIN
    INSERT INTO E_REGISTRATION(student_id, e_id, r_date)
    VALUES (p_student_id, p_event_id, p_date);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `club`
--

CREATE TABLE `club` (
  `c_id` char(10) NOT NULL,
  `c_name` varchar(50) DEFAULT NULL,
  `c_email` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `sc_id` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `club`
--

INSERT INTO `club` (`c_id`, `c_name`, `c_email`, `category`, `sc_id`) VALUES
('C001', 'IEEE', 'ieee@sabanciuniv.edu', 'Engineering', 'SC01'),
('C002', 'Music Club', 'music@sabanciuniv.edu', 'Arts', 'SC01'),
('C003', 'Entrepreneurship Club', 'entrepreneur@sabanciuniv.edu', 'Business', 'SC01'),
('C004', 'Sports Club', 'sports@sabanciuniv.edu', 'Recreation', 'SC01'),
('C005', 'Photography Club', 'photo@sabanciuniv.edu', 'Arts', 'SC01'),
('C006', 'AI Society', 'ai@sabanciuniv.edu', 'Technology', 'SC01'),
('C007', 'Debate Club', 'debate@sabanciuniv.edu', 'Social', 'SC01'),
('C008', 'Dance Club', 'dance@sabanciuniv.edu', 'Arts', 'SC01'),
('C009', 'Environmental Club', 'eco@sabanciuniv.edu', 'Sustainability', 'SC01'),
('C010', 'Volunteer Club', 'volunteer@sabanciuniv.edu', 'Community Service', 'SC01');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `donation`
--

CREATE TABLE `donation` (
  `sp_id` char(10) NOT NULL,
  `c_id` char(10) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `d_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `donation`
--

INSERT INTO `donation` (`sp_id`, `c_id`, `amount`, `d_date`) VALUES
('SP01', 'C006', 50000, '2024-02-20'),
('SP02', 'C002', 20000, '2024-02-18'),
('SP03', 'C003', 30000, '2024-03-01'),
('SP04', 'C005', 15000, '2024-02-12'),
('SP05', 'C010', 45000, '2024-01-25');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `event`
--

CREATE TABLE `event` (
  `e_id` char(10) NOT NULL,
  `e_name` varchar(50) DEFAULT NULL,
  `e_date` date DEFAULT NULL,
  `time` char(5) DEFAULT NULL,
  `c_id` char(10) DEFAULT NULL,
  `v_id` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `event`
--

INSERT INTO `event` (`e_id`, `e_name`, `e_date`, `time`, `c_id`, `v_id`) VALUES
('E001', 'AI Workshop', '2024-03-15', '14:00', 'C006', 'V006'),
('E002', 'Music Festival', '2024-04-10', '18:00', 'C002', 'V004'),
('E003', 'Entrepreneurship Summit', '2024-05-01', '10:00', 'C003', 'V002'),
('E004', 'Basketball Tournament', '2024-03-20', '16:00', 'C004', 'V003'),
('E005', 'Photography Exhibition', '2024-04-05', '11:00', 'C005', 'V009'),
('E006', 'Volunteer Day', '2024-03-12', '09:00', 'C010', 'V007'),
('E007', 'Debate Challenge', '2024-04-22', '13:00', 'C007', 'V001'),
('E008', 'Hackathon', '2024-05-10', '08:00', 'C006', 'V006'),
('E009', 'Dance Show', '2024-04-18', '19:00', 'C008', 'V010'),
('E010', 'Eco Awareness Seminar', '2024-03-28', '15:00', 'C009', 'V002');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `e_registration`
--

CREATE TABLE `e_registration` (
  `student_id` char(11) NOT NULL,
  `e_id` char(10) NOT NULL,
  `r_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `e_registration`
--

INSERT INTO `e_registration` (`student_id`, `e_id`, `r_date`) VALUES
('32251000001', 'E001', '2024-02-01'),
('32515000002', 'E004', '2024-02-15'),
('33000000003', 'E003', '2024-04-01'),
('33000000004', 'E002', '2024-03-10'),
('33000000005', 'E006', '2024-02-20'),
('33000000006', 'E007', '2024-02-05'),
('33000000007', 'E005', '2024-03-25'),
('33000000008', 'E008', '2024-04-15'),
('33000000009', 'E010', '2024-02-28'),
('33000000010', 'E009', '2024-03-05');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `membership`
--

CREATE TABLE `membership` (
  `student_id` char(11) NOT NULL,
  `c_id` char(10) NOT NULL,
  `since` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `membership`
--

INSERT INTO `membership` (`student_id`, `c_id`, `since`) VALUES
('32251000001', 'C006', '2023-10-01'),
('32515000002', 'C004', '2023-09-15'),
('33000000003', 'C003', '2024-01-10'),
('33000000004', 'C002', '2023-12-01'),
('33000000005', 'C010', '2024-02-05'),
('33000000006', 'C001', '2023-08-20'),
('33000000007', 'C005', '2023-11-25'),
('33000000008', 'C007', '2024-03-10'),
('33000000009', 'C009', '2024-01-15'),
('33000000010', 'C008', '2023-09-05');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `school`
--

CREATE TABLE `school` (
  `sc_id` char(10) NOT NULL,
  `sc_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `school`
--

INSERT INTO `school` (`sc_id`, `sc_name`) VALUES
('SC01', 'Sabanci University'),
('SC02', 'Bilkent University'),
('SC03', 'Bogazici University'),
('SC04', 'Istanbul Technical University'),
('SC05', 'Koç University'),
('SC06', 'Middle East Technical University'),
('SC07', 'Ankara University'),
('SC08', 'Hacettepe University'),
('SC09', 'Yıldız Technical University'),
('SC10', 'Istanbul University');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sponsor`
--

CREATE TABLE `sponsor` (
  `sp_id` char(10) NOT NULL,
  `sp_name` varchar(50) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `sponsor`
--

INSERT INTO `sponsor` (`sp_id`, `sp_name`, `budget`) VALUES
('1010', 'eik', 0),
('SP01', 'Tesla', 200000),
('SP02', 'Google', 150000),
('SP03', 'Microsoft', 180000),
('SP04', 'Arçelik', 120000),
('SP05', 'Bayegan', 250000),
('SP100', 'TESTSPONSOR', -50000),
('WEB_NEG', 'Web Negative', 0),
('WEB_POS', 'Web Positive', 50000);

--
-- Tetikleyiciler `sponsor`
--
DELIMITER $$
CREATE TRIGGER `trg_sponsor_budget_fix` BEFORE INSERT ON `sponsor` FOR EACH ROW BEGIN
    IF NEW.budget < 0 THEN
        SET NEW.budget = 0;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `student`
--

CREATE TABLE `student` (
  `student_id` char(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `student`
--

INSERT INTO `student` (`student_id`, `name`, `email`, `department`) VALUES
('1011', 'Unknown', 'sinem@baygan.com', 'computer'),
('1012', 'Unknown', 'sinem@baygan.com', 'computer'),
('1013', 'Unknown', 'sinem@baygan.com', 'computer'),
('32251', 'Unknown', NULL, NULL),
('32251000001', 'Sera Sinem Baygan', 'sera.baygan@sabanciuniv.edu', 'Computer Science'),
('32515000002', 'İsmail Memiş', 'ismail.memis@sabanciuniv.edu', 'Mechatronics Engineering'),
('33000000003', 'Ahmet Yılmaz', 'ahmet.yilmaz@sabanciuniv.edu', 'Business Administration'),
('33000000004', 'Ayşe Demir', 'ayse.demir@sabanciuniv.edu', 'Industrial Engineering'),
('33000000005', 'Mehmet Kaya', 'mehmet.kaya@sabanciuniv.edu', 'Computer Science'),
('33000000006', 'Elif Aksoy', 'elif.aksoy@sabanciuniv.edu', 'Economics'),
('33000000007', 'Can Polat', 'can.polat@sabanciuniv.edu', 'Management'),
('33000000008', 'Selin Acar', 'selin.acar@sabanciuniv.edu', 'Computer Science'),
('33000000009', 'Efe Koç', 'efe.koc@sabanciuniv.edu', 'Psychology'),
('33000000010', 'Zeynep Kılıç', 'zeynep.kilic@sabanciuniv.edu', 'Visual Arts'),
('9999999999', 'Unknown', 'test@example.com', 'TestDepartment');

--
-- Tetikleyiciler `student`
--
DELIMITER $$
CREATE TRIGGER `trg_student_name_default` BEFORE INSERT ON `student` FOR EACH ROW BEGIN
    IF NEW.name IS NULL OR NEW.name = '' THEN
        SET NEW.name = 'Unknown';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `s_registration`
--

CREATE TABLE `s_registration` (
  `student_id` char(11) NOT NULL,
  `sc_id` char(10) NOT NULL,
  `since` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `s_registration`
--

INSERT INTO `s_registration` (`student_id`, `sc_id`, `since`) VALUES
('32251000001', 'SC01', '2023-09-01'),
('32515000002', 'SC01', '2023-09-01'),
('33000000003', 'SC01', '2023-09-01'),
('33000000004', 'SC01', '2023-09-01'),
('33000000005', 'SC01', '2023-09-01'),
('33000000006', 'SC01', '2023-09-01'),
('33000000007', 'SC01', '2023-09-01'),
('33000000008', 'SC01', '2023-09-01'),
('33000000009', 'SC01', '2023-09-01'),
('33000000010', 'SC01', '2023-09-01');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `tickets`
--

INSERT INTO `tickets` (`id`, `username`, `message`, `status`, `created_at`) VALUES
(1, 'ismail', 'hii', 0, '2025-12-28 19:49:18'),
(2, 'sera', 'merhaba', 0, '2025-12-28 20:05:06'),
(3, 'iso', 'heyy', 0, '2025-12-28 20:15:07'),
(4, 'ismail', 'merhaba', 0, '2025-12-28 20:29:53'),
(5, 'sera', 'can you help', 0, '2025-12-28 20:39:50');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ticket_comments`
--

CREATE TABLE `ticket_comments` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `ticket_comments`
--

INSERT INTO `ticket_comments` (`id`, `ticket_id`, `username`, `comment`, `created_at`) VALUES
(1, 1, 'admin', 'hey', '2025-12-28 20:04:25'),
(2, 2, 'admin', 'oky', '2025-12-28 20:05:16'),
(3, 3, 'admin', 'olmaz', '2025-12-28 20:15:21'),
(4, 3, 'admin', 'hey yooo', '2025-12-28 20:15:25'),
(5, 5, 'admin', 'yes i can', '2025-12-28 20:40:25'),
(6, 5, 'admin', 'hii', '2025-12-28 20:40:31');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `venue`
--

CREATE TABLE `venue` (
  `v_id` char(10) NOT NULL,
  `v_name` varchar(50) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `venue`
--

INSERT INTO `venue` (`v_id`, `v_name`, `capacity`, `location`) VALUES
('V001', 'Engineering Auditorium', 300, 'Faculty of Engineering'),
('V002', 'Main Conference Hall', 500, 'Central Campus'),
('V003', 'Sports Center Arena', 2000, 'Sports Complex'),
('V004', 'Music Hall', 250, 'Arts Building'),
('V005', 'Garden Stage', 150, 'North Campus'),
('V006', 'Innovation Lab', 100, 'Technology Center'),
('V007', 'Cafeteria Lounge', 200, 'Student Center'),
('V008', 'Library Auditorium', 120, 'Main Library'),
('V009', 'Design Studio', 80, 'Fine Arts Building'),
('V010', 'Seminar Room A', 60, 'Academic Block A');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `sc_id` (`sc_id`);

--
-- Tablo için indeksler `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`sp_id`,`c_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Tablo için indeksler `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`e_id`),
  ADD KEY `c_id` (`c_id`),
  ADD KEY `v_id` (`v_id`);

--
-- Tablo için indeksler `e_registration`
--
ALTER TABLE `e_registration`
  ADD PRIMARY KEY (`student_id`,`e_id`),
  ADD KEY `e_id` (`e_id`);

--
-- Tablo için indeksler `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`student_id`,`c_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Tablo için indeksler `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`sc_id`);

--
-- Tablo için indeksler `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`sp_id`);

--
-- Tablo için indeksler `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- Tablo için indeksler `s_registration`
--
ALTER TABLE `s_registration`
  ADD PRIMARY KEY (`student_id`,`sc_id`),
  ADD KEY `sc_id` (`sc_id`);

--
-- Tablo için indeksler `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Tablo için indeksler `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`v_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `ticket_comments`
--
ALTER TABLE `ticket_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `club`
--
ALTER TABLE `club`
  ADD CONSTRAINT `club_ibfk_1` FOREIGN KEY (`sc_id`) REFERENCES `school` (`sc_id`);

--
-- Tablo kısıtlamaları `donation`
--
ALTER TABLE `donation`
  ADD CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`sp_id`) REFERENCES `sponsor` (`sp_id`),
  ADD CONSTRAINT `donation_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `club` (`c_id`);

--
-- Tablo kısıtlamaları `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `club` (`c_id`),
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`v_id`) REFERENCES `venue` (`v_id`);

--
-- Tablo kısıtlamaları `e_registration`
--
ALTER TABLE `e_registration`
  ADD CONSTRAINT `e_registration_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `e_registration_ibfk_2` FOREIGN KEY (`e_id`) REFERENCES `event` (`e_id`);

--
-- Tablo kısıtlamaları `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `membership_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `club` (`c_id`);

--
-- Tablo kısıtlamaları `s_registration`
--
ALTER TABLE `s_registration`
  ADD CONSTRAINT `s_registration_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `s_registration_ibfk_2` FOREIGN KEY (`sc_id`) REFERENCES `school` (`sc_id`);

--
-- Tablo kısıtlamaları `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD CONSTRAINT `fk_ticket_comments_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
