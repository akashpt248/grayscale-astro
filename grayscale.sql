-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 16, 2026 at 07:33 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grayscale`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `uid` varchar(150) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `summary` longtext DEFAULT NULL,
  `imageurl` varchar(250) DEFAULT NULL,
  `blogcontent` longtext DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `metatag` longtext DEFAULT NULL,
  `metakeyword` longtext DEFAULT NULL,
  `metadesc` longtext DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT current_timestamp(),
  `updatedate` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `imageurl2` varchar(255) DEFAULT NULL,
  `popular` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `uid`, `title`, `summary`, `imageurl`, `blogcontent`, `priority`, `metatag`, `metakeyword`, `metadesc`, `slug`, `date`, `createdate`, `updatedate`, `status`, `imageurl2`, `popular`) VALUES
(1, '57ca096e-e061-45ef-a827-64777f1f14ea', 'What is a Personalized Nutrition Plan?', '', NULL, '&lt;p&gt;A personalized nutrition plan is not your generic “eat less, move more” advice. It’s a tailored eating strategy built specifically for &lt;em&gt;you&lt;/em&gt; — based on your body type, metabolism, lifestyle, health conditions, and goals (fat loss, muscle gain, maintenance, etc.).&lt;/p&gt;\r\n\r\n&lt;p&gt;Instead of forcing your body to fit a diet, this approach makes the diet fit your body.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;h3&gt;Why It Actually Matters&lt;/h3&gt;\r\n\r\n&lt;h4&gt;1. One-size diets don’t work&lt;/h4&gt;\r\n\r\n&lt;p&gt;What works for someone else might completely fail for you. Your body processes food differently based on genetics, activity level, and even sleep patterns. Personalized plans eliminate guesswork.&lt;/p&gt;\r\n\r\n&lt;h4&gt;2. Better and faster results&lt;/h4&gt;\r\n\r\n&lt;p&gt;When your nutrition aligns with your body’s needs, results come faster — whether it’s weight loss, muscle gain, or improved energy levels.&lt;/p&gt;\r\n\r\n&lt;h4&gt;3. Sustainable lifestyle (not crash dieting)&lt;/h4&gt;\r\n\r\n&lt;p&gt;Strict diets usually fail because they ignore your routine. A personalized plan considers your work schedule, food preferences, and habits — making it easier to stick long-term.&lt;/p&gt;\r\n\r\n&lt;h4&gt;4. Improves overall health&lt;/h4&gt;\r\n\r\n&lt;p&gt;It’s not just about looks. A good nutrition plan can:&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Balance hormones&lt;/li&gt;\r\n	&lt;li&gt;Improve digestion&lt;/li&gt;\r\n	&lt;li&gt;Stabilize blood sugar&lt;/li&gt;\r\n	&lt;li&gt;Boost immunity&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;h4&gt;5. Prevents nutritional deficiencies&lt;/h4&gt;\r\n\r\n&lt;p&gt;Random dieting often cuts out essential nutrients. A customized plan ensures your body gets the right balance of carbs, protein, fats, vitamins, and minerals.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;h3&gt;What Goes Into a Personalized Plan?&lt;/h3&gt;\r\n\r\n&lt;p&gt;A proper plan usually considers:&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Your age, weight, and body composition&lt;/li&gt;\r\n	&lt;li&gt;Fitness goals (fat loss, muscle gain, etc.)&lt;/li&gt;\r\n	&lt;li&gt;Daily routine (office, active, student, etc.)&lt;/li&gt;\r\n	&lt;li&gt;Medical history or conditions&lt;/li&gt;\r\n	&lt;li&gt;Food preferences (veg/non-veg, allergies)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;h3&gt;Real Talk&lt;/h3&gt;\r\n\r\n&lt;p&gt;Following random diets from the internet can slow your progress or even harm your health. Personalized nutrition removes that noise and gives you a clear, practical path that actually fits your life.&lt;/p&gt;\r\n', 1, 'Personalized Nutrition Plans: Custom Diet Strategies for Your Body &amp; Goals', 'personalized nutrition, custom diet plan, meal planning for fitness, healthy eating plan, diet based on body type, nutrition for weight loss, fitness diet plan, balanced meal strategy', 'Discover personalized nutrition plans tailored to your body, lifestyle, and goals. Learn why custom diet strategies deliver better, sustainable results for health, fitness, and overall well-being.', 'what-is-a-personalized-nutrition-plan', '2026-04-29', '2026-04-29 04:59:12', '2026-04-29 04:59:12', 1, NULL, 1),
(5, '57ca096e-e061-45ef-a827-64777f1f14ea', 'What is a Personalized Nutrition Plan?', '', NULL, '&lt;p&gt;A personalized nutrition plan is not your generic “eat less, move more” advice. It’s a tailored eating strategy built specifically for &lt;em&gt;you&lt;/em&gt; — based on your body type, metabolism, lifestyle, health conditions, and goals (fat loss, muscle gain, maintenance, etc.).&lt;/p&gt;\r\n\r\n&lt;p&gt;Instead of forcing your body to fit a diet, this approach makes the diet fit your body.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;h3&gt;Why It Actually Matters&lt;/h3&gt;\r\n\r\n&lt;h4&gt;1. One-size diets don’t work&lt;/h4&gt;\r\n\r\n&lt;p&gt;What works for someone else might completely fail for you. Your body processes food differently based on genetics, activity level, and even sleep patterns. Personalized plans eliminate guesswork.&lt;/p&gt;\r\n\r\n&lt;h4&gt;2. Better and faster results&lt;/h4&gt;\r\n\r\n&lt;p&gt;When your nutrition aligns with your body’s needs, results come faster — whether it’s weight loss, muscle gain, or improved energy levels.&lt;/p&gt;\r\n\r\n&lt;h4&gt;3. Sustainable lifestyle (not crash dieting)&lt;/h4&gt;\r\n\r\n&lt;p&gt;Strict diets usually fail because they ignore your routine. A personalized plan considers your work schedule, food preferences, and habits — making it easier to stick long-term.&lt;/p&gt;\r\n\r\n&lt;h4&gt;4. Improves overall health&lt;/h4&gt;\r\n\r\n&lt;p&gt;It’s not just about looks. A good nutrition plan can:&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Balance hormones&lt;/li&gt;\r\n	&lt;li&gt;Improve digestion&lt;/li&gt;\r\n	&lt;li&gt;Stabilize blood sugar&lt;/li&gt;\r\n	&lt;li&gt;Boost immunity&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;h4&gt;5. Prevents nutritional deficiencies&lt;/h4&gt;\r\n\r\n&lt;p&gt;Random dieting often cuts out essential nutrients. A customized plan ensures your body gets the right balance of carbs, protein, fats, vitamins, and minerals.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;h3&gt;What Goes Into a Personalized Plan?&lt;/h3&gt;\r\n\r\n&lt;p&gt;A proper plan usually considers:&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Your age, weight, and body composition&lt;/li&gt;\r\n	&lt;li&gt;Fitness goals (fat loss, muscle gain, etc.)&lt;/li&gt;\r\n	&lt;li&gt;Daily routine (office, active, student, etc.)&lt;/li&gt;\r\n	&lt;li&gt;Medical history or conditions&lt;/li&gt;\r\n	&lt;li&gt;Food preferences (veg/non-veg, allergies)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;h3&gt;Real Talk&lt;/h3&gt;\r\n\r\n&lt;p&gt;Following random diets from the internet can slow your progress or even harm your health. Personalized nutrition removes that noise and gives you a clear, practical path that actually fits your life.&lt;/p&gt;\r\n', 1, 'Personalized Nutrition Plans: Custom Diet Strategies for Your Body &amp; Goals', 'personalized nutrition, custom diet plan, meal planning for fitness, healthy eating plan, diet based on body type, nutrition for weight loss, fitness diet plan, balanced meal strategy', 'Discover personalized nutrition plans tailored to your body, lifestyle, and goals. Learn why custom diet strategies deliver better, sustainable results for health, fitness, and overall well-being.', 'what-is-a-personalized-nutrition-plan', '2026-04-29', '2026-04-29 04:59:12', '2026-04-29 04:59:12', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `uid` varchar(128) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `combination_key` varchar(100) DEFAULT NULL,
  `imageurl` varchar(250) DEFAULT NULL,
  `date` varchar(40) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT current_timestamp(),
  `updatedate` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `hot` int(11) DEFAULT NULL,
  `referkey` varchar(60) DEFAULT NULL,
  `referkeyid` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `uid`, `title`, `category`, `combination_key`, `imageurl`, `date`, `createdate`, `updatedate`, `status`, `priority`, `hot`, `referkey`, `referkeyid`) VALUES
(1, '2bd81c75-3310-4746-9f51-8e4db369185c', 'Test downloads', 'Downloads', 'DOWNLOADS', '../imgserver/uploads/attachments/test-downloads_fc_380.pdf', NULL, '2022-10-20 09:28:44', '2022-10-20 09:28:44', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `file_attachments`
--

CREATE TABLE `file_attachments` (
  `id` int(11) NOT NULL,
  `uid` varchar(150) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL,
  `sub_category` varchar(200) DEFAULT NULL,
  `link_type` varchar(20) DEFAULT NULL,
  `imageurl` varchar(250) DEFAULT NULL,
  `link` longtext DEFAULT NULL,
  `combination_key` varchar(100) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT current_timestamp(),
  `updatedate` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hot` int(11) DEFAULT NULL,
  `referkey` varchar(60) DEFAULT NULL,
  `referkeyid` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `file_attachments`
