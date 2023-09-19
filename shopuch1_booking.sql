-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th9 18, 2023 lúc 09:50 PM
-- Phiên bản máy phục vụ: 8.0.33
-- Phiên bản PHP: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopuch1_booking`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(14) COLLATE utf8mb4_general_ci NOT NULL,
  `birthday` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `role` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `name`, `email`, `password`, `phone`, `birthday`, `role`) VALUES
(1, 'Nguyễn Tiến Dũng', 'dnguyentien7890@gmail.com', '$2b$10$BerXCnjUQK5wlvW13kUcMuKV5dEfluMku0Iq/zaKFz48z.SQdTzAu', '0366764838', '', 0),
(2, 'Đào Xuân Bảo', 'dnguyentien7890123@gmail.com', '$2b$10$2GZac7CJUigcKE0u0vYkCumQQ5OtlpTIp4uRSdl7BamGLWFeC6CwG', '0366764838', '', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_room`
--

CREATE TABLE `book_room` (
  `id` int NOT NULL,
  `roomCode` int NOT NULL,
  `arrivalDay` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `dayOut` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `theNumberGuests` int NOT NULL,
  `userCode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `book_room`
--

INSERT INTO `book_room` (`id`, `roomCode`, `arrivalDay`, `dayOut`, `theNumberGuests`, `userCode`) VALUES
(48, 10, '25-07-2023', '28-07-2023', 1, 2),
(49, 6, '25-07-2023', '31-07-2023', 1, 2),
(50, 7, '25-07-2023', '31-07-2023', 1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int NOT NULL,
  `roomCode` int NOT NULL,
  `userCodeComment` int NOT NULL,
  `commentDate` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `commentStart` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `location`
--

CREATE TABLE `location` (
  `id` int NOT NULL,
  `nameLocation` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `province` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `country` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `location`
--

INSERT INTO `location` (`id`, `nameLocation`, `province`, `country`, `image`) VALUES
(1, 'Quận 1', 'Hồ Chí Minh', 'Việt Nam', 'https://airbnbnew.cybersoft.edu.vn/images/vt1.jpg'),
(2, 'Cái Răng', 'Cần Thơ', 'Việt Nam', 'https://airbnbnew.cybersoft.edu.vn/images/vt2.jpg'),
(3, 'Hòn Rùa', 'Nha Trang', 'Việt Nam', 'https://airbnbnew.cybersoft.edu.vn/images/vt3.jpg'),
(4, 'Hoàn Kiếm', 'Hà Nội', 'Việt Nam', 'https://airbnbnew.cybersoft.edu.vn/images/vt4.jpg'),
(5, 'Hòn Tằm', 'Phú Quốc', 'Việt Nam', 'https://airbnbnew.cybersoft.edu.vn/images/vt5.jpg'),
(6, 'Hải Châu', 'Đà Nẵng', 'Việt Nam', 'https://airbnbnew.cybersoft.edu.vn/images/vt6.jpg'),
(7, 'Langbiang', 'Đà Lạt', 'Việt Nam', 'https://airbnbnew.cybersoft.edu.vn/images/vt7.jpg'),
(8, 'Mũi Né', 'Phan Thiết', 'Việt Nam', 'https://airbnbnew.cybersoft.edu.vn/images/vt8.jpg'),
(9, 'Chợ Nha Mân', 'Đồng Tháp', 'Việt Nam', 'https://airbnbnew.cybersoft.edu.vn/avatar/15-06-2023-03-11-34-cho.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rented_room`
--

CREATE TABLE `rented_room` (
  `id` int NOT NULL,
  `codeRoom` int NOT NULL,
  `roomName` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `guest` int NOT NULL,
  `bedRoom` int NOT NULL,
  `bed` int NOT NULL,
  `discription` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `washingMachine` tinyint(1) NOT NULL,
  `iron` tinyint(1) NOT NULL,
  `tivi` tinyint(1) NOT NULL,
  `airConditioner` tinyint(1) NOT NULL,
  `kitchen` tinyint(1) NOT NULL,
  `parking` tinyint(1) NOT NULL,
  `wifi` tinyint(1) NOT NULL,
  `pool` tinyint(1) NOT NULL,
  `locationCode` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `bathroom` int NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `rented_room`
--

INSERT INTO `rented_room` (`id`, `codeRoom`, `roomName`, `guest`, `bedRoom`, `bed`, `discription`, `price`, `washingMachine`, `iron`, `tivi`, `airConditioner`, `kitchen`, `parking`, `wifi`, `pool`, `locationCode`, `image`, `bathroom`, `status`) VALUES
(1, 0, 'NewApt D1 - Cozy studio - NU apt - 500m Bui Vien!', 3, 1, 1, 'Tự nhận phòng\\r\\nTự nhận phòng bằng khóa thông minh.\\r\\nDinh Long là Chủ nhà siêu cấp\\r\\nChủ nhà siêu cấp là những chủ nhà có kinh nghiệm, được đánh giá cao và là những người cam kết mang lại quãng thời gian ở tuyệt vời cho khách.', 28, 1, 1, 1, 0, 0, 1, 1, 1, 1, 'https://airbnbnew.cybersoft.edu.vn/images/phong1.jpg', 1, 0),
(2, 1, 'STUDIO MỚI NETFLIX MIỄN PHÍ/ĐỖ XE MIỄN PHÍ', 2, 1, 1, 'Không gian riêng để làm việc\\r\\nMột khu vực chung có Wi-fi, phù hợp để làm việc.\\r\\nTự nhận phòng\\r\\nTự nhận phòng bằng khóa thông minh.\\r\\nKim Nam là Chủ nhà siêu cấp\\r\\nChủ nhà siêu cấp là những chủ nhà có kinh nghiệm, được đánh giá cao và là những ngườ', 21, 1, 1, 1, 1, 1, 0, 1, 0, 1, 'https://airbnbnew.cybersoft.edu.vn/images/phong2.png', 1, 0),
(3, 2, 'Phòng sang trọng với ban công tại D.1 - 200m đến Bitexco', 2, 1, 1, 'Emmy là Chủ nhà siêu cấp\\r\\nChủ nhà siêu cấp là những chủ nhà có kinh nghiệm, được đánh giá cao và là những người cam kết mang lại quãng thời gian ở tuyệt vời cho khách.\\r\\nTrải nghiệm nhận phòng tuyệt vời\\r\\n100% khách gần đây đã xếp hạng 5 sao cho quy t', 17, 1, 1, 1, 0, 0, 1, 0, 1, 1, 'https://airbnbnew.cybersoft.edu.vn/images/phong3.png', 1, 0),
(4, 3, 'Closer home!!!!', 4, 2, 2, 'Hieu là Chủ nhà siêu cấp\\r\\nChủ nhà siêu cấp là những chủ nhà có kinh nghiệm, được đánh giá cao và là những người cam kết mang lại quãng thời gian ở tuyệt vời cho khách.\\r\\nĐịa điểm tuyệt vời\\r\\n100% khách gần đây đã xếp hạng 5 sao cho vị trí này.\\r\\nTrải nghiệm nhận phòng tuyệt vời\\r\\n100% khách gần đây đã xếp hạng 5 sao cho quy trình nhận phòng.', 28, 1, 1, 1, 1, 0, 0, 1, 0, 2, 'https://airbnbnew.cybersoft.edu.vn/images/phong4.png', 2, 0),
(5, 4, 'Toàn bộ quê hương phải của Gi ngay trung tâm Cần Thơ', 4, 2, 2, 'Giang là Chủ nhà siêu cấp\\r\\nChủ nhà siêu cấp là những chủ nhà có kinh nghiệm, được đánh giá cao và là những người cam kết mang lại quãng thời gian ở tuyệt vời cho khách.\\r\\nĐịa điểm tuyệt vời\\r\\n94% khách gần đây đã xếp hạng 5 sao cho vị trí này.\\r\\nTrải nghiệm nhận phòng tuyệt vời\\r\\n94% khách gần đây đã xếp hạng 5 sao cho quy trình nhận phòng.', 25, 1, 1, 1, 1, 0, 1, 0, 0, 2, 'https://airbnbnew.cybersoft.edu.vn/images/phong5.png', 2, 0),
(6, 5, 'Ngôi nhà có hoa, nắng đẹp, trung tâm Cần Thơ', 4, 1, 2, 'Tự nhận phòng\\r\\nTự nhận phòng với hộp khóa an toàn.\\r\\nDang là Chủ nhà siêu cấp\\r\\nChủ nhà siêu cấp là những chủ nhà có kinh nghiệm, được đánh giá cao và là những người cam kết mang lại quãng thời gian ở tuyệt vời cho khách.', 21, 1, 1, 1, 1, 1, 0, 1, 0, 2, 'https://airbnbnew.cybersoft.edu.vn/images/phong6.png', 2, 0),
(7, 6, 'Near Hon Chong-Quiet Seaview Studio to beach', 2, 1, 1, 'là nơi ẩn náu mới đưa khách tham quan một hành trình kỳ thú vào bãi biển Nha Trang. Chỉ 2 phút đi bộ ra bãi biển!\\r\\nCâu chuyện về Trăng tròn được diễn giải lại một cách nghệ thuật theo lối trang trí sang trọng, cổ điển của ngôi nhà – một phiên bản đương đại của thần thoại truyền thống được kể bằng đồ nội thất kết hợp các chi tiết phong cách với các yếu tố Việt cổ. Chúng tôi kết hợp dịch vụ lưu trú truyền thống của châu Á với các tiện ích hiểu biết về công nghệ,', 10, 1, 1, 1, 0, 0, 1, 0, 1, 3, 'https://airbnbnew.cybersoft.edu.vn/images/phong7.png', 1, 0),
(8, 7, 'Tầng 25 Căn hộ 1 phòng ngủ ấm cúng và hiện đại', 4, 1, 2, 'Phòng ngủ ấm cúng và Morden 1 ở tầng 25. Cảm giác như ở nhà khi qua đêm ở đây! Mọi chi tiết trong căn hộ đều đi kèm với tinh thần nghệ thuật.\\r\\n\\r\\nChỗ ở\\r\\nToàn bộ căn hộ sẽ là của bạn! Sử dụng miễn phí tiện nghi và đồ dùng nhà bếp của chúng tôi', 15, 0, 0, 1, 1, 1, 1, 1, 1, 3, 'https://airbnbnew.cybersoft.edu.vn/images/phong8.png', 1, 0),
(9, 8, 'Căn hộ mặt tiền Economy Beach với chế độ ngắm bình minh', 4, 1, 2, 'Căn hộ của tôi là căn hộ mặt tiền bãi biển, hướng ra bãi biển. Bạn có thể tận hưởng bình minh từ cửa sổ.\\r\\nCăn hộ có thể cho thuê tối đa 4 người với 2 giường đôi. Tọa lạc tại trung tâm thành phố với nhiều nhà hàng và siêu thị xung quanh.', 18, 1, 0, 1, 0, 1, 0, 1, 0, 3, 'https://airbnbnew.cybersoft.edu.vn/images/phong9.png', 1, 0),
(10, 9, 'Hanoi Old Quarter Homestay - Unique Railway View', 2, 1, 1, 'Welcome to our house - a newly renovated apartment & just a step to Old Quarter, Dong Xuan Market, Hoan Kiem Lake...\\r\\n\\r\\nYou will get a chance to truly live a Hanoian life with local neighbor, local food & an one-of-a-kind experience of living right beside an unique Hanoi old French style Railway.', 23, 1, 1, 1, 1, 1, 1, 1, 0, 4, 'https://airbnbnew.cybersoft.edu.vn/images/phong10.png', 1, 0),
(11, 10, 'Studio mới, thang máy, Hoàn Kiếm, gần khu phố cổ', 2, 1, 1, 'Chào mừng bạn đến với Botanicahome! Chúng tôi hân hạnh mời bạn trải nghiệm ngôi nhà của gia đình chúng tôi. Chúng tôi muốn tạo ra một không gian nơi mọi người cảm thấy hoàn toàn thoải mái và như ở nhà. Căn hộ studio nằm trong tòa nhà nhỏ gần khu phố cổ và trung tâm thành phố. Tòa nhà này được xây dựng và được vận hành bởi chính gia đình. Chúng tôi sẽ cố gắng tính toán từng chi tiết, lớn nhỏ để làm bạn hài lòng và mang đến cho bạn một môi trường gọn gàng, sạch sẽ, an toàn, giá cả phải chăng và ấm cúng.', 15, 1, 1, 1, 1, 1, 0, 1, 0, 4, 'https://airbnbnew.cybersoft.edu.vn/images/phong11.png', 1, 0),
(12, 11, 'Studio mới, thang máy, Hoàn Kiếm, gần khu phố cổ', 2, 1, 1, 'Chào mừng bạn đến với Botanicahome! Chúng tôi hân hạnh mời bạn trải nghiệm ngôi nhà của gia đình chúng tôi. Chúng tôi muốn tạo ra một không gian nơi mọi người cảm thấy hoàn toàn thoải mái và như ở nhà. Căn hộ studio nằm trong tòa nhà nhỏ gần khu phố cổ và trung tâm thành phố. Tòa nhà này được xây dựng và được vận hành bởi chính gia đình. Chúng tôi sẽ cố gắng tính toán từng chi tiết, lớn nhỏ để làm bạn hài lòng và mang đến cho bạn một môi trường gọn gàng, sạch sẽ, an toàn, giá cả phải chăng và ấm cúng.', 18, 1, 1, 1, 1, 1, 1, 1, 1, 4, 'https://airbnbnew.cybersoft.edu.vn/images/phong12.png', 1, 0),
(13, 12, 'Fisherman homestay (phòng 2 người - B)', 2, 1, 1, 'Feel free and make yourself at home\r\n\r\nĐây là nơi để bạn trốn đi những ồn ào, tấp nập của công việc. Nơi bạn có thể tận hưởng cảm giác bình yên, nhẹ nhàng, đón những cơn gió và ngửi được vị mặn của bỉển nhưng vẫn không mang cảm giác xa lạ. Một nơi thân thuộc như chính ngôi nhà của bạn.', 15, 1, 1, 1, 1, 1, 1, 1, 1, 5, 'https://airbnbnew.cybersoft.edu.vn/images/phong13.png', 1, 0),
(14, 13, 'Cách nhau 2 phòng ngủ tại thị trấn Dương Đông', 8, 2, 3, 'Chào mừng bạn đến với The Yard - nơi cách trung tâm quần đảo Phú Quốc vài bước chân.\r\n\r\nNằm trong khu phố với Thị trấn Dương Đông, Chợ đêm Phú Quốc, Bãi Dài, Chùa,... và được bao quanh bởi nhiều điều địa phương mang bạn đến gần hơn với cuộc sống hàng ngày của công dân đảo.', 43, 1, 0, 0, 0, 1, 1, 1, 1, 5, 'https://airbnbnew.cybersoft.edu.vn/images/phong14.png', 3, 0),
(15, 14, 'Fisherman homestay', 4, 1, 2, 'Feel free and make yourself at home.\r\n\r\nĐây là nơi để bạn trốn đi những ồn ào, tấp nập của công việc. Nơi bạn có thể tận hưởng cảm giác bình yên, nhẹ nhàng, đón những cơn gió và ngửi được vị mặn của bỉển nhưng vẫn không mang cảm giác xa lạ. Một nơi thân thuộc như chính ngôi nhà của bạn.', 33, 1, 1, 0, 0, 1, 1, 0, 1, 5, 'https://airbnbnew.cybersoft.edu.vn/images/phong15.png', 2, 0),
(16, 15, 'Studio mới & ấm cúng | Riverside | Bên cạnh Cầu Hàn', 2, 1, 1, 'Chào mừng bạn đến với Ngôi nhà Đậu thứ ba của tôi ở bên bờ sông Hàn, bên cạnh cầu sông Hàn\r\nstudio rộng 25 m2 được trang trí tốt, rộng rãi, rất mới, tươi mới và sạch sẽ.\r\nVị trí tuyệt vời:\r\n- 3 phút đi bộ đến Cầu Hàn, trung tâm thương mại Vincom...\r\n- 2-3 phút bằng taxi đến cầu Rồng, cầu Tình yêu, Chợ đêm Sontra và bãi biển', 13, 1, 1, 1, 0, 0, 0, 0, 0, 6, 'https://airbnbnew.cybersoft.edu.vn/images/phong16.png', 1, 0),
(17, 16, 'ModernLuxury Studio cách bãi biển 1 phút', 2, 1, 1, 'Đắm chìm trong vẻ đẹp hiện đại và ấm áp của ngôi nhà mới xây này.\r\n* 3 phút đi bộ đến bãi biển Mỹ Khê\r\n* Không giới hạn Internet siêu tốc độ cao riêng tư/ WIFI và TV internet\r\n* Nhà bếp và máy giặt đầy đủ\r\ntiện nghi * Massage và massage phổ biến cạnh tòa nhà (phiếu giảm giá khi có sẵn)\r\n* Giảm giá 30% cho thời gian ở theo tháng', 19, 1, 0, 0, 0, 1, 1, 1, 1, 6, 'https://airbnbnew.cybersoft.edu.vn/images/phong17.png', 1, 0),
(18, 17, 'Phòng mùa hè', 2, 1, 1, 'Mọi thứ đều trở nên đơn giản tại chỗ ở yên bình và nằm tại vị trí trung tâm này.', 9, 1, 1, 1, 0, 0, 0, 0, 0, 7, 'https://airbnbnew.cybersoft.edu.vn/images/phong18.png', 1, 0),
(19, 18, 'Căn hộ hiện đại độc đáo của Scandinavia', 2, 1, 1, 'Nơi ở độc đáo này mang một phong cách rất riêng.', 17, 1, 1, 1, 0, 0, 0, 0, 0, 7, 'https://airbnbnew.cybersoft.edu.vn/images/phong19.png', 1, 0),
(20, 19, 'Hill Lodge Mũi Né - Ngôi nhà nhỏ gần bãi biển', 4, 1, 1, 'Đó sẽ là một ý tưởng chớp nhoáng sau khi tôi quyết định nghỉ việc. Tôi chia sẻ với bạn tôi, một kiến trúc sư, sau đó Hill Lodge được tạo ra. Thành phố này nằm trên sườn đồi trong một bãi biển dài, đó là lý do tại sao chúng tôi gọi “Hill Lodge”.\r\n\r\nChỗ ở\r\nHill Lodge được thiết kế theo phong cách tối giản. Chúng tôi thiết lập một số vật liệu cần thiết trong nhà nghỉ nhỏ. Nó có thể là đủ để sống và ẹnjoy sau một thời gian dài làm việc trong một thành phố bận rộn hoặc chỉ là một chuyến đi.', 27, 1, 1, 1, 1, 1, 1, 1, 1, 8, 'https://airbnbnew.cybersoft.edu.vn/images/phong20.png', 1, 0),
(21, 20, 'Sky Guest House', 2, 1, 1, 'Một số thông tin đã được dịch tự động. ', 19, 1, 1, 1, 1, 1, 1, 1, 1, 8, 'https://airbnbnew.cybersoft.edu.vn/images/phong21.png', 1, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `book_room`
--
ALTER TABLE `book_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lienHePhongThue` (`roomCode`),
  ADD KEY `lienMaNguoiDung` (`userCode`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lienHeUser` (`userCodeComment`);

--
-- Chỉ mục cho bảng `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `rented_room`
--
ALTER TABLE `rented_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lienHeLocation` (`locationCode`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `book_room`
--
ALTER TABLE `book_room`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `location`
--
ALTER TABLE `location`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `rented_room`
--
ALTER TABLE `rented_room`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `book_room`
--
ALTER TABLE `book_room`
  ADD CONSTRAINT `lienHePhongThue` FOREIGN KEY (`roomCode`) REFERENCES `rented_room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lienMaNguoiDung` FOREIGN KEY (`userCode`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `lienHeUser` FOREIGN KEY (`userCodeComment`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `rented_room`
--
ALTER TABLE `rented_room`
  ADD CONSTRAINT `lienHeLocation` FOREIGN KEY (`locationCode`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
