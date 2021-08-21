
use webstore2;

-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: webstore
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
LOCK TABLE usergroup write;
CREATE TABLE `usergroup` (
  `usergroup_id` int(11) NOT NULL,
  `usergroup_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`usergroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Dumping data for table `usergroup`
--

LOCK TABLES `usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
INSERT INTO `usergroup` VALUES (1,'customer'),(2,'admin');
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Sách'),(2,'Tập vở các loại'),(3,'Dụng cụ học sinh'),(4,'Sản phẩm khác');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) DEFAULT NULL,
  `user_pass` varchar(255) DEFAULT NULL,
  `user_role` bit(1) NOT NULL,
  `usergroup_id` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  foreign key (`usergroup_id`) references usergroup(`usergroup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user@email.com','123456',_binary '\0',1,NULL),
(2,'admin@email.com','123456',_binary '\0',2,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `bill_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `noti` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  foreign key( `user_id`) references users( `user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45466342 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,1,9000000,'Bank transfer ','huy','2018-06-12 22:38:41',3,NULL,1),
(2,1,11000000,'Bank transfer ','vinh','2018-06-12 22:38:41',3,NULL,1);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;




--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_price` double DEFAULT NULL,
  `product_description` text CHARACTER SET utf8,
  `product_quantity` int(11) DEFAULT NULL,
  `product_provider` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_buy` double DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  foreign key(`category_id`) references category(`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1484425983255 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
insert into `product` values (1,1, 'Bảy Bức Thư Bị Đánh Mất', '/resources/images/anh1.jpg', 97000,'Cuốn sách xoay quanh hành trình ròng rã nhiều năm của nhà văn Triệu Du đi tìm kiếm, xác thực lại mức độ tin cậy về 7 bức thư mà nhà văn nổi tiếng Ba Kim đã từng viết gửi một độc giả nữ có tên Đại Lợi. Cô là một nữ sinh có tư tưởng mới trong xã hội phong kiến Trung Quốc, không chịu khuất phục số phận, muốn học hỏi tiếp thu kiến thức từ bên ngoài, muốn góp phần giúp ích cho xã hội.Qua đó, độc giả sẽ thêm hiểu về tư tưởng, tâm tư, tình cảm, phong cách sáng tác, thái độ và trách nhiệm không chỉ của nhà văn Ba Kim đối với xã hội, con người thời đó và ngay cả đối với độc giả của ông. Đồng thời cũng thêm trân trọng, hiểu hơn về sự kính trọng, tôn trọng lịch sử, tôn trọng các bậc tiền bối của các thế hệ nhà văn lớp sau dành cho lớp trước.', 50, '	NXB Lao Động', 45000);
insert into `product` values (2, 1, 'Bảo Toàn Sinh Mệnh', '/resources/images/anh2.jpg', 199000,'Qua cuộc đời đầy thăng trầm của thanh niên trí thức Ngô Chí Bằng – vốn là một đứa trẻ mồ côi ở thôn Vô Lương, trốn chạy quê hương cùng bao quan hệ ân nghĩa chằng chịt với bà con thôn làng, lên thành phố đeo đuổi một cuộc đời lý tưởng, tiểu thuyết Bảo toàn sinh mệnh như một tấm gương soi cho mỗi con người trong hành trình đi tìm bản ngã. Trên con đường đó có nhiều cạm bẫy, nhiều trắc trở, nhiều vấp ngã, nhiều lần đứng dậy, nhiều thành công song cũng nhiều thất bại chỉ trong tích tắc. Mỗi con người đều nỗ lực vươn lên dù trong mọi hoàn cảnh nhưng cũng vô hình chung đánh mất bản thân trước những giằng xé về danh và lợi.', 23, '	Chibooks', 100000);
insert into `product` values (3, 1, 'Núi Vắng', '/resources/images/anh3.jpg', 121000,'Gió cuốn và Lửa trời là hai câu chuyện tiêu biểu trong bộ Sử thi thôn Cơ của nhà văn Trung Quốc nổi tiếng A Lai xoay quanh câu chuyện của những người dân sinh sống tại một ngôi làng nông thôn của dân tộc Tạng trong xã hội mới.Những thay đổi mới trong tư duy, lối sống, và cả trong cung cách quản lý của xã hội mới đều gây nên nhiều xáo trộn bất ngờ trong cuộc sống bình dị, an lành của những con người này.Cùng với sự tan rã của chế độ cũ, một thôn Cơ chất phác, truyền thống với rất nhiều giá trị quý giá cũng dần “bay theo gió”. Sự thay đổi của thời đại đã làm đảo lộn tín ngưỡng của bà con thôn Cơ về thiên nhiên và thần linh, cũng đập tan những truyền thống mà thôn Cơ gìn giữ từ bao đời nay.', 89, 'Chibooks', 68000);
insert into `product` values (4, 1, 'Mùa Lũ', '/resources/images/anh4.jpg', 77000,'Cả nhà Lan Nhi sinh sống ở vùng đất có tên là Hoàng Phượng Khoát trên cao nguyên Dự Đông bờ nam sông Hoàng Hà. Năm đó Lan Nhi mười tuổi, nước lũ thình lình tràn về, cuốn phăng cả làng mạc. Lũ lụt tuy tàn khốc, nhưng  khát vọng sinh tồn, ước vọng về cuộc sống yên ổn khiến mọi người không khuất phục, không tuyệt vọng, vật lộn không biết mệt mỏi với nước lũ hết năm này qua năm khác. Cuối cùng, dưới sự dẫn dắt của ông nội, toàn thể bà con đồng tâm hiệp lực xây đắp bức tường bao to cao, chặn đứng sự xâm nhập của nước lũ.Với hình tượng nghệ thuật mới mẻ, tình tiết hồi hộp lôi cuốn, tác phẩm đã thể hiện sự cao quý và kiên cường của con người trước thiên tai, viết nên bài ca về cuộc sống rung động lòng người.', 122, 'Chibooks', 30000);
insert into `product` values (5, 1, 'Lời Hứa Của Một Chú Chó', '/resources/images/anh5.jpg', 143000,'LỜI HỨA CỦA MỘT CHÚ CHÓ tiếp tục câu chuyện về Bailey, chú chó tốt bụng trong MỤC ĐÍCH SỐNG CỦA MỘT CHÚ CHÓ và HÀNH TRÌNH CỦA MỘT CHÚ CHÓ (cả hai đều đã chuyển thể thành phim điện ảnh).Để thực hiện lời hứa của mình với cậu chủ Ethan, Bailey trở lại với cuộc sống. Lần này, Bailey có sự giúp sức của Lacey, một cô chó rất đặc biệt khác, để làm tròn vai trò cầu nối và chữa lành cho các thành viên trong gia đình.', 77, 'NXB Trẻ', 65000);
insert into `product` values (6, 2, 'Tập Hiệp Phong 200 trang', '/resources/images/anh6.jpg', 10000,'Tập Hiệp Phong 200 trang (6.4010) với kích thước 15cm x 25cm, 200 trang, định lượng 52gms, nền giấy trắng, kẻ ô ly, thấm mực nhanh được dùng để ghi chú nội dung', 500, 'Hiệp Phong', 2000);
insert into `product` values (7, 2, 'Tập Thuận Tiến 100 trang', '/resources/images/anh7.jpg', 10000,'Tập Thuận Tiến 100 trang (010) với kích thước 15cm x 25cm, 100 trang, định lượng 60gms, nền giấy trắng, kẻ ô ly, thấm mực nhanh được dùng để ghi chú nội dung chuyên dụng ✓Tiết kiệm từ 10% - 30%', 950, 'Thuận Tiến', 2000);
insert into `product` values (8, 2, 'Tập Thuận Tiến 100 trang dày', '/resources/images/anh8.jpg', 10000,'Tập Thuận Tiến 100 trang dày (010) với kích thước 15cm x 25cm, 100 trang, định lượng 100gms, nền giấy trắng, kẻ ô ly, thấm mực nhanh được dùng để ghi chú nội dung chuyên dụng ✓Tiết kiệm từ 10% - 30%', 1200, 'Thuận Tiến', 2000);
insert into `product` values (9, 2, 'Tập Vibook 100 trang', '/resources/images/anh9.jpg', 10000,'Tập Vibook 100 trang (7.6010) với kích thước 15cm x 25cm, 100 trang, định lượng 80gms, nền giấy trắng, kẻ ô ly, thấm mực nhanh được dùng để ghi chú nội dung chuyên dụng ✓Tiết kiệm từ 10% - 30%', 721, 'Vbook', 2000);
insert into `product` values (10, 2, 'Tập Vibook 200 trang', '/resources/images/anh10.jpg', 15000,'Tập Vibook 200 trang (10.5015) với kích thước 15cm x 25cm, 200 trang, định lượng 60gms, nền giấy trắng, kẻ ô ly, thấm mực nhanh được dùng để ghi chú nội dung chuyên dụng ✓Tiết kiệm từ 10% - 30%', 1245, 'Vbook', 2000);
insert into `product` values (11, 3, 'Bấm kim Kanex ICON - 10 tờ', '/resources/images/anh11.jpg', 30000,'Bấm kim Kanex ICON - 10 tờ (18.6025) với thân máy bằng nhựa, dạng bấm, lực bấm 10 tờ, sử dụng kim bấm no.10 được dùng để liên kết và phân nhóm tài liệu bằng lực bấm hoặc đóng nhiều tờ giấy thành xấp hoặc cuốn phù hợp với nghiệp vụ photocopy và lưu trữ chứng từ ✓Tiết kiệm từ 10% - 30%', 342, 'Kanex', 11000);
insert into `product` values (12, 3, 'Khoan 2 lổ Tata', '/resources/images/anh12.jpg', 500000,'Khoan 2 lổ Tata (0500) với thân kim loại, khoan 2 lổ, đế cao su chống trượt, lực khoan 250 tờ, có hộp chứa giấy rời được dùng để tạo lổ trên nhiều lớp giấy nhằm hổ trợ cho các loại bìa lưu trữ hoặc đóng sách ✓Tiết kiệm từ 10% - 30%', 2100, 'Tata ', 189000);
insert into `product` values (13, 3, 'Kẹp màu 15mm', '/resources/images/anh13.jpg', 30000,'Kẹp màu 15mm (019) với độ rộng 15mm, dạng bóp, lực kẹp 50 tờ được dùng để kẹp và lưu trữ chứng từ, hồ sơ, tài liệu dày với số lượng lớn ✓Tiết kiệm từ 10% - 30%Sản phẩm được sản xuất bởi các doanh nghiệp văn phòng phẩm uy tín tại Châu Á', 143, 'Châu Á ', 8000);
insert into `product` values (14, 3, 'Băng keo trong mini', '/resources/images/anh14.jpg', 4000,'Băng keo trong mini (04) với chất liệu nhựa OPP, chiều rộng 2.5 cm, được phủ keo 1 mặt, màu trắng trong, độ dày 80 yard, lỏi nhỏ được dùng để dán bưu kiện, dán trên vật liệu giấy và bề mặt nhẵn ✓Tiết kiệm từ 10% - 30%', 798, 'Việt Nam ', 500);
insert into `product` values (15, 3, 'Thước dẻo WinQ 20cm', '/resources/images/anh15.jpg', 4000,'Thước dẻo WinQ 20cm (04) với kích thước: 20 cm, nhựa dẻo, nền trong, đơn vị đo cm, inch được dùng để đo đạc kích thước vật thể nhỏ, kê kẻ đường viền tạo ô tạo khung trong hoạt động ghi chú nhật ký ✓Tiết kiệm từ 10% - 30%', 332, 'WinQ ', 500);
insert into `product` values (16, 4, 'Bảng Tên Nhựa Ngang', '/resources/images/anh16.jpg', 5000,'Làm bằng nhựa PVC cao cấp, dày dặn và chắc chắn.Mặt trước được ép bởi nhựa PVC trong giúp bảo vệ lớp bảng tên bên trong không bị ướt.Sản phẩm thích hợp dùng để đeo thẻ tên học sinh và nhân viên văn phòng.', 288, 'Stacom ', 500);
insert into `product` values (17, 4, 'Keo Dán Ánh Dương', '/resources/images/anh17.jpg', 4000,'Được sản xuất từ các chất tạo độ dính dùng được cho nhiều chất liệu khác nhau như: giấy, ảnh,…', 2117, 'Ánh Dương ', 500);
insert into `product` values (18, 4, 'Bảng Menu A6 Mica', '/resources/images/anh18.jpg', 82000,'Menu mica đế rời chân rút, đế gỗ cao cấp.Không bị đục mờ, rạn nứt.Đế chắc chắn. Mặt có thể tháo rời để gài tờ Menu, quảng cáo, tờ rơi...', 412, '	Việt Nam', 32000);
insert into `product` values (19, 4, 'Ghim Giấy Màu Xukiva TD', '/resources/images/anh19.jpg', 19000,'Sản phẩm có kích thước gọn nhẹ, thường được dùng để ghim giữ các liên giấy, tài liệu rời, vô cùng tiện dụng trong văn phòng, cửa hàng, bệnh viện,...', 552, '	Việt Nam', 5000);
insert into `product` values (20, 4, 'Dao Rọc Giấy Nhỏ', '/resources/images/anh20.jpg', 7500,'Dao Rọc Giấy Nhỏ TTH 120 9mm được làm từ hợp kim thép chắc chắn, có độ bền cao, sắc bén', 115, '	Việt Nam', 1000);
insert into `product` values (21, 1, 'Spy X Family - Tập 4', '/resources/images/anh21.jpg', 19000,'Họ đã phát hiện được âm mưu dùng chó đánh bom ám sát bộ trưởng của Westalis! Cả gia đình cùng nhau ra ngoài để tìm cho Anya một chú cún cưng, nhưng Twilight lại kết hợp việc đó với chiến dịch chống khủng bố khẩn cấp…!! Và rồi, Anya gặp được một chú chó kì lạ biết rõ cả gia đình Forger…!?', 88, 'NXB Kim Đồng', 7000);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;





--
-- Table structure for table `bill_detail`
--

DROP TABLE IF EXISTS `bill_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_detail` (
  `bill_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bill_id` bigint(11) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`bill_detail_id`),
  foreign key ( `bill_id` ) references bill( `bill_id` ),
	foreign key (`product_id` ) references product( `product_id` )
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `bill_detail`
--

LOCK TABLES `bill_detail` WRITE;
/*!40000 ALTER TABLE `bill_detail` DISABLE KEYS */;
INSERT INTO `bill_detail` VALUES (1,1,1,97000,1);
/*!40000 ALTER TABLE `bill_detail` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-13  9:16:15