--

INSERT INTO `file_attachments` (`id`, `uid`, `title`, `category`, `sub_category`, `link_type`, `imageurl`, `link`, `combination_key`, `priority`, `status`, `createdate`, `updatedate`, `hot`, `referkey`, `referkeyid`) VALUES
(1, 'b8773cbf-1156-4cbe-8b08-23ebc164ffc9', 'eee', NULL, NULL, NULL, '../../imgserver/uploads/attachments/eee_b8773cbf-1156-4cbe-8b08-23ebc164ffc9_0.pdf', NULL, 'ATTACHMENTS_1', 1, 1, '2025-01-24 09:37:12', '2025-01-24 09:37:12', NULL, NULL, NULL),
(2, '0d2f626f-eb72-4b6e-a0f7-af6cbf846e47', 'mm', NULL, NULL, NULL, '../../imgserver/uploads/attachments/mm_0d2f626f-eb72-4b6e-a0f7-af6cbf846e47_0.pdf', NULL, 'ATTACHMENTS_1', 2, 1, '2025-01-29 09:16:47', '2025-01-29 09:16:47', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `user_id`, `time`) VALUES
(13, 253, '1768194415'),
(14, 274, '1778218713'),
(15, 274, '1778218722');

-- --------------------------------------------------------

--
-- Table structure for table `media_gallery`
--

