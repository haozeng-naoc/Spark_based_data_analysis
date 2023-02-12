/*
 Navicat Premium Data Transfer

 Source Server         : bigdata
 Source Server Type    : MySQL
 Source Server Version : 50651 (5.6.51)
 Source Host           : node1:3306
 Source Schema         : bigdata

 Target Server Type    : MySQL
 Target Server Version : 50651 (5.6.51)
 File Encoding         : 65001

 Date: 02/02/2023 20:26:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Average_price
-- ----------------------------
DROP TABLE IF EXISTS `Average_price`;
CREATE TABLE `Average_price`  (
  `Win_price` double NULL DEFAULT NULL,
  `Mac_price` double NULL DEFAULT NULL,
  `Linux_price` double NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Average_price
-- ----------------------------
INSERT INTO `Average_price` VALUES (6.11910862919045, 7.168453802989055, 7.053737303585381);

-- ----------------------------
-- Table structure for Pos_neg
-- ----------------------------
DROP TABLE IF EXISTS `Pos_neg`;
CREATE TABLE `Pos_neg`  (
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `positive count` bigint(20) NULL DEFAULT NULL,
  `negative count` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Pos_neg
-- ----------------------------
INSERT INTO `Pos_neg` VALUES ('Dota 2', 1477153, 300437);
INSERT INTO `Pos_neg` VALUES ('Counter-Strike: Global Offensive', 5764420, 766677);
INSERT INTO `Pos_neg` VALUES ('Team Fortress 2', 823693, 56683);
INSERT INTO `Pos_neg` VALUES ('PUBG: BATTLEGROUNDS', 1154655, 895978);
INSERT INTO `Pos_neg` VALUES ('Lost Ark', 124308, 44066);
INSERT INTO `Pos_neg` VALUES ('Path of Exile', 167454, 16653);
INSERT INTO `Pos_neg` VALUES ('Terraria', 964983, 21044);
INSERT INTO `Pos_neg` VALUES ('Brawlhalla', 246362, 46611);
INSERT INTO `Pos_neg` VALUES ('Grand Theft Auto V', 1171197, 210154);
INSERT INTO `Pos_neg` VALUES ('Wallpaper Engine', 522889, 10368);

-- ----------------------------
-- Table structure for categories_count
-- ----------------------------
DROP TABLE IF EXISTS `categories_count`;
CREATE TABLE `categories_count`  (
  `category` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `Frequency` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of categories_count
-- ----------------------------
INSERT INTO `categories_count` VALUES ('Single-player', 61913);
INSERT INTO `categories_count` VALUES ('Steam Achievements', 30810);
INSERT INTO `categories_count` VALUES ('Steam Cloud', 15640);
INSERT INTO `categories_count` VALUES ('Full controller support', 13186);
INSERT INTO `categories_count` VALUES ('Multi-player', 13025);
INSERT INTO `categories_count` VALUES ('Steam Trading Cards', 9486);
INSERT INTO `categories_count` VALUES ('Partial Controller Support', 8909);
INSERT INTO `categories_count` VALUES ('PvP', 8189);
INSERT INTO `categories_count` VALUES ('Co-op', 6414);
INSERT INTO `categories_count` VALUES ('Steam Leaderboards', 6005);

-- ----------------------------
-- Table structure for language_count
-- ----------------------------
DROP TABLE IF EXISTS `language_count`;
CREATE TABLE `language_count`  (
  `language` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `Frequency` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of language_count
-- ----------------------------
INSERT INTO `language_count` VALUES ('English', 63616);
INSERT INTO `language_count` VALUES ('German', 15227);
INSERT INTO `language_count` VALUES ('Simplified Chinese', 14827);
INSERT INTO `language_count` VALUES ('French', 14725);
INSERT INTO `language_count` VALUES ('Russian', 14286);
INSERT INTO `language_count` VALUES ('Spanish - Spain', 13538);
INSERT INTO `language_count` VALUES ('Japanese', 11801);
INSERT INTO `language_count` VALUES ('Italian', 10247);
INSERT INTO `language_count` VALUES ('Portuguese - Brazil', 7539);
INSERT INTO `language_count` VALUES ('Korean', 7526);

-- ----------------------------
-- Table structure for most_downloaded_games_price
-- ----------------------------
DROP TABLE IF EXISTS `most_downloaded_games_price`;
CREATE TABLE `most_downloaded_games_price`  (
  `Name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `Price` double NULL DEFAULT NULL,
  `owners clean` double NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of most_downloaded_games_price
-- ----------------------------
INSERT INTO `most_downloaded_games_price` VALUES ('Dota 2', 0, 50000000);
INSERT INTO `most_downloaded_games_price` VALUES ('PUBG: BATTLEGROUNDS', 0, 25000000);
INSERT INTO `most_downloaded_games_price` VALUES ('Counter-Strike: Global Offensive', 0, 25000000);
INSERT INTO `most_downloaded_games_price` VALUES ('New World', 39.99, 25000000);
INSERT INTO `most_downloaded_games_price` VALUES ('Team Fortress 2', 0, 25000000);
INSERT INTO `most_downloaded_games_price` VALUES ('Tom Clancy\'s Rainbow SixÃÂ® Siege', 19.99, 15040000);
INSERT INTO `most_downloaded_games_price` VALUES ('Half-Life 2: Lost Coast', 0, 15000000);
INSERT INTO `most_downloaded_games_price` VALUES ('Warframe', 0, 15000000);
INSERT INTO `most_downloaded_games_price` VALUES ('Valheim', 19.99, 15000000);
INSERT INTO `most_downloaded_games_price` VALUES ('ELDEN RING', 59.99, 15000000);

-- ----------------------------
-- Table structure for rate_rank
-- ----------------------------
DROP TABLE IF EXISTS `rate_rank`;
CREATE TABLE `rate_rank`  (
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `rate` double NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rate_rank
-- ----------------------------
INSERT INTO `rate_rank` VALUES ('Sands of Fire', 1);
INSERT INTO `rate_rank` VALUES ('Find The Sunbed', 1);
INSERT INTO `rate_rank` VALUES ('Subwar 2050', 1);
INSERT INTO `rate_rank` VALUES ('3x3 the immersive fiction chapter one : Math awakening', 1);
INSERT INTO `rate_rank` VALUES ('Mystic Midway: Rest in Pieces', 1);
INSERT INTO `rate_rank` VALUES ('Eschaton', 1);
INSERT INTO `rate_rank` VALUES ('Search for the Titanic', 1);
INSERT INTO `rate_rank` VALUES ('The Iron Union', 1);
INSERT INTO `rate_rank` VALUES ('Retro Run', 1);
INSERT INTO `rate_rank` VALUES ('Shadoworlds', 1);

-- ----------------------------
-- Table structure for support
-- ----------------------------
DROP TABLE IF EXISTS `support`;
CREATE TABLE `support`  (
  `have_support_time` double NULL DEFAULT NULL,
  `no_support_time` double NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of support
-- ----------------------------
INSERT INTO `support` VALUES (38928.98161920203, 133432.89085545723);

-- ----------------------------
-- Table structure for top_dlc_developers
-- ----------------------------
DROP TABLE IF EXISTS `top_dlc_developers`;
CREATE TABLE `top_dlc_developers`  (
  `Developers` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sum_DLC_count` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of top_dlc_developers
-- ----------------------------
INSERT INTO `top_dlc_developers` VALUES ('0', 6079);
INSERT INTO `top_dlc_developers` VALUES ('Dovetail Games', 3549);
INSERT INTO `top_dlc_developers` VALUES ('60', 2369);
INSERT INTO `top_dlc_developers` VALUES ('975', 1968);
INSERT INTO `top_dlc_developers` VALUES ('TigerQiuQiu', 1703);
INSERT INTO `top_dlc_developers` VALUES ('710', 1555);
INSERT INTO `top_dlc_developers` VALUES ('Gotcha Gotcha Games,KADOKAWA,Yoji Ojima', 1308);
INSERT INTO `top_dlc_developers` VALUES ('KOEI TECMO GAMES CO., LTD.', 575);
INSERT INTO `top_dlc_developers` VALUES ('1904', 461);
INSERT INTO `top_dlc_developers` VALUES ('CAPCOM Co., Ltd.', 292);

-- ----------------------------
-- Table structure for top_publishers_total_downloads
-- ----------------------------
DROP TABLE IF EXISTS `top_publishers_total_downloads`;
CREATE TABLE `top_publishers_total_downloads`  (
  `Publishers` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `owners clean` double NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of top_publishers_total_downloads
-- ----------------------------
INSERT INTO `top_publishers_total_downloads` VALUES ('Valve', 222020000);
INSERT INTO `top_publishers_total_downloads` VALUES ('Ubisoft', 67505000);
INSERT INTO `top_publishers_total_downloads` VALUES ('Electronic Arts', 54825000);
INSERT INTO `top_publishers_total_downloads` VALUES ('Xbox Game Studios', 41020000);
INSERT INTO `top_publishers_total_downloads` VALUES ('Amazon Games', 40000000);
INSERT INTO `top_publishers_total_downloads` VALUES ('Bethesda Softworks', 39885000);
INSERT INTO `top_publishers_total_downloads` VALUES ('SEGA', 31005000);
INSERT INTO `top_publishers_total_downloads` VALUES ('Square Enix', 27075000);
INSERT INTO `top_publishers_total_downloads` VALUES ('KRAFTON, Inc.', 25510000);
INSERT INTO `top_publishers_total_downloads` VALUES ('Rockstar Games', 24675000);

-- ----------------------------
-- Table structure for years
-- ----------------------------
DROP TABLE IF EXISTS `years`;
CREATE TABLE `years`  (
  `year` bigint(20) NULL DEFAULT NULL,
  `Name` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of years
-- ----------------------------
INSERT INTO `years` VALUES (2022, 13960);
INSERT INTO `years` VALUES (2021, 12306);
INSERT INTO `years` VALUES (2020, 9473);
INSERT INTO `years` VALUES (2018, 7853);
INSERT INTO `years` VALUES (2019, 7614);
INSERT INTO `years` VALUES (2017, 6182);
INSERT INTO `years` VALUES (2016, 4310);
INSERT INTO `years` VALUES (2015, 2620);
INSERT INTO `years` VALUES (2014, 1590);
INSERT INTO `years` VALUES (2013, 482);
INSERT INTO `years` VALUES (2012, 350);
INSERT INTO `years` VALUES (2009, 328);
INSERT INTO `years` VALUES (2010, 297);
INSERT INTO `years` VALUES (2011, 281);
INSERT INTO `years` VALUES (2023, 208);
INSERT INTO `years` VALUES (2008, 166);
INSERT INTO `years` VALUES (2007, 102);
INSERT INTO `years` VALUES (2006, 69);
INSERT INTO `years` VALUES (2005, 7);
INSERT INTO `years` VALUES (2004, 7);
INSERT INTO `years` VALUES (2001, 4);
INSERT INTO `years` VALUES (2003, 3);
INSERT INTO `years` VALUES (1999, 3);
INSERT INTO `years` VALUES (1997, 2);
INSERT INTO `years` VALUES (2000, 2);
INSERT INTO `years` VALUES (1998, 1);
INSERT INTO `years` VALUES (2002, 1);
INSERT INTO `years` VALUES (2025, 1);

SET FOREIGN_KEY_CHECKS = 1;
