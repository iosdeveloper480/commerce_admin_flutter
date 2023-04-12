-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2023 at 12:05 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fatima`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `name` text DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `flat` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `name`, `details`, `country`, `city`, `flat`, `phone`, `latitude`, `longitude`, `hide`) VALUES
(1, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 'Office', 'Port City Java', 'ae', 'Abu Dhabi', '402', '971586745257', '24.466993', '54.384375', 0),
(2, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 'Office ', 'Port City Java, Al Nahyan Camp', 'ae', 'Abu Dhabi', '100', '+971586745257', '24.4671365', '54.3845912', 0),
(3, 'stUykVEFSahTIDAsRViLXiqXnmR2', 'Ujh', 'Port City Java', 'ae', 'Abu Dhabi', '777', '971527188709', '24.466993', '54.384375', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `role` int(255) NOT NULL,
  `main` int(11) NOT NULL DEFAULT 0,
  `status` int(255) NOT NULL DEFAULT 1,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `user_name`, `pass`, `role`, `main`, `status`, `hide`) VALUES
(1, 'Admin', 'admin', '25d55ad283aa400af464c76d713c07ad', 1, 1, 1, 0),
(2, 'Employee', 'Employee', '25d55ad283aa400af464c76d713c07ad', 2, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `app_alerts`
--

CREATE TABLE `app_alerts` (
  `id` int(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0-No link , 1-Outside link,2-Shop,3-products,4- categories',
  `img` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `name_ar` text DEFAULT NULL,
  `link_id` varchar(255) NOT NULL DEFAULT '0',
  `link` varchar(255) DEFAULT NULL COMMENT 'tablename,id',
  `hide` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_alerts`
--

INSERT INTO `app_alerts` (`id`, `type`, `img`, `name`, `name_ar`, `link_id`, `link`, `hide`) VALUES
(1, 1, 'http://172.20.30.149/fatima/admin/app_alerts/images/1.png?t=1679831333', 'Slider 1', 'Slider 1', '4', 'https://www.google.com/', 0),
(2, 1, 'http://172.20.30.149/fatima/admin/app_alerts/images/2.png?t=1679831347', 'Slider 1', 'Slider 1', '4', 'https://www.google.com/', 0);

-- --------------------------------------------------------

--
-- Table structure for table `app_config`
--

