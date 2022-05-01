-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2016 a las 23:18:17
-- Versión del servidor: 10.1.8-MariaDB
-- Versión de PHP: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aquihayplan`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `recipient_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recipient_surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `postal_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_more` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `address`
--

INSERT INTO `address` (`id`, `name`, `recipient_name`, `recipient_surname`, `city`, `postal_code`, `address`, `address_more`, `phone`, `mobile`, `comments`, `created_at`, `updated_at`, `enabled`) VALUES
(1, 'My home', 'Maggie', 'Simpson', 'ES_CT_B_Barcelona', '08007', 'Passeig de Gràcia', '1', '936524596', '625452365', 'Is an Apple Store', '2016-10-11 21:48:16', '2016-10-11 21:48:16', 1),
(2, 'Work', 'Homer', 'Simpson', 'ES_CT_B_Barcelona', '08009', 'C/ València', '333 Baixos', '935864758', '625452365', 'It''s an office', '2016-10-11 21:48:16', '2016-10-11 21:48:16', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_user`
--

CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `recovery_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `one_time_login_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `admin_user`
--

INSERT INTO `admin_user` (`id`, `gender`, `password`, `email`, `token`, `firstname`, `lastname`, `birthday`, `recovery_hash`, `one_time_login_hash`, `created_at`, `updated_at`, `last_login_at`, `enabled`) VALUES
(1, 0, '$2y$15$.STxTm0o5n1bjZM6dFhvvOktWV1L3fxE19Fq/a8FKf7bZzs.BL4Ii', 'admin@admin.com', 'b2b06760bacc19ad69cf4cd9b1756dc0', 'John', 'Wayne', NULL, NULL, NULL, '2016-10-11 21:48:18', '2016-10-11 21:48:18', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attribute`
--

CREATE TABLE `attribute` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `attribute`
--

INSERT INTO `attribute` (`id`, `name`, `created_at`, `updated_at`, `enabled`) VALUES
(1, 'Size', '2016-10-11 21:48:18', '2016-10-11 21:48:18', 1),
(2, 'Color', '2016-10-11 21:48:18', '2016-10-11 21:48:18', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authorization`
--

CREATE TABLE `authorization` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `resourceowner_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `authorization_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiration_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `principal_image_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banner_banner_zone`
--

CREATE TABLE `banner_banner_zone` (
  `banner_id` int(11) NOT NULL,
  `banner_zone_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banner_zone`
--

CREATE TABLE `banner_zone` (
  `id` int(11) NOT NULL,
  `language_iso` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrier`
--

CREATE TABLE `carrier` (
  `id` int(11) NOT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `carrier`
--

INSERT INTO `carrier` (`id`, `tax_id`, `name`, `description`, `enabled`) VALUES
(1, 1, 'default', 'Default carrier', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `delivery_address_id` int(11) DEFAULT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `ordered` tinyint(1) NOT NULL,
  `shipping_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_coupon`
--

CREATE TABLE `cart_coupon` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_line`
--

CREATE TABLE `cart_line` (
  `id` int(11) NOT NULL,
  `order_line_id` int(11) DEFAULT NULL,
  `cart_id` int(11) NOT NULL,
  `purchasable_currency_iso` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `currency_iso` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `purchasable_id` int(11) DEFAULT NULL,
  `purchasable_amount` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `root` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `parent_id`, `name`, `slug`, `root`, `position`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`, `enabled`) VALUES
(1, NULL, 'Women''s', 'women-shirts', 1, 0, 'Women Shirts', 'Women Shirts', 'Women Shirts', '2016-10-11 21:48:20', '2016-10-11 21:48:20', 1),
(2, NULL, 'Men''s', 'Men-shirts', 1, 1, 'Men Shirts', 'Men Shirts', 'Men Shirts', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comment_vote`
--

CREATE TABLE `comment_vote` (
  `author_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coupon`
--

CREATE TABLE `coupon` (
  `id` int(11) NOT NULL,
  `price_currency_iso` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `minimum_purchase_currency_iso` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `enforcement` int(11) NOT NULL,
  `price_amount` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `minimum_purchase_amount` int(11) DEFAULT NULL,
  `stackable` tinyint(1) NOT NULL DEFAULT '0',
  `valid_from` datetime NOT NULL,
  `valid_to` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `coupon`
--

INSERT INTO `coupon` (`id`, `price_currency_iso`, `minimum_purchase_currency_iso`, `rule`, `code`, `name`, `type`, `enforcement`, `price_amount`, `discount`, `value`, `count`, `used`, `priority`, `minimum_purchase_amount`, `stackable`, `valid_from`, `valid_to`, `created_at`, `updated_at`, `enabled`) VALUES
(1, 'USD', 'USD', NULL, 'percent', '12 percent discount', 2, 2, 0, 12, NULL, 5, 0, 0, 0, 0, '2016-10-11 21:48:46', NULL, '2016-10-11 21:48:46', '2016-10-11 21:48:46', 1),
(2, 'EUR', 'USD', NULL, '5euros', '5 euros discount', 1, 2, 500, 0, NULL, 0, 0, 0, 0, 0, '2016-10-11 21:48:46', NULL, '2016-10-11 21:48:46', '2016-10-11 21:48:46', 1),
(3, 'USD', 'USD', NULL, '10dollars', '10 dollars discount', 1, 2, 1000, 0, NULL, 20, 0, 0, 0, 0, '2016-10-11 21:48:46', NULL, '2016-10-11 21:48:46', '2016-10-11 21:48:46', 1),
(4, 'USD', 'USD', 3, 'bigspender', '50% discount', 2, 1, 0, 50, NULL, 0, 0, 0, 0, 0, '2016-10-11 21:48:46', NULL, '2016-10-11 21:48:46', '2016-10-11 21:48:46', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currency`
--

CREATE TABLE `currency` (
  `iso` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `currency`
--

INSERT INTO `currency` (`iso`, `name`, `symbol`, `created_at`, `updated_at`, `enabled`) VALUES
('AFN', 'Afghanistan Afghani', '؋', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('ALL', 'Albania Lek', 'Lek', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('ANG', 'Netherlands Antilles Guilder', 'ƒ', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('ARS', 'Argentina Peso', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('AUD', 'Australia Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('AWG', 'Aruba Guilder', 'ƒ', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('AZN', 'Azerbaijan New Manat', 'ман', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('BAM', 'Bosnia and Herzegovina Convertible Marka', 'KM', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('BBD', 'Barbados Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('BGN', 'Bulgaria Lev', 'лв', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('BMD', 'Bermuda Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('BND', 'Brunei Darussalam Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('BOB', 'Bolivia Boliviano', '$b', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('BRL', 'Brazil Real', 'R$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('BSD', 'Bahamas Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('BWP', 'Botswana Pula', 'P', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('BYR', 'Belarus Ruble', 'p.', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('BZD', 'Belize Dollar', 'BZ$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('CAD', 'Canada Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('CHF', 'Switzerland Franc', 'CHF', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('CLP', 'Chile Peso', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('CNY', 'China Yuan Renminbi', '¥', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('COP', 'Colombia Peso', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('CRC', 'Costa Rica Colon', '₡', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('CUP', 'Cuba Peso', '₱', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('CZK', 'Czech Republic Koruna', 'Kč', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('DKK', 'Denmark Krone', 'kr', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('DOP', 'Dominican Republic Peso', 'RD$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('EEK', 'Estonia Kroon', 'kr', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('EGP', 'Egypt Pound', '£', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('EUR', 'Euro Member Countries', '€', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
('FJD', 'Fiji Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('FKP', 'Falkland Islands (Malvinas) Pound', '£', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('GBP', 'United Kingdom Pound', '£', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
('GGP', 'Guernsey Pound', '£', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('GHC', 'Ghana Cedi', '¢', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('GIP', 'Gibraltar Pound', '£', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('GTQ', 'Guatemala Quetzal', 'Q', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('GYD', 'Guyana Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('HKD', 'Hong Kong Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('HNL', 'Honduras Lempira', 'L', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('HRK', 'Croatia Kuna', 'kn', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('HUF', 'Hungary Forint', 'Ft', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('IDR', 'Indonesia Rupiah', 'Rp', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('ILS', 'Israel Shekel', '₪', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('IMP', 'Isle of Man Pound', '£', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('INR', 'India Rupee', '₹', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('IRR', 'Iran Rial', '﷼', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('ISK', 'Iceland Krona', 'kr', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('JEP', 'Jersey Pound', '£', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('JMD', 'Jamaica Dollar', 'J$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('JPY', 'Japan Yen', '¥', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
('KGS', 'Kyrgyzstan Som', 'лв', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('KHR', 'Cambodia Riel', '៛', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('KPW', 'Korea (North) Won', '₩', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('KRW', 'Korea (South) Won', '₩', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('KYD', 'Cayman Islands Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('KZT', 'Kazakhstan Tenge', 'лв', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('LAK', 'Laos Kip', '₭', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('LBP', 'Lebanon Pound', '£', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('LKR', 'Sri Lanka Rupee', '₨', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('LRD', 'Liberia Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('LTL', 'Lithuania Litas', 'Lt', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('LVL', 'Latvia Lat', 'Ls', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('MKD', 'Macedonia Denar', 'ден', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('MNT', 'Mongolia Tughrik', '₮', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('MUR', 'Mauritius Rupee', '₨', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('MXN', 'Mexico Peso', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('MYR', 'Malaysia Ringgit', 'RM', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('MZN', 'Mozambique Metical', 'MT', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('NAD', 'Namibia Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('NGN', 'Nigeria Naira', '₦', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('NIO', 'Nicaragua Cordoba', 'C$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('NOK', 'Norway Krone', 'kr', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('NPR', 'Nepal Rupee', '₨', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('NZD', 'New Zealand Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('OMR', 'Oman Rial', '﷼', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('PAB', 'Panama Balboa', 'B/.', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('PEN', 'Peru Nuevo Sol', 'S/.', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('PHP', 'Philippines Peso', '₱', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('PKR', 'Pakistan Rupee', '₨', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('PLN', 'Poland Zloty', 'zł', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('PYG', 'Paraguay Guarani', 'Gs', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('QAR', 'Qatar Riyal', '﷼', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('RON', 'Romania New Leu', 'lei', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('RSD', 'Serbia Dinar', 'Дин.', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('RUB', 'Russia Ruble', 'руб', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('SAR', 'Saudi Arabia Riyal', '﷼', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('SBD', 'Solomon Islands Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('SCR', 'Seychelles Rupee', '₨', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('SEK', 'Sweden Krona', 'kr', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('SGD', 'Singapore Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('SHP', 'Saint Helena Pound', '£', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('SOS', 'Somalia Shilling', 'S', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('SRD', 'Suriname Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('SVC', 'El Salvador Colon', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('SYP', 'Syria Pound', '£', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('THB', 'Thailand Baht', '฿', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('TRL', 'Turkey Lira', '₤', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('TRY', 'Turkey Lira', '₺', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('TTD', 'Trinidad and Tobago Dollar', 'TT$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('TVD', 'Tuvalu Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('TWD', 'Taiwan New Dollar', 'NT$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('UAH', 'Ukraine Hryvnia', '₴', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('USD', 'United States Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
('UYU', 'Uruguay Peso', '$U', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('UZS', 'Uzbekistan Som', 'лв', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('VEF', 'Venezuela Bolivar', 'Bs', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('VND', 'Viet Nam Dong', '₫', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('XCD', 'East Caribbean Dollar', '$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('YER', 'Yemen Rial', '﷼', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('ZAR', 'South Africa Rand', 'R', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0),
('ZWD', 'Zimbabwe Dollar', 'Z$', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currency_exchange_rate`
--

CREATE TABLE `currency_exchange_rate` (
  `id` int(11) NOT NULL,
  `target_currency_iso` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_currency_iso` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(18,10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `currency_exchange_rate`
--

INSERT INTO `currency_exchange_rate` (`id`, `target_currency_iso`, `source_currency_iso`, `exchange_rate`) VALUES
(1, 'EUR', 'USD', '0.7365960000'),
(2, 'GBP', 'USD', '0.5887650000'),
(3, 'JPY', 'USD', '101.8226250000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `delivery_address_id` int(11) DEFAULT NULL,
  `invoice_address_id` int(11) DEFAULT NULL,
  `language_iso` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `recovery_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `one_time_login_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identity_document` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guest` tinyint(1) NOT NULL,
  `newsletter` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `customer`
--

INSERT INTO `customer` (`id`, `delivery_address_id`, `invoice_address_id`, `language_iso`, `gender`, `password`, `email`, `token`, `firstname`, `lastname`, `birthday`, `recovery_hash`, `one_time_login_hash`, `created_at`, `updated_at`, `last_login_at`, `enabled`, `phone`, `identity_document`, `guest`, `newsletter`) VALUES
(1, NULL, NULL, NULL, 0, '$2y$15$Ms9QRUC/BOtdRpbXplNy6evKnFXMnTQdJ8qPdn5MYft8dVXWWtsLm', 'customer@customer.com', '8420010bd67327289818dc8c12ac2adc', 'Homer', 'Simpson', NULL, NULL, NULL, '2016-10-11 21:48:22', '2016-10-11 21:48:22', NULL, 1, NULL, NULL, 0, 0),
(2, NULL, NULL, NULL, 1, '$2y$15$KwKh/4CT1f8VHcLF/2rKHOkmYN/kt5nvfkUu6zalALlDUqarkgRoG', 'another-customer@customer.com', '926cae64d74ae59f6d438be174a4d4b0', 'Santa', 'Claus', NULL, NULL, NULL, '2016-10-11 21:48:24', '2016-10-11 21:48:24', NULL, 1, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer_address`
--

CREATE TABLE `customer_address` (
  `customer_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `customer_address`
--

INSERT INTO `customer_address` (`customer_id`, `address_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entity_translation`
--

CREATE TABLE `entity_translation` (
  `entity_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entity_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `translation` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `entity_translation`
--

INSERT INTO `entity_translation` (`entity_type`, `entity_id`, `entity_field`, `locale`, `translation`) VALUES
('carrier', '1', 'description', 'ca', 'El nostre sistema d''entrega bàsic'),
('carrier', '1', 'description', 'en', 'Our basic delivery system'),
('carrier', '1', 'description', 'es', 'Nuestro sistema de entrega básico'),
('carrier', '1', 'description', 'fr', 'Notre système de livraison basique'),
('carrier', '1', 'name', 'ca', 'Bàsic'),
('carrier', '1', 'name', 'en', 'Basic'),
('carrier', '1', 'name', 'es', 'Básico'),
('carrier', '1', 'name', 'fr', 'Minimale'),
('category', '1', 'metaDescription', 'ca', 'Samarretes de dona'),
('category', '1', 'metaDescription', 'en', 'Women Shirts'),
('category', '1', 'metaDescription', 'es', 'Camisetas de Mujer'),
('category', '1', 'metaDescription', 'fr', 'Chemises de femme'),
('category', '1', 'metaKeywords', 'ca', 'Samarretes de dona'),
('category', '1', 'metaKeywords', 'en', 'Women Shirts'),
('category', '1', 'metaKeywords', 'es', 'Camisetas Mujer'),
('category', '1', 'metaKeywords', 'fr', 'Chemises de femme'),
('category', '1', 'metaTitle', 'ca', 'Samarretes de dona'),
('category', '1', 'metaTitle', 'en', 'Women Shirts'),
('category', '1', 'metaTitle', 'es', 'Camisetas de Mujer'),
('category', '1', 'metaTitle', 'fr', 'Chemises de femme'),
('category', '1', 'name', 'ca', 'Dona'),
('category', '1', 'name', 'en', 'Women''s'),
('category', '1', 'name', 'es', 'Mujer'),
('category', '1', 'name', 'fr', 'Femme'),
('category', '1', 'slug', 'ca', 'samarretes-de-dona'),
('category', '1', 'slug', 'en', 'women-shirts'),
('category', '1', 'slug', 'es', 'camisetas-de-mujer'),
('category', '1', 'slug', 'fr', 'chemises-de-femme'),
('category', '2', 'metaDescription', 'ca', 'Samarretes d''home'),
('category', '2', 'metaDescription', 'en', 'Men Shirts'),
('category', '2', 'metaDescription', 'es', 'Camisetas de Hombre'),
('category', '2', 'metaDescription', 'fr', 'Chemises de homme'),
('category', '2', 'metaKeywords', 'ca', 'Samarretes d''home'),
('category', '2', 'metaKeywords', 'en', 'Men Shirts'),
('category', '2', 'metaKeywords', 'es', 'Camisetas Hombre'),
('category', '2', 'metaKeywords', 'fr', 'Chemises de homme'),
('category', '2', 'metaTitle', 'ca', 'Samarretes d''home'),
('category', '2', 'metaTitle', 'en', 'Men Shirts'),
('category', '2', 'metaTitle', 'es', 'Camisetas de Hombre'),
('category', '2', 'metaTitle', 'fr', 'Chemises de homme'),
('category', '2', 'name', 'ca', 'Home'),
('category', '2', 'name', 'en', 'Men''s'),
('category', '2', 'name', 'es', 'Hombre'),
('category', '2', 'name', 'fr', 'Homem'),
('category', '2', 'slug', 'ca', 'samarretes-d-home'),
('category', '2', 'slug', 'en', 'men-shirts'),
('category', '2', 'slug', 'es', 'camisetas-de-hombre'),
('category', '2', 'slug', 'fr', 'chemises-de-homme'),
('manufacturer', '1', 'description', 'ca', 'Levis'),
('manufacturer', '1', 'description', 'en', 'Levis'),
('manufacturer', '1', 'description', 'es', 'Levis'),
('manufacturer', '1', 'description', 'fr', 'Levis'),
('manufacturer', '1', 'metaDescription', 'ca', 'Fabricant Levis'),
('manufacturer', '1', 'metaDescription', 'en', 'Levis Manufacturer'),
('manufacturer', '1', 'metaDescription', 'es', 'Fabricante Levis'),
('manufacturer', '1', 'metaDescription', 'fr', 'Fabricant Levis'),
('manufacturer', '1', 'metaKeywords', 'ca', 'Levis, Fabricant'),
('manufacturer', '1', 'metaKeywords', 'en', 'Levis, Manufacturer'),
('manufacturer', '1', 'metaKeywords', 'es', 'Levis, Fabricante'),
('manufacturer', '1', 'metaKeywords', 'fr', 'Levis, Fabricant'),
('manufacturer', '1', 'metaTitle', 'ca', 'Levis'),
('manufacturer', '1', 'metaTitle', 'en', 'Levis'),
('manufacturer', '1', 'metaTitle', 'es', 'Levis'),
('manufacturer', '1', 'metaTitle', 'fr', 'Levis'),
('manufacturer', '1', 'name', 'ca', 'Levis'),
('manufacturer', '1', 'name', 'en', 'Levis'),
('manufacturer', '1', 'name', 'es', 'Levis'),
('manufacturer', '1', 'name', 'fr', 'Levis'),
('manufacturer', '1', 'slug', 'ca', 'levis'),
('manufacturer', '1', 'slug', 'en', 'levis'),
('manufacturer', '1', 'slug', 'es', 'levis'),
('manufacturer', '1', 'slug', 'fr', 'levis'),
('page', '1', 'content', 'es', 'Hola amigos.\n\nNuestra más humilde bienvenida a nuestro blog.\n\nEn este blog encontrarás las últimas novedades, así como todas las noticias relacionadas con nuestra tienda.\n\nNo dudéis en dejar vuestros comentarios e impresiones, así como sugerencias y opiniones. Éstos nos serán de extrema ayuda para mejorar nuestro producto y poder seguir trabajando para darle un mejor servicio cada dia.\n\nSalutaciones y esperamos verle de nuevo.'),
('page', '1', 'path', 'es', 'hola-mundo'),
('page', '1', 'title', 'es', 'Hola mundo'),
('page', '2', 'content', 'ca', 'Sobre nosaltres'),
('page', '2', 'content', 'en', 'About us'),
('page', '2', 'content', 'es', 'Sobre nosotros'),
('page', '2', 'content', 'fr', 'A propos'),
('page', '2', 'metaDescription', 'ca', 'Sobre nosaltres'),
('page', '2', 'metaDescription', 'en', 'About us'),
('page', '2', 'metaDescription', 'es', 'Sobre nosotros'),
('page', '2', 'metaDescription', 'fr', 'A propos'),
('page', '2', 'metaKeywords', 'ca', 'sobre,nosaltres'),
('page', '2', 'metaKeywords', 'en', 'about,us'),
('page', '2', 'metaKeywords', 'es', 'sobre,nosotros'),
('page', '2', 'metaKeywords', 'fr', 'propos'),
('page', '2', 'metaTitle', 'ca', 'Sobre nosaltres'),
('page', '2', 'metaTitle', 'en', 'About us'),
('page', '2', 'metaTitle', 'es', 'Sobre nosotros'),
('page', '2', 'metaTitle', 'fr', 'A propos'),
('page', '2', 'path', 'ca', 'sobre-nosaltres'),
('page', '2', 'path', 'en', 'about-us'),
('page', '2', 'path', 'es', 'sobre-nosotros'),
('page', '2', 'path', 'fr', 'a-propos'),
('page', '2', 'title', 'ca', 'Sobre nosaltres'),
('page', '2', 'title', 'en', 'About us'),
('page', '2', 'title', 'es', 'Sobre nosotros'),
('page', '2', 'title', 'fr', 'A propos'),
('page', '3', 'content', 'ca', 'Termes legals'),
('page', '3', 'content', 'en', 'Terms and conditions'),
('page', '3', 'content', 'es', 'Términos y condiciones'),
('page', '3', 'content', 'fr', 'Mentions legales'),
('page', '3', 'metaDescription', 'ca', 'Termes legals'),
('page', '3', 'metaDescription', 'en', 'Terms and conditions'),
('page', '3', 'metaDescription', 'es', 'Términos y condiciones'),
('page', '3', 'metaDescription', 'fr', 'Mentions legales'),
('page', '3', 'metaKeywords', 'ca', 'termes,legals'),
('page', '3', 'metaKeywords', 'en', 'terms,conditions'),
('page', '3', 'metaKeywords', 'es', 'términos,condiciones'),
('page', '3', 'metaKeywords', 'fr', 'mentions,legales'),
('page', '3', 'metaTitle', 'ca', 'Termes legals'),
('page', '3', 'metaTitle', 'en', 'Terms and conditions'),
('page', '3', 'metaTitle', 'es', 'Términos y condiciones'),
('page', '3', 'metaTitle', 'fr', 'Mentions legales'),
('page', '3', 'path', 'ca', 'termes-legals'),
('page', '3', 'path', 'en', 'terms-and-conditions'),
('page', '3', 'path', 'es', 'terminos-y-condiciones'),
('page', '3', 'path', 'fr', 'mentions-legales'),
('page', '3', 'title', 'ca', 'Termes legals'),
('page', '3', 'title', 'en', 'Terms and conditions'),
('page', '3', 'title', 'es', 'Términos y condiciones'),
('page', '3', 'title', 'fr', 'Mentions legales'),
('page', '4', 'content', 'es', 'Pedido confirmado para {{ order.customer.fullname }}.'),
('page', '4', 'title', 'es', 'Confirmación de pedido'),
('page', '5', 'content', 'es', 'Hola {{ customer.fullname }}. Su pedido acaba de ser mandado.'),
('page', '5', 'title', 'es', 'Aviso de envío de pedido para el cliente'),
('page', '6', 'content', 'en', 'Welcome {{ customer.fullname }},<br/><br/>\n\nYour account has been successful created.<br/>\nWe hope you like our products and the buying process be flawless.<br/><br/>\n\nSincerely,'),
('page', '6', 'content', 'es', 'Bienvenido {{ customer.fullname }},<br/><br/>\n\nTu cuenta se ha creado correctamente.<br/>\nDeseamos que en nuestra tienda encuentres productos de tu agrado y que el proceso de compra te resulte lo más cómodo posible.<br/><br/>\n\nAtentamente,'),
('page', '6', 'title', 'en', 'Order confirmation'),
('page', '6', 'title', 'es', 'Confirmación de registro'),
('page', '7', 'content', 'es', 'Hola {{ customer.fullname }}. Para recuperar tu contraseña entra en <a href="{{ remember_url }}">este enlace</a>.'),
('page', '7', 'title', 'es', 'Recordatorio de contraseña'),
('page', '8', 'content', 'es', 'Hola {{ customer.fullname }}. Tu contraseña ha sido recuperada.'),
('page', '8', 'title', 'es', 'Contraseña recuperada'),
('purchasable', '1', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '1', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '1', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '1', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '1', 'metaDescription', 'ca', 'Ibiza Lips Català'),
('purchasable', '1', 'metaDescription', 'en', 'Ibiza Lips English'),
('purchasable', '1', 'metaDescription', 'es', 'Ibiza Lips Spanish'),
('purchasable', '1', 'metaDescription', 'fr', 'Ibiza Lips Français'),
('purchasable', '1', 'metaKeywords', 'ca', 'Ibiza Lips Català'),
('purchasable', '1', 'metaKeywords', 'en', 'Ibiza Lips English'),
('purchasable', '1', 'metaKeywords', 'es', 'Ibiza Lips Spanish'),
('purchasable', '1', 'metaKeywords', 'fr', 'Ibiza Lips Français'),
('purchasable', '1', 'metaTitle', 'ca', 'Ibiza Lips Català'),
('purchasable', '1', 'metaTitle', 'en', 'Ibiza Lips English'),
('purchasable', '1', 'metaTitle', 'es', 'Ibiza Lips Spanish'),
('purchasable', '1', 'metaTitle', 'fr', 'Ibiza Lips Français'),
('purchasable', '1', 'name', 'ca', 'Ibiza Lips Català'),
('purchasable', '1', 'name', 'en', 'Ibiza Lips English'),
('purchasable', '1', 'name', 'es', 'Ibiza Lips Spanish'),
('purchasable', '1', 'name', 'fr', 'Ibiza Lips Français'),
('purchasable', '1', 'slug', 'ca', 'ibiza-lips-ca'),
('purchasable', '1', 'slug', 'en', 'ibiza-lips-en'),
('purchasable', '1', 'slug', 'es', 'ibiza-lips-es'),
('purchasable', '1', 'slug', 'fr', 'ibiza-lips-fr'),
('purchasable', '10', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '10', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '10', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '10', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '10', 'metaDescription', 'ca', 'Amnesia Poem Català'),
('purchasable', '10', 'metaDescription', 'en', 'Amnesia Poem English'),
('purchasable', '10', 'metaDescription', 'es', 'Amnesia Poem Spanish'),
('purchasable', '10', 'metaDescription', 'fr', 'Amnesia Poem Français'),
('purchasable', '10', 'metaKeywords', 'ca', 'Amnesia Poem Català'),
('purchasable', '10', 'metaKeywords', 'en', 'Amnesia Poem English'),
('purchasable', '10', 'metaKeywords', 'es', 'Amnesia Poem Spanish'),
('purchasable', '10', 'metaKeywords', 'fr', 'Amnesia Poem Français'),
('purchasable', '10', 'metaTitle', 'ca', 'Amnesia Poem Català'),
('purchasable', '10', 'metaTitle', 'en', 'Amnesia Poem English'),
('purchasable', '10', 'metaTitle', 'es', 'Amnesia Poem Spanish'),
('purchasable', '10', 'metaTitle', 'fr', 'Amnesia Poem Français'),
('purchasable', '10', 'name', 'ca', 'Amnesia Poem Català'),
('purchasable', '10', 'name', 'en', 'Amnesia Poem English'),
('purchasable', '10', 'name', 'es', 'Amnesia Poem Spanish'),
('purchasable', '10', 'name', 'fr', 'Amnesia Poem Français'),
('purchasable', '10', 'slug', 'ca', 'amnesia-poem-ca'),
('purchasable', '10', 'slug', 'en', 'amnesia-poem-en'),
('purchasable', '10', 'slug', 'es', 'amnesia-poem-es'),
('purchasable', '10', 'slug', 'fr', 'amnesia-poem-fr'),
('purchasable', '11', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '11', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '11', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '11', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '11', 'metaDescription', 'ca', 'Pyramid Català'),
('purchasable', '11', 'metaDescription', 'en', 'Pyramid English'),
('purchasable', '11', 'metaDescription', 'es', 'Pyramid Spanish'),
('purchasable', '11', 'metaDescription', 'fr', 'Pyramid Français'),
('purchasable', '11', 'metaKeywords', 'ca', 'Pyramid Català'),
('purchasable', '11', 'metaKeywords', 'en', 'Pyramid English'),
('purchasable', '11', 'metaKeywords', 'es', 'Pyramid Spanish'),
('purchasable', '11', 'metaKeywords', 'fr', 'Pyramid Français'),
('purchasable', '11', 'metaTitle', 'ca', 'Pyramid Català'),
('purchasable', '11', 'metaTitle', 'en', 'Pyramid English'),
('purchasable', '11', 'metaTitle', 'es', 'Pyramid Spanish'),
('purchasable', '11', 'metaTitle', 'fr', 'Pyramid Français'),
('purchasable', '11', 'name', 'ca', 'Pyramid Català'),
('purchasable', '11', 'name', 'en', 'Pyramid English'),
('purchasable', '11', 'name', 'es', 'Pyramid Spanish'),
('purchasable', '11', 'name', 'fr', 'Pyramid Français'),
('purchasable', '11', 'slug', 'ca', 'pyramid-ca'),
('purchasable', '11', 'slug', 'en', 'pyramid-en'),
('purchasable', '11', 'slug', 'es', 'pyramid-es'),
('purchasable', '11', 'slug', 'fr', 'pyramid-fr'),
('purchasable', '12', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '12', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '12', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '12', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '12', 'metaDescription', 'ca', 'Amnesia Pink Català'),
('purchasable', '12', 'metaDescription', 'en', 'Amnesia Pink English'),
('purchasable', '12', 'metaDescription', 'es', 'Amnesia Pink Spanish'),
('purchasable', '12', 'metaDescription', 'fr', 'Amnesia Pink Français'),
('purchasable', '12', 'metaKeywords', 'ca', 'Amnesia Pink Català'),
('purchasable', '12', 'metaKeywords', 'en', 'Amnesia Pink English'),
('purchasable', '12', 'metaKeywords', 'es', 'Amnesia Pink Spanish'),
('purchasable', '12', 'metaKeywords', 'fr', 'Amnesia Pink Français'),
('purchasable', '12', 'metaTitle', 'ca', 'Amnesia Pink Català'),
('purchasable', '12', 'metaTitle', 'en', 'Amnesia Pink English'),
('purchasable', '12', 'metaTitle', 'es', 'Amnesia Pink Spanish'),
('purchasable', '12', 'metaTitle', 'fr', 'Amnesia Pink Français'),
('purchasable', '12', 'name', 'ca', 'Amnesia Pink Català'),
('purchasable', '12', 'name', 'en', 'Amnesia Pink English'),
('purchasable', '12', 'name', 'es', 'Amnesia Pink Spanish'),
('purchasable', '12', 'name', 'fr', 'Amnesia Pink Français'),
('purchasable', '12', 'slug', 'ca', 'amnesia-pink-ca'),
('purchasable', '12', 'slug', 'en', 'amnesia-pink-en'),
('purchasable', '12', 'slug', 'es', 'amnesia-pink-es'),
('purchasable', '12', 'slug', 'fr', 'amnesia-pink-fr'),
('purchasable', '13', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '13', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '13', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '13', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '13', 'metaDescription', 'ca', 'Pinky Fragments Català'),
('purchasable', '13', 'metaDescription', 'en', 'Pinky Fragments English'),
('purchasable', '13', 'metaDescription', 'es', 'Pinky Fragments Spanish'),
('purchasable', '13', 'metaDescription', 'fr', 'Pinky Fragments Français'),
('purchasable', '13', 'metaKeywords', 'ca', 'Pinky Fragments Català'),
('purchasable', '13', 'metaKeywords', 'en', 'Pinky Fragments English'),
('purchasable', '13', 'metaKeywords', 'es', 'Pinky Fragments Spanish'),
('purchasable', '13', 'metaKeywords', 'fr', 'Pinky Fragments Français'),
('purchasable', '13', 'metaTitle', 'ca', 'Pinky Fragments Català'),
('purchasable', '13', 'metaTitle', 'en', 'Pinky Fragments English'),
('purchasable', '13', 'metaTitle', 'es', 'Pinky Fragments Spanish'),
('purchasable', '13', 'metaTitle', 'fr', 'Pinky Fragments Français'),
('purchasable', '13', 'name', 'ca', 'Pinky Fragments Català'),
('purchasable', '13', 'name', 'en', 'Pinky Fragments English'),
('purchasable', '13', 'name', 'es', 'Pinky Fragments Spanish'),
('purchasable', '13', 'name', 'fr', 'Pinky Fragments Français'),
('purchasable', '13', 'slug', 'ca', 'pinky-fragments-ca'),
('purchasable', '13', 'slug', 'en', 'pinky-fragments-en'),
('purchasable', '13', 'slug', 'es', 'pinky-fragments-es'),
('purchasable', '13', 'slug', 'fr', 'pinky-fragments-fr'),
('purchasable', '14', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '14', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '14', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '14', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '14', 'metaDescription', 'ca', 'I was there II Català'),
('purchasable', '14', 'metaDescription', 'en', 'I was there II English'),
('purchasable', '14', 'metaDescription', 'es', 'I was there II Spanish'),
('purchasable', '14', 'metaDescription', 'fr', 'I was there II Français'),
('purchasable', '14', 'metaKeywords', 'ca', 'I was there II Català'),
('purchasable', '14', 'metaKeywords', 'en', 'I was there II English'),
('purchasable', '14', 'metaKeywords', 'es', 'I was there II Spanish'),
('purchasable', '14', 'metaKeywords', 'fr', 'I was there II Français'),
('purchasable', '14', 'metaTitle', 'ca', 'I was there II Català'),
('purchasable', '14', 'metaTitle', 'en', 'I was there II English'),
('purchasable', '14', 'metaTitle', 'es', 'I was there II Spanish'),
('purchasable', '14', 'metaTitle', 'fr', 'I was there II Français'),
('purchasable', '14', 'name', 'ca', 'I was there II Català'),
('purchasable', '14', 'name', 'en', 'I was there II English'),
('purchasable', '14', 'name', 'es', 'I was there II Spanish'),
('purchasable', '14', 'name', 'fr', 'I was there II Français'),
('purchasable', '14', 'slug', 'ca', 'i-was-there-ii-ca'),
('purchasable', '14', 'slug', 'en', 'i-was-there-ii-en'),
('purchasable', '14', 'slug', 'es', 'i-was-there-ii-es'),
('purchasable', '14', 'slug', 'fr', 'i-was-there-ii-fr'),
('purchasable', '15', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '15', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '15', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '15', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '15', 'metaDescription', 'ca', 'Amnesia Català'),
('purchasable', '15', 'metaDescription', 'en', 'Amnesia English'),
('purchasable', '15', 'metaDescription', 'es', 'Amnesia Spanish'),
('purchasable', '15', 'metaDescription', 'fr', 'Amnesia Français'),
('purchasable', '15', 'metaKeywords', 'ca', 'Amnesia Català'),
('purchasable', '15', 'metaKeywords', 'en', 'Amnesia English'),
('purchasable', '15', 'metaKeywords', 'es', 'Amnesia Spanish'),
('purchasable', '15', 'metaKeywords', 'fr', 'Amnesia Français'),
('purchasable', '15', 'metaTitle', 'ca', 'Amnesia Català'),
('purchasable', '15', 'metaTitle', 'en', 'Amnesia English'),
('purchasable', '15', 'metaTitle', 'es', 'Amnesia Spanish'),
('purchasable', '15', 'metaTitle', 'fr', 'Amnesia Français'),
('purchasable', '15', 'name', 'ca', 'Amnesia Català'),
('purchasable', '15', 'name', 'en', 'Amnesia English'),
('purchasable', '15', 'name', 'es', 'Amnesia Spanish'),
('purchasable', '15', 'name', 'fr', 'Amnesia Français'),
('purchasable', '15', 'slug', 'ca', 'amnesia-ca'),
('purchasable', '15', 'slug', 'en', 'amnesia-en'),
('purchasable', '15', 'slug', 'es', 'amnesia-es'),
('purchasable', '15', 'slug', 'fr', 'amnesia-fr'),
('purchasable', '16', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '16', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '16', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '16', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '16', 'metaDescription', 'ca', 'Amnesia 100% Català'),
('purchasable', '16', 'metaDescription', 'en', 'Amnesia 100% English'),
('purchasable', '16', 'metaDescription', 'es', 'Amnesia 100% Spanish'),
('purchasable', '16', 'metaDescription', 'fr', 'Amnesia 100% Français'),
('purchasable', '16', 'metaKeywords', 'ca', 'Amnesia 100% Català'),
('purchasable', '16', 'metaKeywords', 'en', 'Amnesia 100% English'),
('purchasable', '16', 'metaKeywords', 'es', 'Amnesia 100% Spanish'),
('purchasable', '16', 'metaKeywords', 'fr', 'Amnesia 100% Français'),
('purchasable', '16', 'metaTitle', 'ca', 'Amnesia 100% Català'),
('purchasable', '16', 'metaTitle', 'en', 'Amnesia 100% English'),
('purchasable', '16', 'metaTitle', 'es', 'Amnesia 100% Spanish'),
('purchasable', '16', 'metaTitle', 'fr', 'Amnesia 100% Français'),
('purchasable', '16', 'name', 'ca', 'Amnesia 100% Català'),
('purchasable', '16', 'name', 'en', 'Amnesia 100% English'),
('purchasable', '16', 'name', 'es', 'Amnesia 100% Spanish'),
('purchasable', '16', 'name', 'fr', 'Amnesia 100% Français'),
('purchasable', '16', 'slug', 'ca', 'amnesia-100-percent-ca'),
('purchasable', '16', 'slug', 'en', 'amnesia-100-percent-en'),
('purchasable', '16', 'slug', 'es', 'amnesia-100-percent-es'),
('purchasable', '16', 'slug', 'fr', 'amnesia-100-percent-fr'),
('purchasable', '17', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '17', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '17', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '17', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '17', 'metaDescription', 'ca', 'A life style II Català'),
('purchasable', '17', 'metaDescription', 'en', 'A life style II English'),
('purchasable', '17', 'metaDescription', 'es', 'A life style II Spanish'),
('purchasable', '17', 'metaDescription', 'fr', 'A life style II Français'),
('purchasable', '17', 'metaKeywords', 'ca', 'A life style II Català'),
('purchasable', '17', 'metaKeywords', 'en', 'A life style II English'),
('purchasable', '17', 'metaKeywords', 'es', 'A life style II Spanish'),
('purchasable', '17', 'metaKeywords', 'fr', 'A life style II Français'),
('purchasable', '17', 'metaTitle', 'ca', 'A life style II Català'),
('purchasable', '17', 'metaTitle', 'en', 'A life style II English'),
('purchasable', '17', 'metaTitle', 'es', 'A life style II Spanish'),
('purchasable', '17', 'metaTitle', 'fr', 'A life style II Français'),
('purchasable', '17', 'name', 'ca', 'A life style II Català'),
('purchasable', '17', 'name', 'en', 'A life style II English'),
('purchasable', '17', 'name', 'es', 'A life style II Spanish'),
('purchasable', '17', 'name', 'fr', 'A life style II Français'),
('purchasable', '17', 'slug', 'ca', 'a-life-style-ii-ca'),
('purchasable', '17', 'slug', 'en', 'a-life-style-ii-en'),
('purchasable', '17', 'slug', 'es', 'a-life-style-ii-es'),
('purchasable', '17', 'slug', 'fr', 'a-life-style-ii-fr'),
('purchasable', '18', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '18', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '18', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '18', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '18', 'metaDescription', 'ca', 'All night long Català'),
('purchasable', '18', 'metaDescription', 'en', 'All night long English'),
('purchasable', '18', 'metaDescription', 'es', 'All night long Spanish'),
('purchasable', '18', 'metaDescription', 'fr', 'All night long Français'),
('purchasable', '18', 'metaKeywords', 'ca', 'All night long Català'),
('purchasable', '18', 'metaKeywords', 'en', 'All night long English'),
('purchasable', '18', 'metaKeywords', 'es', 'All night long Spanish'),
('purchasable', '18', 'metaKeywords', 'fr', 'All night long Français'),
('purchasable', '18', 'metaTitle', 'ca', 'All night long Català'),
('purchasable', '18', 'metaTitle', 'en', 'All night long English'),
('purchasable', '18', 'metaTitle', 'es', 'All night long Spanish'),
('purchasable', '18', 'metaTitle', 'fr', 'All night long Français'),
('purchasable', '18', 'name', 'ca', 'All night long Català'),
('purchasable', '18', 'name', 'en', 'All night long English'),
('purchasable', '18', 'name', 'es', 'All night long Spanish'),
('purchasable', '18', 'name', 'fr', 'All night long Français'),
('purchasable', '18', 'slug', 'ca', 'all-night-long-ca'),
('purchasable', '18', 'slug', 'en', 'all-night-long-en'),
('purchasable', '18', 'slug', 'es', 'all-night-long-es'),
('purchasable', '18', 'slug', 'fr', 'all-night-long-fr'),
('purchasable', '19', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '19', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '19', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '19', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '19', 'metaDescription', 'ca', 'A.M. Nesia Ibiza II Català'),
('purchasable', '19', 'metaDescription', 'en', 'A.M. Nesia Ibiza II English'),
('purchasable', '19', 'metaDescription', 'es', 'A.M. Nesia Ibiza II Spanish'),
('purchasable', '19', 'metaDescription', 'fr', 'A.M. Nesia Ibiza II Français'),
('purchasable', '19', 'metaKeywords', 'ca', 'A.M. Nesia Ibiza II Català'),
('purchasable', '19', 'metaKeywords', 'en', 'A.M. Nesia Ibiza II English'),
('purchasable', '19', 'metaKeywords', 'es', 'A.M. Nesia Ibiza II Spanish'),
('purchasable', '19', 'metaKeywords', 'fr', 'A.M. Nesia Ibiza II Français'),
('purchasable', '19', 'metaTitle', 'ca', 'A.M. Nesia Ibiza II Català'),
('purchasable', '19', 'metaTitle', 'en', 'A.M. Nesia Ibiza II English'),
('purchasable', '19', 'metaTitle', 'es', 'A.M. Nesia Ibiza II Spanish'),
('purchasable', '19', 'metaTitle', 'fr', 'A.M. Nesia Ibiza II Français'),
('purchasable', '19', 'name', 'ca', 'A.M. Nesia Ibiza II Català'),
('purchasable', '19', 'name', 'en', 'A.M. Nesia Ibiza II English'),
('purchasable', '19', 'name', 'es', 'A.M. Nesia Ibiza II Spanish'),
('purchasable', '19', 'name', 'fr', 'A.M. Nesia Ibiza II Français'),
('purchasable', '19', 'slug', 'ca', 'a-m-nesia-ibiza-ii-ca'),
('purchasable', '19', 'slug', 'en', 'a-m-nesia-ibiza-ii-en'),
('purchasable', '19', 'slug', 'es', 'a-m-nesia-ibiza-ii-es'),
('purchasable', '19', 'slug', 'fr', 'a-m-nesia-ibiza-ii-fr'),
('purchasable', '20', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '20', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '20', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '20', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '20', 'metaDescription', 'ca', 'High Pyramid Català'),
('purchasable', '20', 'metaDescription', 'en', 'High Pyramid English'),
('purchasable', '20', 'metaDescription', 'es', 'High Pyramid Spanish'),
('purchasable', '20', 'metaDescription', 'fr', 'High Pyramid Français'),
('purchasable', '20', 'metaKeywords', 'ca', 'High Pyramid Català'),
('purchasable', '20', 'metaKeywords', 'en', 'High Pyramid English'),
('purchasable', '20', 'metaKeywords', 'es', 'High Pyramid Spanish'),
('purchasable', '20', 'metaKeywords', 'fr', 'High Pyramid Français'),
('purchasable', '20', 'metaTitle', 'ca', 'High Pyramid Català'),
('purchasable', '20', 'metaTitle', 'en', 'High Pyramid English'),
('purchasable', '20', 'metaTitle', 'es', 'High Pyramid Spanish'),
('purchasable', '20', 'metaTitle', 'fr', 'High Pyramid Français'),
('purchasable', '20', 'name', 'ca', 'High Pyramid Català'),
('purchasable', '20', 'name', 'en', 'High Pyramid English'),
('purchasable', '20', 'name', 'es', 'High Pyramid Spanish'),
('purchasable', '20', 'name', 'fr', 'High Pyramid Français'),
('purchasable', '20', 'slug', 'ca', 'high-pyramid-ca'),
('purchasable', '20', 'slug', 'en', 'high-pyramid-en'),
('purchasable', '20', 'slug', 'es', 'high-pyramid-es'),
('purchasable', '20', 'slug', 'fr', 'high-pyramid-fr'),
('purchasable', '21', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '21', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '21', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '21', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '21', 'metaDescription', 'ca', 'Star Amnesia Català'),
('purchasable', '21', 'metaDescription', 'en', 'Star Amnesia English'),
('purchasable', '21', 'metaDescription', 'es', 'Star Amnesia Spanish'),
('purchasable', '21', 'metaDescription', 'fr', 'Star Amnesia Français'),
('purchasable', '21', 'metaKeywords', 'ca', 'Star Amnesia Català'),
('purchasable', '21', 'metaKeywords', 'en', 'Star Amnesia English'),
('purchasable', '21', 'metaKeywords', 'es', 'Star Amnesia Spanish'),
('purchasable', '21', 'metaKeywords', 'fr', 'Star Amnesia Français'),
('purchasable', '21', 'metaTitle', 'ca', 'Star Amnesia Català'),
('purchasable', '21', 'metaTitle', 'en', 'Star Amnesia English'),
('purchasable', '21', 'metaTitle', 'es', 'Star Amnesia Spanish'),
('purchasable', '21', 'metaTitle', 'fr', 'Star Amnesia Français'),
('purchasable', '21', 'name', 'ca', 'Star Amnesia Català'),
('purchasable', '21', 'name', 'en', 'Star Amnesia English'),
('purchasable', '21', 'name', 'es', 'Star Amnesia Spanish'),
('purchasable', '21', 'name', 'fr', 'Star Amnesia Français'),
('purchasable', '21', 'slug', 'ca', 'star-amnesia-ca'),
('purchasable', '21', 'slug', 'en', 'star-amnesia-en'),
('purchasable', '21', 'slug', 'es', 'star-amnesia-es'),
('purchasable', '21', 'slug', 'fr', 'star-amnesia-fr'),
('purchasable', '22', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '22', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '22', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '22', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '22', 'metaDescription', 'ca', 'Ibiza 4 Ever Català'),
('purchasable', '22', 'metaDescription', 'en', 'Ibiza 4 Ever English'),
('purchasable', '22', 'metaDescription', 'es', 'Ibiza 4 Ever Spanish'),
('purchasable', '22', 'metaDescription', 'fr', 'Ibiza 4 Ever Français'),
('purchasable', '22', 'metaKeywords', 'ca', 'Ibiza 4 Ever Català'),
('purchasable', '22', 'metaKeywords', 'en', 'Ibiza 4 Ever English'),
('purchasable', '22', 'metaKeywords', 'es', 'Ibiza 4 Ever Spanish'),
('purchasable', '22', 'metaKeywords', 'fr', 'Ibiza 4 Ever Français'),
('purchasable', '22', 'metaTitle', 'ca', 'Ibiza 4 Ever Català'),
('purchasable', '22', 'metaTitle', 'en', 'Ibiza 4 Ever English'),
('purchasable', '22', 'metaTitle', 'es', 'Ibiza 4 Ever Spanish'),
('purchasable', '22', 'metaTitle', 'fr', 'Ibiza 4 Ever Français'),
('purchasable', '22', 'name', 'ca', 'Ibiza 4 Ever Català'),
('purchasable', '22', 'name', 'en', 'Ibiza 4 Ever English'),
('purchasable', '22', 'name', 'es', 'Ibiza 4 Ever Spanish'),
('purchasable', '22', 'name', 'fr', 'Ibiza 4 Ever Français'),
('purchasable', '22', 'slug', 'ca', 'ibiza-4-ever-ca'),
('purchasable', '22', 'slug', 'en', 'ibiza-4-ever-en'),
('purchasable', '22', 'slug', 'es', 'ibiza-4-ever-es'),
('purchasable', '22', 'slug', 'fr', 'ibiza-4-ever-fr'),
('purchasable', '23', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '23', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '23', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '23', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '23', 'metaDescription', 'ca', 'Pack 4 flavors Català'),
('purchasable', '23', 'metaDescription', 'en', 'Pack 4 flqueavors English'),
('purchasable', '23', 'metaDescription', 'es', 'Pack 4 flavors Spanish'),
('purchasable', '23', 'metaDescription', 'fr', 'Pack 4 flavors Français'),
('purchasable', '23', 'metaKeywords', 'ca', 'Pack 4 flavors Català'),
('purchasable', '23', 'metaKeywords', 'en', 'Pack 4 flavors English'),
('purchasable', '23', 'metaKeywords', 'es', 'Pack 4 flavors Spanish'),
('purchasable', '23', 'metaKeywords', 'fr', 'Pack 4 flavors Français'),
('purchasable', '23', 'metaTitle', 'ca', 'Pack 4 flavors Català'),
('purchasable', '23', 'metaTitle', 'en', 'Pack 4 flavors English'),
('purchasable', '23', 'metaTitle', 'es', 'Pack 4 flavors Spanish'),
('purchasable', '23', 'metaTitle', 'fr', 'Pack 4 flavors Français'),
('purchasable', '23', 'name', 'ca', 'Pack 4 flavors Català'),
('purchasable', '23', 'name', 'en', 'Pack 4 flavors English'),
('purchasable', '23', 'name', 'es', 'Pack 4 flavors Spanish'),
('purchasable', '23', 'name', 'fr', 'Pack 4 flavors Français'),
('purchasable', '23', 'slug', 'ca', 'pack-4-flavors-ca'),
('purchasable', '23', 'slug', 'en', 'pack-4-flavors-en'),
('purchasable', '23', 'slug', 'es', 'pack-4-flavors-es'),
('purchasable', '23', 'slug', 'fr', 'pack-4-flavors-fr'),
('purchasable', '6', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '6', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '6', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '6', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '6', 'metaDescription', 'ca', 'Ibiza Banana Català'),
('purchasable', '6', 'metaDescription', 'en', 'Ibiza Banana English'),
('purchasable', '6', 'metaDescription', 'es', 'Ibiza Banana Spanish'),
('purchasable', '6', 'metaDescription', 'fr', 'Ibiza Banana Français'),
('purchasable', '6', 'metaKeywords', 'ca', 'Ibiza Banana Català'),
('purchasable', '6', 'metaKeywords', 'en', 'Ibiza Banana English'),
('purchasable', '6', 'metaKeywords', 'es', 'Ibiza Banana Spanish'),
('purchasable', '6', 'metaKeywords', 'fr', 'Ibiza Banana Français'),
('purchasable', '6', 'metaTitle', 'ca', 'Ibiza Banana Català'),
('purchasable', '6', 'metaTitle', 'en', 'Ibiza Banana English'),
('purchasable', '6', 'metaTitle', 'es', 'Ibiza Banana Spanish'),
('purchasable', '6', 'metaTitle', 'fr', 'Ibiza Banana Français'),
('purchasable', '6', 'name', 'ca', 'Ibiza Banana Català'),
('purchasable', '6', 'name', 'en', 'Ibiza Banana English'),
('purchasable', '6', 'name', 'es', 'Ibiza Banana Spanish'),
('purchasable', '6', 'name', 'fr', 'Ibiza Banana Français'),
('purchasable', '6', 'slug', 'ca', 'ibiza-banana-ca'),
('purchasable', '6', 'slug', 'en', 'ibiza-banana-en'),
('purchasable', '6', 'slug', 'es', 'ibiza-banana-es'),
('purchasable', '6', 'slug', 'fr', 'ibiza-banana-fr'),
('purchasable', '7', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '7', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '7', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '7', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '7', 'metaDescription', 'ca', 'I Was There Català'),
('purchasable', '7', 'metaDescription', 'en', 'I Was There English'),
('purchasable', '7', 'metaDescription', 'es', 'I Was There Spanish'),
('purchasable', '7', 'metaDescription', 'fr', 'I Was There Français'),
('purchasable', '7', 'metaKeywords', 'ca', 'I Was There Català'),
('purchasable', '7', 'metaKeywords', 'en', 'I Was There English'),
('purchasable', '7', 'metaKeywords', 'es', 'I Was There Spanish'),
('purchasable', '7', 'metaKeywords', 'fr', 'I Was There Français'),
('purchasable', '7', 'metaTitle', 'ca', 'I Was There Català'),
('purchasable', '7', 'metaTitle', 'en', 'I Was There English'),
('purchasable', '7', 'metaTitle', 'es', 'I Was There Spanish'),
('purchasable', '7', 'metaTitle', 'fr', 'I Was There Français'),
('purchasable', '7', 'name', 'ca', 'I Was There Català'),
('purchasable', '7', 'name', 'en', 'I Was There English'),
('purchasable', '7', 'name', 'es', 'I Was There Spanish'),
('purchasable', '7', 'name', 'fr', 'I Was There Français'),
('purchasable', '7', 'slug', 'ca', 'i-was-there-ca'),
('purchasable', '7', 'slug', 'en', 'i-was-there-en'),
('purchasable', '7', 'slug', 'es', 'i-was-there-es'),
('purchasable', '7', 'slug', 'fr', 'i-was-there-fr'),
('purchasable', '8', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '8', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '8', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '8', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '8', 'metaDescription', 'ca', 'A Life Style Català'),
('purchasable', '8', 'metaDescription', 'en', 'A Life Style English'),
('purchasable', '8', 'metaDescription', 'es', 'A Life Style Spanish'),
('purchasable', '8', 'metaDescription', 'fr', 'A Life Style Français'),
('purchasable', '8', 'metaKeywords', 'ca', 'A Life Style Català'),
('purchasable', '8', 'metaKeywords', 'en', 'A Life Style English'),
('purchasable', '8', 'metaKeywords', 'es', 'A Life Style Spanish'),
('purchasable', '8', 'metaKeywords', 'fr', 'A Life Style Français'),
('purchasable', '8', 'metaTitle', 'ca', 'A Life Style Català'),
('purchasable', '8', 'metaTitle', 'en', 'A Life Style English'),
('purchasable', '8', 'metaTitle', 'es', 'A Life Style Spanish'),
('purchasable', '8', 'metaTitle', 'fr', 'A Life Style Français'),
('purchasable', '8', 'name', 'ca', 'A Life Style Català'),
('purchasable', '8', 'name', 'en', 'A Life Style English'),
('purchasable', '8', 'name', 'es', 'A Life Style Spanish'),
('purchasable', '8', 'name', 'fr', 'A Life Style Français'),
('purchasable', '8', 'slug', 'ca', 'a-life-style-ca'),
('purchasable', '8', 'slug', 'en', 'a-life-style-en'),
('purchasable', '8', 'slug', 'es', 'a-life-style-es'),
('purchasable', '8', 'slug', 'fr', 'a-life-style-fr');
INSERT INTO `entity_translation` (`entity_type`, `entity_id`, `entity_field`, `locale`, `translation`) VALUES
('purchasable', '9', 'description', 'ca', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '9', 'description', 'en', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '9', 'description', 'es', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '9', 'description', 'fr', 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.'),
('purchasable', '9', 'metaDescription', 'ca', 'A.M. Nesia Ibiza Català'),
('purchasable', '9', 'metaDescription', 'en', 'A.M. Nesia Ibiza English'),
('purchasable', '9', 'metaDescription', 'es', 'A.M. Nesia Ibiza Spanish'),
('purchasable', '9', 'metaDescription', 'fr', 'A.M. Nesia Ibiza Français'),
('purchasable', '9', 'metaKeywords', 'ca', 'A.M. Nesia Ibiza Català'),
('purchasable', '9', 'metaKeywords', 'en', 'A.M. Nesia Ibiza English'),
('purchasable', '9', 'metaKeywords', 'es', 'A.M. Nesia Ibiza Spanish'),
('purchasable', '9', 'metaKeywords', 'fr', 'A.M. Nesia Ibiza Français'),
('purchasable', '9', 'metaTitle', 'ca', 'A.M. Nesia Ibiza Català'),
('purchasable', '9', 'metaTitle', 'en', 'A.M. Nesia Ibiza English'),
('purchasable', '9', 'metaTitle', 'es', 'A.M. Nesia Ibiza Spanish'),
('purchasable', '9', 'metaTitle', 'fr', 'A.M. Nesia Ibiza Français'),
('purchasable', '9', 'name', 'ca', 'A.M. Nesia Ibiza Català'),
('purchasable', '9', 'name', 'en', 'A.M. Nesia Ibiza English'),
('purchasable', '9', 'name', 'es', 'A.M. Nesia Ibiza Spanish'),
('purchasable', '9', 'name', 'fr', 'A.M. Nesia Ibiza Français'),
('purchasable', '9', 'slug', 'ca', 'a-m-nesia-ibiza-ca'),
('purchasable', '9', 'slug', 'en', 'a-m-nesia-ibiza-en'),
('purchasable', '9', 'slug', 'es', 'a-m-nesia-ibiza-es'),
('purchasable', '9', 'slug', 'fr', 'a-m-nesia-ibiza-fr');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `image`
--

INSERT INTO `image` (`id`, `name`, `content_type`, `extension`, `size`, `width`, `height`, `created_at`, `updated_at`, `enabled`) VALUES
(1, 'product-1.jpg', 'image/jpeg', 'jpg', 87315, 640, 500, '2016-10-11 21:48:39', '2016-10-11 21:48:39', 1),
(2, 'product-2.jpg', 'image/jpeg', 'jpg', 96768, 640, 500, '2016-10-11 21:48:40', '2016-10-11 21:48:40', 1),
(3, 'product-3.jpg', 'image/jpeg', 'jpg', 88868, 640, 500, '2016-10-11 21:48:40', '2016-10-11 21:48:40', 1),
(4, 'product-4.jpg', 'image/jpeg', 'jpg', 88341, 640, 500, '2016-10-11 21:48:42', '2016-10-11 21:48:42', 1),
(5, 'product-5.jpg', 'image/jpeg', 'jpg', 78984, 640, 500, '2016-10-11 21:48:43', '2016-10-11 21:48:43', 1),
(6, 'product-6.jpg', 'image/jpeg', 'jpg', 95480, 640, 500, '2016-10-11 21:48:44', '2016-10-11 21:48:44', 1),
(7, 'product-7.jpg', 'image/jpeg', 'jpg', 91752, 640, 500, '2016-10-11 21:48:44', '2016-10-11 21:48:44', 1),
(8, 'product-8.jpg', 'image/jpeg', 'jpg', 70130, 640, 500, '2016-10-11 21:48:44', '2016-10-11 21:48:44', 1),
(9, 'product-9.jpg', 'image/jpeg', 'jpg', 95125, 640, 500, '2016-10-11 21:48:44', '2016-10-11 21:48:44', 1),
(10, 'product-10.jpg', 'image/jpeg', 'jpg', 67072, 640, 500, '2016-10-11 21:48:45', '2016-10-11 21:48:45', 1),
(11, 'product-11.jpg', 'image/jpeg', 'jpg', 70903, 640, 500, '2016-10-11 21:48:45', '2016-10-11 21:48:45', 1),
(12, 'product-12.jpg', 'image/jpeg', 'jpg', 61746, 640, 500, '2016-10-11 21:48:45', '2016-10-11 21:48:45', 1),
(13, 'product-13.jpg', 'image/jpeg', 'jpg', 85726, 640, 500, '2016-10-11 21:48:45', '2016-10-11 21:48:45', 1),
(14, 'product-14.jpg', 'image/jpeg', 'jpg', 68803, 640, 500, '2016-10-11 21:48:45', '2016-10-11 21:48:45', 1),
(15, 'product-15.jpg', 'image/jpeg', 'jpg', 67269, 640, 500, '2016-10-11 21:48:45', '2016-10-11 21:48:45', 1),
(16, 'product-16.jpg', 'image/jpeg', 'jpg', 82135, 640, 500, '2016-10-11 21:48:45', '2016-10-11 21:48:45', 1),
(17, 'product-17.jpg', 'image/jpeg', 'jpg', 86434, 640, 500, '2016-10-11 21:48:45', '2016-10-11 21:48:45', 1),
(18, 'product-18.jpg', 'image/jpeg', 'jpg', 74483, 640, 500, '2016-10-11 21:48:45', '2016-10-11 21:48:45', 1),
(19, 'pack-1.jpg', 'image/jpeg', 'jpg', 87727, 640, 500, '2016-10-11 21:48:47', '2016-10-11 21:48:47', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `language`
--

CREATE TABLE `language` (
  `iso` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `language`
--

INSERT INTO `language` (`iso`, `name`, `enabled`) VALUES
('af', 'Afrikaans', 0),
('ar', 'Arabic', 0),
('az', 'Azerbaijani', 0),
('be', 'Belarusian', 0),
('bg', 'Bulgarian', 0),
('bn', 'Bengali', 0),
('ca', 'Catalan', 1),
('cs', 'Czech', 0),
('cy', 'Welsh', 0),
('da', 'Danish', 0),
('de', 'German', 1),
('el', 'Greek', 0),
('en', 'English', 1),
('eo', 'Esperanto', 0),
('es', 'Spanish', 1),
('et', 'Estonian', 0),
('eu', 'Basque', 0),
('fa', 'Persian', 0),
('fi', 'Finnish', 1),
('fr', 'French', 1),
('ga', 'Irish', 0),
('gl', 'Galician', 1),
('gu', 'Gujarati', 0),
('hi', 'Hindi', 0),
('hr', 'Croatian', 0),
('ht', 'Haitian Creole', 0),
('hu', 'Hungarian', 0),
('id', 'Indonesian', 0),
('is', 'Icelandic', 0),
('it', 'Italian', 0),
('iw', 'Hebrew', 0),
('ja', 'Japanese', 0),
('ka', 'Georgian', 0),
('kn', 'Kannada', 0),
('ko', 'Korean', 0),
('la', 'Latin', 0),
('lt', 'Lithuanian', 0),
('lv', 'Latvian', 0),
('mk', 'Macedonian', 0),
('ms', 'Malay', 0),
('mt', 'Maltese', 0),
('nl', 'Dutch', 0),
('no', 'Norwegian', 0),
('pl', 'Polish', 0),
('pt', 'Portuguese', 0),
('ro', 'Romanian', 0),
('ru', 'Russian', 0),
('sk', 'Slovak', 0),
('sl', 'Slovenian', 0),
('sq', 'Albanian', 0),
('sr', 'Serbian', 1),
('sv', 'Swedish', 0),
('sw', 'Swahili', 0),
('ta', 'Tamil', 0),
('te', 'Telugu', 0),
('th', 'Thai', 0),
('tl', 'Filipino', 0),
('tr', 'Turkish', 0),
('uk', 'Ukrainian', 0),
('ur', 'Urdu', 0),
('vi', 'Vietnamese', 0),
('yi', 'Yiddish', 0),
('zh-CN', 'Chinese Simplified', 0),
('zh-TW', 'Chinese Traditional', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `location`
--

CREATE TABLE `location` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `location_inheritance`
--

CREATE TABLE `location_inheritance` (
  `parent_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `children_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manufacturer`
--

CREATE TABLE `manufacturer` (
  `id` int(11) NOT NULL,
  `principal_image_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `images_sort` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `manufacturer`
--

INSERT INTO `manufacturer` (`id`, `principal_image_id`, `name`, `slug`, `description`, `images_sort`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`, `enabled`) VALUES
(1, NULL, 'levis', 'levis', 'Levis manufacturer', '', NULL, NULL, NULL, '2016-10-11 21:48:17', '2016-10-11 21:48:17', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manufacturer_image`
--

CREATE TABLE `manufacturer_image` (
  `product_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `code`, `description`, `enabled`) VALUES
(1, 'admin', 'Admin menu', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_node`
--

CREATE TABLE `menu_node` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active_urls` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_node_hierarchy`
--

CREATE TABLE `menu_node_hierarchy` (
  `menu_node_id` int(11) NOT NULL,
  `menu_subnode_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metric_entry`
--

CREATE TABLE `metric_entry` (
  `id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20160131002537');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `newsletter_subscription`
--

CREATE TABLE `newsletter_subscription` (
  `id` int(11) NOT NULL,
  `language_iso` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reason` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `node_hierarchy`
--

CREATE TABLE `node_hierarchy` (
  `menu_node_id` int(11) NOT NULL,
  `menu_subnode_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `payment_last_state_line_id` int(11) NOT NULL,
  `shipping_last_state_line_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `currency_iso` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `purchasable_currency_iso` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `coupon_currency_iso` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_currency_iso` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_address_id` int(11) DEFAULT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `purchasable_amount` int(11) NOT NULL,
  `coupon_amount` int(11) DEFAULT NULL,
  `shipping_amount` int(11) DEFAULT NULL,
  `shipping_method` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `shipping_method_extra` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `payment_method` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `payment_method_extra` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `amount` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_coupon`
--

CREATE TABLE `order_coupon` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `amount_currency_iso` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_line`
--

CREATE TABLE `order_line` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `purchasable_currency_iso` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `currency_iso` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `purchasable_id` int(11) DEFAULT NULL,
  `purchasable_amount` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pack`
--

CREATE TABLE `pack` (
  `id` int(11) NOT NULL,
  `stock_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pack`
--

INSERT INTO `pack` (`id`, `stock_type`) VALUES
(23, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pack_purchasable`
--

CREATE TABLE `pack_purchasable` (
  `pack_id` int(11) NOT NULL,
  `purchasable_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pack_purchasable`
--

INSERT INTO `pack_purchasable` (`pack_id`, `purchasable_id`) VALUES
(23, 2),
(23, 6),
(23, 7),
(23, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publication_date` datetime DEFAULT NULL,
  `persistent` tinyint(1) NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `page`
--

INSERT INTO `page` (`id`, `name`, `title`, `content`, `type`, `path`, `publication_date`, `persistent`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`, `enabled`) VALUES
(1, NULL, 'Hola mundo', 'Hola amigos.\n\nNuestra más humilde bienvenida a nuestro blog.\n\nEn este blog encontrarás las últimas novedades, así como todas las noticias relacionadas con nuestra tienda.\n\nNo dudéis en dejar vuestros comentarios e impresiones, así como sugerencias y opiniones. Éstos nos serán de extrema ayuda para mejorar nuestro producto y poder seguir trabajando para darle un mejor servicio cada dia.\n\nSalutaciones y esperamos verle de nuevo.', 2, 'hola-mundo', '2016-10-11 21:48:17', 0, NULL, NULL, NULL, '2016-10-11 21:48:17', '2016-10-11 21:48:17', 1),
(2, NULL, 'Sobre nosotros', 'Sobre nosotros', 1, 'sobre-nosotros', '2016-10-11 21:48:17', 0, 'Sobre nosotros', 'Sobre nosotros', 'sobre,nosotros', '2016-10-11 21:48:17', '2016-10-11 21:48:17', 1),
(3, NULL, 'Términos y condiciones', 'Términos y condiciones', 1, 'terminos-y-condiciones', '2016-10-11 21:48:17', 0, 'Términos y condiciones', 'Términos y condiciones', 'términos,condiciones', '2016-10-11 21:48:17', '2016-10-11 21:48:17', 1),
(4, 'order_confirmation', 'Confirmación de pedido', 'Pedido confirmado para {{ customer.fullname }}.', 3, NULL, '2016-10-11 21:48:17', 1, NULL, NULL, NULL, '2016-10-11 21:48:17', '2016-10-11 21:48:17', 1),
(5, 'order_shipped', 'Aviso de envío de pedido para el cliente', 'Hola {{ customer.fullname }}. Su pedido acaba de ser mandado.', 3, NULL, '2016-10-11 21:48:17', 1, NULL, NULL, NULL, '2016-10-11 21:48:17', '2016-10-11 21:48:17', 1),
(6, 'customer_registration', 'Confirmación de registro', 'Bienvenido {{ customer.fullname }},<br/><br/>\n\nTu cuenta se ha creado correctamente.<br/>\nDeseamos que en nuestra tienda encuentres productos de tu agrado y que el proceso de compra te resulte lo más cómodo posible.<br/><br/>\n\nAtentamente,', 3, NULL, '2016-10-11 21:48:17', 1, NULL, NULL, NULL, '2016-10-11 21:48:17', '2016-10-11 21:48:17', 1),
(7, 'password_remember', 'Recordatorio de contraseña', 'Hola {{ customer.fullname }}. Para recuperar tu contraseña entra en <a href="{{ remember_url }}">este enlace</a>.', 3, NULL, '2016-10-11 21:48:17', 1, NULL, NULL, NULL, '2016-10-11 21:48:17', '2016-10-11 21:48:17', 1),
(8, 'password_recover', 'Contraseña recuperada', 'Hola {{ customer.fullname }}. Tu contraseña ha sido recuperada.', 3, NULL, '2016-10-11 21:48:17', 1, NULL, NULL, NULL, '2016-10-11 21:48:17', '2016-10-11 21:48:17', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_state_lines`
--

CREATE TABLE `payment_state_lines` (
  `order_id` int(11) NOT NULL,
  `state_line_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plugin`
--

CREATE TABLE `plugin` (
  `namespace` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `plugin_configuration` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `plugin`
--

INSERT INTO `plugin` (`namespace`, `hash`, `type`, `category`, `enabled`, `plugin_configuration`) VALUES
('Elcodi\\Plugin\\BankwireBundle\\ElcodiBankwireBundle', '7dfb108b18622a3b3a8e89789352e497fe739f60', 'plugin', 'payment', 1, '{"category":"payment","name":"elcodi_plugin.bankwire.name","description":"elcodi_plugin.bankwire.description","enabled_by_default":true,"visible":true,"fa_icon":null,"fields":[]}'),
('Elcodi\\Plugin\\CustomShippingBundle\\ElcodiCustomShippingBundle', '9c7614228c491b0908c02805ca1cc32d43ef4e0b', 'plugin', 'shipping', 1, '{"category":"shipping","name":"elcodi_plugin.custom_shipping.name","description":"elcodi_plugin.custom_shipping.description","fa_icon":"truck","visible":false,"enabled_by_default":true,"fields":[]}'),
('Elcodi\\Plugin\\DisqusBundle\\ElcodiDisqusBundle', '9d9735ca6b75c3708315c12c0cd3fa5fad42a4f9', 'plugin', 'app', 0, '{"category":"app","name":"elcodi_plugin.disqus.name","description":"elcodi_plugin.disqus.description","fa_icon":"comment-o","fields":{"disqus_identifier":{"type":"text","label":"elcodi_plugin.disqus.field.disqus_identifier.label","attr":{"placeholder":"elcodi_plugin.disqus.field.disqus_identifier.placeholder"},"required":false,"data":null,"options":[]},"disqus_enabled_product":{"type":"checkbox","label":"elcodi_plugin.disqus.field.disqus_enabled_product.label","required":false,"data":null,"options":[],"attr":[]},"disqus_enabled_blog_post":{"type":"checkbox","label":"elcodi_plugin.disqus.field.disqus_enabled_blog_post.label","required":false,"data":null,"options":[],"attr":[]}},"visible":true,"enabled_by_default":false}'),
('Elcodi\\Plugin\\FacebookBundle\\ElcodiFacebookBundle', '80cff34b60a472391549719c3b8fe00482e3a80a', 'plugin', 'social', 0, '{"category":"social","name":"elcodi_plugin.facebook.name","description":"elcodi_plugin.facebook.description","fa_icon":"facebook","fields":{"facebook_account":{"type":"text","label":"elcodi_plugin.facebook.field.facebook_account.label","attr":{"placeholder":"elcodi_plugin.facebook.field.facebook_account.placeholder"},"required":false,"data":null,"options":[]}},"visible":true,"enabled_by_default":false}'),
('Elcodi\\Plugin\\FreePaymentBundle\\ElcodiFreePaymentBundle', '5e6072352527aca617da73bf2cb32082a31f14f5', 'plugin', 'payment', 1, '{"category":"payment","name":"elcodi_plugin.free_payment.name","description":"elcodi_plugin.free_payment.description","enabled_by_default":true,"visible":true,"fa_icon":null,"fields":[]}'),
('Elcodi\\Plugin\\GoogleAnalyticsBundle\\ElcodiGoogleAnalyticsBundle', '9ac9ee19b0d95f4dbbb6fccbae43920bcd992e40', 'plugin', 'app', 0, '{"category":"app","name":"elcodi_plugin.google_analytics.name","description":"elcodi_plugin.google_analytics.description","fa_icon":"google","fields":{"analytics_tracker_id":{"type":"text","label":"elcodi_plugin.google_analytics.field.analytics_tracker_id.label","required":true,"attr":{"placeholder":"elcodi_plugin.google_analytics.field.analytics_tracker_id.placeholder"},"data":null,"options":[]}},"visible":true,"enabled_by_default":false}'),
('Elcodi\\Plugin\\PaypalWebCheckoutBundle\\ElcodiPaypalWebCheckoutBundle', '82db41612c6a3db4aa040c33ebedffbd57b92511', 'plugin', 'payment', 0, '{"category":"payment","name":"elcodi_plugin.paypal_web_checkout.name","description":"elcodi_plugin.paypal_web_checkout.description","fa_icon":"paypal","fields":{"business":{"type":"text","required":true,"label":"elcodi_plugin.paypal_web_checkout.field.business.label","attr":{"placeholder":"elcodi_plugin.paypal_web_checkout.field.business.placeholder"},"data":null,"options":[]}},"visible":true,"enabled_by_default":false}'),
('Elcodi\\Plugin\\PinterestBundle\\ElcodiPinterestBundle', '6cfefe23b31d185dca147aaf1e10dbb27f2677a4', 'plugin', 'social', 0, '{"category":"social","name":"elcodi_plugin.pinterest.name","description":"elcodi_plugin.pinterest.description","fa_icon":"pinterest","fields":{"asynchronous":{"type":"checkbox","label":"elcodi_plugin.pinterest.field.asynchronous.label","required":false,"data":null,"options":[],"attr":[]}},"visible":true,"enabled_by_default":false}'),
('Elcodi\\Plugin\\ProductCsvBundle\\ElcodiProductCsvBundle', 'deb2dfe68e01541c28e22529f75bc6223fddd605', 'plugin', 'app', 0, '{"category":"app","name":"elcodi_plugin.product_csv.name","description":"elcodi_plugin.product_csv.description","visible":true,"fa_icon":null,"enabled_by_default":false,"fields":[]}'),
('Elcodi\\Plugin\\StoreSetupWizardBundle\\ElcodiStoreSetupWizardBundle', 'bb5eb5bbab39438a95fbe46e8ee7aeb77fbdb1c5', 'plugin', NULL, 1, '{"name":"elcodi_plugin.setup_wizard.name","description":"elcodi_plugin.setup_wizard.description","fa_icon":"magic","visible":false,"enabled_by_default":true,"category":null,"fields":[]}'),
('Elcodi\\Plugin\\StoreTemplateBundle\\StoreTemplateBundle', '2f1614601b2241b90c05cb67bc08f1ab7ba52af0', 'template', NULL, 1, '{"name":"Default Template","enabled_by_default":true,"category":null,"visible":true,"fa_icon":null,"description":null,"fields":[]}'),
('Elcodi\\Plugin\\StripeBundle\\ElcodiStripeBundle', '887ee51dc5572759c418db09b66988664f0ecbc1', 'plugin', 'payment', 0, '{"category":"payment","name":"elcodi_plugin.stripe.name","description":"elcodi_plugin.stripe.description","fa_icon":"cc-stripe","fields":{"private_key":{"type":"text","required":true,"label":"elcodi_plugin.stripe.field.private_key.label","data":null,"options":[],"attr":[]},"public_key":{"type":"text","required":true,"label":"elcodi_plugin.stripe.field.public_key.label","data":null,"options":[],"attr":[]}},"visible":true,"enabled_by_default":false}'),
('Elcodi\\Plugin\\TwitterBundle\\ElcodiTwitterBundle', '49b9dc09a852520a5c6df02e6740bf6bb7502890', 'plugin', 'social', 0, '{"category":"social","name":"elcodi_plugin.twitter.name","description":"elcodi_plugin.twitter.description","fa_icon":"twitter","fields":{"twitter_account":{"type":"text","label":"elcodi_plugin.twitter.field.twitter_account.label","attr":{"placeholder":"elcodi_plugin.twitter.field.twitter_account.placeholder"},"required":false,"data":null,"options":[]}},"visible":true,"enabled_by_default":false}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `principal_variant_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `principal_variant_id`) VALUES
(1, NULL),
(6, NULL),
(7, NULL),
(8, NULL),
(9, NULL),
(10, NULL),
(11, NULL),
(12, NULL),
(13, NULL),
(14, NULL),
(15, NULL),
(16, NULL),
(17, NULL),
(18, NULL),
(19, NULL),
(20, NULL),
(21, NULL),
(22, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_attribute`
--

CREATE TABLE `product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `product_attribute`
--

INSERT INTO `product_attribute` (`product_id`, `attribute_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchasable`
--

CREATE TABLE `purchasable` (
  `id` int(11) NOT NULL,
  `principal_category_id` int(11) DEFAULT NULL,
  `principal_image_id` int(11) DEFAULT NULL,
  `price_currency_iso` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reduced_price_currency_iso` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `show_in_home` tinyint(1) DEFAULT NULL,
  `dimensions` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `reduced_price` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `images_sort` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `purchasable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `purchasable`
--

INSERT INTO `purchasable` (`id`, `principal_category_id`, `principal_image_id`, `price_currency_iso`, `reduced_price_currency_iso`, `manufacturer_id`, `name`, `sku`, `slug`, `short_description`, `description`, `show_in_home`, `dimensions`, `stock`, `price`, `reduced_price`, `height`, `width`, `depth`, `weight`, `images_sort`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`, `enabled`, `purchasable_type`) VALUES
(1, 1, 1, 'USD', 'USD', NULL, 'Ibiza Lips English', NULL, 'ibiza-lips-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 799, 0, 0, 0, 0, 0, '', 'Ibiza Lips English', 'Ibiza Lips English', 'Ibiza Lips English', '2016-10-11 21:48:31', '2016-10-11 21:48:45', 1, 'product'),
(2, NULL, NULL, 'USD', 'USD', NULL, NULL, '', NULL, NULL, NULL, 0, NULL, 10000, 1099, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, '2016-10-11 21:48:31', '2016-10-11 21:48:31', 1, 'variant'),
(3, NULL, NULL, 'USD', 'USD', NULL, NULL, '', NULL, NULL, NULL, 0, NULL, 10000, 1299, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, '2016-10-11 21:48:31', '2016-10-11 21:48:31', 1, 'variant'),
(4, NULL, NULL, 'USD', 'USD', NULL, NULL, '', NULL, NULL, NULL, 0, NULL, 10000, 1199, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, '2016-10-11 21:48:31', '2016-10-11 21:48:31', 1, 'variant'),
(5, NULL, NULL, 'USD', 'USD', NULL, NULL, '', NULL, NULL, NULL, 0, NULL, 10000, 1399, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, '2016-10-11 21:48:31', '2016-10-11 21:48:31', 1, 'variant'),
(6, 1, 2, 'EUR', 'USD', NULL, 'Ibiza Banana English', NULL, 'ibiza-banana-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 399, 0, 0, 0, 0, 0, '', 'Ibiza Banana English', 'Ibiza Banana English', 'Ibiza Banana English', '2016-10-11 21:48:39', '2016-10-11 21:48:45', 1, 'product'),
(7, 1, 3, 'USD', 'USD', NULL, 'I Was There English', NULL, 'i-was-there-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 2105, 0, 0, 0, 0, 0, '', 'I Was There English', 'I Was There English', 'I Was There English', '2016-10-11 21:48:40', '2016-10-11 21:48:45', 1, 'product'),
(8, 1, 4, 'USD', 'USD', NULL, 'A Life Style English', NULL, 'a-life-style-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1290, 0, 0, 0, 0, 0, '', 'A Life Style English', 'A Life Style English', 'A Life Style English', '2016-10-11 21:48:40', '2016-10-11 21:48:45', 1, 'product'),
(9, 1, 5, 'USD', 'USD', NULL, 'A.M. Nesia Ibiza English', NULL, 'a-m-nesia-ibiza-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1190, 0, 0, 0, 0, 0, '', 'A.M. Nesia Ibiza English', 'A.M. Nesia Ibiza English', 'A.M. Nesia Ibiza English', '2016-10-11 21:48:43', '2016-10-11 21:48:45', 1, 'product'),
(10, 1, 6, 'USD', 'USD', NULL, 'Amnesia Poem English', NULL, 'amnesia-poem-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1390, 0, 0, 0, 0, 0, '', 'Amnesia Poem English', 'Amnesia Poem English', 'Amnesia Poem English', '2016-10-11 21:48:43', '2016-10-11 21:48:45', 1, 'product'),
(11, 1, 7, 'USD', 'USD', NULL, 'Pyramid English', NULL, 'pyramid-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1090, 0, 0, 0, 0, 0, '', 'Pyramid English', 'Pyramid English', 'Pyramid English', '2016-10-11 21:48:44', '2016-10-11 21:48:45', 1, 'product'),
(12, 1, 8, 'USD', 'USD', NULL, 'Amnesia Pink English', NULL, 'amnesia-pink-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1290, 0, 0, 0, 0, 0, '', 'Amnesia Pink English', 'Amnesia Pink English', 'Amnesia Pink English', '2016-10-11 21:48:44', '2016-10-11 21:48:45', 1, 'product'),
(13, 1, 9, 'USD', 'USD', NULL, 'Pinky Fragments English', NULL, 'pinky-fragments-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1190, 0, 0, 0, 0, 0, '', 'Pinky Fragments English', 'Pinky Fragments English', 'Pinky Fragments English', '2016-10-11 21:48:44', '2016-10-11 21:48:45', 1, 'product'),
(14, 2, 10, 'USD', 'USD', NULL, 'I was there II English', NULL, 'i-was-there-ii-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1190, 0, 0, 0, 0, 0, '', 'I was there II English', 'I was there II English', 'I was there II English', '2016-10-11 21:48:44', '2016-10-11 21:48:45', 1, 'product'),
(15, 2, 11, 'USD', 'USD', NULL, 'Amnesia English', NULL, 'amnesia-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1800, 0, 0, 0, 0, 0, '', 'Amnesia English', 'Amnesia English', 'Amnesia English', '2016-10-11 21:48:45', '2016-10-11 21:48:45', 1, 'product'),
(16, 2, 12, 'USD', 'USD', NULL, 'Amnesia 100% English', NULL, 'amnesia-100-percent-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1650, 0, 0, 0, 0, 0, '', 'Amnesia 100% English', 'Amnesia 100% English', 'Amnesia 100% English', '2016-10-11 21:48:45', '2016-10-11 21:48:45', 1, 'product'),
(17, 2, 13, 'USD', 'USD', NULL, 'A life style II English', NULL, 'a-life-style-ii-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1550, 0, 0, 0, 0, 0, '', 'A life style II English', 'A life style II English', 'A life style II English', '2016-10-11 21:48:45', '2016-10-11 21:48:45', 1, 'product'),
(18, 2, 14, 'USD', 'USD', NULL, 'All night long English', NULL, 'all-night-long-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1710, 0, 0, 0, 0, 0, '', 'All night long English', 'All night long English', 'All night long English', '2016-10-11 21:48:45', '2016-10-11 21:48:45', 1, 'product'),
(19, 2, 15, 'USD', 'USD', NULL, 'A.M. Nesia Ibiza II English', NULL, 'a-m-nesia-ibiza-ii-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 18000, 0, 0, 0, 0, 0, '', 'A.M. Nesia Ibiza II English', 'A.M. Nesia Ibiza II English', 'A.M. Nesia Ibiza II English', '2016-10-11 21:48:45', '2016-10-11 21:48:45', 1, 'product'),
(20, 2, 16, 'USD', 'USD', NULL, 'High Pyramid English', NULL, 'high-pyramid-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 2000, 0, 0, 0, 0, 0, '', 'High Pyramid English', 'High Pyramid English', 'High Pyramid English', '2016-10-11 21:48:45', '2016-10-11 21:48:45', 1, 'product'),
(21, 2, 17, 'USD', 'USD', NULL, 'Star Amnesia English', NULL, 'star-amnesia-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1145, 0, 0, 0, 0, 0, '', 'Star Amnesia English', 'Star Amnesia English', 'Star Amnesia English', '2016-10-11 21:48:45', '2016-10-11 21:48:45', 1, 'product'),
(22, 2, 18, 'USD', 'USD', NULL, 'Ibiza 4 Ever English', NULL, 'ibiza-4-ever-en', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1020, 0, 0, 0, 0, 0, '', 'Ibiza 4 Ever English', 'Ibiza 4 Ever English', 'Ibiza 4 Ever English', '2016-10-11 21:48:45', '2016-10-11 21:48:45', 1, 'product'),
(23, 2, 19, 'EUR', 'USD', 1, 'Pack 4 flavors', 'pack-sku-code-1', 'pack-4-flavors', 'Pack 4 flavors', 'Pack 4 flavors', 1, NULL, 0, 3000, 0, 30, 30, 30, 200, '', NULL, NULL, NULL, '2016-10-11 21:48:46', '2016-10-11 21:48:47', 1, 'pack');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchasable_category`
--

CREATE TABLE `purchasable_category` (
  `purchasable_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `purchasable_category`
--

INSERT INTO `purchasable_category` (`purchasable_id`, `category_id`) VALUES
(1, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchasable_image`
--

CREATE TABLE `purchasable_image` (
  `product_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `purchasable_image`
--

INSERT INTO `purchasable_image` (`product_id`, `image_id`) VALUES
(1, 1),
(6, 2),
(7, 3),
(8, 4),
(9, 5),
(10, 6),
(11, 7),
(12, 8),
(13, 9),
(14, 10),
(15, 11),
(16, 12),
(17, 13),
(18, 14),
(19, 15),
(20, 16),
(21, 17),
(22, 18),
(23, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rule`
--

CREATE TABLE `rule` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `expression` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `rule`
--

INSERT INTO `rule` (`id`, `name`, `expression`) VALUES
(1, 'Importe inferior a 300€', 'cart.getPurchasableAmount().isLessThan(money(300))'),
(2, 'Menos de 3 productos', 'cart.getQuantity() < 3'),
(3, 'Superior a 300€ y menos de 3 productos', 'not rule("Importe inferior a 300€") and rule("Menos de 3 productos")');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shipping_range`
--

CREATE TABLE `shipping_range` (
  `id` int(11) NOT NULL,
  `carrier_id` int(11) NOT NULL,
  `from_zone_id` int(11) DEFAULT NULL,
  `to_zone_id` int(11) NOT NULL,
  `price_currency_iso` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `from_price_currency_iso` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `to_price_currency_iso` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `from_price_amount` int(11) DEFAULT NULL,
  `to_price_amount` int(11) DEFAULT NULL,
  `from_weight` int(11) DEFAULT NULL,
  `to_weight` int(11) DEFAULT NULL,
  `price_amount` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `shipping_range`
--

INSERT INTO `shipping_range` (`id`, `carrier_id`, `from_zone_id`, `to_zone_id`, `price_currency_iso`, `from_price_currency_iso`, `to_price_currency_iso`, `type`, `name`, `from_price_amount`, `to_price_amount`, `from_weight`, `to_weight`, `price_amount`, `enabled`) VALUES
(1, 1, 1, 1, 'EUR', 'EUR', 'EUR', 1, 'From 0€ to 10€', 0, 1000, NULL, NULL, 900, 1),
(2, 1, 1, 1, 'EUR', 'EUR', 'EUR', 1, 'From 10€ to 20€', 1000, 2000, NULL, NULL, 500, 1),
(3, 1, 1, 1, 'EUR', 'EUR', 'EUR', 1, 'Free for up to 20€', 2000, 999999999, NULL, NULL, 115, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shipping_state_lines`
--

CREATE TABLE `shipping_state_lines` (
  `order_id` int(11) NOT NULL,
  `state_line_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state_line`
--

CREATE TABLE `state_line` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `store`
--

CREATE TABLE `store` (
  `id` int(11) NOT NULL,
  `logo_id` int(11) DEFAULT NULL,
  `secondary_logo_id` int(11) DEFAULT NULL,
  `mobile_logo_id` int(11) DEFAULT NULL,
  `header_image_id` int(11) DEFAULT NULL,
  `background_image_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `default_language_iso` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_currency_iso` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `leitmotiv` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_company` tinyint(1) NOT NULL,
  `cif` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tracker` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `routing_strategy` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `use_stock` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `store`
--

INSERT INTO `store` (`id`, `logo_id`, `secondary_logo_id`, `mobile_logo_id`, `header_image_id`, `background_image_id`, `address_id`, `default_language_iso`, `default_currency_iso`, `name`, `leitmotiv`, `email`, `is_company`, `cif`, `tracker`, `template`, `routing_strategy`, `use_stock`, `created_at`, `updated_at`, `enabled`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 1, 'en', 'USD', 'Bamboo Store', 'A store powered by Elcodi', 'email@email.com', 1, 'B-12345678', '123456', '2f1614601b2241b90c05cb67bc08f1ab7ba52af0', 'prefix_except_default', 1, '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tax`
--

CREATE TABLE `tax` (
  `id` int(11) NOT NULL,
  `name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tax`
--

INSERT INTO `tax` (`id`, `name`, `description`, `value`, `enabled`) VALUES
(1, 'VAT 21', 'VAT 21 for Spain', 21, 0),
(2, 'VAT 16', 'VAT 16 for Spain', 16, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `value`
--

INSERT INTO `value` (`id`, `attribute_id`, `value`) VALUES
(1, 1, 'Small'),
(2, 1, 'Medium'),
(3, 1, 'Large'),
(4, 2, 'Black'),
(5, 2, 'White'),
(6, 2, 'Gray');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variant`
--

CREATE TABLE `variant` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `variant`
--

INSERT INTO `variant` (`id`, `product_id`) VALUES
(2, 1),
(3, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variant_options`
--

CREATE TABLE `variant_options` (
  `variant_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `variant_options`
--

INSERT INTO `variant_options` (`variant_id`, `option_id`) VALUES
(2, 1),
(2, 5),
(3, 2),
(3, 5),
(4, 1),
(4, 4),
(5, 2),
(5, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zone`
--

CREATE TABLE `zone` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `locations` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `zone`
--

INSERT INTO `zone` (`id`, `name`, `code`, `locations`, `created_at`, `updated_at`, `enabled`) VALUES
(1, 'Spain', 'spain', 'ES', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(2, 'Andorra', 'andorra', 'AD', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(3, 'Almería', 'almera', 'ES_an_al', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(4, 'Cádiz', 'cdiz', 'ES_an_ca', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(5, 'Córdoba', 'c?rdoba', 'ES_an_co', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(6, 'Granada', 'granada', 'ES_an_gr', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(7, 'Huelva', 'huelva', 'ES_an_h', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(8, 'Jaén', 'jan', 'ES_an_j', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(9, 'Málaga', 'mlaga', 'ES_an_ma', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(10, 'Sevilla', 'sevilla', 'ES_an_se', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(11, 'Huesca', 'huesca', 'ES_ar_hu', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(12, 'Teruel', 'teruel', 'ES_ar_te', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(13, 'Zaragoza', 'zaragoza', 'ES_ar_z', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(14, 'Asturias', 'asturias', 'ES_as_o', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(15, 'Cantabria', 'cantabria', 'ES_cb_s', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(16, 'Ceuta', 'ceuta', 'ES_ce_ce', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(17, 'Ávila', 'vila', 'ES_cl_av', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(18, 'Burgos', 'burgos', 'ES_cl_bu', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(19, 'León', 'le?n', 'ES_cl_le', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(20, 'Palencia', 'palencia', 'ES_cl_p', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(21, 'Salamanca', 'salamanca', 'ES_cl_sa', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(22, 'Segovia', 'segovia', 'ES_cl_sg', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(23, 'Soria', 'soria', 'ES_cl_so', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(24, 'Valladolid', 'valladolid', 'ES_cl_va', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(25, 'Zamora', 'zamora', 'ES_cl_za', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(26, 'Albacete', 'albacete', 'ES_cm_ab', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(27, 'Ciudad Real', 'ciudadreal', 'ES_cm_cr', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(28, 'Cuenca', 'cuenca', 'ES_cm_cu', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(29, 'Guadalajara', 'guadalajara', 'ES_cm_gu', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(30, 'Toledo', 'toledo', 'ES_cm_to', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(31, 'Las Palmas', 'laspalmas', 'ES_cn_gc', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(32, 'Santa Cruz de Tenerife', 'santacruzdetenerife', 'ES_cn_tf', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(33, 'Barcelona', 'barcelona', 'ES_ct_b', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(34, 'Girona', 'girona', 'ES_ct_gi', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(35, 'Lleida', 'lleida', 'ES_ct_l', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(36, 'Tarragona', 'tarragona', 'ES_ct_t', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(37, 'Badajoz', 'badajoz', 'ES_ex_ba', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(38, 'Cáceres', 'cceres', 'ES_ex_cc', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(39, 'A Coruña', 'acorua', 'ES_ga_c', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(40, 'Lugo', 'lugo', 'ES_ga_lu', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(41, 'Ourense', 'ourense', 'ES_ga_or', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(42, 'Pontevedra', 'pontevedra', 'ES_ga_po', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(43, 'Baleares', 'baleares', 'ES_ib_pm', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(44, 'Murcia', 'murcia', 'ES_mc_mu', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(45, 'Madrid', 'madrid', 'ES_md_m', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(46, 'Melilla', 'melilla', 'ES_ml_me', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(47, 'Navarra', 'navarra', 'ES_nc_na', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(48, 'Vizcaya', 'vizcaya', 'ES_pv_bi', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(49, 'Guipúzcoa', 'guipzcoa', 'ES_pv_ss', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(50, 'Álava', 'lava', 'ES_pv_vi', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(51, 'La Rioja', 'larioja', 'ES_ri_lo', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(52, 'Alicante', 'alicante', 'ES_vc_a', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(53, 'Castellón', 'castell?n', 'ES_vc_cs', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1),
(54, 'Valencia', 'valencia', 'ES_vc_v', '2016-10-11 21:48:21', '2016-10-11 21:48:21', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_AD8A54A95F37A13B` (`token`),
  ADD UNIQUE KEY `UNIQ_AD8A54A98A2057A4` (`recovery_hash`),
  ADD UNIQUE KEY `UNIQ_AD8A54A98586CD6F` (`one_time_login_hash`);

--
-- Indices de la tabla `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `authorization`
--
ALTER TABLE `authorization`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_7A6D8BEFA76ED395` (`user_id`),
  ADD KEY `resourceowner_username_idx` (`resourceowner_name`,`username`);

--
-- Indices de la tabla `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6F9DB8E73DA5256D` (`image_id`),
  ADD KEY `IDX_6F9DB8E7A7F1F96B` (`principal_image_id`);

--
-- Indices de la tabla `banner_banner_zone`
--
ALTER TABLE `banner_banner_zone`
  ADD PRIMARY KEY (`banner_id`,`banner_zone_id`),
  ADD KEY `IDX_98251B1E684EC833` (`banner_id`),
  ADD KEY `IDX_98251B1ECB711668` (`banner_zone_id`);

--
-- Indices de la tabla `banner_zone`
--
ALTER TABLE `banner_zone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A852916DB0DED06D` (`language_iso`);

--
-- Indices de la tabla `carrier`
--
ALTER TABLE `carrier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4739F11CB2A824D8` (`tax_id`);

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BA388B79395C3F3` (`customer_id`),
  ADD KEY `IDX_BA388B7EBF23851` (`delivery_address_id`),
  ADD KEY `IDX_BA388B779D0C0E4` (`billing_address_id`);

--
-- Indices de la tabla `cart_coupon`
--
ALTER TABLE `cart_coupon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6A3B5D5D1AD5CDBF` (`cart_id`),
  ADD KEY `IDX_6A3B5D5D66C5951B` (`coupon_id`);

--
-- Indices de la tabla `cart_line`
--
ALTER TABLE `cart_line`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_3EF1B4CFBB01DC09` (`order_line_id`),
  ADD KEY `IDX_3EF1B4CF1AD5CDBF` (`cart_id`),
  ADD KEY `IDX_3EF1B4CFCA263E04` (`purchasable_currency_iso`),
  ADD KEY `IDX_3EF1B4CFB3D2E75A` (`currency_iso`),
  ADD KEY `IDX_3EF1B4CF9778C508` (`purchasable_id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_64C19C1727ACA70` (`parent_id`);

--
-- Indices de la tabla `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526C727ACA70` (`parent_id`);

--
-- Indices de la tabla `comment_vote`
--
ALTER TABLE `comment_vote`
  ADD PRIMARY KEY (`author_token`,`comment_id`),
  ADD KEY `IDX_7C262788F8697D13` (`comment_id`);

--
-- Indices de la tabla `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_64BF3F0277153098` (`code`),
  ADD KEY `IDX_64BF3F0247018B47` (`price_currency_iso`),
  ADD KEY `IDX_64BF3F02DCEAE720` (`minimum_purchase_currency_iso`),
  ADD KEY `IDX_64BF3F0246D8ACCC` (`rule`);

--
-- Indices de la tabla `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`iso`);

--
-- Indices de la tabla `currency_exchange_rate`
--
ALTER TABLE `currency_exchange_rate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B9F60EEC5380340B` (`target_currency_iso`),
  ADD KEY `IDX_B9F60EEC65383BE2` (`source_currency_iso`);

--
-- Indices de la tabla `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_81398E095F37A13B` (`token`),
  ADD UNIQUE KEY `UNIQ_81398E098A2057A4` (`recovery_hash`),
  ADD UNIQUE KEY `UNIQ_81398E098586CD6F` (`one_time_login_hash`),
  ADD UNIQUE KEY `UNIQ_81398E09EBF23851` (`delivery_address_id`),
  ADD UNIQUE KEY `UNIQ_81398E09C6BDFEB` (`invoice_address_id`),
  ADD KEY `IDX_81398E09B0DED06D` (`language_iso`);

--
-- Indices de la tabla `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`customer_id`,`address_id`),
  ADD KEY `IDX_1193CB3F9395C3F3` (`customer_id`),
  ADD KEY `IDX_1193CB3FF5B7AF75` (`address_id`);

--
-- Indices de la tabla `entity_translation`
--
ALTER TABLE `entity_translation`
  ADD PRIMARY KEY (`entity_type`,`entity_id`,`entity_field`,`locale`);

--
-- Indices de la tabla `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`iso`);

--
-- Indices de la tabla `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `location_inheritance`
--
ALTER TABLE `location_inheritance`
  ADD PRIMARY KEY (`parent_id`,`children_id`),
  ADD KEY `IDX_CD045D5727ACA70` (`parent_id`),
  ADD KEY `IDX_CD045D53D3D2749` (`children_id`);

--
-- Indices de la tabla `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3D0AE6DCA7F1F96B` (`principal_image_id`);

--
-- Indices de la tabla `manufacturer_image`
--
ALTER TABLE `manufacturer_image`
  ADD PRIMARY KEY (`product_id`,`image_id`),
  ADD KEY `IDX_CE63904F4584665A` (`product_id`),
  ADD KEY `IDX_CE63904F3DA5256D` (`image_id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu_node`
--
ALTER TABLE `menu_node`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu_node_hierarchy`
--
ALTER TABLE `menu_node_hierarchy`
  ADD PRIMARY KEY (`menu_node_id`,`menu_subnode_id`),
  ADD KEY `IDX_F80FD5E9CED68269` (`menu_node_id`),
  ADD KEY `IDX_F80FD5E92CC283CA` (`menu_subnode_id`);

--
-- Indices de la tabla `metric_entry`
--
ALTER TABLE `metric_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `newsletter_subscription`
--
ALTER TABLE `newsletter_subscription`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A82B55ADE7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_A82B55ADD1B862B8` (`hash`),
  ADD KEY `IDX_A82B55ADB0DED06D` (`language_iso`);

--
-- Indices de la tabla `node_hierarchy`
--
ALTER TABLE `node_hierarchy`
  ADD PRIMARY KEY (`menu_node_id`,`menu_subnode_id`),
  ADD KEY `IDX_E1C520CDCED68269` (`menu_node_id`),
  ADD KEY `IDX_E1C520CD2CC283CA` (`menu_subnode_id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_E52FFDEEAD8238BF` (`payment_last_state_line_id`),
  ADD UNIQUE KEY `UNIQ_E52FFDEE5B8FCE3F` (`shipping_last_state_line_id`),
  ADD UNIQUE KEY `UNIQ_E52FFDEE1AD5CDBF` (`cart_id`),
  ADD KEY `IDX_E52FFDEE9395C3F3` (`customer_id`),
  ADD KEY `IDX_E52FFDEEB3D2E75A` (`currency_iso`),
  ADD KEY `IDX_E52FFDEECA263E04` (`purchasable_currency_iso`),
  ADD KEY `IDX_E52FFDEEFB17B782` (`coupon_currency_iso`),
  ADD KEY `IDX_E52FFDEEFC817E8F` (`shipping_currency_iso`),
  ADD KEY `IDX_E52FFDEEEBF23851` (`delivery_address_id`),
  ADD KEY `IDX_E52FFDEE79D0C0E4` (`billing_address_id`);

--
-- Indices de la tabla `order_coupon`
--
ALTER TABLE `order_coupon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A7302FD78D9F6D38` (`order_id`),
  ADD KEY `IDX_A7302FD766C5951B` (`coupon_id`),
  ADD KEY `IDX_A7302FD7D82D7CDD` (`amount_currency_iso`);

--
-- Indices de la tabla `order_line`
--
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9CE58EE18D9F6D38` (`order_id`),
  ADD KEY `IDX_9CE58EE1CA263E04` (`purchasable_currency_iso`),
  ADD KEY `IDX_9CE58EE1B3D2E75A` (`currency_iso`),
  ADD KEY `IDX_9CE58EE19778C508` (`purchasable_id`);

--
-- Indices de la tabla `pack`
--
ALTER TABLE `pack`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pack_purchasable`
--
ALTER TABLE `pack_purchasable`
  ADD PRIMARY KEY (`pack_id`,`purchasable_id`),
  ADD KEY `IDX_8D846271919B217` (`pack_id`),
  ADD KEY `IDX_8D846279778C508` (`purchasable_id`);

--
-- Indices de la tabla `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_140AB6205E237E06` (`name`);

--
-- Indices de la tabla `payment_state_lines`
--
ALTER TABLE `payment_state_lines`
  ADD PRIMARY KEY (`order_id`,`state_line_id`),
  ADD KEY `IDX_CB1ED8408D9F6D38` (`order_id`),
  ADD KEY `IDX_CB1ED840B1B0FE4` (`state_line_id`);

--
-- Indices de la tabla `plugin`
--
ALTER TABLE `plugin`
  ADD PRIMARY KEY (`namespace`),
  ADD UNIQUE KEY `UNIQ_E96E2794D1B862B8` (`hash`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04ADE2560A82` (`principal_variant_id`);

--
-- Indices de la tabla `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`),
  ADD KEY `IDX_94DA59764584665A` (`product_id`),
  ADD KEY `IDX_94DA5976B6E62EFA` (`attribute_id`);

--
-- Indices de la tabla `purchasable`
--
ALTER TABLE `purchasable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FC2E9BFE5740FE34` (`principal_category_id`),
  ADD KEY `IDX_FC2E9BFEA7F1F96B` (`principal_image_id`),
  ADD KEY `IDX_FC2E9BFE47018B47` (`price_currency_iso`),
  ADD KEY `IDX_FC2E9BFEEB35D9BE` (`reduced_price_currency_iso`),
  ADD KEY `IDX_FC2E9BFEA23B42D` (`manufacturer_id`);

--
-- Indices de la tabla `purchasable_category`
--
ALTER TABLE `purchasable_category`
  ADD PRIMARY KEY (`purchasable_id`,`category_id`),
  ADD KEY `IDX_F98077AD9778C508` (`purchasable_id`),
  ADD KEY `IDX_F98077AD12469DE2` (`category_id`);

--
-- Indices de la tabla `purchasable_image`
--
ALTER TABLE `purchasable_image`
  ADD PRIMARY KEY (`product_id`,`image_id`),
  ADD KEY `IDX_3A78D4124584665A` (`product_id`),
  ADD KEY `IDX_3A78D4123DA5256D` (`image_id`);

--
-- Indices de la tabla `rule`
--
ALTER TABLE `rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_46D8ACCC5E237E06` (`name`);

--
-- Indices de la tabla `shipping_range`
--
ALTER TABLE `shipping_range`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7D1887F321DFC797` (`carrier_id`),
  ADD KEY `IDX_7D1887F31972DC04` (`from_zone_id`),
  ADD KEY `IDX_7D1887F311B4025E` (`to_zone_id`),
  ADD KEY `IDX_7D1887F347018B47` (`price_currency_iso`),
  ADD KEY `IDX_7D1887F3D6956502` (`from_price_currency_iso`),
  ADD KEY `IDX_7D1887F315643E2F` (`to_price_currency_iso`);

--
-- Indices de la tabla `shipping_state_lines`
--
ALTER TABLE `shipping_state_lines`
  ADD PRIMARY KEY (`order_id`,`state_line_id`),
  ADD KEY `IDX_B1F98F398D9F6D38` (`order_id`),
  ADD KEY `IDX_B1F98F39B1B0FE4` (`state_line_id`);

--
-- Indices de la tabla `state_line`
--
ALTER TABLE `state_line`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_FF575877F98F144A` (`logo_id`),
  ADD UNIQUE KEY `UNIQ_FF5758773C91E28A` (`secondary_logo_id`),
  ADD UNIQUE KEY `UNIQ_FF5758771925D9BF` (`mobile_logo_id`),
  ADD UNIQUE KEY `UNIQ_FF5758778C782417` (`header_image_id`),
  ADD UNIQUE KEY `UNIQ_FF575877E6DA28AA` (`background_image_id`),
  ADD KEY `IDX_FF575877F5B7AF75` (`address_id`),
  ADD KEY `IDX_FF575877920835C7` (`default_language_iso`),
  ADD KEY `IDX_FF575877910402F0` (`default_currency_iso`);

--
-- Indices de la tabla `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1D775834B6E62EFA` (`attribute_id`);

--
-- Indices de la tabla `variant`
--
ALTER TABLE `variant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F143BFAD4584665A` (`product_id`);

--
-- Indices de la tabla `variant_options`
--
ALTER TABLE `variant_options`
  ADD PRIMARY KEY (`variant_id`,`option_id`),
  ADD KEY `IDX_BF90D7C13B69A9AF` (`variant_id`),
  ADD KEY `IDX_BF90D7C1A7C41D6F` (`option_id`);

--
-- Indices de la tabla `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A0EBC00777153098` (`code`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `attribute`
--
ALTER TABLE `attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `authorization`
--
ALTER TABLE `authorization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `banner_zone`
--
ALTER TABLE `banner_zone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `carrier`
--
ALTER TABLE `carrier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cart_coupon`
--
ALTER TABLE `cart_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cart_line`
--
ALTER TABLE `cart_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `currency_exchange_rate`
--
ALTER TABLE `currency_exchange_rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `menu_node`
--
ALTER TABLE `menu_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `metric_entry`
--
ALTER TABLE `metric_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `newsletter_subscription`
--
ALTER TABLE `newsletter_subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `order_coupon`
--
ALTER TABLE `order_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `order_line`
--
ALTER TABLE `order_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `purchasable`
--
ALTER TABLE `purchasable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `rule`
--
ALTER TABLE `rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `shipping_range`
--
ALTER TABLE `shipping_range`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `state_line`
--
ALTER TABLE `state_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `store`
--
ALTER TABLE `store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tax`
--
ALTER TABLE `tax`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `zone`
--
ALTER TABLE `zone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `authorization`
--
ALTER TABLE `authorization`
  ADD CONSTRAINT `FK_7A6D8BEFA76ED395` FOREIGN KEY (`user_id`) REFERENCES `customer` (`id`);

--
-- Filtros para la tabla `banner`
--
ALTER TABLE `banner`
  ADD CONSTRAINT `FK_6F9DB8E73DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `FK_6F9DB8E7A7F1F96B` FOREIGN KEY (`principal_image_id`) REFERENCES `image` (`id`);

--
-- Filtros para la tabla `banner_banner_zone`
--
ALTER TABLE `banner_banner_zone`
  ADD CONSTRAINT `FK_98251B1E684EC833` FOREIGN KEY (`banner_id`) REFERENCES `banner` (`id`),
  ADD CONSTRAINT `FK_98251B1ECB711668` FOREIGN KEY (`banner_zone_id`) REFERENCES `banner_zone` (`id`);

--
-- Filtros para la tabla `banner_zone`
--
ALTER TABLE `banner_zone`
  ADD CONSTRAINT `FK_A852916DB0DED06D` FOREIGN KEY (`language_iso`) REFERENCES `language` (`iso`);

--
-- Filtros para la tabla `carrier`
--
ALTER TABLE `carrier`
  ADD CONSTRAINT `FK_4739F11CB2A824D8` FOREIGN KEY (`tax_id`) REFERENCES `tax` (`id`);

--
-- Filtros para la tabla `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_BA388B779D0C0E4` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `FK_BA388B79395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BA388B7EBF23851` FOREIGN KEY (`delivery_address_id`) REFERENCES `address` (`id`);

--
-- Filtros para la tabla `cart_coupon`
--
ALTER TABLE `cart_coupon`
  ADD CONSTRAINT `FK_6A3B5D5D1AD5CDBF` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `FK_6A3B5D5D66C5951B` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`);

--
-- Filtros para la tabla `cart_line`
--
ALTER TABLE `cart_line`
  ADD CONSTRAINT `FK_3EF1B4CF1AD5CDBF` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `FK_3EF1B4CF9778C508` FOREIGN KEY (`purchasable_id`) REFERENCES `purchasable` (`id`),
  ADD CONSTRAINT `FK_3EF1B4CFB3D2E75A` FOREIGN KEY (`currency_iso`) REFERENCES `currency` (`iso`),
  ADD CONSTRAINT `FK_3EF1B4CFBB01DC09` FOREIGN KEY (`order_line_id`) REFERENCES `order_line` (`id`),
  ADD CONSTRAINT `FK_3EF1B4CFCA263E04` FOREIGN KEY (`purchasable_currency_iso`) REFERENCES `currency` (`iso`);

--
-- Filtros para la tabla `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_64C19C1727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `comment_vote`
--
ALTER TABLE `comment_vote`
  ADD CONSTRAINT `FK_7C262788F8697D13` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `coupon`
--
ALTER TABLE `coupon`
  ADD CONSTRAINT `FK_64BF3F0246D8ACCC` FOREIGN KEY (`rule`) REFERENCES `rule` (`id`),
  ADD CONSTRAINT `FK_64BF3F0247018B47` FOREIGN KEY (`price_currency_iso`) REFERENCES `currency` (`iso`),
  ADD CONSTRAINT `FK_64BF3F02DCEAE720` FOREIGN KEY (`minimum_purchase_currency_iso`) REFERENCES `currency` (`iso`);

--
-- Filtros para la tabla `currency_exchange_rate`
--
ALTER TABLE `currency_exchange_rate`
  ADD CONSTRAINT `FK_B9F60EEC5380340B` FOREIGN KEY (`target_currency_iso`) REFERENCES `currency` (`iso`),
  ADD CONSTRAINT `FK_B9F60EEC65383BE2` FOREIGN KEY (`source_currency_iso`) REFERENCES `currency` (`iso`);

--
-- Filtros para la tabla `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_81398E09B0DED06D` FOREIGN KEY (`language_iso`) REFERENCES `language` (`iso`),
  ADD CONSTRAINT `FK_81398E09C6BDFEB` FOREIGN KEY (`invoice_address_id`) REFERENCES `address` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_81398E09EBF23851` FOREIGN KEY (`delivery_address_id`) REFERENCES `address` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `FK_1193CB3F9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `FK_1193CB3FF5B7AF75` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`);

--
-- Filtros para la tabla `location_inheritance`
--
ALTER TABLE `location_inheritance`
  ADD CONSTRAINT `FK_CD045D53D3D2749` FOREIGN KEY (`children_id`) REFERENCES `location` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CD045D5727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `location` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD CONSTRAINT `FK_3D0AE6DCA7F1F96B` FOREIGN KEY (`principal_image_id`) REFERENCES `image` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `manufacturer_image`
--
ALTER TABLE `manufacturer_image`
  ADD CONSTRAINT `FK_CE63904F3DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CE63904F4584665A` FOREIGN KEY (`product_id`) REFERENCES `manufacturer` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `menu_node_hierarchy`
--
ALTER TABLE `menu_node_hierarchy`
  ADD CONSTRAINT `FK_F80FD5E92CC283CA` FOREIGN KEY (`menu_subnode_id`) REFERENCES `menu_node` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F80FD5E9CED68269` FOREIGN KEY (`menu_node_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `newsletter_subscription`
--
ALTER TABLE `newsletter_subscription`
  ADD CONSTRAINT `FK_A82B55ADB0DED06D` FOREIGN KEY (`language_iso`) REFERENCES `language` (`iso`);

--
-- Filtros para la tabla `node_hierarchy`
--
ALTER TABLE `node_hierarchy`
  ADD CONSTRAINT `FK_E1C520CD2CC283CA` FOREIGN KEY (`menu_subnode_id`) REFERENCES `menu_node` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E1C520CDCED68269` FOREIGN KEY (`menu_node_id`) REFERENCES `menu_node` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_E52FFDEE1AD5CDBF` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_E52FFDEE5B8FCE3F` FOREIGN KEY (`shipping_last_state_line_id`) REFERENCES `state_line` (`id`),
  ADD CONSTRAINT `FK_E52FFDEE79D0C0E4` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `FK_E52FFDEE9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_E52FFDEEAD8238BF` FOREIGN KEY (`payment_last_state_line_id`) REFERENCES `state_line` (`id`),
  ADD CONSTRAINT `FK_E52FFDEEB3D2E75A` FOREIGN KEY (`currency_iso`) REFERENCES `currency` (`iso`),
  ADD CONSTRAINT `FK_E52FFDEECA263E04` FOREIGN KEY (`purchasable_currency_iso`) REFERENCES `currency` (`iso`),
  ADD CONSTRAINT `FK_E52FFDEEEBF23851` FOREIGN KEY (`delivery_address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `FK_E52FFDEEFB17B782` FOREIGN KEY (`coupon_currency_iso`) REFERENCES `currency` (`iso`),
  ADD CONSTRAINT `FK_E52FFDEEFC817E8F` FOREIGN KEY (`shipping_currency_iso`) REFERENCES `currency` (`iso`);

--
-- Filtros para la tabla `order_coupon`
--
ALTER TABLE `order_coupon`
  ADD CONSTRAINT `FK_A7302FD766C5951B` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`),
  ADD CONSTRAINT `FK_A7302FD78D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FK_A7302FD7D82D7CDD` FOREIGN KEY (`amount_currency_iso`) REFERENCES `currency` (`iso`);

--
-- Filtros para la tabla `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `FK_9CE58EE18D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FK_9CE58EE19778C508` FOREIGN KEY (`purchasable_id`) REFERENCES `purchasable` (`id`),
  ADD CONSTRAINT `FK_9CE58EE1B3D2E75A` FOREIGN KEY (`currency_iso`) REFERENCES `currency` (`iso`),
  ADD CONSTRAINT `FK_9CE58EE1CA263E04` FOREIGN KEY (`purchasable_currency_iso`) REFERENCES `currency` (`iso`);

--
-- Filtros para la tabla `pack`
--
ALTER TABLE `pack`
  ADD CONSTRAINT `FK_97DE5E23BF396750` FOREIGN KEY (`id`) REFERENCES `purchasable` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pack_purchasable`
--
ALTER TABLE `pack_purchasable`
  ADD CONSTRAINT `FK_8D846271919B217` FOREIGN KEY (`pack_id`) REFERENCES `pack` (`id`),
  ADD CONSTRAINT `FK_8D846279778C508` FOREIGN KEY (`purchasable_id`) REFERENCES `purchasable` (`id`);

--
-- Filtros para la tabla `payment_state_lines`
--
ALTER TABLE `payment_state_lines`
  ADD CONSTRAINT `FK_CB1ED8408D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FK_CB1ED840B1B0FE4` FOREIGN KEY (`state_line_id`) REFERENCES `state_line` (`id`);

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04ADBF396750` FOREIGN KEY (`id`) REFERENCES `purchasable` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D34A04ADE2560A82` FOREIGN KEY (`principal_variant_id`) REFERENCES `variant` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD CONSTRAINT `FK_94DA59764584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_94DA5976B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `purchasable`
--
ALTER TABLE `purchasable`
  ADD CONSTRAINT `FK_FC2E9BFE47018B47` FOREIGN KEY (`price_currency_iso`) REFERENCES `currency` (`iso`),
  ADD CONSTRAINT `FK_FC2E9BFE5740FE34` FOREIGN KEY (`principal_category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_FC2E9BFEA23B42D` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_FC2E9BFEA7F1F96B` FOREIGN KEY (`principal_image_id`) REFERENCES `image` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_FC2E9BFEEB35D9BE` FOREIGN KEY (`reduced_price_currency_iso`) REFERENCES `currency` (`iso`);

--
-- Filtros para la tabla `purchasable_category`
--
ALTER TABLE `purchasable_category`
  ADD CONSTRAINT `FK_F98077AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F98077AD9778C508` FOREIGN KEY (`purchasable_id`) REFERENCES `purchasable` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `purchasable_image`
--
ALTER TABLE `purchasable_image`
  ADD CONSTRAINT `FK_3A78D4123DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_3A78D4124584665A` FOREIGN KEY (`product_id`) REFERENCES `purchasable` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `shipping_range`
--
ALTER TABLE `shipping_range`
  ADD CONSTRAINT `FK_7D1887F311B4025E` FOREIGN KEY (`to_zone_id`) REFERENCES `zone` (`id`),
  ADD CONSTRAINT `FK_7D1887F315643E2F` FOREIGN KEY (`to_price_currency_iso`) REFERENCES `currency` (`iso`),
  ADD CONSTRAINT `FK_7D1887F31972DC04` FOREIGN KEY (`from_zone_id`) REFERENCES `zone` (`id`),
  ADD CONSTRAINT `FK_7D1887F321DFC797` FOREIGN KEY (`carrier_id`) REFERENCES `carrier` (`id`),
  ADD CONSTRAINT `FK_7D1887F347018B47` FOREIGN KEY (`price_currency_iso`) REFERENCES `currency` (`iso`),
  ADD CONSTRAINT `FK_7D1887F3D6956502` FOREIGN KEY (`from_price_currency_iso`) REFERENCES `currency` (`iso`);

--
-- Filtros para la tabla `shipping_state_lines`
--
ALTER TABLE `shipping_state_lines`
  ADD CONSTRAINT `FK_B1F98F398D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FK_B1F98F39B1B0FE4` FOREIGN KEY (`state_line_id`) REFERENCES `state_line` (`id`);

--
-- Filtros para la tabla `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `FK_FF5758771925D9BF` FOREIGN KEY (`mobile_logo_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `FK_FF5758773C91E28A` FOREIGN KEY (`secondary_logo_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `FK_FF5758778C782417` FOREIGN KEY (`header_image_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `FK_FF575877910402F0` FOREIGN KEY (`default_currency_iso`) REFERENCES `currency` (`iso`),
  ADD CONSTRAINT `FK_FF575877920835C7` FOREIGN KEY (`default_language_iso`) REFERENCES `language` (`iso`),
  ADD CONSTRAINT `FK_FF575877E6DA28AA` FOREIGN KEY (`background_image_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `FK_FF575877F5B7AF75` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `FK_FF575877F98F144A` FOREIGN KEY (`logo_id`) REFERENCES `image` (`id`);

--
-- Filtros para la tabla `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D775834B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`);

--
-- Filtros para la tabla `variant`
--
ALTER TABLE `variant`
  ADD CONSTRAINT `FK_F143BFAD4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F143BFADBF396750` FOREIGN KEY (`id`) REFERENCES `purchasable` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `variant_options`
--
ALTER TABLE `variant_options`
  ADD CONSTRAINT `FK_BF90D7C13B69A9AF` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BF90D7C1A7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `value` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