CREATE TABLE `media_gallery` (
  `id` bigint(20) NOT NULL,
  `media_id` varchar(128) NOT NULL,
  `metaname` varchar(128) DEFAULT NULL,
  `metatype` varchar(60) DEFAULT NULL,
  `metacontent` longtext DEFAULT NULL,
  `source_hash` longtext DEFAULT NULL,
  `create_timestamp` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_timestamp` timestamp NULL DEFAULT current_timestamp(),
  `referkey` varchar(60) DEFAULT NULL,
  `referkeyid` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `media_gallery`
--

INSERT INTO `media_gallery` (`id`, `media_id`, `metaname`, `metatype`, `metacontent`, `source_hash`, `create_timestamp`, `update_timestamp`, `referkey`, `referkeyid`, `status`) VALUES
(1, '3db928da-cfa5-48d9-82cb-726555578c37', 'EDITORIMAGE', 'BANNERIMAGE', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__3db928da-cfa5-48d9-82cb-726555578c37_0.png', NULL, '2025-11-17 04:46:49', '2025-11-17 04:45:41', NULL, NULL, 2),
(2, 'dbdb400a-240f-448c-a312-4e2eba6ace41', 'EDITORIMAGE', 'BANNERIMAGE', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__dbdb400a-240f-448c-a312-4e2eba6ace41_0.png', NULL, '2025-11-17 04:46:49', '2025-11-17 04:46:14', NULL, NULL, 2),
(3, 'c52c7c68-072f-456c-b7ac-7a8112e1ff36', 'EDITORIMAGE', 'BANNERIMAGE', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__c52c7c68-072f-456c-b7ac-7a8112e1ff36_0.png', NULL, '2025-11-17 04:46:49', '2025-11-17 04:46:48', NULL, NULL, 2),
(4, 'ae8e932b-d480-435a-b102-3e21f05fea86', 'EDITORIMAGE', 'PRODUCTS', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__ae8e932b-d480-435a-b102-3e21f05fea86_0.png', NULL, '2025-11-17 06:34:12', '2025-11-17 06:06:46', NULL, NULL, 2),
(5, 'bfd72b8f-9611-45a1-ad5d-5356231a5dca', 'EDITORIMAGE', 'PRODUCTS', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__bfd72b8f-9611-45a1-ad5d-5356231a5dca_0.png', NULL, '2025-11-17 06:34:12', '2025-11-17 06:10:14', NULL, NULL, 2),
(6, 'fdb041ae-3850-4dec-a873-3696907ede00', 'EDITORIMAGE', 'PRODUCTS', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__fdb041ae-3850-4dec-a873-3696907ede00_0.png', NULL, '2025-11-17 06:34:12', '2025-11-17 06:10:41', NULL, NULL, 2),
(7, '9d75f465-74b9-41f0-a890-1eb1b2b988cc', 'EDITORIMAGE', 'PRODUCTS', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__9d75f465-74b9-41f0-a890-1eb1b2b988cc_0.png', NULL, '2025-11-17 06:34:12', '2025-11-17 06:12:28', NULL, NULL, 2),
(8, '7e17e86f-74b1-4629-aead-780edca6a05d', 'EDITORIMAGE', 'PRODUCTS', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__7e17e86f-74b1-4629-aead-780edca6a05d_0.png', NULL, '2025-11-17 06:34:12', '2025-11-17 06:18:52', NULL, NULL, 2),
(9, '60a58be4-5ed3-4460-a147-5facb3e0a449', 'EDITORIMAGE', 'PRODUCTS', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__60a58be4-5ed3-4460-a147-5facb3e0a449_0.png', NULL, '2025-11-17 06:34:12', '2025-11-17 06:26:38', NULL, NULL, 2),
(10, 'e6084868-1d54-4930-a97e-6ef080ff8978', 'EDITORIMAGE', 'PRODUCTS', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__e6084868-1d54-4930-a97e-6ef080ff8978_0.png', NULL, '2025-11-17 06:34:12', '2025-11-17 06:26:58', NULL, NULL, 2),
(11, '6b265a1a-49cc-40f0-8f97-cc098f54d739', 'EDITORIMAGE', 'PRODUCTS', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__6b265a1a-49cc-40f0-8f97-cc098f54d739_0.png', NULL, '2025-11-17 06:34:12', '2025-11-17 06:27:27', NULL, NULL, 2),
(12, 'f85fba8b-e2ef-45d3-bfcf-657a1aa03d80', 'EDITORIMAGE', 'PRODUCTS', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__f85fba8b-e2ef-45d3-bfcf-657a1aa03d80_0.png', NULL, '2025-11-17 06:34:12', '2025-11-17 06:27:51', NULL, NULL, 2),
(13, 'b8275a00-ef89-4a46-b0b4-5eda6879b14e', 'EDITORIMAGE', 'PRODUCTS', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__b8275a00-ef89-4a46-b0b4-5eda6879b14e_0.png', NULL, '2025-11-17 06:34:12', '2025-11-17 06:31:31', NULL, NULL, 2),
(14, 'dcdd6aca-791e-40d3-9ee5-867284ec80b0', 'EDITORIMAGE', 'PRODUCTS', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__dcdd6aca-791e-40d3-9ee5-867284ec80b0_0.png', NULL, '2025-11-17 06:34:12', '2025-11-17 06:32:36', NULL, NULL, 2),
(15, '3cd92de8-8721-48c7-8e26-9a0e3e3ed382', 'EDITORIMAGE', 'PRODUCTS', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__3cd92de8-8721-48c7-8e26-9a0e3e3ed382_0.png', NULL, '2025-11-17 06:34:12', '2025-11-17 06:32:55', NULL, NULL, 2),
(16, 'b554c76e-947e-430f-965b-f69329a92af9', 'EDITORIMAGE', 'PRODUCTS', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__b554c76e-947e-430f-965b-f69329a92af9_0.png', NULL, '2025-11-17 06:34:12', '2025-11-17 06:34:11', NULL, NULL, 2),
(17, '10474f8b-aaea-42a4-8925-cc8e057669da', 'EDITORIMAGE', 'MEALPLAN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__10474f8b-aaea-42a4-8925-cc8e057669da_0.png', NULL, '2025-11-17 07:29:06', '2025-11-17 07:29:04', NULL, NULL, 2),
(18, '54679dd9-4d77-4c20-87c8-99458b49c100', 'EDITORIMAGE', 'MEALPLAN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__54679dd9-4d77-4c20-87c8-99458b49c100_0.png', NULL, '2025-11-17 08:45:01', '2025-11-17 08:45:00', NULL, NULL, 2),
(19, 'b5ddc2dd-9fef-4586-8a7a-0d1285292353', 'EDITORIMAGE', 'MEALPLAN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__b5ddc2dd-9fef-4586-8a7a-0d1285292353_0.png', NULL, '2025-11-17 09:15:38', '2025-11-17 09:15:37', NULL, NULL, 2),
(20, 'f6c58127-3b5c-4c87-9425-ed937aacd932', 'EDITORIMAGE', 'MEALPLAN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__f6c58127-3b5c-4c87-9425-ed937aacd932_0.png', NULL, '2025-11-17 09:15:52', '2025-11-17 09:15:48', NULL, NULL, 2),
(21, '769487aa-988b-4a98-ba5e-ec2b6bd669ba', 'EDITORIMAGE', 'MEALPLAN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__769487aa-988b-4a98-ba5e-ec2b6bd669ba_0.png', NULL, '2025-11-17 09:17:16', '2025-11-17 09:17:15', NULL, NULL, 2),
(22, '4141c70f-f0ca-48d2-9a72-c26eedbc8ac9', 'EDITORIMAGE', 'MEALPLAN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__4141c70f-f0ca-48d2-9a72-c26eedbc8ac9_0.png', NULL, '2025-11-17 09:17:55', '2025-11-17 09:17:55', NULL, NULL, 2),
(23, '411758b4-ba0f-4b25-9b08-3ee870a2046f', 'EDITORIMAGE', 'MEALPLAN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__411758b4-ba0f-4b25-9b08-3ee870a2046f_0.png', NULL, '2025-11-17 09:18:34', '2025-11-17 09:18:33', NULL, NULL, 2),
(24, '37a3d937-c6f0-4a62-a9ab-d862960e23f5', 'EDITORIMAGE', 'MEALPLAN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__37a3d937-c6f0-4a62-a9ab-d862960e23f5_0.png', NULL, '2025-11-17 09:19:09', '2025-11-17 09:18:49', NULL, NULL, 2),
(25, '5dd99916-cb97-40db-ba55-7c1182121786', 'EDITORIMAGE', 'MEALPLAN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__5dd99916-cb97-40db-ba55-7c1182121786_0.png', NULL, '2025-11-17 09:19:09', '2025-11-17 09:19:08', NULL, NULL, 2),
(26, '8491e852-0aab-4c85-99c7-4c5db0046560', 'EDITORIMAGE', 'MEALPLAN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__8491e852-0aab-4c85-99c7-4c5db0046560_0.png', NULL, '2025-11-17 09:30:23', '2025-11-17 09:30:22', NULL, NULL, 2),
(27, '9b16eaac-d4ee-4c8f-9e17-5f24ae746391', 'EDITORIMAGE', 'MEALPLAN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__9b16eaac-d4ee-4c8f-9e17-5f24ae746391_0.png', NULL, '2025-11-17 09:30:31', '2025-11-17 09:30:30', NULL, NULL, 2),
(28, '85006ed2-8b99-4d8d-a419-5003fdba269d', 'EDITORIMAGE', 'KITCHEN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__85006ed2-8b99-4d8d-a419-5003fdba269d_0.png', NULL, '2025-11-17 11:25:53', '2025-11-17 11:19:26', NULL, NULL, 2),
(29, 'c64ff331-d743-464e-adb7-d8d38aa4290c', 'EDITORIMAGE', 'KITCHEN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__c64ff331-d743-464e-adb7-d8d38aa4290c_0.png', NULL, '2025-11-17 11:25:53', '2025-11-17 11:20:34', NULL, NULL, 2),
(30, '80f57988-bad6-4e50-a28e-9a9460e33438', 'EDITORIMAGE', 'KITCHEN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__80f57988-bad6-4e50-a28e-9a9460e33438_0.png', NULL, '2025-11-17 11:25:53', '2025-11-17 11:21:16', NULL, NULL, 2),
(31, '26174f78-e742-4733-9776-c8b87d07d83f', 'EDITORIMAGE', 'KITCHEN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__26174f78-e742-4733-9776-c8b87d07d83f_0.png', NULL, '2025-11-17 11:25:53', '2025-11-17 11:21:49', NULL, NULL, 2),
(32, '997078f8-9753-4222-9816-73bd75d31849', 'EDITORIMAGE', 'KITCHEN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__997078f8-9753-4222-9816-73bd75d31849_0.png', NULL, '2025-11-17 11:46:57', '2025-11-17 11:46:56', NULL, NULL, 2),
(33, '0ea95794-6b04-4b6d-b3cd-6f3eb6d16b8f', 'EDITORIMAGE', 'KITCHEN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__0ea95794-6b04-4b6d-b3cd-6f3eb6d16b8f_0.png', NULL, '2025-11-17 11:47:55', '2025-11-17 11:47:55', NULL, NULL, 2),
(34, '9674c7cc-2c11-48ab-be7d-765f67a9ece1', 'EDITORIMAGE', 'MEALPLAN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__9674c7cc-2c11-48ab-be7d-765f67a9ece1_0.png', NULL, '2025-11-18 04:31:57', '2025-11-18 04:31:56', NULL, NULL, 2),
(35, 'c359835e-f6a6-44b2-834c-bf6221d2ba3f', 'EDITORIMAGE', 'MEALPLAN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__c359835e-f6a6-44b2-834c-bf6221d2ba3f_0.png', NULL, '2025-11-18 04:44:39', '2025-11-18 04:44:38', NULL, NULL, 2),
(36, '32796af3-d492-4028-b6ff-f88180238f67', 'EDITORIMAGE', 'MEALPLAN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__32796af3-d492-4028-b6ff-f88180238f67_0.png', NULL, '2025-11-18 04:44:50', '2025-11-18 04:44:50', NULL, NULL, 2),
(37, '0739fb77-b531-48d2-9f15-bb01d180acc4', 'EDITORIMAGE', 'MEALPLAN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__0739fb77-b531-48d2-9f15-bb01d180acc4_0.png', NULL, '2025-11-18 04:45:08', '2025-11-18 04:45:07', NULL, NULL, 2),
(38, 'e26b81f7-e0dc-412f-9cf7-8cea67a7641a', 'EDITORIMAGE', 'MEALPLAN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__e26b81f7-e0dc-412f-9cf7-8cea67a7641a_0.png', NULL, '2025-11-18 04:55:14', '2025-11-18 04:55:12', NULL, NULL, 2),
(39, '7d4b455d-84cd-4582-95c1-943ddb4b02bf', 'EDITORIMAGE', 'WE_WORK_WITH_SLIDER', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__7d4b455d-84cd-4582-95c1-943ddb4b02bf_0.png', NULL, '2025-11-19 05:10:15', '2025-11-19 05:04:57', NULL, NULL, 2),
(40, 'c1957e7a-30ca-4dbe-9b3b-9a533e63a8f1', 'EDITORIMAGE', 'WE_WORK_WITH_SLIDER', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__c1957e7a-30ca-4dbe-9b3b-9a533e63a8f1_0.png', NULL, '2025-11-19 05:10:15', '2025-11-19 05:05:15', NULL, NULL, 2),
(41, '28d32f39-6aa7-49cf-be8e-f898ade1ebf1', 'EDITORIMAGE', 'WE_WORK_WITH_SLIDER', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__28d32f39-6aa7-49cf-be8e-f898ade1ebf1_0.png', NULL, '2025-11-19 05:10:15', '2025-11-19 05:09:17', NULL, NULL, 2),
(42, '683979bc-dd22-4c1e-8460-a78bc159ab1d', 'EDITORIMAGE', 'WE_WORK_WITH_SLIDER', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__683979bc-dd22-4c1e-8460-a78bc159ab1d_0.png', NULL, '2025-11-19 05:10:15', '2025-11-19 05:10:14', NULL, NULL, 2),
(43, 'a20e2b28-9f2a-48dd-8ceb-cc22e18cb684', 'EDITORIMAGE', 'WE_WORK_WITH_SLIDER', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__a20e2b28-9f2a-48dd-8ceb-cc22e18cb684_0.png', NULL, '2025-11-19 05:10:37', '2025-11-19 05:10:35', NULL, NULL, 2),
(44, 'a53c47c6-0b5e-4181-a7f2-91392ab66020', 'EDITORIMAGE', 'MEALPLAN', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__a53c47c6-0b5e-4181-a7f2-91392ab66020_0.png', NULL, '2025-11-19 05:35:34', '2025-11-19 05:35:33', NULL, NULL, 2),
(45, '2f3deacb-eb49-4590-b00a-de504592cae0', 'EDITORIMAGE', 'PRODUCTS', 'http://localhost/square_meals/imgserver/uploads/attachments/pcm__2f3deacb-eb49-4590-b00a-de504592cae0_0.png', NULL, '2025-12-03 10:53:51', '2025-11-24 10:39:46', NULL, NULL, 2),
(46, '0e4b2944-06ab-4c85-a57e-5ff30a41bbe6', 'EDITORIMAGE', 'PRODUCTS', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__0e4b2944-06ab-4c85-a57e-5ff30a41bbe6_0.png', NULL, '2026-04-17 12:47:12', '2025-12-03 10:53:50', NULL, NULL, 2),
(47, 'd31fdfda-3882-4467-b29d-238ee917221d', 'EDITORIMAGE', 'PRODUCTS', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__d31fdfda-3882-4467-b29d-238ee917221d_0.png', NULL, '2026-04-17 12:47:12', '2025-12-03 10:54:05', NULL, NULL, 2),
(48, '1abfb410-71a0-4e38-ba95-0b528c61cb87', 'EDITORIMAGE', 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__1abfb410-71a0-4e38-ba95-0b528c61cb87_0.png', NULL, '2026-04-17 12:47:12', '2025-12-05 10:06:29', NULL, NULL, 2),
(49, '13d5dd57-528c-4609-9e03-5eccde692063', 'EDITORIMAGE', 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__13d5dd57-528c-4609-9e03-5eccde692063_0.png', NULL, '2026-04-17 12:47:12', '2025-12-05 10:06:58', NULL, NULL, 2),
(50, '5eadb54a-9437-411e-8e6d-e55470b066e2', 'EDITORIMAGE', 'PRODUCTS', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__5eadb54a-9437-411e-8e6d-e55470b066e2_0.png', NULL, '2026-04-17 12:47:12', '2025-12-09 04:37:40', NULL, NULL, 2),
(51, '92c8cda0-e255-477d-8e43-e9b481e2abb9', 'EDITORIMAGE', 'PRODUCTS', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__92c8cda0-e255-477d-8e43-e9b481e2abb9_0.png', NULL, '2026-04-17 12:47:12', '2025-12-09 04:38:58', NULL, NULL, 2),
(52, 'bd9aef09-6c9b-4205-bae6-cdd6b9edb1bd', 'EDITORIMAGE', 'PRODUCTS', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__bd9aef09-6c9b-4205-bae6-cdd6b9edb1bd_0.png', NULL, '2026-04-17 12:47:12', '2025-12-09 04:51:04', NULL, NULL, 2),
(53, 'b1a8cbce-129d-46cf-b2f6-f21bfe016c0c', 'EDITORIMAGE', 'PRODUCTS', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__b1a8cbce-129d-46cf-b2f6-f21bfe016c0c_0.png', NULL, '2026-04-17 12:47:12', '2025-12-09 04:51:33', NULL, NULL, 2),
(54, '5d45433c-2cf6-4eef-bf8d-dea84aca78d4', 'EDITORIMAGE', 'PRODUCTS', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__5d45433c-2cf6-4eef-bf8d-dea84aca78d4_0.png', NULL, '2026-04-17 12:47:12', '2025-12-09 04:51:42', NULL, NULL, 2),
(55, 'b76139fb-8ab6-47ed-aa4b-25600d79f729', 'EDITORIMAGE', 'PRODUCTS', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__b76139fb-8ab6-47ed-aa4b-25600d79f729_0.png', NULL, '2026-04-17 12:47:12', '2025-12-09 04:52:28', NULL, NULL, 2),
(56, 'e38f247d-6f06-4c20-bf22-06689ea26675', 'EDITORIMAGE', 'PRODUCTS', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__e38f247d-6f06-4c20-bf22-06689ea26675_0.png', NULL, '2026-04-17 12:47:12', '2025-12-09 04:54:42', NULL, NULL, 2),
(57, 'a3d643ad-b3f8-4149-8aa8-675fbe40bd9c', 'EDITORIMAGE', 'KITCHEN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__a3d643ad-b3f8-4149-8aa8-675fbe40bd9c_0.png', NULL, '2026-04-17 12:47:12', '2025-12-09 05:45:20', NULL, NULL, 2),
(58, '1aca6fa6-f041-4912-a051-0346f181b5b2', 'EDITORIMAGE', 'PRODUCTS', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__1aca6fa6-f041-4912-a051-0346f181b5b2_0.png', NULL, '2026-04-17 12:47:12', '2025-12-09 10:14:45', NULL, NULL, 2),
(59, 'bfbf5657-aa1d-452c-8fc3-90029a52b057', 'EDITORIMAGE', 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__bfbf5657-aa1d-452c-8fc3-90029a52b057_0.png', NULL, '2026-04-17 12:47:12', '2025-12-10 11:52:15', NULL, NULL, 2),
(60, 'f2ad67fa-b274-4e1c-b9b4-0893e508f68b', 'EDITORIMAGE', 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__f2ad67fa-b274-4e1c-b9b4-0893e508f68b_0.png', NULL, '2026-04-17 12:47:12', '2025-12-10 11:52:29', NULL, NULL, 2),
(61, '9c432ef8-5128-4d61-a23f-0a0d3325182c', 'EDITORIMAGE', 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__9c432ef8-5128-4d61-a23f-0a0d3325182c_0.png', NULL, '2026-04-17 12:47:12', '2025-12-10 11:52:34', NULL, NULL, 2),
(62, 'f898f1ee-3540-4c73-8dd2-aac02281cfb7', 'EDITORIMAGE', 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__f898f1ee-3540-4c73-8dd2-aac02281cfb7_0.png', NULL, '2026-04-17 12:47:12', '2025-12-11 05:08:12', NULL, NULL, 2),
(63, '4d7b7059-cd1b-4218-9d6d-4d700423a567', 'EDITORIMAGE', 'PRODUCTS', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__4d7b7059-cd1b-4218-9d6d-4d700423a567_0.png', NULL, '2026-04-17 12:47:12', '2025-12-12 11:31:41', NULL, NULL, 2),
(64, '147f240d-0b2d-409b-b7d6-e7bb967760b6', 'EDITORIMAGE', 'PRODUCTS', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__147f240d-0b2d-409b-b7d6-e7bb967760b6_0.png', NULL, '2026-04-17 12:47:12', '2025-12-12 11:31:47', NULL, NULL, 2),
(65, '15c3a7ec-e9c8-4631-b818-6587f36af2a2', 'EDITORIMAGE', 'KITCHEN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__15c3a7ec-e9c8-4631-b818-6587f36af2a2_0.png', NULL, '2026-04-17 12:47:12', '2025-12-13 06:44:10', NULL, NULL, 2),
(66, '6abe4856-44af-4b53-a075-4fa6e3615e56', 'EDITORIMAGE', 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__6abe4856-44af-4b53-a075-4fa6e3615e56_0.png', NULL, '2026-04-17 12:47:12', '2025-12-15 09:53:44', NULL, NULL, 2),
(67, 'ef393c9f-7d6e-4211-9561-6ebdb44230bd', 'EDITORIMAGE', 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__ef393c9f-7d6e-4211-9561-6ebdb44230bd_0.png', NULL, '2026-04-17 12:47:12', '2025-12-15 09:54:06', NULL, NULL, 2),
(68, 'ebf8b30f-5e71-4a18-95ef-9d104b889b5c', 'EDITORIMAGE', 'KITCHEN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__ebf8b30f-5e71-4a18-95ef-9d104b889b5c_0.png', NULL, '2026-04-17 12:47:12', '2025-12-18 05:25:29', NULL, NULL, 2),
(69, 'cdb39924-1821-4b72-add6-1c187ac7d90d', 'EDITORIMAGE', 'KITCHEN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__cdb39924-1821-4b72-add6-1c187ac7d90d_0.png', NULL, '2026-04-17 12:47:12', '2025-12-18 05:30:55', NULL, NULL, 2),
(70, 'bb0963a4-1687-4a59-b0fe-7f965a6e85f3', 'EDITORIMAGE', 'KITCHEN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__bb0963a4-1687-4a59-b0fe-7f965a6e85f3_0.png', NULL, '2026-04-17 12:47:12', '2025-12-18 05:32:01', NULL, NULL, 2),
(71, '904e5b0c-238c-40d7-9ef1-c867b69a1081', 'EDITORIMAGE', 'KITCHEN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__904e5b0c-238c-40d7-9ef1-c867b69a1081_0.png', NULL, '2026-04-17 12:47:12', '2025-12-18 05:37:35', NULL, NULL, 2),
(72, '17fb5a02-dc2c-46a9-b134-1a0949dfcdd9', 'EDITORIMAGE', 'KITCHEN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__17fb5a02-dc2c-46a9-b134-1a0949dfcdd9_0.png', NULL, '2026-04-17 12:47:12', '2025-12-18 11:01:53', NULL, NULL, 2),
(73, '2b13db39-de80-4b82-bfc1-c85ec791a816', 'EDITORIMAGE', 'PRODUCTS', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__2b13db39-de80-4b82-bfc1-c85ec791a816_0.png', NULL, '2026-04-17 12:47:12', '2025-12-24 05:39:56', NULL, NULL, 2),
(74, 'ffd2eda0-347b-4276-8343-cd178de5b836', 'EDITORIMAGE', 'KITCHEN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__ffd2eda0-347b-4276-8343-cd178de5b836_0.png', NULL, '2026-04-17 12:47:12', '2025-12-31 10:30:33', NULL, NULL, 2),
(75, 'b5d94b87-32ed-469b-ade0-faf2da3cfc21', 'EDITORIMAGE', 'WE_WORK_WITH_SLIDER', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__b5d94b87-32ed-469b-ade0-faf2da3cfc21_0.png', NULL, '2026-04-17 12:47:12', '2025-12-31 11:00:37', NULL, NULL, 2),
(76, '3af63ad4-fe33-416c-8de0-80467a187be7', 'EDITORIMAGE', 'WE_WORK_WITH_SLIDER', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__3af63ad4-fe33-416c-8de0-80467a187be7_0.png', NULL, '2026-04-17 12:47:12', '2025-12-31 11:00:54', NULL, NULL, 2),
(77, '1cd31cbb-647b-4299-946a-06b364700019', 'EDITORIMAGE', 'WE_WORK_WITH_SLIDER', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__1cd31cbb-647b-4299-946a-06b364700019_0.png', NULL, '2026-04-17 12:47:12', '2025-12-31 11:01:40', NULL, NULL, 2),
(78, '2d66388d-d720-49fd-b64a-2932171ee9d8', 'EDITORIMAGE', 'WE_WORK_WITH_SLIDER', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/pcm__2d66388d-d720-49fd-b64a-2932171ee9d8_0.png', NULL, '2026-04-17 12:47:12', '2026-01-03 10:56:41', NULL, NULL, 2),
(79, '3cb14678-b4fd-4f3a-afec-a3e6883faf01', 'EDITORIMAGE', 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__3cb14678-b4fd-4f3a-afec-a3e6883faf01_0.png', NULL, '2026-04-17 12:47:12', '2026-01-24 07:03:33', NULL, NULL, 2),
(80, '3cb14678-b4fd-4f3a-afec-a3e6883faf01', 'EDITORIMAGE', 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__3cb14678-b4fd-4f3a-afec-a3e6883faf01_0.png', NULL, '2026-04-17 12:47:12', '2026-01-24 07:03:47', NULL, NULL, 2),
(81, 'b00d4ff7-0e86-4890-9b30-ee03e8df5547', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__b00d4ff7-0e86-4890-9b30-ee03e8df5547_0.png', NULL, '2026-04-17 12:47:12', '2026-02-25 08:35:59', NULL, NULL, 2),
(82, '4e71fef7-a836-484b-9c5f-b6458858f360', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__4e71fef7-a836-484b-9c5f-b6458858f360_0.png', NULL, '2026-04-17 12:47:12', '2026-02-25 08:54:58', NULL, NULL, 2),
(83, '18cabd51-b8be-4e77-8087-1b76019f38f3', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__18cabd51-b8be-4e77-8087-1b76019f38f3_0.png', NULL, '2026-04-17 12:47:12', '2026-02-25 09:05:39', NULL, NULL, 2),
(84, '9925ff5f-2dc3-4e2e-aaa5-4e12d7c62c45', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__9925ff5f-2dc3-4e2e-aaa5-4e12d7c62c45_0.png', NULL, '2026-04-17 12:47:12', '2026-02-26 05:17:08', NULL, NULL, 2),
(85, 'a1e8abcb-8b1f-4995-a2ff-8d0cb2de907d', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__a1e8abcb-8b1f-4995-a2ff-8d0cb2de907d_0.png', NULL, '2026-04-17 12:47:13', '2026-02-26 05:25:06', NULL, NULL, 2),
(86, 'a8a1bd27-1ab5-4655-a5d2-49d5b550eba6', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__a8a1bd27-1ab5-4655-a5d2-49d5b550eba6_0.png', NULL, '2026-04-17 12:47:13', '2026-02-26 05:27:37', NULL, NULL, 2),
(87, '83985c5d-b72b-4ff8-9c74-d3c5e495890d', NULL, 'WE_WORK_WITH_SLIDER', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__83985c5d-b72b-4ff8-9c74-d3c5e495890d_0.png', NULL, '2026-04-17 12:47:13', '2026-02-26 05:43:24', NULL, NULL, 2),
(88, '8e5e12bb-585f-4fa8-a6fd-96cbed0d2815', NULL, 'TRAINER', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__8e5e12bb-585f-4fa8-a6fd-96cbed0d2815_0.png', NULL, '2026-04-17 12:47:13', '2026-03-04 09:57:30', NULL, NULL, 2),
(89, 'fb91cd49-c705-43d6-bde1-77f653b3fb72', NULL, 'WE_WORK_WITH_SLIDER', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__fb91cd49-c705-43d6-bde1-77f653b3fb72_0.png', NULL, '2026-04-17 12:47:13', '2026-03-25 04:28:34', NULL, NULL, 2),
(90, '4255e4f8-bca6-41c1-9150-513fe7cc3378', NULL, 'WE_WORK_WITH_SLIDER', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__4255e4f8-bca6-41c1-9150-513fe7cc3378_0.png', NULL, '2026-04-17 12:47:13', '2026-03-25 04:28:39', NULL, NULL, 2),
(91, 'a3a818c2-9672-42f2-8c7d-79c59e879aa1', NULL, 'WE_WORK_WITH_SLIDER', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__a3a818c2-9672-42f2-8c7d-79c59e879aa1_0.png', NULL, '2026-04-17 12:47:13', '2026-03-25 04:28:44', NULL, NULL, 2),
(92, 'bfd7d8d5-fa89-481e-98d6-8dbf94926728', NULL, 'COORDINATOR', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__bfd7d8d5-fa89-481e-98d6-8dbf94926728_0.png', NULL, '2026-04-17 12:47:13', '2026-03-25 07:04:37', NULL, NULL, 2),
(93, '0a9b28d5-5f0b-440d-97c4-16f61cee5351', NULL, 'COORDINATOR', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__0a9b28d5-5f0b-440d-97c4-16f61cee5351_0.png', NULL, '2026-04-17 12:47:13', '2026-03-31 05:55:40', NULL, NULL, 2),
(94, '6dee5418-3053-4749-9f6c-89e7507842bc', NULL, 'COORDINATOR', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__6dee5418-3053-4749-9f6c-89e7507842bc_0.png', NULL, '2026-04-17 12:47:13', '2026-03-31 05:57:12', NULL, NULL, 2),
(95, '64b915dd-b1ce-4492-9965-1c1847b303d6', NULL, 'COORDINATOR', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__64b915dd-b1ce-4492-9965-1c1847b303d6_0.png', NULL, '2026-04-17 12:47:13', '2026-03-31 06:43:41', NULL, NULL, 2),
(96, '9288715d-d726-4d17-8da2-5d128244ebd4', NULL, 'COORDINATOR', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__9288715d-d726-4d17-8da2-5d128244ebd4_0.png', NULL, '2026-04-17 12:47:13', '2026-03-31 06:52:00', NULL, NULL, 2),
(97, 'd43b2c1d-8bc8-469b-986c-4cb104861d9d', NULL, 'COORDINATOR', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__d43b2c1d-8bc8-469b-986c-4cb104861d9d_0.png', NULL, '2026-04-17 12:47:13', '2026-03-31 06:53:42', NULL, NULL, 2),
(98, '9b2aba7f-fed5-4347-9254-1813a9834dbd', NULL, 'COORDINATOR', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__9b2aba7f-fed5-4347-9254-1813a9834dbd_0.png', NULL, '2026-04-17 12:47:13', '2026-03-31 07:14:21', NULL, NULL, 2),
(99, 'be973d43-57f3-484b-a9b5-484f636a0196', NULL, 'TRAINER', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__be973d43-57f3-484b-a9b5-484f636a0196_0.png', NULL, '2026-04-17 12:47:13', '2026-04-17 11:08:37', NULL, NULL, 2),
(100, 'ca931f72-147a-42eb-8076-4175bc7073eb', NULL, 'WE_WORK_WITH_SLIDER', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__ca931f72-147a-42eb-8076-4175bc7073eb_0.png', NULL, '2026-04-17 12:47:13', '2026-04-17 11:24:30', NULL, NULL, 2),
(101, 'c03b87b0-aa10-4ea4-aa44-1b5817767e0c', NULL, 'WE_WORK_WITH_SLIDER', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__c03b87b0-aa10-4ea4-aa44-1b5817767e0c_0.png', NULL, '2026-04-17 12:47:13', '2026-04-17 11:25:04', NULL, NULL, 2),
(102, '304e640c-10f0-4212-b7ff-a5866ee89b1a', NULL, 'WE_WORK_WITH_SLIDER', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__304e640c-10f0-4212-b7ff-a5866ee89b1a_0.png', NULL, '2026-04-17 12:47:13', '2026-04-17 11:25:10', NULL, NULL, 2),
(103, 'de7720ec-2a9f-4ed6-8da2-386419d6ce23', NULL, 'WE_WORK_WITH_SLIDER', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__de7720ec-2a9f-4ed6-8da2-386419d6ce23_0.png', NULL, '2026-04-17 12:47:13', '2026-04-17 11:25:18', NULL, NULL, 2),
(104, '7a498208-e21e-4bf2-9235-8c7693128319', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__7a498208-e21e-4bf2-9235-8c7693128319_0.png', NULL, '2026-04-17 12:47:13', '2026-04-17 11:50:46', NULL, NULL, 2),
(105, '88aaa9d5-547d-4967-bf63-f1e5299b57fd', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__88aaa9d5-547d-4967-bf63-f1e5299b57fd_0.png', NULL, '2026-04-17 12:47:13', '2026-04-17 11:51:22', NULL, NULL, 2),
(106, '6d142ba4-4356-4564-8c94-9a26467ea94b', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__6d142ba4-4356-4564-8c94-9a26467ea94b_0.png', NULL, '2026-04-17 12:47:13', '2026-04-17 11:52:12', NULL, NULL, 2),
(107, '67cb6d62-9530-4ba3-830b-d34611eb775f', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__67cb6d62-9530-4ba3-830b-d34611eb775f_0.png', NULL, '2026-04-17 12:47:13', '2026-04-17 11:53:41', NULL, NULL, 2),
(108, '85032c34-bd70-4c12-96d8-4685b6f020f2', NULL, 'COORDINATOR', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__85032c34-bd70-4c12-96d8-4685b6f020f2_0.png', NULL, '2026-04-22 10:48:09', '2026-04-22 10:48:05', NULL, NULL, 2),
(109, 'f4c18379-0db2-4931-8ac1-d76f154e608b', NULL, 'COORDINATOR', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__f4c18379-0db2-4931-8ac1-d76f154e608b_0.png', NULL, '2026-04-22 10:48:45', '2026-04-22 10:48:42', NULL, NULL, 2),
(110, 'd24ee2b8-cddd-4dc9-ad93-0622b0625f75', NULL, 'COORDINATOR', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__d24ee2b8-cddd-4dc9-ad93-0622b0625f75_0.png', NULL, '2026-04-22 10:51:26', '2026-04-22 10:51:15', NULL, NULL, 2),
(111, '14955120-8ed2-44dd-aa03-93d0852d1469', NULL, 'COORDINATOR', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__14955120-8ed2-44dd-aa03-93d0852d1469_0.png', NULL, '2026-04-22 11:12:55', '2026-04-22 11:12:53', NULL, NULL, 2),
(112, 'c004d531-3944-4bb9-a018-18469aebd724', NULL, 'TRAINER', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__c004d531-3944-4bb9-a018-18469aebd724_0.png', NULL, '2026-04-22 11:16:28', '2026-04-22 11:16:18', NULL, NULL, 2),
(113, '0e0f68cd-3435-44e7-82a9-c9dfcc382ff6', NULL, 'TRAINER', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__0e0f68cd-3435-44e7-82a9-c9dfcc382ff6_0.png', NULL, '2026-04-22 11:18:02', '2026-04-22 11:18:00', NULL, NULL, 2),
(114, '6e678b9c-d91b-406a-8038-78a7fbcb8ef8', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__6e678b9c-d91b-406a-8038-78a7fbcb8ef8_0.png', NULL, '2026-04-23 05:19:34', '2026-04-23 05:19:32', NULL, NULL, 2),
(115, '106f9e7d-050e-4674-af33-a9e8e2594b12', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__106f9e7d-050e-4674-af33-a9e8e2594b12_0.png', NULL, '2026-04-23 05:21:42', '2026-04-23 05:21:40', NULL, NULL, 2),
(116, '9ebae301-4246-42e1-b65e-c589e8e09f3f', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__9ebae301-4246-42e1-b65e-c589e8e09f3f_0.png', NULL, '2026-04-23 05:31:11', '2026-04-23 05:31:10', NULL, NULL, 2),
(117, 'f7f8f62b-ff0f-4ca5-8f4d-5c44b619b059', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__f7f8f62b-ff0f-4ca5-8f4d-5c44b619b059_0.png', NULL, '2026-04-23 12:40:33', '2026-04-23 12:40:32', NULL, NULL, 2),
(118, '9a792e1f-75e9-4784-814a-ffa05e423a40', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__9a792e1f-75e9-4784-814a-ffa05e423a40_0.png', NULL, '2026-04-23 12:41:00', '2026-04-23 12:40:59', NULL, NULL, 2),
(119, '5e195fca-75d8-4451-84be-7be8f5ffd611', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__5e195fca-75d8-4451-84be-7be8f5ffd611_0.png', NULL, '2026-04-23 12:47:19', '2026-04-23 12:47:18', NULL, NULL, 2),
(120, '54e501a8-5300-41e4-b0f3-1a06bd3fc9eb', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__54e501a8-5300-41e4-b0f3-1a06bd3fc9eb_0.png', NULL, '2026-04-23 12:56:03', '2026-04-23 12:56:02', NULL, NULL, 2),
(121, '7e0135ed-32c7-4b05-8b61-3b1d3edb4206', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__7e0135ed-32c7-4b05-8b61-3b1d3edb4206_0.png', NULL, '2026-04-23 12:56:56', '2026-04-23 12:56:56', NULL, NULL, 2),
(122, '165c3f36-2721-48d1-b62f-fa4a00dc7812', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__165c3f36-2721-48d1-b62f-fa4a00dc7812_0.png', NULL, '2026-04-23 13:01:03', '2026-04-23 13:00:49', NULL, NULL, 2),
(123, '10c1def5-263f-43db-8300-e3eac8d0739c', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__10c1def5-263f-43db-8300-e3eac8d0739c_0.png', NULL, '2026-04-23 13:04:18', '2026-04-23 13:04:16', NULL, NULL, 2),
(124, 'c5b45e24-42ee-4ca4-9f52-cc89bc9dad6f', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__c5b45e24-42ee-4ca4-9f52-cc89bc9dad6f_0.png', NULL, '2026-04-23 13:05:09', '2026-04-23 13:05:08', NULL, NULL, 2),
(125, 'ac498d9c-6b05-46e3-a102-28483177fd8d', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__ac498d9c-6b05-46e3-a102-28483177fd8d_0.png', NULL, '2026-04-23 13:05:33', '2026-04-23 13:05:32', NULL, NULL, 2),
(126, 'e2e49f18-26d6-48d1-8809-1dfd6f058f2c', NULL, 'MEALPLAN', 'https://www.squarefitglobal.com/imgserver/uploads/attachments/sqf__e2e49f18-26d6-48d1-8809-1dfd6f058f2c_0.png', NULL, '2026-04-23 13:09:03', '2026-04-23 13:09:01', NULL, NULL, 2),
(127, 'bcd56c97-4f7e-4158-b577-6eed004df061', 'EDITORIMAGE', 'CASE_STUDY', 'http://localhost/squarefit/server/uploads/attachments/sqf__bcd56c97-4f7e-4158-b577-6eed004df061_0.png', NULL, '2026-04-28 04:30:28', '2026-04-28 04:19:48', NULL, NULL, 2),
(128, 'e63190f9-9810-46fa-b746-2258c5f35c05', 'EDITORIMAGE', 'CASE_STUDY', 'http://localhost/squarefit/server/uploads/attachments/sqf__e63190f9-9810-46fa-b746-2258c5f35c05_0.png', NULL, '2026-04-28 04:30:28', '2026-04-28 04:24:11', NULL, NULL, 2),
(129, '8b50d606-11fd-4bc8-9c42-633e89ace218', 'EDITORIMAGE', 'CASE_STUDY', 'http://localhost/squarefit/server/uploads/attachments/sqf__8b50d606-11fd-4bc8-9c42-633e89ace218_0.png', NULL, '2026-04-28 04:30:28', '2026-04-28 04:24:30', NULL, NULL, 2),
(130, 'e82ce049-1aad-43ac-a8ad-474821767364', 'EDITORIMAGE', 'CASE_STUDY', 'http://localhost/squarefit/server/uploads/attachments/sqf__e82ce049-1aad-43ac-a8ad-474821767364_0.png', NULL, '2026-04-28 04:30:28', '2026-04-28 04:30:24', NULL, NULL, 2),
(131, 'b5f2d39f-10f7-406a-8839-6cde39dd4348', 'EDITORIMAGE', 'CASE_STUDY', 'http://localhost/squarefit/server/uploads/attachments/sqf__b5f2d39f-10f7-406a-8839-6cde39dd4348_0.png', NULL, '2026-04-28 04:33:44', '2026-04-28 04:33:41', NULL, NULL, 2),
(132, '5e368d72-79ab-4601-b36a-742c21b07c2d', 'EDITORIMAGE', 'CASE_STUDY', 'http://localhost/squarefit/imgserver/uploads/attachments/sqf__5e368d72-79ab-4601-b36a-742c21b07c2d_0.png', NULL, '2026-04-28 04:35:49', '2026-04-28 04:34:37', NULL, NULL, 2),
(133, '5e368d72-79ab-4601-b36a-742c21b07c2d', 'EDITORIMAGE', 'CASE_STUDY', 'http://localhost/squarefit/imgserver/uploads/attachments/sqf__5e368d72-79ab-4601-b36a-742c21b07c2d_0.png', NULL, '2026-04-28 04:35:49', '2026-04-28 04:35:17', NULL, NULL, 2),
(134, '0f1ffcd1-af64-4168-9591-711037e366b0', NULL, 'CASE_STUDY', 'http://localhost/squarefit/imgserver/uploads/attachments/sqf__0f1ffcd1-af64-4168-9591-711037e366b0_0.png', NULL, '2026-04-29 05:24:23', '2026-04-29 05:00:10', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `media_gallery_compressed`
--

CREATE TABLE `media_gallery_compressed` (
  `id` bigint(20) NOT NULL,
  `media_id` varchar(128) DEFAULT NULL,
  `metaname` varchar(128) DEFAULT NULL,
  `metatype` varchar(60) DEFAULT NULL,
  `metacontent` longtext DEFAULT NULL,
  `source_hash` longtext DEFAULT NULL,
  `create_timestamp` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_timestamp` timestamp NULL DEFAULT current_timestamp(),
  `referkey` varchar(60) DEFAULT NULL,
  `referkeyid` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `media_gallery_compressed`
--

INSERT INTO `media_gallery_compressed` (`id`, `media_id`, `metaname`, `metatype`, `metacontent`, `source_hash`, `create_timestamp`, `update_timestamp`, `referkey`, `referkeyid`, `status`) VALUES
(1, 'bdee8984-d334-4e55-85d9-c88db95f220b', NULL, NULL, 'https://www.squarefitglobal.com/imgserver/uploads/compressed/1772009789_d40b734897f7f0f6854715b5d4fd0c23-lossy.webp', 'da086e2e72762e45360ec0f8bb6b75c38851231d', '2026-04-17 12:47:13', '2026-02-25 08:56:30', 'COMPRESSED', '4e71fef7-a836-484b-9c5f-b6458858f360', 91253),
(2, 'f31f1631-2cf0-443b-b83b-6d142f11e1f8', NULL, NULL, 'https://www.squarefitglobal.com/imgserver/uploads/compressed/1772009789_d40b734897f7f0f6854715b5d4fd0c23-lossy.webp', 'da086e2e72762e45360ec0f8bb6b75c38851231d', '2026-04-17 12:47:13', '2026-02-25 08:56:30', 'COMPRESSED', '4e71fef7-a836-484b-9c5f-b6458858f360', 91253),
(3, '3cc38285-a68c-4dc1-97bd-2b887b34a035', NULL, NULL, 'https://www.squarefitglobal.com/imgserver/uploads/compressed/1772010348_8d10063057ace8e2115725c19f8740ce-lossy.webp', 'bd97b5ab9fc7b886b5709a097f6cd248433606ab', '2026-04-17 12:47:13', '2026-02-25 09:05:48', 'COMPRESSED', '18cabd51-b8be-4e77-8087-1b76019f38f3', 91253),
(4, 'b1fa3abb-1fc8-43c7-a838-618050ac3781', NULL, NULL, 'https://www.squarefitglobal.com/imgserver/uploads/compressed/1772083034_474d25860cbbb552a238e912b46ec093-lossy.webp', 'b3221f62f7d66a3f7f85cf96ecea6a6b94910df7', '2026-04-17 12:47:13', '2026-02-26 05:17:14', 'COMPRESSED', '9925ff5f-2dc3-4e2e-aaa5-4e12d7c62c45', 2),
(5, '6676e251-456d-4c71-8cd6-ebac1a81662c', NULL, NULL, 'https://www.squarefitglobal.com/imgserver/uploads/compressed/1772083519_583c3bd4a9eae0e6f81517c118bfd5ae-lossy.webp', 'ff411114afa42f1622cb9e1ec9e39b5f381e7685', '2026-04-17 12:47:13', '2026-02-26 05:25:20', 'COMPRESSED', 'a1e8abcb-8b1f-4995-a2ff-8d0cb2de907d', 2),
(6, '26454a46-20bf-4422-b567-8546819d4e48', NULL, NULL, 'https://www.squarefitglobal.com/imgserver/uploads/compressed/1772083800_99518e61090c2a5e1ac6f25017a20517-lossy.webp', '7494cdd8dafa268f68041112487369b23fccc324', '2026-04-17 12:47:13', '2026-02-26 05:30:00', 'COMPRESSED', 'a8a1bd27-1ab5-4655-a5d2-49d5b550eba6', 2),
(7, 'f5a20070-85d0-44c6-a2fb-69da6eaf2225', NULL, NULL, 'https://www.squarefitglobal.com/imgserver/uploads/compressed/1772084609_4240da273a624c27902b208fed878759-lossy.webp', '7cb989468e21a76c94a6f196e3b023497c8f6798', '2026-04-17 12:47:13', '2026-02-26 05:43:29', 'COMPRESSED', '9ec0b859-ce9d-4093-9d00-da77ab47cb8b', 91253);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `userid` varchar(150) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `phonecode` varchar(10) DEFAULT NULL,
  `password` char(128) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `user_type_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `create_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiry` varchar(90) DEFAULT NULL,
  `refer_type` varchar(60) DEFAULT NULL,
  `refer_id` int(11) DEFAULT NULL,
  `referral_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `userid`, `username`, `email`, `phone_number`, `phonecode`, `password`, `salt`, `user_type`, `user_type_id`, `status`, `create_timestamp`, `update_timestamp`, `expiry`, `refer_type`, `refer_id`, `referral_code`) VALUES
