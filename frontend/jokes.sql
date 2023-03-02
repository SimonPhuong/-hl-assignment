-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th3 02, 2023 lúc 11:43 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `jokes`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jokes`
--

CREATE TABLE `jokes` (
  `id` int(11) NOT NULL,
  `joke_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `jokes`
--

INSERT INTO `jokes` (`id`, `joke_content`) VALUES
(1, 'A housewife, an accountant and a lawyer were asked \"How much is 2+2?\"\r\nThe housewife replies: \"Four!\".\r\nThe accountant says: \"I think it\'s either 3 or 4.  Let me run those figures through my spreadsheet one more time.\"\r\nThe lawyer pulls the drapes, dims the lights and asks in a hushed voice, \"How much do you want it to be?\"'),
(2, 'The teacher asked Jimmy, \"Why is your cat at school today Jimmy?\"\r\nJimmy replied crying, \"Because I heard my daddy tell my mommy, \'I am going to eat that pussy once Jimmy leaves for school today!\'\"'),
(3, 'Teacher: \"Kids,what does the chicken give you?\"\r\nStudent: \"Meat!\"\r\nTeacher: \"Very good! Now what does the pig give you?\"\r\nStudent: \"Bacon!\"\r\nTeacher: \"Great! And what does the fat cow give you?\"\r\nStudent: \"Homework!\"'),
(4, 'A child asked his father, \"How were people born?\"\r\nSo his father said, \"Adam and Eve made babies, then their babies became adults and made babies, and so on.\"\r\n\r\nThe child then went to his mother, asked her the same question and she told him, \"We were monkeys then we evolved to become like we are now.\"\r\n\r\nThe child ran back to his father and said, \"You lied to me!\"\r\nHis father replied, \"No, your mom was talking about her side of the family.\"');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `votes`
--

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `joke_id` int(11) NOT NULL,
  `vote_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `votes`
--

INSERT INTO `votes` (`id`, `joke_id`, `vote_type`) VALUES
(7, 1, 'like'),
(8, 2, 'like'),
(9, 4, 'dislike');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `jokes`
--
ALTER TABLE `jokes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `jokes`
--
ALTER TABLE `jokes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