CREATE TABLE `app_config` (
  `id` int(11) NOT NULL,
  `android_version` varchar(255) NOT NULL DEFAULT '0',
  `ios_version` varchar(255) NOT NULL DEFAULT '0',
  `is_delete` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_config`
--

INSERT INTO `app_config` (`id`, `android_version`, `ios_version`, `is_delete`) VALUES
(1, '1', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_data`
--

CREATE TABLE `app_data` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `details_ar` text NOT NULL,
  `hide` varchar(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_data`
--

INSERT INTO `app_data` (`id`, `name`, `name_ar`, `details`, `details_ar`, `hide`) VALUES
(1, 'About Us', 'عن التطبيق', '<p>About Fatima DB0About Fatima DB0 About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0About Fatima DB0 </p>', '                                                  <p>About Fatima </p>                                        ', '0'),
(2, 'Terms and Conditions', 'الشروط والأحكام', '<p>Terms and Conditions of Fatima DB</p>', '<p>Terms and Conditions of Fatima</p>', '0'),
(3, 'Privacy Policy', 'سياسة الخصوصية', '                <p>This is Fatima\'s (“Fatima”) online privacy policy (“Policy”). This policy applies only to activities Fatima engages in on its mobile application and does not apply to Fatima activities that are \"offline\" or unrelated to the mobile application.</p><p>Fatima collects certain anonymous data regarding the usage of the mobile application. This information does not personally identify users, by itself or in combination with other information, and is gathered to improve the performance of the mobile application. The anonymous data collected by the Fatima mobile application can include information such as the type of device you are using and the length of the visit to the mobile application. You may also be asked to provide personally identifiable information on the Fatima mobile application, which may include your name, address, telephone number, and e-mail address. This information can be gathered when feedback or e-mails are sent to Fatima, when you register for services, or make purchases on the mobile application. In all such cases you have the option of providing us with personally identifiable information.</p><ol><li>USE AND DISCLOSURE OF INFORMATION. Except as otherwise stated below, we do not sell, trade or rent your personally identifiable information collected on the mobile application to others. The information collected by our mobile application is used to process orders, to keep you informed about your order status, to notify you of products or special offers that may be of interest to you, and for statistical purposes for improving our mobile application. We will disclose your Delivery information to third parties for order tracking purposes or process your check or money order, as appropriate, fill your order, improve the functionality of our mobile application, perform statistical and data analyses deliver your order and deliver promotional emails to you from us. For example, we must release your mailing address information to the delivery service to deliver products that you ordered.</li><li>All credit/debit cards’ details and personally identifiable information will NOT be stored, sold, shared, rented or leased to any third parties.</li></ol><p>COOKIES. Cookies are small bits of data cached in a user’s mobile device. Fatima utilizes cookies to determine whether or not you have visited the mobile application in the past. However, no other user information is gathered.</p><p>Fatima may use non-personal \"aggregated data\" to enhance the operation of our mobile application, or analyze interest in the areas of our mobile application. Additionally, if you provide Fatima with content for publishing or feedback, we may publish your user name or other identifying data with your permission.</p><p>Fatima may also disclose personally identifiable information in order to respond to a subpoena, court order or other such request. Fatima may also provide such personally identifiable information in response to a law enforcement agencies request or as otherwise required by law. Your personally identifiable information may be provided to a party if Fatima files for bankruptcy, or there is a transfer of the assets or ownership of Fatima in connection with proposed or consummated corporate reorganizations, such as mergers or acquisitions.</p><ol><li>SECURITY. Fatima takes appropriate steps to ensure data privacy and security including through various hardware and software methodologies. However, Fatima cannot guarantee the security of any information that is disclosed online.</li><li>OTHER MOBILE APPLICATIONS. Fatima is not responsible for the privacy policies of mobile applications to which it links. If you provide any information to such third parties different rules regarding the collection and use of your personal information may apply. We strongly suggest you review such third party’s privacy policies before providing any data to them. We are not responsible for the policies or practices of third parties. Please be aware that our mobile application may contain links to other mobile applications on the Internet that are owned and operated by third parties. The information practices of those mobile applications linked are not covered by this Policy. Those linked mobile applications may send their own cookies or clear GIFs</li></ol><p><br></p>              ', '<p>This is Fatima\'s (“Fatima”) online privacy policy (“Policy”). This policy applies only to activities Fatima engages in on its mobile application and does not apply to Fatima activities that are \"offline\" or unrelated to the mobile application.</p><p>Fatima collects certain anonymous data regarding the usage of the mobile application. This information does not personally identify users, by itself or in combination with other information, and is gathered to improve the performance of the mobile application. The anonymous data collected by the Fatima mobile application can include information such as the type of device you are using and the length of the visit to the mobile application. You may also be asked to provide personally identifiable information on the Fatima mobile application, which may include your name, address, telephone number, and e-mail address. This information can be gathered when feedback or e-mails are sent to Fatima, when you register for services, or make purchases on the mobile application. In all such cases you have the option of providing us with personally identifiable information.</p><ol><li>USE AND DISCLOSURE OF INFORMATION. Except as otherwise stated below, we do not sell, trade or rent your personally identifiable information collected on the mobile application to others. The information collected by our mobile application is used to process orders, to keep you informed about your order status, to notify you of products or special offers that may be of interest to you, and for statistical purposes for improving our mobile application. We will disclose your Delivery information to third parties for order tracking purposes or process your check or money order, as appropriate, fill your order, improve the functionality of our mobile application, perform statistical and data analyses deliver your order and deliver promotional emails to you from us. For example, we must release your mailing address information to the delivery service to deliver products that you ordered.</li><li>All credit/debit cards’ details and personally identifiable information will NOT be stored, sold, shared, rented or leased to any third parties.</li></ol><p>COOKIES. Cookies are small bits of data cached in a user’s mobile device. Fatima utilizes cookies to determine whether or not you have visited the mobile application in the past. However, no other user information is gathered.</p><p>Fatima may use non-personal \"aggregated data\" to enhance the operation of our mobile application, or analyze interest in the areas of our mobile application. Additionally, if you provide Fatima with content for publishing or feedback, we may publish your user name or other identifying data with your permission.</p><p>Fatima may also disclose personally identifiable information in order to respond to a subpoena, court order or other such request. Fatima may also provide such personally identifiable information in response to a law enforcement agencies request or as otherwise required by law. Your personally identifiable information may be provided to a party if Fatima files for bankruptcy, or there is a transfer of the assets or ownership of Fatima in connection with proposed or consummated corporate reorganizations, such as mergers or acquisitions.</p><ol><li>SECURITY. Fatima takes appropriate steps to ensure data privacy and security including through various hardware and software methodologies. However, Fatima cannot guarantee the security of any information that is disclosed online.</li><li>OTHER MOBILE APPLICATIONS. Fatima is not responsible for the privacy policies of mobile applications to which it links. If you provide any information to such third parties different rules regarding the collection and use of your personal information may apply. We strongly suggest you review such third party’s privacy policies before providing any data to them. We are not responsible for the policies or practices of third parties. Please be aware that our mobile application may contain links to other mobile applications on the Internet that are owned and operated by third parties. The information practices of those mobile applications linked are not covered by this Policy. Those linked mobile applications may send their own cookies or clear GIFs</li></ol><p><br></p>', '0');

-- --------------------------------------------------------

--
-- Stand-in structure for view `availability_view`
-- (See below for the actual view)
--
CREATE TABLE `availability_view` (
`name` text
,`name_ar` text
,`custom` int(11)
,`price` varchar(255)
,`cat_id` int(11)
,`sub_id` int(11)
,`id` int(255)
,`shop_id` int(11)
,`max_quantity` varchar(255)
,`status` int(11)
,`discount` varchar(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL DEFAULT 0,
  `name` text NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL DEFAULT '0',
  `slug` varchar(255) NOT NULL,
  `img` text DEFAULT NULL,
  `special_img` varchar(255) DEFAULT 'http://172.20.30.149/fatima/assets/img/special.png',
  `offer_img` varchar(255) DEFAULT 'http://172.20.30.149/fatima/assets/img/offer.png',
  `size_img` varchar(255) DEFAULT NULL,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `shop_id`, `name`, `name_ar`, `special`, `slug`, `img`, `special_img`, `offer_img`, `size_img`, `hide`) VALUES
(1, 0, 'Abayas', 'عبايات', '200', 'abayas', 'http://172.20.30.149/fatima/admin/categories/categories/1.png?t=1679894580', 'http://172.20.30.149/fatima/assets/img/special.png?t=4354354565', 'http://172.20.30.149/fatima/admin/categories/categories/1-offer.png?t=1673961538', 'http://172.20.30.149/fatima/admin/size_charts/images/1.png?t=1679460556', 0),
(2, 0, 'Dresses', 'فساتين', '300', 'dresses', 'http://172.20.30.149/fatima/admin/categories/categories/2.png?t=1679894586', 'http://172.20.30.149/fatima/assets/img/special.png?t=54654634', 'http://172.20.30.149/fatima/assets/img/offer.png', '', 0),
(3, 0, 'Travel Wear', 'ملابس سفر', '200', 'travel_wear', 'http://172.20.30.149/fatima/admin/categories/categories/3.png?t=1679894596', 'http://172.20.30.149/fatima/assets/img/special.png?t=56565678', 'http://172.20.30.149/fatima/assets/img/offer.png', NULL, 0),
(4, 0, 'Mukhawar', 'مخاوير', '0', 'mukhawar', 'http://172.20.30.149/fatima/admin/categories/categories/4.png?t=1674039580', 'http://172.20.30.149/fatima/assets/img/special.png', 'http://172.20.30.149/fatima/admin/categories/categories/4-offer.png?t=1680521113', NULL, 0),
(5, 0, 'Kaftans', 'قفاطين', '0', 'kaftans', 'http://172.20.30.149/fatima/admin/categories/categories/5.png?t=1674039616', 'http://172.20.30.149/fatima/assets/img/special.png', 'http://172.20.30.149/fatima/assets/img/offer.png', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` int(20) NOT NULL DEFAULT 0,
  `hide` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name_ar`, `name`, `country_id`, `hide`) VALUES
(1, 'أبو ظبي', 'Abu Dhabi', 1, 0),
(2, 'دبي', 'Dubai', 1, 0),
(3, 'الشارقة', 'Sharjah', 1, 0),
(4, 'ام القيوين', 'Umm Al Quwain', 1, 0),
(5, 'عجمان', 'Ajman', 1, 0),
(6, 'رأس الخيمة', 'Ras Al-Khaimah', 1, 0),
(7, 'الفجيرة', 'Fujairah', 1, 0),
(8, 'العين', 'AL Ain', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `facebook`, `instagram`, `twitter`, `whatsapp`, `phone`, `email`) VALUES
(1, 'https://www.facebook.com/', 'https://www.instagram.com/', 'https://twitter.com/', '+971586745257', '0859745257', 'fatima@info.com');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `hide` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `name_ar`, `code`, `hide`) VALUES
(1, 'UAE', 'الامارات', 'AE', 0);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1-percentage,2-value,\r\n3-free',
  `value` varchar(255) NOT NULL DEFAULT '0',
  `date` varchar(255) NOT NULL,
  `used` int(255) NOT NULL DEFAULT 0,
  `max` int(255) NOT NULL DEFAULT 0,
  `cap` varchar(255) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT ' 0-inactive,\r\n1- active,\r\n2-expired,\r\n3-limit exceeded',
  `expiry` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `name`, `name_ar`, `type`, `value`, `date`, `used`, `max`, `cap`, `status`, `expiry`, `created_by`, `hide`) VALUES
(1, '111', 'new', 'new', 1, '50', '2023-03-29', 16, 100, '10', 1, '2023-05-01', '1', 0),
(2, '222', 'new', 'new', 2, '150', '2023-01-16', 1, 100, '100', 1, '2023-11-03', '1', 0),
(3, '333', 'Free', 'Free', 3, '0', '2023-01-16', 4, 100, '0', 1, '2023-11-23', '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_transactions`
--

CREATE TABLE `coupon_transactions` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL DEFAULT '0',
  `user_id` varchar(255) NOT NULL DEFAULT '0',
  `ticket_id` varchar(255) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `coupon_transactions`
--

INSERT INTO `coupon_transactions` (`id`, `code`, `user_id`, `ticket_id`, `value`, `date`, `hide`) VALUES
(1, '333', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '135', '20', '2023-04-03 10:41:09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_settings`
--

CREATE TABLE `delivery_settings` (
  `id` int(11) NOT NULL,
  `delivery` varchar(255) NOT NULL DEFAULT '0',
  `free` varchar(255) NOT NULL DEFAULT '0',
  `minimum` varchar(255) NOT NULL DEFAULT '0',
  `per_shop` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery_settings`
--

INSERT INTO `delivery_settings` (`id`, `delivery`, `free`, `minimum`, `per_shop`) VALUES
(1, '10', '100', '0', '10');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `details_ar` text DEFAULT NULL,
  `hide` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `name`, `name_ar`, `details`, `details_ar`, `hide`) VALUES
(1, 'How can I track my order? ', 'How can I track my order? AR', 'Once you have placed your order,  you can track the status of your order from your \"order   history\"  section on your account page on the application.', 'Once you have placed your order,  you can track the status of your order from your \"order   history\"  section on your account page on the application.', 0),
(3, 'Support online payment ? ', 'Support online payment ? ', 'Yes card and COD', 'Yes card and COD', 0);

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `cat` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `filter` int(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `cat`, `name`, `name_ar`, `filter`, `slug`, `sort`, `hide`) VALUES
(1, '1,2,3', 'Color', 'اللون', 1, 'color', 2, 0),
(2, '1,2,3', 'Model', 'الموديل', 1, 'model', 1, 0),
(3, '1,2,3', 'Fabric', 'القماش', 1, 'fabric', 3, 0),
(4, '1,2,3', 'Style', 'التصميم', 0, 'style', 4, 0),
(5, '1,3', 'Pattern', 'النقش', 0, 'pattern', 5, 0),
(6, '1,4', 'Shilah', 'شيله', 0, 'shilah', 6, 0),
(7, '1,2,3', 'Delivery', 'Delivery', 0, 'delivery', 7, 1),
(12, '1,2', 'Delivery', 'التوصيل', 0, 'delivery1', 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `feature_options`
--

CREATE TABLE `feature_options` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL DEFAULT 0,
  `feature` int(11) NOT NULL,
  `cat` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `approve` int(11) NOT NULL DEFAULT 0,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feature_options`
--

INSERT INTO `feature_options` (`id`, `shop_id`, `feature`, `cat`, `name`, `name_ar`, `approve`, `hide`) VALUES
(1, 0, 2, '1', 'Frasha', 'فريشا', 1, 0),
(2, 0, 1, '1,2,3', 'Black', 'أسود', 1, 0),
(3, 0, 3, '1,2,3', '100% Cotton', '100% قطن', 1, 0),
(4, 0, 4, '1,2,3', 'Regular', 'عادي', 1, 0),
(5, 0, 5, '1,3', 'Solid', 'متامسك', 1, 0),
(6, 0, 6, '1,4', 'Yes', 'نعم', 1, 0),
(7, 0, 7, '1,2,3', '8-10 Days', '8-10 Days', 1, 1),
(11, 0, 1, '2,3', 'Red', 'أحمر', 1, 0),
(12, 0, 1, '3', 'Green', 'أخضر', 1, 0),
(13, 0, 1, '1,2,3', 'Blue', 'أزرق', 1, 0),
(14, 0, 3, '1', '100% silk', '100% سلك', 1, 0),
(15, 0, 3, '1', 'Chiffon', 'شفون', 1, 0),
(16, 0, 2, '1,2,3', 'Embroidered Abaya', 'مطرز', 1, 0),
(17, 0, 2, '1,2,3', 'Full Abaya', 'كامل', 1, 0),
(18, 0, 3, '2,3', 'Cotton', 'قطن', 1, 0),
(19, 0, 12, '1', '1- 3 ', '1- 3 ', 1, 0),
(20, 0, 12, '2', '4-5', '4-5', 1, 0),
(21, 0, 12, '1', '14-21', '14-21', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lang`
--

CREATE TABLE `lang` (
  `id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `value_ar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lang`
--

INSERT INTO `lang` (`id`, `name`, `value`, `value_ar`) VALUES
(1, 'dir', 'ltr', 'rtl'),
(2, 'appname', 'Fatima', 'فاطمة'),
(3, 'name', 'Name', 'الاسم'),
(4, 'name_ar', 'Name (Arabic)', 'الاسم (بالعربي)'),
(5, 'name_en', 'Name (English)', 'الاسم (بالانجيزي)'),
(6, 'hlang', 'en', 'ar'),
(7, 'add', 'Add', 'إضافة'),
(8, 'save', 'Save', 'حفظ'),
(9, 'cancel', 'Cancel', 'إلغاء'),
(10, 'dashboard', 'Dashboard', 'الشاشة الرئيسية'),
(11, 'categories', 'Categories', 'التصنيفات'),
(12, 'home', 'Home', 'الرئيسية'),
(13, 'img', 'Image', 'صورة'),
(14, 'edit', 'Edit', 'تعديل'),
(15, 'delete', 'Delete', 'حذف'),
(16, 'alert_title', 'Are you sure?', 'هل انت متأكد ؟ '),
(17, 'deleteconfirm', 'Do you really want to delete this record?', 'هل انت متأكد من الحذف ؟'),
(18, 'yes', 'Yes', 'نعم'),
(20, 'cimage', 'Change Image', 'تغيير الصورة'),
(21, 'upload', 'Upload', 'تحميل'),
(22, 'simage', 'Select Image', 'إختر الصورة'),
(23, 'uploadlimit', 'File must be less than 2MB', 'حجم الملف يجب ان يكون اقل من 2 ميقا'),
(24, 'extmessage', 'Select an image with extension jpeg, png, jpg and gif', 'نوع الصورة يجيب ان يكون jpeg,jpg,png'),
(25, 'subcategories', 'Sub Categories', 'التصنيفات الفرعية'),
(26, 'category', 'Category', 'التصنيف'),
(28, 'sizes', 'Sizes', 'المقاسات'),
(29, 'measurements', 'Measurements', 'القياسات'),
(31, 'features', 'Features', 'الخصائص'),
(33, 'products', 'Products', 'المنتجات'),
(34, 'select', 'Select', 'اختر'),
(35, 'sub_category', 'Sub Category', 'تصنيف فرعي'),
(36, 'details_ar', 'Details (Arabic)', 'التفاصيل بالعربي'),
(37, 'details_en', 'Details (English)', 'التفاصيل بالانجليزي'),
(38, 'price', 'Price', 'السعر'),
(39, 'quantity', 'Quantity', 'الكمية'),
(42, 'logout', 'Logout', 'تسجيل خروج'),
(43, 'account', 'Account', 'الحساب'),
(46, 'country', 'Country', 'الدولة'),
(47, 'countries', 'Countries', 'الدول'),
(48, 'cities', 'Cities', 'المدن'),
(49, 'locations', 'Locations', 'المواقع'),
(54, 'gallery', 'Gallery', 'معرض الصور'),
(55, 'clang', 'العربية', 'English'),
(56, 'users', 'Users', 'المستخدمون'),
(57, 'email', 'Email', 'البريد إلكتروني'),
(58, 'phone', 'Phone No. ', 'رقم الهاتف '),
(59, 'role', 'Role', 'الصلاحية'),
(60, 'status', 'status', 'الحالة'),
(61, 'changepass', 'Change Password', 'تغيير كلمة المرور'),
(62, 'pass', 'Password', 'كلمه السر'),
(63, 'user_name', 'User Name', 'اسم المستخدم'),
(66, 'dtype', 'Discount Type', 'نوع الخصم'),
(67, 'percentage', 'Percentage', 'نسبة'),
(68, 'value', 'Value', 'القيمة'),
(69, 'dvalue', 'Discount Value', 'خصم قيمة'),
(70, 'coupons', 'coupons', 'كودات الخصم'),
(71, 'date', 'Date', 'التاريخ'),
(72, 'code', 'Code', 'الكود'),
(73, 'used', 'Used', 'تم استخدام'),
(74, 'maxuse', 'Max Use', 'عدد الكوبونات'),
(75, 'maxvalue', 'Max Value', 'اقصي قيمة للتخفيض'),
(76, 'expiry', 'Expiry', 'تاريخ الانتهاء'),
(77, 'cap', 'Cap', 'الحد الأقصى للخصم'),
(78, 'type', 'Type', 'النوع'),
(79, 'fdelivery', 'Free Delivery', 'توصيل مجاني'),
(80, 'currency', ' AED', ' درهم '),
(81, 'expired', 'Expired', 'منتهي'),
(82, 'limitexceeded', 'Limit Exceeded', 'تم تجاوز الحد'),
(83, 'free', 'Free', 'مجاني'),
(84, 'customizations', 'Customizations', 'تخصيص'),
(85, 'view', 'View', 'عرض'),
(86, 'notspecified', 'Not Specified', 'غير محدد'),
(87, 'customers', 'Customers', 'العملاء'),
(88, 'gender', 'Gender', 'الجنس'),
(90, 'balance', 'Balance', 'الرصيد'),
(91, 'female', 'Female', 'انثي'),
(92, 'male', 'Male', 'ذكر'),
(98, 'sliders', 'Sliders', 'صور العرض'),
(99, 'link', 'Link', 'الرابط'),
(100, 'none', 'None', 'لا يوجد'),
(101, 'shop', 'Shop', 'المتجر'),
(103, 'banners', 'Banners', 'صور الإعلانات'),
(104, 'addresses', 'Addresses', 'العناوين'),
(108, 'details', 'Details', 'تفاصيل'),
(110, 'address', 'Address', 'العنوان'),
(111, 'city', 'City', 'المدينة'),
(113, 'shops', 'Shops', 'المتاجر'),
(114, 'area_en', 'Area (English)', 'المنطقة بالانجليزي'),
(115, 'area_ar', 'Area (Arabic)', 'المنطقة بالعربي '),
(117, 'location', 'Location', 'الموقع'),
(118, 'previous', 'Previous', 'السابق'),
(119, 'next', 'Next', 'التالي'),
(120, 'shopdetails', 'Shop Details', 'تفاصيل المتجر'),
(121, 'user', 'User', 'المستخدم'),
(122, 'emailexist', 'Email already exist', 'البريد الإلكتروني مستخدم مسبقاً'),
(123, 'update', 'Update', ' تعديل'),
(124, 'open', 'Open', 'مفتوح'),
(125, 'login', 'Login', 'تسجيل دخول'),
(126, 'comm', 'Commission', 'النسبة'),
(127, 'minorder', 'Minimum Order', 'الحد الأدنى للطلب'),
(128, 'deliveryfees', 'Delivery Fees', 'رسوم التوصيل'),
(131, 'profile', 'Profile', 'بياناتي'),
(132, 'oldpass', 'Old Password', 'كلمة المرور القديمة'),
(133, 'newpass', 'New Password', 'كلمة المرور الجديدة'),
(134, 'conpass', 'Confirm Password', 'تأكيد كلمة المرور'),
(135, 'allrequired', 'All fields are required', 'جميع الحقول مطلوبة'),
(136, 'validatepass', 'Password must be at least 8 characters in length', 'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل'),
(137, 'notmatch', 'Password Not Matching', 'كلمات المرور غير متطابقة'),
(138, 'incorrectpass', 'Old password is incorrect', 'كلمة المرور القديمة ليست صحيحة'),
(139, 'schangepass', 'Your Password changed Successfully', 'تم تغيير كلمة المرور بنجاح الرجاء تسجيل الدخول من جديد'),
(140, 'fchangepass', 'Your Password Not Changed Incorrect Data', 'لم يتم تغيير كلمة المرور الرجاء التأكد من البيانات'),
(141, 'settings', 'Settings', 'الإعدادات'),
(142, 'reject', 'Reject', 'رفض'),
(143, 'payment', 'Payment', 'الدفع'),
(144, 'pcash', 'Cash Payment', 'دفع نقدي'),
(146, 'ponline', 'Online Payment', 'دفع إلكتروني'),
(148, 'discount', 'Total Discount', 'إجمالي التخفيضات '),
(149, 'delivery', 'Delivery', 'توصيل'),
(150, 'subtotal', 'Sub Total', 'مجموع الطلبات'),
(151, 'total', 'Total', 'المجموع'),
(152, 'confirmaccept', 'Do you really want to accept this order?', 'هل حقا تريد الموافقة على هذا الطلب ؟ '),
(153, 'accept', 'Accept', 'قبول'),
(154, 'orders', 'Orders', 'الطلبات'),
(155, 'norders', 'New Orders', 'طلبات جديدة'),
(156, 'acorders', 'Accepted Orders', 'الطلبات المقبولة'),
(157, 'ticket', 'Ticket', 'الإيصال'),
(158, 'ofdelivery', 'Out for Delivery', 'خارج للتوصيل'),
(160, 'confirmoutfordelivery', 'Do you really want to confirm this order out for delivery? ', 'هل تريد تأكيد ان هذا الطلب في الخارج للتوصيل ؟'),
(162, 'print', 'PRINT', 'طباعة'),
(163, 'comorders', 'Completed Orders', 'الطلبات المنتهية'),
(165, 'corders', 'Cancelled Orders', ' الطلبات الملغيه '),
(167, 'otransactions', 'Online Transactions', 'المعاملات الاونلاين'),
(169, 'transactionid', 'Transaction ID', 'رقم المعاملة'),
(170, 'amount', 'Amount', 'القيمة'),
(171, 'referenceid', 'Reference ID', 'الرقم المرجعي'),
(172, 'paidby', 'Paid By', 'تم الدفع بواسطة'),
(174, 'rbank', 'Refund to bank', 'Refund to bank'),
(177, 'refund', 'Refund', 'ارجاع'),
(178, 'refunds', 'Refunds', 'الارجاعات'),
(179, 'paymentmethods', 'Payment Methods', 'طرق الدفع'),
(180, 'appdata', 'App Data', 'بيانات التطبيق'),
(181, 'rate', 'Rate', 'التقييم'),
(182, 'comment', 'Comment', 'التعليق'),
(183, 'reviews', 'Reviews', 'التقييمات'),
(184, 'out', 'Out of Stock', 'نفاذ الكمية'),
(186, 'closed', 'Closed', 'مغلق'),
(189, 'notifications', 'Notifications', 'الإشعارات'),
(190, 'faqs', 'Faqs', 'الأسئلة الشائعة'),
(191, 'question_ar', 'Question (Arabic)', 'السؤال بالعربي'),
(192, 'question_en', 'Question (English)', 'السؤال بالانجليزي'),
(193, 'answer_ar', 'Answer (Arabic)', 'الإجابة بالعربي'),
(194, 'answer_en', 'Answer (English)', 'الإجابة بالانجيزي'),
(195, 'size_charts', 'Size Charts', 'جدول القياسات'),
(196, 'tickets', 'Tickets', 'الفواتير'),
(197, 'sales', 'Sales', 'المبيعات'),
(198, 'reports', 'Reports', 'التقارير'),
(199, 'sreport', 'Sales Report', 'تقرير المبيعات'),
(200, 'contacts', 'Contacts', 'معلومات التواصل'),
(202, 'copyright', 'Copyright 2022  Designed by', 'جميع الحقوق محفوظة 2022 / صمم بواسطة'),
(203, 'personalize', 'Enable Customer-Specific Measurements', 'امكانية تخصيص القياسات من قبل العميل '),
(204, 'screen', 'Screen', 'الشاشة'),
(205, 'permissions', 'Permissions', 'الصلاحيات'),
(206, 'more', 'More', 'المزيد'),
(207, 'approved', 'Approved', 'تمت الموافقة'),
(208, 'waiting', 'Waiting', 'قيد الانتظار'),
(209, 'approve', 'Approve', 'موافقة'),
(211, 'statusapprove', 'Do you really want to approve?', 'هل تريد تأكيد الموافقة؟'),
(212, 'special', 'Special', 'سعر خاص'),
(213, 'foptions', 'Feature Options', 'خيارات الخصائص'),
(214, 'feature', 'Feature', 'الخاصية'),
(215, 'flat', 'Flat', 'الشقة'),
(216, 'facebook', 'Facebook', 'فيسبوك'),
(217, 'insta', 'Instagram', 'انستغرام'),
(218, 'twitter', 'Twitter', 'تويتر'),
(219, 'whatsapp', 'WhatsApp', 'واتساب'),
(221, 'sort', 'Sort', 'ترتيب'),
(222, 'customer_sizes', 'Customer Sizes', 'مقاسات العملاء'),
(223, 'available_sizes', 'Available Sizes', 'المقاسات المتاحة'),
(224, 'not_available', 'Not Available', 'غير متوفر'),
(225, 'nofreedelivery', 'No Free Delivery', 'لا يوجد توصيل مجاني'),
(226, 'nominorder', 'No Minimum Order', 'لا يوجد حد أدنى للطب'),
(227, 'note', 'Note', 'ملاحظة '),
(228, 'lessthan', 'Less Than', 'اقل من '),
(229, 'offer_special', 'Offer/Special', 'عرض / سعر خاص '),
(230, 'coupontrans', 'Coupon Transactions', 'معاملات الكوبونات'),
(231, 'settlement', 'Settlement', 'السداد'),
(232, 'last_settle', 'Last settlement date', 'اخر تاريخ سداد'),
(233, 'settle', 'Settle', 'تسديد'),
(234, 'rsettlement', 'Settlement Report', 'تقرير السداد'),
(235, 'settlementid', 'Settlement Id', 'رقم السداد'),
(236, 'ready_delivery', 'Ready For Delivery', 'جاهز للتوصيل'),
(237, 'new', 'New', 'جديد'),
(238, 'accepted', 'Accepted', 'تمت الموافقة'),
(241, 'hours_ago', ' Hours ago', 'ساعات سابقا'),
(242, 'bill', 'Bill', 'الفاتورة'),
(243, 'order_details', 'Order Details', 'تفاصيل الطلب'),
(244, 'done', 'Done', 'انتهى'),
(245, 'rejected', 'Rejected', 'تم الرفض'),
(247, 'credit', 'Credit', 'المبلغ المستحق'),
(248, 'confirmready', 'Do you really want to confirm this order ready for delivery? ', 'هل تريد تأكيد ان هذا الطلب جاهز للتوصيل ؟'),
(249, 'product', 'Product', 'المنتج'),
(250, 'confirmreject', 'Do you really want to reject this orders? ', 'هل تريد تأكيد رفض هذه الطلبات ؟'),
(251, 'confirmdone', 'Do you really want to mark this orders as completed?', 'هل تريد تأكيد هذه الطلبات على أنها مكتملة؟'),
(252, 'per_shop', 'Per shop', 'لكل محل '),
(253, 'app_alerts', 'App Alerts', 'صور تنبيهات التطبيق'),
(254, 'goback', 'Go Back', 'رجوع'),
(255, 'permission_error', 'Sorry you don\'t have permission to access this section, please contact your system admin or otherwise go back', 'عذرا ليس لديك صلاحية للوصول إلى هذا القسم ، يرجى الاتصال بمسؤول النظام الخاص بك أو العودة للشاشة السابقة'),
(256, 'label_features', 'Add product features and options', 'إضف ميزات وخيارات المنتج'),
(258, 'nofeatures', 'No Features', 'لا توجد خصائص'),
(260, 'delivery_settings', 'Delivery Settings', 'اعدادات التوصيل'),
(261, 'android_version', 'Android Version', 'نسخة الانرويد'),
(262, 'ios_version', 'IOS Version', 'نسخة الايفون'),
(265, 'app_config', 'App Configuration', 'اعدادات التطبيق'),
(266, 'filter_use', 'Filter Use', 'الاستخدام في التصفية '),
(267, 'role_exist', 'Role already exist', 'الصلاحية موجودة مسبقاً'),
(268, 'actions', 'Actions', 'الاجراءات'),
(269, 'enabled', 'Enabled', 'فعال'),
(270, 'disabled', 'Disabled', 'غير فعال'),
(271, 'total_sales', 'Total Sales', 'المبيعات'),
(272, 'settled_amt', 'Settled Amount', 'المبالغ المسددة'),
(273, 'pending_amt', 'Pending Amount', 'المبالغ المعلقة'),
(274, 'stock', 'Stock', 'المخزن'),
(275, 'discount_products', 'Discounted Products', 'المنتجات المخفضة'),
(276, 'change_status', 'Change Status', 'تغيير الحالة'),
(277, 'total_users', 'Total Users', 'عدد المستخدمين'),
(278, 'top_shops', 'Top 5 shops', 'افضل 5 متاجر'),
(279, 'rfinancial', 'Financial Reports', 'التقارير المالية'),
(280, 'send_noti', 'Send Notification', 'ارسال اشعار'),
(281, 'refund_desc', 'Amount will be refunded to your account with in 2-3 days', 'سيتم ارجاع المبلغ لحسلبك خلال 2-3 ايام عمل '),
(282, 'search', 'Search', 'بحث'),
(283, 'not_found', 'Result not found', 'لا توجد نتائج'),
(284, 'shop_close', 'Shop Open/Close', 'اغلاق / فتح المحل ');

-- --------------------------------------------------------

--
-- Table structure for table `measurements`
--

CREATE TABLE `measurements` (
  `id` int(11) NOT NULL,
  `cat` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `measurements`
--

INSERT INTO `measurements` (`id`, `cat`, `name`, `name_ar`, `hide`) VALUES
(1, '1,2', 'Bust', 'الصدر', 0),
(2, '1,2', 'Shoulders', 'الأكتاف', 0),
(3, '1', 'Sleeves', 'الكم', 0),
(4, '1', 'Length', 'الطول', 0),
(5, '1', 'Waist', 'الخصر', 0),
(6, '1', 'Hips', 'محيط الحوض', 0),
(7, '3', 'Pocket', 'Pocket', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `details` text NOT NULL,
  `details_ar` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(255) NOT NULL,
  `shop_id` varchar(255) NOT NULL DEFAULT '0',
  `ticket_id` int(255) NOT NULL DEFAULT 0,
  `user_id` varchar(255) NOT NULL DEFAULT '0',
  `item_id` int(255) DEFAULT 0,
  `quantity` int(255) NOT NULL DEFAULT 0,
  `custom` varchar(255) NOT NULL DEFAULT '0',
  `price` varchar(255) NOT NULL DEFAULT '0',
  `size` int(255) NOT NULL DEFAULT 0,
  `size_name` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `comm` varchar(255) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `rate` varchar(5) NOT NULL DEFAULT '0',
  `delivery` int(11) NOT NULL DEFAULT 0,
  `status` int(255) NOT NULL DEFAULT 0 COMMENT ' 	-1 rejected,0-pending,1-accepted ,2-Shipped,3-Done',
  `settlement` int(11) NOT NULL DEFAULT 0,
  `hide` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `shop_id`, `ticket_id`, `user_id`, `item_id`, `quantity`, `custom`, `price`, `size`, `size_name`, `note`, `comm`, `date`, `rate`, `delivery`, `status`, `settlement`, `hide`) VALUES
(1, '1', 100, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 1, 1, '0', '27', 1, '50', NULL, '10', '2023-03-23 08:13:25', '0', 0, -1, 0, '0'),
(2, '2', 100, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 1, '0', '30', 1, '50', NULL, '15', '2023-03-23 08:13:25', '0', 0, -1, 0, '0'),
(3, '1', 100, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 1, 1, '1', '27', 0, 'Bust (10)\nShoulders (20)\nSleeves (30)\nLength (40)\nWaist (50)\nHips (60)', NULL, '10', '2023-03-23 08:13:25', '5', 0, -1, 0, '0'),
(4, '1', 101, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 1, 1, '0', '27', 1, '50', NULL, '10', '2023-03-23 08:14:01', '0', 1, 2, 0, '0'),
(5, '2', 101, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 1, '0', '30', 1, '50', NULL, '15', '2023-03-23 08:14:01', '0', 1, 2, 0, '0'),
(6, '1', 101, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 1, 1, '1', '27', 0, 'Bust (10)\nShoulders (20)\nSleeves (30)\nLength (40)\nWaist (50)\nHips (60)', NULL, '10', '2023-03-23 08:14:01', '0', 1, 2, 0, '0'),
(7, '1', 102, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 1, 1, '0', '27', 1, '50', NULL, '10', '2023-03-23 08:19:09', '0', 1, 3, 1, '0'),
(8, '2', 102, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 1, '0', '30', 1, '50', NULL, '15', '2023-03-23 08:19:09', '0', 1, 3, 1, '0'),
(9, '1', 102, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 1, 1, '1', '27', 0, 'Bust (10)\nShoulders (20)\nSleeves (30)\nLength (40)\nWaist (50)\nHips (60)', NULL, '10', '2023-03-23 08:19:09', '0', 1, 3, 1, '0'),
(10, '1', 103, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 1, 1, '0', '27', 1, '50', NULL, '10', '2023-03-23 08:20:31', '0', 1, 2, 0, '0'),
(11, '2', 103, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 1, '0', '30', 1, '50', NULL, '15', '2023-03-23 08:20:31', '0', 0, -1, 0, '0'),
(12, '1', 103, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 1, 1, '1', '27', 0, 'Bust (10)\nShoulders (20)\nSleeves (30)\nLength (40)\nWaist (50)\nHips (60)', NULL, '10', '2023-03-23 08:20:31', '0', 1, 1, 0, '0'),
(13, '1', 104, 'stUykVEFSahTIDAsRViLXiqXnmR2', 6, 1, '1', '84', 0, 'Bust (10)\nShoulders (20)\nSleeves (30)\nLength (40)\nWaist (50)\nHips (60)', NULL, '10', '2023-03-23 08:22:05', '0', 1, 2, 0, '0'),
(14, '1', 104, 'stUykVEFSahTIDAsRViLXiqXnmR2', 1, 2, '0', '27', 3, '30', NULL, '10', '2023-03-23 08:22:05', '0', 1, 2, 0, '0'),
(15, '1', 107, 'stUykVEFSahTIDAsRViLXiqXnmR2', 12, 1, '0', '69', 1, '50', NULL, '10', '2023-03-26 06:43:39', '0', 1, 3, 1, '0'),
(16, '1', 107, 'stUykVEFSahTIDAsRViLXiqXnmR2', 15, 1, '0', '0', 1, '50', NULL, '10', '2023-03-26 06:43:39', '0', 1, 3, 1, '0'),
(17, '1', 107, 'stUykVEFSahTIDAsRViLXiqXnmR2', 13, 1, '0', '1', 1, '50', NULL, '10', '2023-03-26 06:43:39', '0', 1, 3, 1, '0'),
(18, '1', 108, 'stUykVEFSahTIDAsRViLXiqXnmR2', 12, 1, '0', '69', 1, '50', NULL, '10', '2023-03-26 06:59:10', '0', 1, 3, 0, '0'),
(19, '1', 109, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 12, 1, '0', '69', 1, '50', NULL, '10', '2023-03-26 11:18:30', '0', 1, 2, 0, '0'),
(20, '1', 109, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 10, 1, '0', '163', 1, '50', NULL, '10', '2023-03-26 11:18:30', '0', 0, -1, 0, '0'),
(21, '1', 109, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 12, 1, '0', '69', 1, '50', NULL, '10', '2023-03-26 11:18:30', '0', 0, 1, 0, '0'),
(22, '1', 110, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 21, 1, '0', '312.8', 1, '50', NULL, '10', '2023-03-27 07:16:06', '0', 1, 2, 0, '0'),
(23, '1', 111, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 1, 3, '0', '15', 1, '50', NULL, '10', '2023-03-28 11:27:34', '0', 1, 1, 0, '0'),
(24, '2', 112, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 1, '0', '30', 1, '50', NULL, '15', '2023-03-28 11:55:32', '0', 0, 0, 0, '0'),
(25, '1', 112, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 13, 1, '0', '1', 1, '50', NULL, '10', '2023-03-28 11:55:32', '0', 0, -1, 0, '0'),
(26, '1', 112, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 1, 1, '0', '15', 1, '50', NULL, '10', '2023-03-28 11:55:32', '0', 0, 1, 0, '0'),
(27, '1', 114, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 1, 3, '0', '15', 1, '50', NULL, '10', '2023-03-29 06:39:30', '0', 1, 1, 0, '0'),
(28, '1', 115, 'stUykVEFSahTIDAsRViLXiqXnmR2', 1, 3, '1', '25', 1, '50', NULL, '10', '2023-03-29 06:56:54', '0', 0, 0, 0, '0'),
(29, '2', 116, 'stUykVEFSahTIDAsRViLXiqXnmR2', 2, 1, '1', '50', 1, '50', NULL, '15', '2023-03-29 07:03:43', '0', 0, 0, 0, '0'),
(30, '2', 117, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 2, '0', '30', 1, '50', NULL, '15', '2023-03-29 07:03:46', '0', 0, 0, 0, '0'),
(31, '1', 118, 'stUykVEFSahTIDAsRViLXiqXnmR2', 1, 1, '1', '25', 1, '50', NULL, '10', '2023-03-29 07:09:11', '0', 0, 0, 0, '0'),
(32, '2', 118, 'stUykVEFSahTIDAsRViLXiqXnmR2', 2, 1, '1', '50', 1, '50', NULL, '15', '2023-03-29 07:09:11', '0', 0, 0, 0, '0'),
(33, '1', 119, 'stUykVEFSahTIDAsRViLXiqXnmR2', 1, 1, '0', '25', 1, '50', NULL, '10', '2023-03-29 07:23:57', '0', 0, 0, 0, '0'),
(34, '1', 120, 'stUykVEFSahTIDAsRViLXiqXnmR2', 1, 1, '0', '15.0', 1, '50', NULL, '10', '2023-03-29 07:32:00', '0', 0, 1, 0, '0'),
(35, '2', 120, 'stUykVEFSahTIDAsRViLXiqXnmR2', 2, 1, '0', '30.0', 1, '50', NULL, '15', '2023-03-29 07:32:00', '0', 0, -1, 0, '0'),
(36, '1', 120, 'stUykVEFSahTIDAsRViLXiqXnmR2', 1, 1, '1', '15.0', 0, 'Bust (57)\nShoulders (67)\nSleeves (28)\nLength (200)\nWaist (28)\nHips (22.50)\n', NULL, '10', '2023-03-29 07:32:00', '0', 0, 0, 0, '0'),
(37, '1', 121, 'stUykVEFSahTIDAsRViLXiqXnmR2', 1, 2, '0', '15.0', 1, '50', NULL, '10', '2023-03-29 07:38:13', '5.0', 0, 0, 0, '0'),
(38, '1', 121, 'stUykVEFSahTIDAsRViLXiqXnmR2', 11, 3, '1', '66.6', 0, 'Bust (100)\nShoulders (200)\n', NULL, '10', '2023-03-29 07:38:13', '0', 0, 0, 0, '0'),
(39, '1', 122, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 1, 1, '1', '15', 0, 'الصدر (10)\nالأكتاف (20)\nالكم (30)\nالطول (40)\nالخصر (50)\nمحيط الحوض (60)', NULL, '10', '2023-03-29 07:43:37', '0', 0, -1, 0, '0'),
(40, '2', 123, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 2, '0', '30.0', 1, '50', NULL, '15', '2023-03-30 06:23:52', '5.0', 1, 3, 0, '0'),
(41, '2', 123, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 2, '1', '30.0', 0, 'الصدر (10)\nالأكتاف (20)\nالكم (30)\nالطول (40)\nالخصر (50)\nمحيط الحوض (60)\n', NULL, '15', '2023-03-30 06:23:52', '5.0', 1, 3, 0, '0'),
(42, '2', 123, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 3, '1', '30.0', 0, 'الصدر (1)\nالأكتاف (2)\nالكم (3)\nالطول (4)\nالخصر (5)\nمحيط الحوض (6)\n', NULL, '15', '2023-03-30 06:23:52', '5.0', 1, 3, 0, '0'),
(43, '2', 124, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 2, '0', '30', 1, '50', NULL, '15', '2023-03-30 06:25:08', '5.0', 1, 2, 0, '0'),
(44, '2', 124, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 1, '1', '30', 0, 'الصدر (10)\nالأكتاف (20)\nالكم (30)\nالطول (40)\nالخصر (50)\nمحيط الحوض (60)', NULL, '15', '2023-03-30 06:25:08', '5.0', 1, 2, 0, '0'),
(45, '2', 124, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 1, '1', '30', 0, 'الصدر (1000)\nالأكتاف (20)\nالكم (30)\nالطول (40)\nالخصر (50)\nمحيط الحوض (60)', NULL, '15', '2023-03-30 06:25:08', '5.0', 1, 2, 0, '0'),
(46, '1', 125, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 1, 1, '0', '15.0', 1, '50', NULL, '10', '2023-03-30 06:34:50', '5.0', 1, 3, 0, '0'),
(47, '2', 125, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 1, '0', '30.0', 1, '50', NULL, '15', '2023-03-30 06:34:50', '5.0', 1, 3, 0, '0'),
(48, '1', 126, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 1, 1, '0', '15', 1, '50', NULL, '10', '2023-03-30 06:34:51', '5.0', 0, 1, 0, '0'),
(49, '2', 126, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 1, '0', '30', 1, '50', NULL, '15', '2023-03-30 06:34:51', '5.0', 0, 1, 0, '0'),
(50, '2', 127, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 1, '0', '30.0', 1, '50', NULL, '15', '2023-03-30 08:42:37', '5.0', 0, 0, 0, '0'),
(51, '2', 128, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 1, '0', '30.0', 1, '50', NULL, '15', '2023-03-30 08:58:02', '5.0', 0, 0, 0, '0'),
(52, '2', 129, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 1, '0', '30.0', 1, '50', NULL, '15', '2023-03-30 08:59:42', '5.0', 0, 0, 0, '0'),
(53, '2', 130, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 1, '0', '30.0', 1, '50', NULL, '15', '2023-03-30 09:01:12', '5.0', 0, 0, 0, '0'),
(54, '2', 131, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 1, '0', '30.0', 1, '50', NULL, '15', '2023-03-30 09:01:33', '5.0', 0, -1, 0, '0'),
(55, '1', 132, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 1, 1, '1', '15.0', 0, 'Bust (10)\nShoulders (20)\nSleeves (30)\nLength (40)\nWaist (50)\nHips (60)\n', 'ncjcjcif', '10', '2023-03-31 06:07:22', '5.0', 0, 1, 0, '0'),
(56, '1', 133, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 4, 1, '1', '27', 0, 'الصدر (10)\nالأكتاف (20)\nالكم (30)\nالطول (40)\nالخصر (50)\nمحيط الحوض (60)', NULL, '10', '2023-03-31 06:22:30', '5.0', 0, 0, 0, '0'),
(57, '1', 134, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 4, 1, '1', '27', 0, 'الصدر (10)\nالأكتاف (20)\nالكم (30)\nالطول (40)\nالخصر (50)\nمحيط الحوض (60)', 'notttte', '10', '2023-03-31 06:23:59', '5.0', 0, 0, 0, '0'),
(58, '1', 135, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 1, 3, '1', '15', 0, 'Bust (10)\nShoulders (20)\nSleeves (30)\nLength (40)\nWaist (50)\nHips (60)', 'N', '10', '2023-04-03 10:41:09', '5', 1, 1, 0, '0'),
(59, '2', 135, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 2, 1, '0', '30', 1, '50', NULL, '15', '2023-04-03 10:41:09', '5', 0, 0, 0, '0'),
(60, '1', 136, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 4, 1, '1', '27', 0, 'الصدر (10)\nالأكتاف (20)\nالكم (30)\nالطول (40)\nالخصر (50)\nمحيط الحوض (60)', '', '10', '2023-04-03 11:57:35', '0', 0, 0, 0, '0');

--
-- Triggers `orders`
--
DELIMITER $$
CREATE TRIGGER `update_ticket_status` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
    DECLARE ticket_id INT;
    DECLARE order_status INT;
    DECLARE same_status INT;
    SET ticket_id = NEW.ticket_id;
    SET order_status = NEW.status;
    SET same_status = (SELECT COUNT(*) FROM orders WHERE ticket_id = ticket_id AND status = order_status);
    IF (same_status = (SELECT COUNT(*) FROM orders WHERE ticket_id = ticket_id)) THEN
        UPDATE ticket SET status = order_status WHERE ticket_id = ticket_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `orders_report_view`
-- (See below for the actual view)
--
CREATE TABLE `orders_report_view` (
`id` int(255)
,`ticket_id` int(255)
,`user_id` varchar(255)
,`shop_id` varchar(255)
,`delivery` int(11)
,`subtotal` double(19,2)
,`comm` double(19,2)
,`settlement_amount` double(19,2)
,`date` timestamp
,`status` int(255)
,`settlement` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `orders_view`
-- (See below for the actual view)
--
CREATE TABLE `orders_view` (
`shop_id` varchar(255)
,`id` int(255)
,`name` text
,`name_ar` text
,`item_id` int(255)
,`custom` varchar(255)
,`price` varchar(255)
,`quantity` int(255)
,`ticket_id` int(255)
,`user_id` varchar(255)
,`status` int(255)
,`note` text
,`size_name` varchar(255)
,`delivery` int(11)
,`img` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `name_ar`, `img`, `status`, `sort`) VALUES
(0, 'Cash on delivery', 'الدفع عند الإستلام', 'http://172.20.30.149/fatima/admin/payment_methods/images/0.png?t=1679485720', 1, 2),
(1, 'Credit Card', 'البطاقة البنكية', 'http://172.20.30.149/fatima/admin/payment_methods/images/1.png?t=1679485716', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(255) NOT NULL,
  `role` varchar(255) CHARACTER SET utf32 NOT NULL,
  `screen` varchar(255) NOT NULL DEFAULT 'dashboard',
  `options` varchar(255) NOT NULL DEFAULT '0',
  `main` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `role`, `screen`, `options`, `main`) VALUES
(1, 'Admin', 'dashboard', '-1', 1),
(2, 'Employee', 'dashboard', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,67,57,58,59,60,61,62,63,64,65,66', 0);

-- --------------------------------------------------------

--
-- Table structure for table `permission_group`
--

CREATE TABLE `permission_group` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `sort` int(255) NOT NULL DEFAULT 0,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_group`
--

INSERT INTO `permission_group` (`id`, `slug`, `name`, `sort`, `hide`) VALUES
(1, 'dashboard', 'dashboard', 1, 0),
(2, 'locations', 'locations', 2, 0),
(3, 'categories', 'categories', 3, 0),
(4, 'features', 'features', 4, 0),
(5, 'sizes', 'sizes', 5, 0),
(6, 'size_charts', 'size_charts', 6, 0),
(7, 'measurements', 'measurements', 7, 0),
(8, 'shops', 'shops', 8, 0),
(9, 'orders', 'orders', 9, 0),
(10, 'sliders', 'sliders', 10, 0),
(11, 'banners', 'banners', 11, 0),
(12, 'app_alerts', 'app_alerts', 12, 0),
(13, 'coupons', 'coupons', 13, 0),
(14, 'appdata', 'appdata', 14, 0),
(15, 'faqs', 'faqs', 15, 0),
(16, 'reviews', 'reviews', 16, 0),
(17, 'notifications', 'notifications', 17, 0),
(18, 'customers', 'customers', 18, 0),
(19, 'addresses', 'addresses', 19, 0),
(20, 'refunds', 'refunds', 20, 0),
(21, 'settings', 'settings', 21, 0),
(22, 'settlement', 'settlement', 22, 0),
(23, 'reports', 'reports', 23, 0);

-- --------------------------------------------------------

--
-- Table structure for table `permission_options`
--

CREATE TABLE `permission_options` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `permission_group` int(255) NOT NULL,
  `sort` int(255) NOT NULL DEFAULT 0,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_options`
--

INSERT INTO `permission_options` (`id`, `slug`, `name`, `action`, `permission_group`, `sort`, `hide`) VALUES
(1, 'view_dashboard', 'dashboard', 'view', 1, 0, 0),
(2, 'add_locations', 'locations', 'add', 2, 0, 0),
(3, 'edit_locations', 'locations', 'edit', 2, 0, 0),
(4, 'delete_locations', 'locations', 'delete', 2, 0, 0),
(5, 'add_categories', 'categories', 'add', 3, 0, 0),
(6, 'edit_categories', 'categories', 'edit', 3, 0, 0),
(7, 'delete_categories', 'categories', 'delete', 3, 0, 0),
(8, 'add_features', 'features', 'add', 4, 0, 0),
(9, 'edit_features', 'features', 'edit', 4, 0, 0),
(10, 'delete_features', 'features', 'delete', 4, 0, 0),
(11, 'add_sizes', 'sizes', 'add', 5, 0, 0),
(12, 'edit_sizes', 'sizes', 'edit', 5, 0, 0),
(13, 'delete_sizes', 'sizes', 'delete', 5, 0, 0),
(14, 'edit_size_charts', 'size_charts', 'edit', 6, 0, 0),
(15, 'delete_size_charts', 'size_charts', 'delete', 6, 0, 0),
(16, 'add_measurements', 'measurements', 'add', 7, 0, 0),
(17, 'edit_measurements', 'measurements', 'edit', 7, 0, 0),
(18, 'delete_measurements', 'measurements', 'delete', 7, 0, 0),
(19, 'add_shop', 'shop', 'add', 8, 0, 0),
(20, 'edit_shop', 'shop', 'edit', 8, 0, 0),
(21, 'new_orders', 'norders', '', 9, 0, 0),
(22, 'accepted_orders', 'acorders', '', 9, 0, 0),
(23, 'ready_delivery', 'ready_delivery', '', 9, 0, 0),
(24, 'out_delivery', 'ofdelivery', '', 9, 0, 0),
(25, 'update_status', 'status', 'update', 9, 0, 0),
(26, 'add_sliders', 'sliders', 'add', 10, 0, 0),
(27, 'edit_sliders', 'sliders', 'edit', 10, 0, 0),
(28, 'delete_sliders', 'sliders', 'delete', 10, 0, 0),
(29, 'edit_banners', 'banners', 'edit', 11, 0, 0),
(30, 'delete_banners', 'banners', 'delete', 11, 0, 0),
(31, 'add_app_alerts', 'app_alerts', 'add', 12, 0, 0),
(32, 'edit_app_alerts', 'app_alerts', 'edit', 12, 0, 0),
(33, 'app_alerts', 'app_alerts', 'delete', 12, 0, 0),
(34, 'add_coupons', 'coupons', 'add', 13, 0, 0),
(35, 'edit_coupons', 'coupons', 'edit', 13, 0, 0),
(36, 'delete_coupons', 'coupons', 'delete', 13, 0, 0),
(37, 'edit_appdata', 'appdata', 'edit', 14, 0, 0),
(38, 'add_faqs', 'faqs', 'add', 15, 0, 0),
(39, 'edit_faqs', 'faqs', 'edit', 15, 0, 0),
(40, 'delete_faqs', 'faqs', 'delete', 15, 0, 0),
(41, 'delete_reviews', 'reviews', 'delete', 16, 0, 0),
(42, 'add_notifications', 'notifications', 'add', 17, 0, 0),
(43, 'edit_notifications', 'notifications', 'edit', 17, 0, 0),
(44, 'delete_notifications', 'notifications', 'delete', 17, 0, 0),
(45, 'view_customers', 'customers', 'view', 18, 0, 0),
(46, 'change_status', 'change_status', '', 18, 0, 0),
(47, 'view_addresses', 'addresses', 'view', 19, 0, 0),
(48, 'view_refunds', 'refunds', 'view', 20, 0, 0),
(49, 'approve_refunds', 'refunds', 'approve', 20, 0, 0),
(50, 'add_users', 'users', 'add', 21, 0, 0),
(51, 'edit_users', 'users', 'edit', 21, 0, 0),
(52, 'change_password', 'changepass', '', 21, 0, 0),
(53, 'permissions', 'permissions', '', 21, 0, 0),
(54, 'edit_contacts', 'contacts', 'edit', 21, 0, 0),
(55, 'edit_paymentmethods', 'paymentmethods', 'edit', 21, 0, 0),
(56, 'delivery_settings', 'delivery_settings', '', 21, 0, 0),
(57, 'settlement', 'settlement', '', 22, 0, 0),
(58, 'customer_sizes', 'customer_sizes', 'view', 23, 0, 0),
(59, 'view_products', 'products', 'view', 23, 0, 0),
(60, 'view_out', 'out', 'view', 23, 0, 0),
(61, 'view_completed', 'comorders', 'view', 23, 0, 0),
(62, 'view_cancelled', 'corders', 'view', 23, 0, 0),
(63, 'view_online_trans', 'otransactions', 'view', 23, 0, 0),
(64, 'view_coupon_trans', 'coupontrans', 'view', 23, 0, 0),
(65, 'sales_report', 'sreport', '', 23, 0, 0),
(66, 'settlement_report', 'rsettlement', '', 23, 0, 0),
(67, 'app_config', 'app_config', '', 21, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(255) NOT NULL,
  `img` text DEFAULT NULL,
  `main_id` int(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1-products\r\n2-Customized',
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `img`, `main_id`, `type`, `hide`) VALUES
(1, 'http://172.20.30.149/fatima/shop/products/gallery/1.png?t=1680499894', 1, 1, 0),
(2, 'http://172.20.30.149/fatima/shop/products/gallery/2.png?t=1680499904', 1, 1, 0),
(3, 'http://172.20.30.149/fatima/shop/products/gallery/3.png?t=1680436507', 1, 1, 1),
(4, 'http://172.20.30.149/fatima/shop/products/gallery/4.png?t=1680499968', 4, 1, 0),
(5, 'http://172.20.30.149/fatima/shop/products/gallery/5.png?t=1680503755', 32, 1, 0),
(6, 'http://172.20.30.149/fatima/shop/products/gallery/6.png?t=1680503764', 32, 1, 1),
(7, 'http://172.20.30.149/fatima/shop/products/gallery/7.png?t=1680503615', 31, 1, 0),
(8, 'http://172.20.30.149/fatima/shop/products/gallery/8.png?t=1680503625', 31, 1, 0),
(9, 'http://172.20.30.149/fatima/shop/products/gallery/9.png?t=1680503445', 30, 1, 0),
(10, 'http://172.20.30.149/fatima/shop/products/gallery/10.png?t=1680503453', 30, 1, 0),
(11, 'http://172.20.30.149/fatima/shop/products/gallery/11.png?t=1680503465', 30, 1, 0),
(12, 'http://172.20.30.149/fatima/shop/products/gallery/12.png?t=1680503307', 29, 1, 0),
(13, 'http://172.20.30.149/fatima/shop/products/gallery/13.png?t=1680503149', 28, 1, 0),
(14, 'http://172.20.30.149/fatima/shop/products/gallery/14.png?t=1680502996', 27, 1, 0),
(15, 'http://172.20.30.149/fatima/shop/products/gallery/15.png?t=1680503005', 27, 1, 0),
(16, 'http://172.20.30.149/fatima/shop/products/gallery/16.png?t=1680502891', 26, 1, 0),
(17, 'http://172.20.30.149/fatima/shop/products/gallery/17.png?t=1680502915', 26, 1, 0),
(18, 'http://172.20.30.149/fatima/shop/products/gallery/18.png?t=1680502828', 25, 1, 0),
(19, 'http://172.20.30.149/fatima/shop/products/gallery/19.png?t=1680502819', 25, 1, 0),
(20, 'http://172.20.30.149/fatima/shop/products/gallery/20.png?t=1680502713', 24, 1, 0),
(21, 'http://172.20.30.149/fatima/shop/products/gallery/21.png?t=1680502721', 24, 1, 0),
(22, 'http://172.20.30.149/fatima/shop/products/gallery/22.png?t=1680502565', 23, 1, 0),
(23, 'http://172.20.30.149/fatima/shop/products/gallery/23.png?t=1680502581', 23, 1, 0),
(24, 'http://172.20.30.149/fatima/shop/products/gallery/24.png?t=1680502479', 22, 1, 0),
(25, 'http://172.20.30.149/fatima/shop/products/gallery/25.png?t=1680502378', 21, 1, 0),
(26, 'http://172.20.30.149/fatima/shop/products/gallery/26.png?t=1680502395', 21, 1, 0),
(27, 'http://172.20.30.149/fatima/shop/products/gallery/27.png?t=1680502246', 20, 1, 0),
(28, 'http://172.20.30.149/fatima/shop/products/gallery/28.png?t=1680502255', 20, 1, 0),
(29, 'http://172.20.30.149/fatima/shop/products/gallery/29.png?t=1680501848', 19, 1, 0),
(30, 'http://172.20.30.149/fatima/shop/products/gallery/30.png?t=1680501857', 19, 1, 0),
(31, 'http://172.20.30.149/fatima/shop/products/gallery/31.png?t=1680501753', 18, 1, 0),
(32, 'http://172.20.30.149/fatima/shop/products/gallery/32.png?t=1680501762', 18, 1, 0),
(33, 'http://172.20.30.149/fatima/shop/products/gallery/33.png?t=1680501609', 17, 1, 0),
(34, 'http://172.20.30.149/fatima/shop/products/gallery/34.png?t=1680501621', 17, 1, 0),
(35, 'http://172.20.30.149/fatima/shop/products/gallery/35.png?t=1680501481', 16, 1, 0),
(36, 'http://172.20.30.149/fatima/shop/products/gallery/36.png?t=1680501491', 16, 1, 0),
(37, 'http://172.20.30.149/fatima/shop/products/gallery/37.png?t=1680501222', 15, 1, 0),
(38, 'http://172.20.30.149/fatima/shop/products/gallery/38.png?t=1680501231', 15, 1, 0),
(39, 'http://172.20.30.149/fatima/shop/products/gallery/39.png?t=1680501100', 14, 1, 0),
(40, 'http://172.20.30.149/fatima/shop/products/gallery/40.png?t=1680501106', 14, 1, 0),
(41, 'http://172.20.30.149/fatima/shop/products/gallery/41.png?t=1680500987', 13, 1, 0),
(42, 'http://172.20.30.149/fatima/shop/products/gallery/42.png?t=1680500874', 12, 1, 0),
(43, 'http://172.20.30.149/fatima/shop/products/gallery/43.png?t=1680500697', 11, 1, 0),
(44, 'http://172.20.30.149/fatima/shop/products/gallery/44.png?t=1680500703', 11, 1, 0),
(45, 'http://172.20.30.149/fatima/shop/products/gallery/45.png?t=1680500613', 10, 1, 0),
(46, 'http://172.20.30.149/fatima/shop/products/gallery/46.png?t=1680500375', 9, 1, 0),
(47, 'http://172.20.30.149/fatima/shop/products/gallery/47.png?t=1680500182', 8, 1, 0),
(48, 'http://172.20.30.149/fatima/shop/products/gallery/48.png?t=1680500074', 7, 1, 0),
(49, 'http://172.20.30.149/fatima/shop/products/gallery/49.png?t=1680500081', 7, 1, 0),
(50, 'http://172.20.30.149/fatima/shop/products/gallery/50.png?t=1680500046', 6, 1, 0),
(51, 'http://172.20.30.149/fatima/shop/products/gallery/51.png?t=1680500058', 6, 1, 0),
(52, 'http://172.20.30.149/fatima/shop/products/gallery/52.png?t=1680500020', 5, 1, 0),
(53, 'http://172.20.30.149/fatima/shop/products/gallery/53.png?t=1680436579', 1, 1, 1),
(54, 'http://172.20.30.149/fatima/shop/products/gallery/54.png?t=1680499936', 1, 1, 0),
(55, 'http://172.20.30.149/fatima/shop/products/gallery/55.png?t=1680499981', 4, 1, 0),
(56, 'http://172.20.30.149/fatima/shop/products/gallery/56.png?t=1680500027', 5, 1, 0),
(57, 'http://172.20.30.149/fatima/shop/products/gallery/57.png?t=1680500188', 8, 1, 0),
(58, 'http://172.20.30.149/fatima/shop/products/gallery/58.png?t=1680500194', 8, 1, 0),
(59, 'http://172.20.30.149/fatima/shop/products/gallery/59.png?t=1680500382', 9, 1, 0),
(60, 'http://172.20.30.149/fatima/shop/products/gallery/60.png?t=1680500390', 9, 1, 0),
(61, 'http://172.20.30.149/fatima/shop/products/gallery/61.png?t=1680500623', 10, 1, 0),
(62, 'http://172.20.30.149/fatima/shop/products/gallery/62.png?t=1680500883', 12, 1, 0),
(63, 'http://172.20.30.149/fatima/shop/products/gallery/63.png?t=1680500995', 13, 1, 0),
(64, 'http://172.20.30.149/fatima/shop/products/gallery/64.png?t=1680501239', 15, 1, 0),
(65, 'http://172.20.30.149/fatima/shop/products/gallery/65.png?t=1680501498', 16, 1, 0),
(66, 'http://172.20.30.149/fatima/shop/products/gallery/66.png?t=1680501633', 17, 1, 0),
(67, 'http://172.20.30.149/fatima/shop/products/gallery/67.png?t=1680501774', 18, 1, 0),
(68, 'http://172.20.30.149/fatima/shop/products/gallery/68.png?t=1680501866', 19, 1, 0),
(69, 'http://172.20.30.149/fatima/shop/products/gallery/69.png?t=1680502264', 20, 1, 0),
(70, 'http://172.20.30.149/fatima/shop/products/gallery/70.png?t=1680502403', 21, 1, 0),
(71, 'http://172.20.30.149/fatima/shop/products/gallery/71.png?t=1680502489', 22, 1, 0),
(72, 'http://172.20.30.149/fatima/shop/products/gallery/72.png?t=1680502499', 22, 1, 0),
(73, 'http://172.20.30.149/fatima/shop/products/gallery/73.png?t=1680502591', 23, 1, 0),
(74, 'http://172.20.30.149/fatima/shop/products/gallery/74.png?t=1680502728', 24, 1, 0),
(75, 'http://172.20.30.149/fatima/shop/products/gallery/75.png?t=1680502837', 25, 1, 0),
(76, 'http://172.20.30.149/fatima/shop/products/gallery/76.png?t=1680503014', 27, 1, 0),
(77, 'http://172.20.30.149/fatima/shop/products/gallery/77.png?t=1680503164', 28, 1, 0),
(78, 'http://172.20.30.149/fatima/shop/products/gallery/78.png?t=1680503317', 29, 1, 0),
(79, 'http://172.20.30.149/fatima/shop/products/gallery/79.png?t=1680503326', 29, 1, 0),
(80, 'http://172.20.30.149/fatima/shop/products/gallery/80.png?t=1680503635', 31, 1, 0),
(81, 'http://172.20.30.149/fatima/shop/products/gallery/81.png?t=1680503941', 3, 1, 0),
(82, 'http://172.20.30.149/fatima/shop/products/gallery/82.png?t=1680503956', 3, 1, 0),
(83, 'http://172.20.30.149/fatima/shop/products/gallery/83.png?t=1680503966', 3, 1, 0),
(84, 'http://172.20.30.149/fatima/shop/products/gallery/84.png?t=1680504096', 2, 1, 0),
(85, 'http://172.20.30.149/fatima/shop/products/gallery/85.png?t=1680504106', 2, 1, 0),
(86, 'http://172.20.30.149/fatima/shop/products/gallery/86.png?t=1680504115', 2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(255) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `cat` int(255) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `name_ar` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `details_ar` text NOT NULL,
  `custom` int(11) NOT NULL DEFAULT 0 COMMENT '0-No, 1 -Yes',
  `img` varchar(255) DEFAULT NULL,
  `price` varchar(255) NOT NULL DEFAULT '0',
  `max_quantity` varchar(255) NOT NULL DEFAULT '0',
  `rate` varchar(255) NOT NULL DEFAULT '5.0',
  `discount_type` int(11) NOT NULL DEFAULT 0 COMMENT '1-percentage,2-value',
  `discount_value` varchar(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT 1,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `shop_id`, `cat`, `sub_id`, `name`, `name_ar`, `slug`, `details`, `details_ar`, `custom`, `img`, `price`, `max_quantity`, `rate`, `discount_type`, `discount_value`, `status`, `hide`) VALUES
(1, 1, 1, 3, 'Abaya Blue', 'عباية زرقاء', 'abaya_blue', 'Classic Middle Eastern aesthetics for this new-season kaftan. It is expertly tailored for a flowing fit and opulently embellished with metallic beadwork that borders the V-neck and trims the voluminous flared sleeves.', 'جماليات الشرق الأوسط الكلاسيكية لهذا الغرض قفطان الموسم الجديد. تم تصميمه بخبرة gتتدفق وتزين بشكل فاخر مع زخرفة خرزية معدنية على حدود العنق و تقليم الأكمام المتوهجة الضخمة.', 1, 'http://172.20.30.149/fatima/shop/products/images/1.png?t=1680499881', '25', '5', '5', 2, '10', 1, 0),
(2, 2, 1, 4, 'Open Abaya', 'Black embroidered nida abaya', 'open_abaya', 'Black embroidered nida abaya', 'Black embroidered nida abaya', 1, 'http://172.20.30.149/fatima/shop/products/images/2.png?t=1680504084', '50', '21', '5', 2, '20', 1, 0),
(3, 2, 1, 5, 'Maria- front open abaya in nida satin- blue & white', 'Maria- front open abaya in nida satin- blue & white', 'maria_front_open_abaya_in_nida_satin_blue_white', 'Maria- front open abaya in nida satin- blue & white', 'Maria- front open abaya in nida satin- blue & white', 0, 'http://172.20.30.149/fatima/shop/products/images/3.png?t=1680503931', '174', '5', '5.0', 0, '0', 1, 0),
(4, 1, 1, 6, 'Blue nazneen contrast band with inner dubai kaftan', 'Blue nazneen contrast band with inner dubai kaftan', 'blue_nazneen_contrast_band_with_inner_dubai_kaftan', 'Blue nazneen contrast band with inner dubai kaftan', 'Blue nazneen contrast band with inner dubai kaftan', 1, 'http://172.20.30.149/fatima/shop/products/images/4.png?t=1680500000', '27', '5', '5', 1, '400', 1, 0),
(5, 1, 1, 7, 'Mrc women front open abaya with embroidery work- beige-black', 'Mrc women front open abaya with embroidery work- beige-black', 'mrc_women_front_open_abaya_with_embroidery_work_beige_black', 'Mrc women front open abaya with embroidery work- beige-black', 'Mrc women front open abaya with embroidery work- beige-black', 0, 'http://172.20.30.149/fatima/shop/products/images/5.png?t=1680500009', '16', '2', '4', 1, '10', 1, 0),
(6, 1, 1, 2, 'Black grey nida plain islamic abaya', 'Black grey nida plain islamic abaya', 'black_grey_nida_plain_islamic_abaya', 'Black grey nida plain islamic abaya', 'Black grey nida plain islamic abaya', 1, 'http://172.20.30.149/fatima/shop/products/images/6.png?t=1680500037', '84', '5', '5.0', 0, '0', 1, 0),
(7, 1, 1, 5, 'Mrc women embroidered designer girls style abaya kaftan', 'Mrc women embroidered designer girls style abaya kaftan', 'Mrc women embroidered designer girls style abaya kaftan', 'Mrc women embroidered designer girls style abaya kaftan', 'Mrc women embroidered designer girls style abaya kaftan', 0, 'http://172.20.30.149/fatima/shop/products/images/7.png?t=1680500066', '368', '5', '5.0', 1, '7', 1, 0),
(8, 1, 1, 8, 'Mrc stylish women girl shrug style embroidered latest abaya', 'Mrc stylish women girl shrug style embroidered latest abaya', 'Mrc stylish women girl shrug style embroidered latest abaya', 'Mrc stylish women girl shrug style embroidered latest abaya', 'Mrc stylish women girl shrug style embroidered latest abaya', 0, 'http://172.20.30.149/fatima/shop/products/images/8.png?t=1680500170', '219', '5', '5', 0, '0', 1, 0),
(9, 1, 1, 7, 'Maroon embroidered nida abaya', 'Maroon embroidered nida abaya', 'Maroon embroidered nida abaya', 'Maroon embroidered nida abaya', 'Maroon embroidered nida abaya', 0, 'http://172.20.30.149/fatima/shop/products/images/9.png?t=1680500365', '410', '5', '5.0', 0, '0', 1, 0),
(10, 1, 1, 2, 'Blue designer abaya with wooden buttons', 'Blue designer abaya with wooden buttons', 'Blue designer abaya with wooden buttons', 'Blue designer abaya with wooden buttons', 'Blue designer abaya with wooden buttons', 0, 'http://172.20.30.149/fatima/shop/products/images/10.png?t=1680500602', '163', '5', '5.0', 0, '0', 1, 0),
(11, 1, 2, 9, 'Kaftan Long Abaya Evening Dresses', 'Kaftan Long Abaya Evening Dresses', 'kaftan_long_abaya_evening_dresses', 'Kaftan Long Abaya Evening Dresses', 'Kaftan Long Abaya Evening Dresses', 1, 'http://172.20.30.149/fatima/shop/products/images/11.png?t=1680500691', '74', '5', '5.0', 1, '10', 1, 0),
(12, 1, 2, 10, 'Kaftan Long Abaya Maxi Dresses', 'Kaftan Long Abaya Maxi Dresses', 'Kaftan Long Abaya Maxi Dresses', 'Kaftan Long Abaya Maxi Dresses', 'Kaftan Long Abaya Maxi Dresses', 0, 'http://172.20.30.149/fatima/shop/products/images/12.png?t=1680500866', '79', '5', '5.0', 2, '10', 1, 0),
(13, 1, 2, 10, 'Kaftan Abaya Muslim African Long Dress', 'Kaftan Abaya Muslim African Long Dress', 'Kaftan Abaya Muslim African Long Dress', 'Kaftan Abaya Muslim African Long Dress', 'Kaftan Abaya Muslim African Long Dress', 0, 'http://172.20.30.149/fatima/shop/products/images/13.png?t=1680500979', '21', '4', '5.0', 2, '20', 1, 0),
(14, 1, 2, 11, 'Moroccan style Islam Long Abaya Kaftan For Muslim Women', 'Moroccan style Islam Long Abaya Kaftan For Muslim Women', 'Moroccan style Islam Long Abaya Kaftan For Muslim Women', 'Moroccan style Islam Long Abaya Kaftan For Muslim Women', 'Moroccan style Islam Long Abaya Kaftan For Muslim Women', 0, 'http://172.20.30.149/fatima/shop/products/images/14.png?t=1680501090', '79', '5', '5', 0, '0', 1, 0),
(15, 1, 2, 11, ' Floral Print Mesh Insert Maxi Dress', 'Floral Print Mesh Insert Maxi Dress', 'floral_print_mesh_insert_maxi_dress', 'Floral Print Mesh Insert Maxi Dress', 'Floral Print Mesh Insert Maxi Dress', 0, 'http://172.20.30.149/fatima/shop/products/images/15.png?t=1680501212', '40', '10', '5.0', 0, '0', 1, 0),
(16, 1, 2, 15, 'Puff Sleeves Schiffli Detail Cotton Shirt Midi Dress', 'Puff Sleeves Schiffli Detail Cotton Shirt Midi Dress', 'Puff Sleeves Schiffli Detail Cotton Shirt Midi Dress', 'Puff Sleeves Schiffli Detail Cotton Shirt Midi Dress', 'Puff Sleeves Schiffli Detail Cotton Shirt Midi Dress', 0, 'http://172.20.30.149/fatima/shop/products/images/16.png?t=1680501472', '50', '24', '5.0', 0, '0', 1, 0),
(17, 1, 2, 10, 'Short Puff Sleeves Aquatic Print Tiered Maxi Dress', 'Short Puff Sleeves Aquatic Print Tiered Maxi Dress', 'Short Puff Sleeves Aquatic Print Tiered Maxi Dress', 'Short Puff Sleeves Aquatic Print Tiered Maxi Dress', 'Short Puff Sleeves Aquatic Print Tiered Maxi Dress', 0, 'http://172.20.30.149/fatima/shop/products/images/17.png?t=1680501600', '174', '5', '5.0', 0, '0', 1, 0),
(18, 1, 2, 10, 'Short Flare Sleeves Pleat Detail Wrap Front Maxi Dress', 'Short Flare Sleeves Pleat Detail Wrap Front Maxi Dress', 'Short Flare Sleeves Pleat Detail Wrap Front Maxi Dress', 'Short Flare Sleeves Pleat Detail Wrap Front Maxi Dress', 'Short Flare Sleeves Pleat Detail Wrap Front Maxi Dress', 0, 'http://172.20.30.149/fatima/shop/products/images/18.png?t=1680501746', '27', '5', '5', 0, '0', 1, 0),
(19, 1, 2, 11, 'Long Sleeves Floral Print A-Line Maxi Dress', 'Long Sleeves Floral Print A-Line Maxi Dress', 'Long Sleeves Floral Print A-Line Maxi Dress', 'Long Sleeves Floral Print A-Line Maxi Dress', 'Long Sleeves Floral Print A-Line Maxi Dress', 0, 'http://172.20.30.149/fatima/shop/products/images/19.png?t=1680501840', '16', '2', '5.0', 0, '0', 1, 0),
(20, 1, 2, 15, 'Short Volume Sleeves Tropical Print Tiered Maxi Dress', 'Short Volume Sleeves Tropical Print Tiered Maxi Dress', 'Short Volume Sleeves Tropical Print Tiered Maxi Dress', 'Short Volume Sleeves Tropical Print Tiered Maxi Dress', 'Short Volume Sleeves Tropical Print Tiered Maxi Dress', 0, 'http://172.20.30.149/fatima/shop/products/images/20.png?t=1680502238', '84', '5', '5.0', 0, '0', 1, 0),
(21, 1, 3, 12, 'BestGift Summer Kids Dresses For Girls Wedding Dress Elegant Toddler Girls Princess Dress Children Evening Party Dresses 3-10 Year', 'BestGift Summer Kids Dresses For Girls Wedding Dress Elegant Toddler Girls Princess Dress Children Evening Party Dresses 3-10 Year', 'BestGift Summer Kids Dresses For Girls Wedding Dress Elegant Toddler Girls Princess Dress Children Evening Party Dresses 3-10 Year', 'BestGift Summer Kids Dresses For Girls Wedding Dress Elegant Toddler Girls Princess Dress Children Evening Party Dresses 3-10 Year', 'BestGift Summer Kids Dresses For Girls Wedding Dress Elegant Toddler Girls Princess Dress Children Evening Party Dresses 3-10 Year', 0, 'http://172.20.30.149/fatima/shop/products/images/21.png?t=1680502370', '368', '5', '5.0', 1, '15', 1, 0),
(22, 1, 3, 12, 'GORLYA Girl\'s Flutter Sleeve Stretchy A-Line Swing Flared Skater Party Dress with Pockets for 4-12 Years Kids', 'GORLYA Girl\'s Flutter Sleeve Stretchy A-Line Swing Flared Skater Party Dress with Pockets for 4-12 Years Kids', 'GORLYA Girl\'s Flutter Sleeve Stretchy A-Line Swing Flared Skater Party Dress with Pockets for 4-12 Years Kids', 'GORLYA Girl\'s Flutter Sleeve Stretchy A-Line Swing Flared Skater Party Dress with Pockets for 4-12 Years Kids', 'GORLYA Girl\'s Flutter Sleeve Stretchy A-Line Swing Flared Skater Party Dress with Pockets for 4-12 Years Kids', 0, 'http://172.20.30.149/fatima/shop/products/images/22.png?t=1680502468', '219', '5', '5.0', 2, '10', 1, 0),
(23, 1, 3, 13, 'Bestgift Fashion Girl Dress Children Solid Dresses Clothing Summer Birthday Dress Girl Flower Girl Dresses for Weddings Kids 3-12 Years', 'Bestgift Fashion Girl Dress Children Solid Dresses Clothing Summer Birthday Dress Girl Flower Girl Dresses for Weddings Kids 3-12 Years', 'Bestgift Fashion Girl Dress Children Solid Dresses Clothing Summer Birthday Dress Girl Flower Girl Dresses for Weddings Kids 3-12 Years', 'Bestgift Fashion Girl Dress Children Solid Dresses Clothing Summer Birthday Dress Girl Flower Girl Dresses for Weddings Kids 3-12 Years', 'Bestgift Fashion Girl Dress Children Solid Dresses Clothing Summer Birthday Dress Girl Flower Girl Dresses for Weddings Kids 3-12 Years', 0, 'http://172.20.30.149/fatima/shop/products/images/23.png?t=1680502557', '410', '5', '5.0', 1, '15', 1, 0),
(24, 1, 3, 13, 'Yalla Baby Girls Dress Costume for Kids Girls Princess Dress Up with Free Accessories - 90-140 cm 3-12 Years Birthday Party Cosplay Outfits', 'Yalla Baby Girls Dress Costume for Kids Girls Princess Dress Up with Free Accessories - 90-140 cm 3-12 Years Birthday Party Cosplay Outfits', 'Yalla Baby Girls Dress Costume for Kids Girls Princess Dress Up with Free Accessories - 90-140 cm 3-12 Years Birthday Party Cosplay Outfits', 'Yalla Baby Girls Dress Costume for Kids Girls Princess Dress Up with Free Accessories - 90-140 cm 3-12 Years Birthday Party Cosplay Outfits', 'Yalla Baby Girls Dress Costume for Kids Girls Princess Dress Up with Free Accessories - 90-140 cm 3-12 Years Birthday Party Cosplay Outfits', 0, 'http://172.20.30.149/fatima/shop/products/images/24.png?t=1680502705', '163', '5', '5.0', 0, '0', 1, 0),
(25, 1, 3, 14, 'K-19 Summer Latest Western Pattern Design Party Wear Kid Children Girl Dress For Kid Girl', 'K-19 Summer Latest Western Pattern Design Party Wear Kid Children Girl Dress For Kid Girl', 'K-19 Summer Latest Western Pattern Design Party Wear Kid Children Girl Dress For Kid Girl', 'K-19 Summer Latest Western Pattern Design Party Wear Kid Children Girl Dress For Kid Girl', 'K-19 Summer Latest Western Pattern Design Party Wear Kid Children Girl Dress For Kid Girl', 0, 'http://172.20.30.149/fatima/shop/products/images/25.png?t=1680502802', '74', '5', '5.0', 0, '0', 1, 0),
(26, 1, 3, 14, 'Bridesmaid Gowns Long Sleeves Cake Tulle Kids Clothes Party Wedding Clothing Lace Princess Dress 4-14 Years', 'Bridesmaid Gowns Long Sleeves Cake Tulle Kids Clothes Party Wedding Clothing Lace Princess Dress 4-14 Years', 'Bridesmaid Gowns Long Sleeves Cake Tulle Kids Clothes Party Wedding Clothing Lace Princess Dress 4-14 Years', 'Bridesmaid Gowns Long Sleeves Cake Tulle Kids Clothes Party Wedding Clothing Lace Princess Dress 4-14 Years', 'Bridesmaid Gowns Long Sleeves Cake Tulle Kids Clothes Party Wedding Clothing Lace Princess Dress 4-14 Years', 0, 'http://172.20.30.149/fatima/shop/products/images/26.png?t=1680502882', '79', '5', '5.0', 0, '0', 1, 0),
(27, 1, 3, 14, 'Cherokee by Unlimited Girl\'s CCJGDRS20136 OVERALL', 'Cherokee by Unlimited Girl\'s CCJGDRS20136 OVERALL', 'Cherokee by Unlimited Girl\'s CCJGDRS20136 OVERALL', 'Cherokee by Unlimited Girl\'s CCJGDRS20136 OVERALL', 'Cherokee by Unlimited Girl\'s CCJGDRS20136 OVERALL', 0, 'http://172.20.30.149/fatima/shop/products/images/27.png?t=1680502987', '21', '4', '5.0', 0, '0', 1, 0),
(28, 1, 3, 15, 'Girls Dress Casual Long sleeves Maxi Style Girls Shirt with Pockets, Kids Beach Wear', 'Girls Dress Casual Long sleeves Maxi Style Girls Shirt with Pockets, Kids Beach Wear', 'girls_dress_casual_long_sleeves_maxi_style_girls_shirt_with_pockets_kids_beach_wear', 'Girls Dress Casual Long sleeves Maxi Style Girls Shirt with Pockets, Kids Beach Wear', 'Girls Dress Casual Long sleeves Maxi Style Girls Shirt with Pockets, Kids Beach Wear', 1, 'http://172.20.30.149/fatima/shop/products/images/28.png?t=1680503139', '79', '5', '5.0', 0, '0', 1, 0),
(29, 1, 3, 12, 'Girl\'s Ruffle Sleeve Elegant Floral Casual Midi Dress for Kids 5-14 Years', 'Girl\'s Ruffle Sleeve Elegant Floral Casual Midi Dress for Kids 5-14 Years', 'Girl\'s Ruffle Sleeve Elegant Floral Casual Midi Dress for Kids 5-14 Years', 'Girl\'s Ruffle Sleeve Elegant Floral Casual Midi Dress for Kids 5-14 Years', 'Girl\'s Ruffle Sleeve Elegant Floral Casual Midi Dress for Kids 5-14 Years', 0, 'http://172.20.30.149/fatima/shop/products/images/29.png?t=1680503298', '163', '5', '5.0', 0, '0', 1, 0),
(30, 1, 3, 12, 'GORLYA Girl\'s 3/4 Sleeve Casual Scalloped Edge A-line Belted Dress with Pockets for 4-14T Kids', 'GORLYA Girl\'s 3/4 Sleeve Casual Scalloped Edge A-line Belted Dress with Pockets for 4-14T Kids', 'gorlya_girl_s_3_4_sleeve_casual_scalloped_edge_a_line_belted_dress_with_pockets_for_4_14t_kids', 'GORLYA Girl\'s 3/4 Sleeve Casual Scalloped Edge A-line Belted Dress with Pockets for 4-14T Kids', 'GORLYA Girl\'s 3/4 Sleeve Casual Scalloped Edge A-line Belted Dress with Pockets for 4-14T Kids', 0, 'http://172.20.30.149/fatima/shop/products/images/30.png?t=1680503433', '16', '2', '5.0', 0, '0', 1, 0),
(31, 1, 1, 2, 'Naba Open Abayas for Women Muslim Dubai Dress Solid Loose Fit Long Cardigan Islamic Kaftan Robe with Hijab Scarf Outfits', 'Naba Open Abayas for Women Muslim Dubai Dress Solid Loose Fit Long Cardigan Islamic Kaftan Robe with Hijab Scarf Outfits', 'naba_open_abayas_for_women_muslim_dubai_dress_solid_loose_fit_long_cardigan_islamic_kaftan_robe_with_hijab_scarf_outfits', 'Naba Open Abayas for Women Muslim Dubai Dress Solid Loose Fit Long Cardigan Islamic Kaftan Robe with Hijab Scarf Outfits', 'Naba Open Abayas for Women Muslim Dubai Dress Solid Loose Fit Long Cardigan Islamic Kaftan Robe with Hijab Scarf Outfits', 0, 'http://172.20.30.149/fatima/shop/products/images/31.png?t=1680503606', '100', '10', '5.0', 0, '0', 1, 0),
(32, 1, 3, 12, 'Round Neck Tunic & Pants Set', 'Round Neck Tunic & Pants Set', 'round_neck_tunic_pants_set', 'Round Neck Tunic & Pants Set', 'Round Neck Tunic & Pants Set', 1, 'http://172.20.30.149/fatima/shop/products/images/32.png?t=1680503745', '150', '10', '5.0', 0, '0', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_features`
--

CREATE TABLE `product_features` (
  `id` int(11) NOT NULL,
  `product_id` int(255) NOT NULL,
  `feature` varchar(255) NOT NULL,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_features`
--

INSERT INTO `product_features` (`id`, `product_id`, `feature`, `hide`) VALUES
(17, 31, '3-14', 0),
(18, 1, '3-15,1-13,2-1,4-4,5-5,6-6', 0),
(19, 32, '1-2', 0),
(21, 4, '1-13', 0),
(22, 5, '3-15', 0),
(23, 6, '6-6', 0),
(24, 2, '3-3,1-2', 0),
(25, 3, '2-1', 0),
(26, 11, '1-11', 0),
(27, 15, '4-4', 0),
(28, 28, '3-3', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` int(11) NOT NULL,
  `product_id` int(255) NOT NULL,
  `sizes` varchar(255) NOT NULL,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `product_id`, `sizes`, `hide`) VALUES
(1, 1, '1,2,3,4', 1),
(2, 2, '1,2,3', 0),
(3, 3, '1,2,3,4', 0),
(4, 4, '1,2,3,4', 1),
(5, 5, '1,2,3,4', 0),
(6, 6, '1,2,3,4', 1),
(7, 7, '1,2,3,4', 0),
(8, 8, '1,2,3,4', 0),
(9, 9, '1,2,3,4', 0),
(10, 10, '1,2,3,4', 0),
(11, 11, '1', 0),
(12, 12, '1,2,3,4', 0),
(13, 13, '1,2,3,4', 0),
(14, 14, '1,2,3,4', 0),
(15, 15, '1', 0),
(16, 16, '1,2,3,4', 0),
(17, 17, '1,2,3,4', 0),
(18, 18, '1,2,3,4', 0),
(19, 19, '1,2,3,4', 0),
(20, 20, '1,2,3,4', 0),
(21, 21, '1,2,3,4', 0),
(22, 22, '1,2,3,4', 0),
(23, 23, '1,2,3,4', 0),
(24, 24, '1,2,3,4', 0),
(25, 25, '1,2,3,4', 0),
(26, 26, '1,2,3,4', 0),
(27, 27, '1,2,3,4', 0),
(28, 28, '1,2,3,4', 1),
(29, 29, '1,2,3,4', 0),
(30, 30, '1,2,3,4', 0),
(31, 31, '1,2,3,4', 0),
(32, 33, '1,2,3,4', 0),
(33, 1, '1,2,3,4', 0);

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` int(11) NOT NULL,
  `pay_by` int(5) NOT NULL DEFAULT 0 COMMENT '0-cash\r\n1-online',
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `ticket_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` int(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `refunds`
--

INSERT INTO `refunds` (`id`, `pay_by`, `date`, `ticket_id`, `item_id`, `user_id`, `amount`, `note`, `status`) VALUES
(1, 1, '2023-03-30 15:37:59', '131', '2', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '30', 'test3', 1),
(2, 0, '2023-03-30 15:47:13', '120', '2', 'stUykVEFSahTIDAsRViLXiqXnmR2', '30', NULL, 0),
(3, 0, '2023-04-03 15:42:25', '109', '10', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '163', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `shop_id` varchar(255) NOT NULL,
  `ticket_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `hide` int(255) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `shop_id`, `ticket_id`, `item_id`, `rate`, `content`, `date`, `hide`) VALUES
(1, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '1', '132', '1', '5.0', '', '2023-03-31 10:15:47', 0),
(2, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '2', '127', '2', '5.0', 'If8f8', '2023-03-31 10:15:59', 0),
(3, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '1', '134', '4', '5.0', '', '2023-03-31 10:58:20', 0),
(4, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '2', '124', '2', '5.0', '', '2023-03-31 10:59:06', 0),
(5, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '2', '124', '2', '5.0', '', '2023-03-31 11:00:24', 0),
(6, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '2', '124', '2', '5.0', '', '2023-03-31 11:04:00', 0),
(7, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '2', '124', '2', '5.0', '', '2023-03-31 11:04:06', 0),
(8, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '1', '133', '4', '5.0', '', '2023-03-31 11:04:17', 0),
(9, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '2', '128', '2', '5.0', '', '2023-03-31 11:05:30', 0),
(10, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '1', '126', '1', '5.0', '', '2023-03-31 11:06:37', 0),
(11, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '2', '126', '2', '5.0', '', '2023-03-31 11:08:04', 0),
(12, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '1', '125', '1', '5.0', '', '2023-03-31 11:09:57', 0),
(13, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '2', '125', '2', '5.0', '', '2023-03-31 11:11:23', 0),
(14, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '2', '123', '2', '5.0', '', '2023-03-31 11:11:34', 0),
(15, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '2', '123', '2', '5.0', '', '2023-03-31 11:11:39', 0),
(16, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '2', '123', '2', '5.0', '', '2023-03-31 11:12:49', 0),
(17, 'stUykVEFSahTIDAsRViLXiqXnmR2', '1', '121', '1', '5.0', '', '2023-04-02 09:34:31', 0),
(18, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '1', '38', '1', '5', 'Fit', '2023-04-03 14:44:50', 0),
(19, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '2', '38', '2', '5', 'Good', '2023-04-03 14:45:06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `screens`
--

CREATE TABLE `screens` (
  `id` int(11) NOT NULL,
  `screen` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `screens`
--

INSERT INTO `screens` (`id`, `screen`, `url`) VALUES
(1, 'dashboard', 'dashboard.php'),
(2, 'locations', 'locations'),
(3, 'orders', 'orders'),
(4, 'reports', 'reports'),
(5, 'shops', 'shops'),
(6, 'settlement', 'settlement');

-- --------------------------------------------------------

--
-- Table structure for table `settlement`
--

CREATE TABLE `settlement` (
  `id` int(255) NOT NULL,
  `settlement_id` varchar(255) NOT NULL DEFAULT '0',
  `user_id` varchar(255) NOT NULL,
  `shop_id` varchar(255) NOT NULL,
  `ticket_id` text NOT NULL,
  `amount` text NOT NULL,
  `total` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settlement`
--

INSERT INTO `settlement` (`id`, `settlement_id`, `user_id`, `shop_id`, `ticket_id`, `amount`, `total`, `note`, `date`) VALUES
(1, '00001', '1', '2', '[\"102\"]', '[\"25.50\"]', '25.5', 'M\r\n', '2023-03-26 10:56:04'),
(2, '00002', '1', '1', '[\"107\"]', '[\"63.00\"]', '63', 'settle2', '2023-03-26 14:19:20'),
(3, '00003', '1', '1', '[\"102\"]', '[\"48.60\"]', '48.6', 'done', '2023-03-30 12:52:56');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `phone` text NOT NULL,
  `country` varchar(5) NOT NULL DEFAULT '1',
  `city` int(11) NOT NULL DEFAULT 0,
  `address` varchar(255) NOT NULL DEFAULT 'UAE',
  `latitude` varchar(255) NOT NULL DEFAULT '0',
  `longitude` varchar(255) NOT NULL DEFAULT '0',
  `details` text DEFAULT NULL,
  `details_ar` text DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdby` varchar(255) NOT NULL DEFAULT '1',
  `img` varchar(512) DEFAULT NULL,
  `rate` varchar(255) NOT NULL DEFAULT '5.0',
  `reviews` varchar(255) NOT NULL DEFAULT '0',
  `view` varchar(255) NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '1',
  `comm` varchar(255) NOT NULL DEFAULT '0',
  `expiry` varchar(255) NOT NULL,
  `close` int(2) NOT NULL DEFAULT 0,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `name`, `name_ar`, `phone`, `country`, `city`, `address`, `latitude`, `longitude`, `details`, `details_ar`, `email`, `created_at`, `createdby`, `img`, `rate`, `reviews`, `view`, `status`, `comm`, `expiry`, `close`, `hide`) VALUES
(1, 'Fatima', 'Fatima_ar', '+9715043856777', '1', 1, ' Abu Dhabi', '24.412865892556795', '54.69971502027053', 'Fatima', 'Fatima', 'Fatima@gmail.com', '2022-09-19 20:00:00', '1', 'http://172.20.30.149/fatima/admin/shops/images/1.png?t=1680067932', '5', '1', '0', '1', '10', '2023-10-12', 0, 0),
(2, 'Fatima Dubai', 'Fatima Dubai', '0567543223', '1', 2, 'Dubai', '25.267701463392058', '55.29611519633366', 'Fatima', 'Fatima', 'admin1@gmail.com', '2022-09-26 06:27:45', '1', 'http://172.20.30.149/fatima/admin/shops/images/2.png?t=1680242737', '5.0', '0', '0', '1', '15', '2023-01-18', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_permissions`
--

CREATE TABLE `shop_permissions` (
  `id` int(255) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `role` varchar(255) CHARACTER SET utf32 NOT NULL,
  `screen` varchar(255) NOT NULL DEFAULT 'dashboard',
  `options` varchar(255) NOT NULL DEFAULT '0',
  `main` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_permissions`
--

INSERT INTO `shop_permissions` (`id`, `shop_id`, `role`, `screen`, `options`, `main`) VALUES
(1, 1, 'Admin', 'dashboard', '-1', 1),
(2, 1, 'Employee', 'reports', '1,2,3,4,5,6,7,13,14,15,16,17,22,18,19,20,8,9,10,11,21,12', 0),
(3, 1, 'EmployeE2', 'dashboard', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_permission_group`
--

CREATE TABLE `shop_permission_group` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `sort` int(255) NOT NULL DEFAULT 0,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_permission_group`
--

INSERT INTO `shop_permission_group` (`id`, `slug`, `name`, `sort`, `hide`) VALUES
(1, 'dashboard', 'dashboard', 0, 0),
(2, 'products', 'products', 0, 0),
(3, 'settings', 'settings', 0, 0),
(4, 'reports', 'reports', 0, 0),
(5, 'orders', 'orders', 0, 0),
(8, 'reviews', 'reviews', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_permission_options`
--

CREATE TABLE `shop_permission_options` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `permission_group` int(255) NOT NULL,
  `sort` int(255) NOT NULL DEFAULT 0,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_permission_options`
--

INSERT INTO `shop_permission_options` (`id`, `slug`, `name`, `action`, `permission_group`, `sort`, `hide`) VALUES
(1, 'view_dashboard', 'dashboard', 'view', 1, 0, 0),
(2, 'add_products', 'products', 'add', 2, 0, 0),
(3, 'edit_products', 'products', 'edit', 2, 0, 0),
(4, 'delete_products', 'products', 'delete', 2, 0, 0),
(5, 'out_stock', 'out', '', 2, 0, 0),
(6, 'update_stock', 'stock', 'update', 2, 0, 0),
(7, 'discount_products', 'discount_products', '', 2, 0, 0),
(8, 'new_orders', 'norders', '', 5, 0, 0),
(9, 'accepted_orders', 'acorders', '', 5, 0, 0),
(10, 'out_delivery', 'ofdelivery', '', 5, 0, 0),
(11, 'change_order_status', 'change_status', '', 5, 0, 0),
(12, 'view_reviews', 'reviews', 'view', 8, 0, 0),
(13, 'add_users', 'users', 'add', 3, 0, 0),
(14, 'edit_users', 'users', 'edit', 3, 0, 0),
(15, 'edit_profile', 'profile', 'edit', 3, 0, 0),
(16, 'changepass', 'changepass', '', 3, 0, 0),
(17, 'permissions', 'permissions', '', 3, 0, 0),
(18, 'view_cancelled', 'corders', '', 4, 0, 0),
(19, 'sales_report', 'sreport', '', 4, 0, 0),
(20, 'settlement_report', 'rsettlement', '', 4, 0, 0),
(21, 'ready_delivery', 'ready_delivery', '', 5, 0, 0),
(22, 'shop_close_open', 'shop_close', '', 3, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_screens`
--

CREATE TABLE `shop_screens` (
  `id` int(11) NOT NULL,
  `screen` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_screens`
--

INSERT INTO `shop_screens` (`id`, `screen`, `url`) VALUES
(1, 'dashboard', 'dashboard.php'),
(2, 'products', 'products'),
(3, 'reports', 'reports'),
(4, 'orders', 'orders');

-- --------------------------------------------------------

--
-- Table structure for table `shop_users`
--

CREATE TABLE `shop_users` (
  `id` int(255) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `role` int(255) NOT NULL,
  `main` int(5) NOT NULL DEFAULT 0,
  `status` int(255) NOT NULL DEFAULT 1,
  `firebase` text DEFAULT NULL,
  `notifications` int(11) NOT NULL DEFAULT 1,
  `lang` int(5) DEFAULT 0,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_users`
--

INSERT INTO `shop_users` (`id`, `shop_id`, `name`, `user_name`, `pass`, `role`, `main`, `status`, `firebase`, `notifications`, `lang`, `hide`) VALUES
(1, 1, 'Fatima', 'admin@gmail.com', '25d55ad283aa400af464c76d713c07ad', 1, 1, 1, NULL, 1, 0, 0),
(2, 2, 'admin', 'admin1@gmail.com', '25d55ad283aa400af464c76d713c07ad', 2, 1, 1, NULL, 1, 0, 0),
(3, 1, 'Employee', 'Employee', '25d55ad283aa400af464c76d713c07ad', 2, 0, 1, NULL, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int(11) NOT NULL,
  `cat` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `cat`, `name`, `name_ar`, `hide`) VALUES
(1, '1,2', '50', '50', 0),
(2, '1', '40', '40', 0),
(3, '1', '30', '30', 0),
(4, '1', '20', '20', 0);

-- --------------------------------------------------------

--
-- Table structure for table `size_charts`
--

CREATE TABLE `size_charts` (
  `id` int(11) NOT NULL,
  `cat` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `size_charts`
--

INSERT INTO `size_charts` (`id`, `cat`, `name`, `name_ar`, `img`, `hide`) VALUES
(1, '1', 'Abaya sizes', 'Abaya sizes', 'http://172.20.30.149/fatima/admin/size_charts/images/1.png?t=1674711940', 0),
(2, '2', 'Dresses', 'Dresses', 'http://172.20.30.149/fatima/admin/size_charts/images/2.png?t=1674712390', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0-No link , 1-Outside link,2-Shop,3-products,4- categories',
  `shop_id` int(11) NOT NULL DEFAULT 0,
  `banner` int(11) NOT NULL DEFAULT 0,
  `cat` int(11) NOT NULL DEFAULT 0,
  `img` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `name_ar` text DEFAULT NULL,
  `link_id` varchar(255) NOT NULL DEFAULT '0',
  `link` varchar(255) DEFAULT NULL COMMENT 'tablename,id',
  `hide` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `type`, `shop_id`, `banner`, `cat`, `img`, `name`, `name_ar`, `link_id`, `link`, `hide`) VALUES
(1, 2, 0, 0, 1, 'http://172.20.30.149/fatima/admin/categories/sliders/1.png?t=1678597871', 'Slider 1', 'Slider 1', '1', 'shops,1', 0),
(2, 1, 0, 0, 1, 'http://172.20.30.149/fatima/admin/categories/sliders/2.png?t=1679828695', 'Slider 2', 'Slider 2', '', 'https://www.google.com/', 0),
(3, 4, 0, 0, 1, 'http://172.20.30.149/fatima/admin/categories/sliders/3.png?t=1679828671', 'Slider 3', 'Slider 3', '1', 'categories,1', 0),
(4, 0, 0, 0, 2, 'https://i.pinimg.com/originals/02/cf/cf/02cfcffac595c832c514d58704cd82ce.jpg', 'Slider 1', 'Slider 1', '', NULL, 0),
(5, 0, 0, 0, 2, 'https://i.pinimg.com/originals/c3/46/37/c34637acf3eed4a16436e1177f23c559.png', 'Slider 2', 'Slider 2', '', NULL, 0),
(6, 0, 0, 0, 3, 'http://172.20.30.149/fatima/admin/categories/sliders/6.png?t=1674025420', 'Slider 1', 'Slider 1', '', NULL, 0),
(7, 2, 0, 1, 0, 'http://172.20.30.149/fatima/admin/banners/images/7.png?t=1679828406', 'Banner 1', 'Banner 1', '1', 'shops,1', 0),
(8, 2, 0, 1, 0, 'http://172.20.30.149/fatima/admin/banners/images/8.png?t=1679828415', 'Banner 2', 'Banner 2', '2', 'shops,2', 0),
(9, 2, 0, 1, 0, 'http://172.20.30.149/fatima/admin/banners/images/9.png?t=1679828425', 'Banner 3', 'Banner 3', '1', 'shops,1', 0),
(10, 2, 0, 0, 0, 'http://172.20.30.149/fatima/admin/sliders/images/10.png?t=1679828373', 'Slider 1', 'Slider 1', '1', 'shops,1', 0),
(11, 4, 0, 0, 0, 'http://172.20.30.149/fatima/admin/sliders/images/11.png?t=1679828385', 'Slider 2', 'Slider 2', '1', 'categories,1', 0),
(12, 3, 0, 0, 0, 'http://172.20.30.149/fatima/admin/sliders/images/12.png?t=1679828392', 'Slider 3 ', 'Slider 3', '1', 'products,1', 0),
(13, 0, 1, 0, 0, 'https://cdn.johrh.com/wp-content/uploads/2022/04/17155301/%D8%B9%D9%85%D9%84%D9%8A%D8%A9.jpg', 'Slider 1', 'Slider 1', '', NULL, 0),
(14, 0, 1, 0, 0, 'https://cdn.johrh.com/wp-content/uploads/2022/04/17155412/%D8%AF%D9%88%D8%A7%D9%85%D8%A7%D8%AA.jpg?t=5465465', 'Slider 2', 'Slider 2', '', NULL, 0),
(15, 0, 1, 0, 0, 'https://cdn.johrh.com/wp-content/uploads/2022/04/17155513/%D9%85%D9%86%D8%A7%D8%B3%D8%A8%D8%A7%D8%AA.jpg', 'Slider 3', 'Slider 3', '', NULL, 0),
(16, 0, 2, 0, 0, 'http://172.20.30.149/fatima/admin/shops/sliders/16.png?t=1674024627', NULL, NULL, '', NULL, 0),
(17, 0, 2, 0, 0, 'http://172.20.30.149/fatima/admin/shops/sliders/17.png?t=1674026617', NULL, NULL, '', NULL, 0),
(18, 0, 2, 0, 0, 'http://172.20.30.149/fatima/admin/shops/sliders/18.png?t=1680242889', NULL, NULL, '0', NULL, 1),
(19, 0, 2, 0, 0, 'http://172.20.30.149/fatima/admin/shops/sliders/19.png?t=1680415822', NULL, NULL, '0', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL DEFAULT 0,
  `cat_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `img` text DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `shop_id`, `cat_id`, `name`, `name_ar`, `slug`, `img`, `sort`, `hide`) VALUES
(2, 0, 1, 'Abaya sets', 'طقم عباية', 'abaya_sets', 'http://172.20.30.149/fatima/admin/categories/sub_categories/2.png?t=1679905695', 0, 0),
(3, 0, 1, 'Embroidered abaya', 'عباية مطرزة', 'embroidered_abaya', 'http://172.20.30.149/fatima/admin/categories/sub_categories/3.png?t=1679905730', 0, 0),
(4, 0, 1, 'Floral Abaya', 'عباية زهور', 'floral_abaya', 'http://172.20.30.149/fatima/admin/categories/sub_categories/4.png?t=1679905581', 0, 0),
(5, 0, 1, 'Casual Abaya', 'عباية كاجوال', 'casual_abaya', 'http://172.20.30.149/fatima/admin/categories/sub_categories/5.png?t=1679905620', 0, 0),
(6, 0, 1, 'Colored Abaya', 'عباية ملونة', 'colored_abaya', 'http://172.20.30.149/fatima/admin/categories/sub_categories/6.png?t=1679905772', 0, 0),
(7, 0, 1, 'Work Abaya', 'عباية عمل', 'work_abaya', 'https://cdn.johrh.com/wp-content/uploads/2022/03/19170114/11132-71-scaled.jpg', 0, 0),
(8, 0, 1, 'Pocket Abaya', 'عباية بجيب', 'pocket_abaya', 'http://172.20.30.149/fatima/admin/categories/sub_categories/8.png?t=1679905809', 0, 0),
(9, 0, 2, 'Modest Dresses', 'فساتين محتشمة', 'modest_dresses', 'http://172.20.30.149/fatima/admin/categories/sub_categories/9.png?t=1679905855', 0, 0),
(10, 0, 2, 'Under Abayas', 'تحت العباءة', 'under_abayas', 'http://172.20.30.149/fatima/admin/categories/sub_categories/10.png?t=1679905938', 0, 0),
(11, 0, 2, 'Evening Dresses', 'فساتين السهرة', 'evening_dresses', 'http://172.20.30.149/fatima/admin/categories/sub_categories/11.png?t=1679906025', 0, 0),
(12, 0, 3, 'Modest Travel Wear', 'ملابس سفر محتشمة', 'modest_travel_wear', 'http://172.20.30.149/fatima/admin/categories/sub_categories/12.png?t=1679907651', 0, 0),
(13, 0, 3, 'Travel Wear Set', 'طقم ملابس سفر', 'travel_wear_set', 'http://172.20.30.149/fatima/admin/categories/sub_categories/13.png?t=1679907618', 0, 0),
(14, 0, 3, 'Travel Blouse', 'بلوزة للسفر', 'travel_blouse', 'http://172.20.30.149/fatima/admin/categories/sub_categories/14.png?t=1679907548', 0, 0),
(15, 0, 3, 'Floral Dresses', 'فساتين بزهور', 'floral_dresses', 'http://172.20.30.149/fatima/admin/categories/sub_categories/15.png?t=1679907507', 0, 0),
(16, 0, 3, 'Summer Travel Wear', 'ملابس سفر صيفية', 'summer_travel_wear', 'http://172.20.30.149/fatima/admin/categories/sub_categories/16.png?t=1679907498', 0, 0),
(17, 0, 4, 'Mukhawar', 'Mukhawar', 'mukhawar', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(255) NOT NULL,
  `shop_id` varchar(255) NOT NULL,
  `ticket_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `total` varchar(255) NOT NULL,
  `delivery` varchar(255) NOT NULL DEFAULT '0',
  `payment` varchar(255) NOT NULL DEFAULT '0' COMMENT '0-cash,1-online',
  `discount` varchar(255) NOT NULL DEFAULT '0',
  `coupon` varchar(255) NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '0' COMMENT ' 	-1 rejected,0-pending,1-accepted ,2-Shipped,3-Done'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `shop_id`, `ticket_id`, `user_id`, `transaction_id`, `date`, `phone`, `address`, `total`, `delivery`, `payment`, `discount`, `coupon`, `status`) VALUES
(1, '1,2', '100', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-23 12:13:25', '+971586745257', 'Port City Java, Al Nahyan Camp', '84', '20', '0', '42', '111', '-1'),
(2, '1,2', '101', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-23 12:14:01', '+971586745257', 'Port City Java, Al Nahyan Camp', '84', '20', '0', '0', '111', '2'),
(3, '1,2', '102', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-23 12:19:09', '+971586745257', 'Port City Java, Al Nahyan Camp', '84', '20', '0', '0', '0', '3'),
(4, '1,2', '103', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-23 12:20:31', '+971586745257', 'Port City Java, Al Nahyan Camp', '84', '20', '0', '0', '0', '1'),
(5, '1', '104', 'stUykVEFSahTIDAsRViLXiqXnmR2', '0', '2023-03-23 12:22:05', '+971586745257', 'Port City Java, Al Nahyan Camp', '138', '10', '0', '50', '111', '2'),
(10, '1', '107', 'stUykVEFSahTIDAsRViLXiqXnmR2', '0', '2023-03-26 10:43:39', '+971586745257', 'Port City Java, Al Nahyan Camp', '70', '10', '0', '0', '0', '3'),
(11, '1', '108', 'stUykVEFSahTIDAsRViLXiqXnmR2', '0', '2023-03-26 10:59:10', '+971586745257', 'Port City Java, Al Nahyan Camp', '69', '10', '0', '34.5', '111', '3'),
(12, '1', '109', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-26 15:18:30', '+971586745257', 'Port City Java, Al Nahyan Camp', '301', '10', '0', '0', '0', '1'),
(13, '1', '110', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-27 11:16:06', '+971586745257', 'Port City Java, Al Nahyan Camp', '312.8', '10', '0', '50', '111', '2'),
(14, '1', '111', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-28 15:27:34', '+971586745257', 'Port City Java, Al Nahyan Camp', '45', '10', '0', '0', '0', '1'),
(15, '2,1', '112', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-28 15:55:32', '+971586745257', 'Port City Java, Al Nahyan Camp', '46', '20', '0', '0', '0', '1'),
(17, '1', '114', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-29 10:39:30', '+971586745257', 'Port City Java, Al Nahyan Camp', '45', '10', '0', '22.5', '111', '1'),
(18, '1', '115', 'stUykVEFSahTIDAsRViLXiqXnmR2', '0', '2023-03-29 10:56:54', '971527188709', 'Al Diar Sawa Hotel Apartments', '45', '10', '0', '0', '0', '0'),
(19, '2', '116', 'stUykVEFSahTIDAsRViLXiqXnmR2', '0', '2023-03-29 11:03:43', '971527188709', 'Al Diar Sawa Hotel Apartments', '30', '10', '0', '0', '0', '0'),
(20, '2', '117', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-29 11:03:46', '+971586745257', 'Port City Java, Al Nahyan Camp', '60', '10', '0', '0', '0', '0'),
(21, '1,2', '118', 'stUykVEFSahTIDAsRViLXiqXnmR2', '0', '2023-03-29 11:09:11', '971527188709', 'Al Diar Sawa Hotel Apartments', '45', '20', '0', '20', '333', '0'),
(22, '1', '119', 'stUykVEFSahTIDAsRViLXiqXnmR2', '0', '2023-03-29 11:23:57', '971527188709', 'Port City Java', '15', '10', '0', '0', '0', '0'),
(23, '1,2,1', '120', 'stUykVEFSahTIDAsRViLXiqXnmR2', '0', '2023-03-29 11:32:00', '971527188709', 'Al Diar Sawa Hotel Apartments', '60', '20', '0', '10', '111', '0'),
(24, '1,1', '121', 'stUykVEFSahTIDAsRViLXiqXnmR2', '0', '2023-03-29 11:38:13', '971527188709', 'Al Diar Sawa Hotel Apartments', '229.8', '0', '0', '100', '222', '0'),
(25, '1', '122', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-29 11:43:37', '+971586745257', 'Port City Java, Al Nahyan Camp', '15', '10', '0', '7.5', '111', '-1'),
(26, '2,2,2', '123', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-30 10:23:52', '+971586745257', 'Port City Java, Al Nahyan Camp', '210', '0', '0', '10', '111', '3'),
(27, '2', '124', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-30 10:25:08', '+971586745257', 'Port City Java, Al Nahyan Camp', '120', '0', '0', '10', '111', '2'),
(28, '1,2', '125', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-30 10:34:50', '+971586745257', 'Port City Java, Al Nahyan Camp', '45', '20', '0', '20', '333', '3'),
(29, '1,2', '126', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-30 10:34:51', '+971586745257', 'Port City Java, Al Nahyan Camp', '45', '20', '0', '20', '333', '1'),
(30, '2', '127', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-30 12:42:37', '+971586745257', 'Port City Java, Al Nahyan Camp', '30', '10', '0', '0', '0', '0'),
(31, '2', '128', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-30 12:58:02', '+971586745257', 'Port City Java, Al Nahyan Camp', '30', '10', '0', '0', '0', '0'),
(32, '2', '129', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-30 12:59:42', '+971586745257', 'Port City Java, Al Nahyan Camp', '30', '10', '0', '0', '0', '0'),
(33, '2', '130', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-30 13:01:12', '+971586745257', 'Port City Java, Al Nahyan Camp', '30', '10', '0', '0', '0', '0'),
(34, '2', '131', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-30 13:01:33', '+971586745257', 'Port City Java, Al Nahyan Camp', '30', '10', '0', '0', '0', '-1'),
(35, '1', '132', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-31 10:07:22', '971586745257', 'Port City Java', '15', '10', '1', '0', '0', '1'),
(36, '1', '133', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-31 10:22:30', '971586745257', 'Port City Java', '27', '10', '0', '0', '0', '0'),
(37, '1', '134', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-03-31 10:23:59', '971586745257', 'Port City Java', '27', '10', '0', '0', '0', '0'),
(38, '1,2', '135', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-04-03 14:41:09', '971586745257', 'Port City Java', '75', '20', '0', '20', '333', '0'),
(39, '1', '136', 'Za33WHwWn0fRuHGmolVqI7KxRtG3', '0', '2023-04-03 15:57:35', '971586745257', 'Port City Java', '27', '10', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `avenus_oid` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `ticket_id` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `device` varchar(255) NOT NULL DEFAULT '2',
  `t_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `firebase` text NOT NULL DEFAULT '0',
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(11) NOT NULL DEFAULT '0' COMMENT '0-Not selected,\r\n1-Male,\r\n2-Female',
  `device` int(2) NOT NULL DEFAULT 2,
  `version` varchar(255) NOT NULL DEFAULT '0',
  `lang` varchar(255) NOT NULL DEFAULT '',
  `block` int(255) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `enable` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `name`, `img`, `firebase`, `phone`, `email`, `gender`, `device`, `version`, `lang`, `block`, `date`, `enable`) VALUES
(4, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 'mohamed', 'http://172.20.30.149/fatima/admin/customers/images/4.jpg?t=1680163250', 'dtsekXmBRteQEf96RJqaAo:APA91bGCbmKV3mvs8QWRHF5fsVGImHmYo11IpVUNd258N-Jyjn3wtB1XzX1ATy2AzqxByRqy_mb_SWAuyfyUNh5rZEOFR9oBf6mH_KwGrf9AmbS49DKO6oP4FNfrkfRzw43jx3YueTz3', '+971586745257', 'devmo@gmail.com', '0', 1, '0', '_ar', 0, '2023-01-20 09:06:34', 1),
(5, 'stUykVEFSahTIDAsRViLXiqXnmR2', 'Waqas Ali', 'http://172.20.30.149/fatima/admin/customers/images/5.jpg?t=1679462698', 'cBlvpNMqKEalhArtNaO_S8:APA91bHK7dMn0hP6Nn4lha5__lxx7DX9pt1pezFXOPQ8eR-MIZzlx1p69fuYYmu9Dkw3hYZJjdWS8Wl1gZoPBJEdYJBvaEopdLmxjqi-hKBOZm3_2vBTL6az38XJSP8_ICJTB2VNSxvh', '527188709', 'waqas.ali@e-ds.ae', '1', 2, '0', '', 0, '2023-03-22 09:15:54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_size`
--

CREATE TABLE `users_size` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cat` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `hide` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_size`
--

INSERT INTO `users_size` (`id`, `user_id`, `name`, `cat`, `details`, `hide`) VALUES
(2, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 'New Size', '1', '[{\"id\":\"1\",\"value\":\"10\"},{\"id\":\"2\",\"value\":\"20\"},{\"id\":\"3\",\"value\":\"30\"},{\"id\":\"4\",\"value\":\"40\"},{\"id\":\"5\",\"value\":\"50\"},{\"id\":\"6\",\"value\":\"60\"}]', 1),
(16, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 'Dress Size', '2', '[{\"id\":\"1\",\"value\":\"10\"},{\"id\":\"2\",\"value\":\"5\"}]', 1),
(17, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 'waq', '2', '[{\"value\":\"1\",\"id\":\"1\"},{\"value\":\"2\",\"id\":\"2\"}]', 1),
(18, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 'moh', '2', '[{\"value\":\"20\",\"id\":\"1\"},{\"value\":\"40\",\"id\":\"2\"}]', 1),
(19, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 'neeeew', '1', '[{\"id\":\"1\",\"value\":\"1\"},{\"id\":\"2\",\"value\":\"2\"},{\"value\":\"3\",\"id\":\"3\"},{\"value\":\"4\",\"id\":\"4\"},{\"value\":\"5\",\"id\":\"5\"},{\"value\":\"6\",\"id\":\"6\"}]', 1),
(26, 'stUykVEFSahTIDAsRViLXiqXnmR2', 'Long Abaya', '1', '[{\"value\":\"50\",\"id\":\"1\"},{\"value\":\"60\",\"id\":\"2\"},{\"value\":\"70\",\"id\":\"3\"},{\"value\":\"80\",\"id\":\"4\"},{\"value\":\"90\",\"id\":\"5\"},{\"value\":\"100\",\"id\":\"6\"}]', 0),
(27, 'Za33WHwWn0fRuHGmolVqI7KxRtG3', 'Abaya', '1', '[{\"id\":\"1\",\"value\":\"10\"},{\"id\":\"2\",\"value\":\"20\"},{\"id\":\"3\",\"value\":\"30\"},{\"id\":\"4\",\"value\":\"40\"},{\"id\":\"5\",\"value\":\"50\"},{\"id\":\"6\",\"value\":\"60\"}]', 0);

-- --------------------------------------------------------

--
-- Structure for view `availability_view`
--
DROP TABLE IF EXISTS `availability_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `availability_view`  AS SELECT `products`.`name` AS `name`, `products`.`name_ar` AS `name_ar`, `products`.`custom` AS `custom`, `products`.`price` AS `price`, `categories`.`id` AS `cat_id`, `sub_categories`.`id` AS `sub_id`, `products`.`id` AS `id`, `products`.`shop_id` AS `shop_id`, `products`.`max_quantity` AS `max_quantity`, `products`.`status` AS `status`, `products`.`discount_value` AS `discount` FROM (((`products` join `shops`) join `categories`) join `sub_categories`) WHERE `shops`.`id` = `products`.`shop_id` AND `shops`.`close` = 0 AND `shops`.`status` = 1 AND `products`.`cat` = `categories`.`id` AND `products`.`sub_id` = `sub_categories`.`id` AND `sub_categories`.`cat_id` = `categories`.`id` AND `products`.`status` = 1 AND `products`.`hide` = 0 AND `products`.`max_quantity` > 0 AND `categories`.`hide` = 0 AND `sub_categories`.`hide` = 00  ;

-- --------------------------------------------------------

--
-- Structure for view `orders_report_view`
--
DROP TABLE IF EXISTS `orders_report_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orders_report_view`  AS SELECT `orders`.`id` AS `id`, `orders`.`ticket_id` AS `ticket_id`, `orders`.`user_id` AS `user_id`, `orders`.`shop_id` AS `shop_id`, `orders`.`delivery` AS `delivery`, round(sum(`orders`.`price` * `orders`.`quantity`),2) AS `subtotal`, round(sum(`orders`.`price` * `orders`.`quantity` * (`orders`.`comm` / 100)),2) AS `comm`, round(sum(`orders`.`price` * `orders`.`quantity`) - sum(`orders`.`price` * `orders`.`quantity` * (`orders`.`comm` / 100)),2) AS `settlement_amount`, `orders`.`date` AS `date`, min(`orders`.`status`) AS `status`, `orders`.`settlement` AS `settlement` FROM `orders` WHERE `orders`.`hide` = 0 GROUP BY `orders`.`ticket_id`, `orders`.`shop_id``shop_id`  ;

-- --------------------------------------------------------

--
-- Structure for view `orders_view`
--
DROP TABLE IF EXISTS `orders_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orders_view`  AS SELECT `orders`.`shop_id` AS `shop_id`, `orders`.`id` AS `id`, `products`.`name` AS `name`, `products`.`name_ar` AS `name_ar`, `orders`.`item_id` AS `item_id`, `orders`.`custom` AS `custom`, `orders`.`price` AS `price`, `orders`.`quantity` AS `quantity`, `orders`.`ticket_id` AS `ticket_id`, `orders`.`user_id` AS `user_id`, `orders`.`status` AS `status`, `orders`.`note` AS `note`, `orders`.`size_name` AS `size_name`, `orders`.`delivery` AS `delivery`, `products`.`img` AS `img` FROM (`orders` join `products` on(`orders`.`item_id` = `products`.`id`)) WHERE `orders`.`hide` = '0''0'  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- Indexes for table `app_alerts`
--
ALTER TABLE `app_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_config`
--
ALTER TABLE `app_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_data`
--
ALTER TABLE `app_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `coupon_transactions`
--
ALTER TABLE `coupon_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_settings`
--
ALTER TABLE `delivery_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_options`
--
ALTER TABLE `feature_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lang`
--
ALTER TABLE `lang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `measurements`
--
ALTER TABLE `measurements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role` (`role`);

--
-- Indexes for table `permission_group`
--
ALTER TABLE `permission_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `permission_options`
--
ALTER TABLE `permission_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `permission_group` (`permission_group`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `product_features`
--
ALTER TABLE `product_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `screens`
--
ALTER TABLE `screens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settlement`
--
ALTER TABLE `settlement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `shop_permissions`
--
ALTER TABLE `shop_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_id` (`shop_id`,`role`);

--
-- Indexes for table `shop_permission_group`
--
ALTER TABLE `shop_permission_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_permission_options`
--
ALTER TABLE `shop_permission_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_group` (`permission_group`);

--
-- Indexes for table `shop_screens`
--
ALTER TABLE `shop_screens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_users`
--
ALTER TABLE `shop_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_name_2` (`user_name`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `size_charts`
--
ALTER TABLE `size_charts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`user_id`);

--
-- Indexes for table `users_size`
--
ALTER TABLE `users_size`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_alerts`
--
ALTER TABLE `app_alerts`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_config`
--
ALTER TABLE `app_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_data`
--
ALTER TABLE `app_data`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupon_transactions`
--
ALTER TABLE `coupon_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_settings`
--
ALTER TABLE `delivery_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `feature_options`
--
ALTER TABLE `feature_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `lang`
--
ALTER TABLE `lang`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

--
-- AUTO_INCREMENT for table `measurements`
--
ALTER TABLE `measurements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permission_group`
--
ALTER TABLE `permission_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `permission_options`
--
ALTER TABLE `permission_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `product_features`
--
ALTER TABLE `product_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `screens`
--
ALTER TABLE `screens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settlement`
--
ALTER TABLE `settlement`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shop_permissions`
--
ALTER TABLE `shop_permissions`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop_permission_group`
--
ALTER TABLE `shop_permission_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shop_permission_options`
--
ALTER TABLE `shop_permission_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `shop_screens`
--
ALTER TABLE `shop_screens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shop_users`
--
ALTER TABLE `shop_users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `size_charts`
--
ALTER TABLE `size_charts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users_size`
--
ALTER TABLE `users_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_features`
--
ALTER TABLE `product_features`
  ADD CONSTRAINT `product_features_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_permission_options`
--
ALTER TABLE `shop_permission_options`
  ADD CONSTRAINT `shop_permission_options_ibfk_1` FOREIGN KEY (`permission_group`) REFERENCES `shop_permission_group` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