(258, 'USER_69300d93825a0', 'akash', 'akashpt248@gmail.com', '1234567890', NULL, 'adb701e8a76dbcadfbc2a2c00eb2191de89b59ce4c84d3d1cb0204ee2d8896ac5c8b63021e449ef33f19bd6fca01c39302e6be0e30c8567887391c25f58bc7d2', '1400d6ea15af379033363d71abd20923b8ab950e48f0040ec21be75454c8dcc0', 'user', NULL, 1, '2025-12-23 09:04:42', '2025-12-03 10:14:43', NULL, NULL, NULL, 'SMED2E5567'),
(270, 'USER_6960d55a2abea', 'akashpt', 'akashptmampetta@gmail.com', '1234567822', NULL, '30a90bc098d1e3444eba1488f55b588ca4a08f497688e80c2c7638cfd1cf572b7f2496d32ae325e371d0d66b59a4b97e146afb71603c2df286826dd9285e2512', 'b4e0cd1f9972141c902181f4e3e86a84eb725ed0b2313b941fb112a53a031a23', 'user', NULL, 1, '2026-01-09 10:15:54', '2026-01-09 10:15:54', NULL, 'referral', 258, 'SQF9632B87C'),
(271, 'MEM_69b7eb4e02bc5', 'sf-admin', 'mishal@gmail.com', '9061328490', NULL, '2e973966b971c41eb3ab7e6513b23d2c395d86a4c5b92cf90c1b9b06f4c050f135b520f61e7e4375168e3a793cf50d7cc3aeb3b7283525a5abb04a4a40795fb8', 'c070c68b70762180e9d4cbb99636d33857890e9ca0ae5ca9a20b7658f9fd903eb9820afa12f21d76e84e90cc307b22d226337a68d544658792ab2575fcee86a7', 'admin', NULL, 1, '2026-03-16 11:36:46', '2026-03-16 11:36:46', NULL, NULL, 253, NULL),
(274, 'MEM_69e21bab61451', 'afsal', 'afsalrahmanvk786@gmail.com', '9061751534', NULL, 'b1016a9cea733c8416570acc5951af5e35336640c942b37bd46f0c832c06278cb9edc21b8797b94dc906173638323f421867c38822412647dc35d8ef673a74b0', '97730987d8b0e7609598d8593417265bcb1628891f08f45b692b2c9b337f4bc701d062ff457a4d8d4cb1fbc04b5a6772280697101aadff971f93848412e64eb2', 'coordinator', 11, 1, '2026-04-22 04:33:36', '2026-04-17 11:38:19', NULL, NULL, 253, NULL),
(277, 'MEM_69e76425e6659', 'admin', 'support@xctllp.com', '7510611511', NULL, '9fda7e2d2983e9a4b2040fddbeb913392cbb048af5eb79a063faa39983be5469f68c4d4cc84dbbb33e931e105967322d9f3daa4d496fe71bde3dd013dbe7f740', 'd49b1f94ab513ccd724f3f02e97b4e07300abd192e85a5df72154634f14959a9f26b8106d83c38a52a9df2de6d249f3fd681769dba346cf05294368f010e30e9', 'admin', NULL, 1, '2026-04-21 11:49:18', '2026-04-21 11:48:53', NULL, NULL, 271, NULL),
(279, 'MEM_69eb5302debe1', 'akashdr', 'akashdr@gmail.com', '1212343456', NULL, '50822a6d601559d3a9f74f59ddf748ccc3e1c1a57689af6fa92fe3a403a9d270ecb58cab8cbad3ff53500ad2f7f9905802d58ceb6161504b99e8e792827b4d7b', 'aca0a4291882e14fb5094515e45e26c6d5375938e648f237eb84d01902da617831daf115634aa4c648f44c8a351d472a6244acceff98189270a55ab8fa127f14', 'coordinator', 28, 1, '2026-04-24 11:27:42', '2026-04-24 11:24:50', NULL, NULL, 277, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `content`, `imageurl`, `type`, `ref_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Shoreline', 'Grayscale is open source and MIT licensed. This means you can use it for any project - even commercial projects! Download it, customize it, and publish your website!\r\n\r\n', 'https://startbootstrap.github.io/startbootstrap-grayscale/assets/img/bg-masthead.jpg', 1, NULL, 1, '2026-05-11 06:57:24', '2026-05-11 06:58:24'),
(2, 'Misty\r\n', 'An example of where you can put an image of a project, or anything else, along with a description.\r\n\r\n\r\n', 'https://startbootstrap.github.io/startbootstrap-grayscale/assets/img/demo-image-01.jpg', 2, 1, 1, '2026-05-11 06:57:24', '2026-05-11 06:58:24'),
(3, 'Mountains\r\n', 'Another example of a project with its respective description. These sections work well responsively as well!\r\n\r\n\r\n\r\n', '	https://startbootstrap.github.io/startbootstrap-grayscale/assets/img/demo-image-02.jpg', 2, 1, 1, '2026-05-11 06:57:24', '2026-05-11 06:58:24'),
(4, 'Mountains\r\n', 'Another example of a project with its respective description. These sections work well responsively as well!\r\n\r\n\r\n\r\n', '	https://startbootstrap.github.io/startbootstrap-grayscale/assets/img/demo-image-02.jpg', 2, 1, 1, '2026-05-11 06:57:24', '2026-05-11 06:58:24');

-- --------------------------------------------------------

--
-- Table structure for table `systemconfig_xc`
--

CREATE TABLE `systemconfig_xc` (
  `id` int(11) NOT NULL,
  `configname` varchar(80) DEFAULT NULL,
  `configvalue` longtext DEFAULT NULL,
  `metaname` varchar(60) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `sc_id` varchar(80) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `create_timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `systemconfig_xc`
--

INSERT INTO `systemconfig_xc` (`id`, `configname`, `configvalue`, `metaname`, `category`, `sc_id`, `status`, `create_timestamp`, `update_timestamp`) VALUES
(45, 'admin', '0', 'USERTYPES', NULL, '61ef9bcf3a65c', 1, '2022-01-25 06:42:23', '2026-03-21 06:04:45'),
(76, 'coordinator', '1', 'USERTYPES', NULL, '691aa6dca699c', 1, '2025-11-17 04:38:52', '2026-03-21 06:04:31'),
(77, 'kitchen', '2', 'USERTYPES', NULL, '691aa6fa794d1', 1, '2025-11-17 04:39:22', '2026-03-21 06:04:26'),
(82, 'trainer', '3', 'USERTYPES', NULL, '691bb67ed9om3', 1, '2025-11-17 04:39:22', '2026-01-12 06:34:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_attachments`
--
ALTER TABLE `file_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_gallery`
--
ALTER TABLE `media_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_gallery_compressed`
--
ALTER TABLE `media_gallery_compressed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `referral_code` (`referral_code`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `systemconfig_xc`
--
ALTER TABLE `systemconfig_xc`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `file_attachments`
--
ALTER TABLE `file_attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `media_gallery`
--
ALTER TABLE `media_gallery`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `media_gallery_compressed`
--
ALTER TABLE `media_gallery_compressed`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;

--
-- AUTO_INCREMENT for table `systemconfig_xc`
--
ALTER TABLE `systemconfig_xc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
