-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for web2
CREATE DATABASE IF NOT EXISTS `web2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `web2`;

-- Dumping structure for table web2.account
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `account_role_fk_1` (`role_id`),
  CONSTRAINT `account_role_fk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table web2.account: ~0 rows (approximately)

-- Dumping structure for table web2.action
CREATE TABLE IF NOT EXISTS `action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table web2.action: ~0 rows (approximately)

-- Dumping structure for table web2.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table web2.brand: ~0 rows (approximately)

-- Dumping structure for table web2.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table web2.category: ~0 rows (approximately)

-- Dumping structure for table web2.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `star` float NOT NULL,
  `created_date` datetime NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id` (`product_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table web2.comment: ~0 rows (approximately)

-- Dumping structure for table web2.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(61) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `login_by` varchar(20) NOT NULL,
  `ward_id` varchar(5) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `ward_id` (`ward_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`ward_id`) REFERENCES `ward` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table web2.customer: ~0 rows (approximately)

-- Dumping structure for table web2.discount
CREATE TABLE IF NOT EXISTS `discount` (
  `id` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `discount_percentage` int(11) DEFAULT NULL,
  `start_day` date DEFAULT NULL,
  `finish_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table web2.discount: ~0 rows (approximately)

-- Dumping structure for table web2.district
CREATE TABLE IF NOT EXISTS `district` (
  `id` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(30) NOT NULL,
  `province_id` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `province_id` (`province_id`),
  CONSTRAINT `district_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table web2.district: ~0 rows (approximately)

-- Dumping structure for table web2.enter_coupon
CREATE TABLE IF NOT EXISTS `enter_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `enter_day` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coupon_product_fk1` (`product_id`),
  KEY `coupon_supplier_fk2` (`supplier_id`),
  KEY `coupon_staff_fk3` (`staff_id`),
  CONSTRAINT `coupon_product_fk1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `coupon_staff_fk3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`),
  CONSTRAINT `coupon_supplier_fk2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table web2.enter_coupon: ~0 rows (approximately)

-- Dumping structure for table web2.image_item
CREATE TABLE IF NOT EXISTS `image_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `image_item_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table web2.image_item: ~0 rows (approximately)

-- Dumping structure for table web2.newsletter
CREATE TABLE IF NOT EXISTS `newsletter` (
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table web2.newsletter: ~0 rows (approximately)

-- Dumping structure for table web2.order
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shipping_unit_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `order_status_id` int(2) NOT NULL,
  `staff_id` int(10) DEFAULT NULL,
  `customer_id` int(10) NOT NULL,
  `payment_method` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:COD, 1: bank',
  `shipping_fee` int(11) DEFAULT 0,
  `delivered_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_order_status_fk_1` (`order_status_id`),
  KEY `order_staff_fk_1` (`staff_id`),
  KEY `order_customer_fk_1` (`customer_id`),
  KEY `shipping_unit_fk_1` (`shipping_unit_id`),
  CONSTRAINT `order_customer_fk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `order_order_status_fk_1` FOREIGN KEY (`order_status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `order_staff_fk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`),
  CONSTRAINT `shipping_unit_fk_1` FOREIGN KEY (`shipping_unit_id`) REFERENCES `shipping_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table web2.order: ~0 rows (approximately)

-- Dumping structure for table web2.order_item
CREATE TABLE IF NOT EXISTS `order_item` (
  `product_id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `qty` int(4) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `total_price` int(10) NOT NULL,
  PRIMARY KEY (`product_id`,`order_id`),
  KEY `order_item_product_fk_1` (`product_id`) USING BTREE,
  KEY `order_item_order_fk_1` (`order_id`) USING BTREE,
  CONSTRAINT `order_detail_order_fk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `order_detail_product_fk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table web2.order_item: ~0 rows (approximately)

-- Dumping structure for table web2.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_id` int(10) NOT NULL DEFAULT 0,
  `barcode` varchar(13) NOT NULL,
  `sku` varchar(20) NOT NULL,
  `name` varchar(300) NOT NULL,
  `price` int(11) NOT NULL,
  `featured_image` varchar(100) NOT NULL,
  `inventory_qty` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `description` text NOT NULL,
  `star` float DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL COMMENT '1: nổi bật',
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `product_category_fk_1` (`category_id`),
  KEY `brand_id` (`brand_id`),
  KEY `discount_id_fk_1` (`discount_id`),
  CONSTRAINT `discount_id_fk_1` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`),
  CONSTRAINT `product_category_fk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table web2.product: ~0 rows (approximately)

-- Dumping structure for table web2.province
CREATE TABLE IF NOT EXISTS `province` (
  `id` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- Dumping data for table web2.province: ~0 rows (approximately)

-- Dumping structure for table web2.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table web2.role: ~0 rows (approximately)

-- Dumping structure for table web2.role_action
CREATE TABLE IF NOT EXISTS `role_action` (
  `role_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`action_id`),
  KEY `role_action_role_fk_1` (`role_id`),
  KEY `role_action_action_fk_1` (`action_id`),
  CONSTRAINT `role_action_action_fk_1` FOREIGN KEY (`action_id`) REFERENCES `action` (`id`),
  CONSTRAINT `role_action_role_fk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table web2.role_action: ~0 rows (approximately)

-- Dumping structure for table web2.shipping_unit
CREATE TABLE IF NOT EXISTS `shipping_unit` (
  `id` int(11) NOT NULL,
  `oder_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `hotline` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table web2.shipping_unit: ~0 rows (approximately)

-- Dumping structure for table web2.staff
CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `staff_role_fk_1` (`role_id`),
  KEY `staff_account_fk_2` (`account_id`),
  CONSTRAINT `staff_account_fk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `staff_role_fk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table web2.staff: ~0 rows (approximately)

-- Dumping structure for table web2.status
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table web2.status: ~0 rows (approximately)

-- Dumping structure for table web2.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `shipping_fee` int(11) NOT NULL,
  `discount` smallint(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table web2.supplier: ~0 rows (approximately)

-- Dumping structure for table web2.transport
CREATE TABLE IF NOT EXISTS `transport` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `province_id` varchar(5) DEFAULT NULL,
  `price` int(10) NOT NULL,
  `shipping_unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transport_province_id` (`province_id`),
  CONSTRAINT `province_fk_2` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table web2.transport: ~0 rows (approximately)

-- Dumping structure for table web2.ward
CREATE TABLE IF NOT EXISTS `ward` (
  `id` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(30) NOT NULL,
  `district_id` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `ward_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table web2.ward: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
