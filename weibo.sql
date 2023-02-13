/*
 Navicat MySQL Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : weibo

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 06/02/2023 05:17:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id1` int(11) NULL DEFAULT NULL,
  `user_id2` int(11) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chat
-- ----------------------------
INSERT INTO `chat` VALUES (46, '2023-01-22 17:14:36', 42, 35, '男神');
INSERT INTO `chat` VALUES (45, '2023-01-22 17:14:06', 42, 35, '新年快乐');
INSERT INTO `chat` VALUES (44, '2023-01-22 17:13:39', 35, 42, 'hello');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `post_id` int(11) NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT 0,
  `reply_id` int(11) NULL DEFAULT 0,
  `time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (32, '本来想留下猥琐评论，但爱是隐忍，这波我选择不说了', 43, 25, 0, 0, '2023-01-09 13:07:29', '新疆');
INSERT INTO `comment` VALUES (3, '梅西是球王[泪][泪][泪]', 18, 2, 0, 0, '2023-01-01 16:43:36', '浙江');
INSERT INTO `comment` VALUES (29, '你为啥可以发语音哈哈哈哈哈', 40, 22, 28, 0, '2023-01-09 12:26:41', '新疆');
INSERT INTO `comment` VALUES (28, '啊啊啊啊好帅的勒。', 39, 22, 0, 0, '2023-01-09 12:22:57', '新疆');
INSERT INTO `comment` VALUES (23, '太牛了，也太不容易了踢的', 37, 2, 3, 0, '2023-01-09 07:17:07', '新疆');
INSERT INTO `comment` VALUES (9, '2023继续陪你 支持你 宝贝 新年快乐♥️', 27, 6, 0, 0, '2023-01-02 23:02:56', '新疆');
INSERT INTO `comment` VALUES (10, '娜比新年快乐', 28, 6, 0, 0, '2023-01-03 00:01:11', '新疆');
INSERT INTO `comment` VALUES (11, '啊啊啊 宝贝', 29, 6, 0, 0, '2023-01-03 00:07:55', '新疆');
INSERT INTO `comment` VALUES (20, 'ᑋᵉᑊᑊᵒ 宝贝 本命年已过 新的一年 在任何事儿上都锦上添花吧 希望在奔赴未来的路上 我们有着生生不息的热爱 如星璀璨 如风自由 2023一定会更好', 36, 12, 0, 0, '2023-01-09 06:03:18', '新疆');
INSERT INTO `comment` VALUES (34, '想听', 42, 25, 32, 0, '2023-01-09 13:11:54', '新疆');
INSERT INTO `comment` VALUES (36, '梅西是球王[泪][泪][泪]', 42, 32, 0, 0, '2023-01-28 03:20:31', '新疆');
INSERT INTO `comment` VALUES (38, '[送花花][送花花]姐姐新年快乐', 2, 57, 0, 0, '2023-01-28 03:42:55', '新疆');

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id1` int(11) NULL DEFAULT NULL COMMENT '发起关注的人',
  `user_id2` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES (1, 8, 2);
INSERT INTO `follow` VALUES (2, 9, 2);
INSERT INTO `follow` VALUES (3, 10, 2);
INSERT INTO `follow` VALUES (4, 11, 2);
INSERT INTO `follow` VALUES (5, 12, 2);
INSERT INTO `follow` VALUES (6, 13, 2);
INSERT INTO `follow` VALUES (7, 14, 2);
INSERT INTO `follow` VALUES (8, 15, 2);
INSERT INTO `follow` VALUES (9, 16, 2);
INSERT INTO `follow` VALUES (10, 17, 2);
INSERT INTO `follow` VALUES (11, 18, 2);
INSERT INTO `follow` VALUES (12, 19, 2);
INSERT INTO `follow` VALUES (13, 20, 2);
INSERT INTO `follow` VALUES (14, 21, 2);
INSERT INTO `follow` VALUES (15, 22, 2);
INSERT INTO `follow` VALUES (16, 23, 2);
INSERT INTO `follow` VALUES (18, 24, 2);
INSERT INTO `follow` VALUES (19, 44, 26);
INSERT INTO `follow` VALUES (38, 30, 7);

-- ----------------------------
-- Table structure for last_chat
-- ----------------------------
DROP TABLE IF EXISTS `last_chat`;
CREATE TABLE `last_chat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id1` int(11) NULL DEFAULT NULL COMMENT '这里的user_id1代表你',
  `user_id2` int(11) NULL DEFAULT NULL COMMENT '这里的user_id2代表和你聊天的那个人',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `send_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `unread` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of last_chat
-- ----------------------------
INSERT INTO `last_chat` VALUES (6, 35, 42, '男神', '2023-01-22 17:13:39', 0);
INSERT INTO `last_chat` VALUES (5, 42, 35, '男神', '2023-01-22 17:13:39', 0);

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NULL DEFAULT NULL,
  `video` int(11) NULL DEFAULT NULL,
  `refer_id` int(11) NULL DEFAULT 0,
  `category` int(11) NULL DEFAULT 0,
  `sort` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (46, '听说表现不错，看完告诉你[太开心]', '2023-01-10 12:12:36', 46, NULL, 0, 1, 1);
INSERT INTO `post` VALUES (45, '祝大家新年快乐，瘦比南山～[爱你]', '2023-01-10 12:04:01', 7, NULL, 0, 0, 3);
INSERT INTO `post` VALUES (42, '相约蒂芙尼', '2023-01-10 11:37:58', 38, NULL, 0, 10, 1);
INSERT INTO `post` VALUES (41, '新年快乐 给大家拜个早年', '2023-01-10 11:36:39', 31, NULL, 0, 9, 3);
INSERT INTO `post` VALUES (38, '三、二、一。', '2023-01-10 11:32:36', 30, NULL, 0, 6, 1);
INSERT INTO `post` VALUES (40, '我和冬梅祝大家元旦快乐，新年快乐！', '2023-01-10 11:35:22', 33, NULL, 0, 8, 1);
INSERT INTO `post` VALUES (39, '久等了', '2023-01-09 11:33:58', 34, NULL, 0, 7, 2);
INSERT INTO `post` VALUES (37, '從不完美找到完美，肯定都是上天最好的安排。', '2023-01-10 11:31:22', 44, NULL, 0, 5, 2);
INSERT INTO `post` VALUES (35, '支持超哥！', '2023-01-10 11:26:24', 45, NULL, 0, 3, 3);
INSERT INTO `post` VALUES (36, '祝大家新年快樂。2023 努力、加油。事事順利。', '2023-01-10 11:28:56', 35, NULL, 0, 4, 1);
INSERT INTO `post` VALUES (34, '新年快乐', '2023-01-10 11:17:01', 32, NULL, 0, 2, 1);
INSERT INTO `post` VALUES (32, '冬至快乐！', '2023-01-10 11:14:41', 2, NULL, 0, 0, 1);
INSERT INTO `post` VALUES (33, '「Tell me a story that it all will be fine. 」', '2023-01-10 11:16:16', 25, NULL, 0, 1, 2);
INSERT INTO `post` VALUES (47, '两张梗图原来有这样的内外联系啊[思考]', '2023-01-10 12:25:36', 47, NULL, 0, 2, 2);
INSERT INTO `post` VALUES (48, ' 两点点花絮[嘻嘻]', '2023-01-10 12:33:40', 48, NULL, 0, 3, 2);
INSERT INTO `post` VALUES (49, '《像阳光那样》[太阳]', '2023-01-10 12:43:25', 49, NULL, 0, 4, 3);
INSERT INTO `post` VALUES (50, '待会儿见[挤眼]', '2023-01-10 12:50:49', 50, NULL, 0, 5, 1);
INSERT INTO `post` VALUES (51, '我翻了翻相册 只有这些了 2022拜拜[耶]', '2023-01-10 12:57:24', 51, NULL, 0, 6, 2);
INSERT INTO `post` VALUES (52, '昨天我的儿童绘本上线了，今天我收到了同事给我做的糖葫芦和我日思夜想的秘制馄饨，我顿时明白了……[偷笑]', '2023-01-10 13:02:39', 52, NULL, 0, 7, 3);
INSERT INTO `post` VALUES (53, '又是新的一年，三餐相伴，四时常在，好好吃饭[心]', '2023-01-10 13:08:00', 53, NULL, 0, 8, 2);
INSERT INTO `post` VALUES (54, '今天解锁葡萄牙语[太阳]', '2023-01-10 13:16:08', 54, NULL, 0, 9, 1);
INSERT INTO `post` VALUES (55, '听歌 留作业[哈哈]', '2023-01-10 13:24:22', 55, NULL, 0, 10, 3);
INSERT INTO `post` VALUES (57, '一月。[打call][打call]', '2023-01-10 13:38:19', 56, NULL, 0, 0, 2);
INSERT INTO `post` VALUES (58, '孙老师随身携带的，拎包的是我，回头率呵呵。[并不简单]', '2023-01-10 13:47:58', 57, NULL, 0, 1, 3);
INSERT INTO `post` VALUES (59, '愿我们的生命里都有光，好好看的画[太阳]', '2023-01-10 13:56:37', 58, NULL, 0, 2, 3);
INSERT INTO `post` VALUES (61, 'Goodbye 2022! Hello 2023![挤眼][爱你]', '2023-01-10 14:05:41', 60, NULL, 0, 4, 2);
INSERT INTO `post` VALUES (62, '新年，快乐⁺²⁰²³[心][偷笑]', '2023-01-10 14:12:00', 61, NULL, 0, 5, 3);
INSERT INTO `post` VALUES (63, 'Here’s to a bright 2023 !!', '2023-01-10 14:22:35', 62, NULL, 0, 6, 3);
INSERT INTO `post` VALUES (65, '幕后花絮[爱你][good]', '2023-01-10 14:36:13', 64, NULL, 0, 8, 3);
INSERT INTO `post` VALUES (66, '新年快乐！2023，都会很ok的！[并不简单]', '2023-01-10 14:41:03', 65, NULL, 0, 9, 2);
INSERT INTO `post` VALUES (67, '祝大家元旦快乐！新的一年都要平安健康，一起随心舞动吧[爱你][爱你][挤眼]', '2023-01-10 14:46:46', 66, NULL, 0, 10, 2);
INSERT INTO `post` VALUES (68, '除夕快乐！发财被爱好运常在~[心]', '2023-01-28 07:42:38', 69, NULL, 0, 3, 1);
INSERT INTO `post` VALUES (69, '续写传奇，2023赛季启航！[耶]', '2023-01-28 08:00:58', 70, NULL, 0, 7, 1);
INSERT INTO `post` VALUES (70, '新春之际，想对所有爱我和我爱的人说：”2023，希望世界和平、明天会更好“！ ', '2023-02-05 14:39:41', 71, 1, 0, 0, 1);

-- ----------------------------
-- Table structure for post_img
-- ----------------------------
DROP TABLE IF EXISTS `post_img`;
CREATE TABLE `post_img`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_img
-- ----------------------------
INSERT INTO `post_img` VALUES (1, 1, '1.jpg');
INSERT INTO `post_img` VALUES (2, 1, '2.jpg');
INSERT INTO `post_img` VALUES (3, 1, '3.jpg');
INSERT INTO `post_img` VALUES (4, 1, '4.jpg');
INSERT INTO `post_img` VALUES (5, 1, '5.jpg');
INSERT INTO `post_img` VALUES (6, 1, '6.jpg');
INSERT INTO `post_img` VALUES (7, 1, '7.jpg');
INSERT INTO `post_img` VALUES (8, 1, '8.jpg');
INSERT INTO `post_img` VALUES (9, 1, '9.jpg');
INSERT INTO `post_img` VALUES (10, 6, '6-1.jpg');
INSERT INTO `post_img` VALUES (11, 6, '6-2.jpg');
INSERT INTO `post_img` VALUES (12, 6, '6-3.jpg');
INSERT INTO `post_img` VALUES (13, 6, '6-4.jpg');
INSERT INTO `post_img` VALUES (14, 6, '6-5.jpg');
INSERT INTO `post_img` VALUES (15, 6, '6-6.jpg');
INSERT INTO `post_img` VALUES (16, 6, '6-7.jpg');
INSERT INTO `post_img` VALUES (17, 6, '6-8.jpg');
INSERT INTO `post_img` VALUES (18, 6, '6-9.jpg');
INSERT INTO `post_img` VALUES (25, 20, '92e2662d-64aa-4756-a0d7-8f6903417738.png');
INSERT INTO `post_img` VALUES (24, 19, 'a4c2c480-602a-47e8-a455-53749a5fa990.png');
INSERT INTO `post_img` VALUES (22, 19, '23054dc2-11c3-4e53-bdee-d3ffc1addfc9.png');
INSERT INTO `post_img` VALUES (23, 19, 'c58e3363-bae9-41d3-b742-ba2b8d1b7427.png');
INSERT INTO `post_img` VALUES (26, 20, '124e2959-a629-42ef-bba7-9701d6d68f2d.png');
INSERT INTO `post_img` VALUES (27, 22, '7e0d3096-38b2-4564-b089-44697dac0f43.png');
INSERT INTO `post_img` VALUES (28, 22, 'b1399633-a492-4e83-829f-2b918e1923ce.png');
INSERT INTO `post_img` VALUES (29, 22, 'ccaa9747-0449-466a-89ad-095c348447d0.png');
INSERT INTO `post_img` VALUES (30, 24, '5d022442-0053-483d-864c-574c38aa1416.png');
INSERT INTO `post_img` VALUES (31, 25, '40054307-6622-44d1-9460-0285709b4e53.png');
INSERT INTO `post_img` VALUES (32, 25, '78fa7f51-a543-4320-801b-01e4ab6ba560.png');
INSERT INTO `post_img` VALUES (33, 25, 'ddfe69c5-a12f-4b19-8652-dee14b5da019.png');
INSERT INTO `post_img` VALUES (34, 25, '45bbd38c-9c93-4801-aba3-592cca4f8b19.png');
INSERT INTO `post_img` VALUES (35, 25, '084ef1f9-13f3-41b9-9172-d1129e2496a1.png');
INSERT INTO `post_img` VALUES (36, 25, 'edeb4965-855f-45cf-9306-c7b498c1bc38.png');
INSERT INTO `post_img` VALUES (37, 57, '45eefd7d-cef8-4337-8ebc-f3bb081161fb.png');
INSERT INTO `post_img` VALUES (38, 57, 'e4c7d4ea-0346-492a-9472-ad77d27b6b11.png');
INSERT INTO `post_img` VALUES (39, 58, '88327413-7a5f-481d-8c69-6102a6e52914.png');
INSERT INTO `post_img` VALUES (40, 58, 'b0faf1f2-6978-493b-a821-fc25318e8e4f.png');
INSERT INTO `post_img` VALUES (41, 58, '55d9c8b1-2f86-4c8c-8cd1-990e50c2931b.png');
INSERT INTO `post_img` VALUES (42, 59, '1ffd1eff-b885-4b0f-b319-c53718cf59a3.png');
INSERT INTO `post_img` VALUES (43, 59, 'a861a32a-0424-476c-a05f-a207e7252b30.png');
INSERT INTO `post_img` VALUES (44, 59, '79dccd3c-0c86-4866-b313-18c1a316a95f.png');
INSERT INTO `post_img` VALUES (69, 68, '5f549b44-9a23-427f-8452-ebbb797cb375.png');
INSERT INTO `post_img` VALUES (68, 68, 'cd3a16cd-8cce-4a87-ad12-ab0bde7e57b7.png');
INSERT INTO `post_img` VALUES (47, 61, '9a78c6fc-4145-4af9-8d22-c06f75e01f11.png');
INSERT INTO `post_img` VALUES (48, 61, 'd84f7192-25a4-4ad0-a7bb-f7326006bdad.png');
INSERT INTO `post_img` VALUES (49, 61, '9f1a9078-d87f-4a88-bb75-304a1311ec82.png');
INSERT INTO `post_img` VALUES (50, 62, '7c74b9e0-79ce-4da7-a34c-d169e497dddd.png');
INSERT INTO `post_img` VALUES (51, 62, 'f35f14d9-60dc-42c9-956b-dad7c7d8a6f7.png');
INSERT INTO `post_img` VALUES (52, 62, 'ec9b9cdb-e005-41bd-a4da-0e22f3713050.png');
INSERT INTO `post_img` VALUES (53, 63, '98abff7b-8670-45e7-82a2-b882c1de5ba5.png');
INSERT INTO `post_img` VALUES (54, 63, 'ae99a0a7-58a1-43f4-8dfa-b6d16a2618c9.png');
INSERT INTO `post_img` VALUES (55, 63, '92f5dacd-6e83-4479-969e-6c1fe7baada4.png');
INSERT INTO `post_img` VALUES (77, 69, 'ff054067-f1bb-4145-bef5-407972f5abdb.png');
INSERT INTO `post_img` VALUES (58, 65, 'f746725a-c2ce-4159-a98c-e0f27e3a8647.png');
INSERT INTO `post_img` VALUES (59, 65, 'a0fa2fb9-19c3-4dbd-83f6-0352302c78b3.png');
INSERT INTO `post_img` VALUES (60, 65, '773ba098-16db-4638-ae38-226cb3b9af62.png');
INSERT INTO `post_img` VALUES (61, 66, 'da42f881-7ed0-4b4b-8672-a42fece94fd9.png');
INSERT INTO `post_img` VALUES (62, 67, 'c9351873-f970-45c0-a396-f346764a8949.png');
INSERT INTO `post_img` VALUES (63, 67, 'e387e4c3-fdbf-4945-bcf7-f148871ada2e.png');
INSERT INTO `post_img` VALUES (64, 67, '3a264cec-2bf7-4bb4-8529-7cdbe9a5fad9.png');
INSERT INTO `post_img` VALUES (65, 67, '4ca0b315-9923-4832-80a5-38242785abf0.png');
INSERT INTO `post_img` VALUES (66, 67, 'dc5ef89b-eb41-4527-a8f1-d6233ba5ae43.png');
INSERT INTO `post_img` VALUES (67, 67, '4d01bb18-b617-4199-97eb-249954afaed5.png');
INSERT INTO `post_img` VALUES (70, 68, 'eb1a9d33-4227-4e30-8c2b-9ee2fd0ced5d.png');
INSERT INTO `post_img` VALUES (71, 68, 'd0a785ab-25bb-4b2c-86cb-b585c4ebd7bc.png');
INSERT INTO `post_img` VALUES (72, 68, '33a5ce4f-48de-446a-a05f-f47f3883812b.png');
INSERT INTO `post_img` VALUES (73, 68, '6e895740-b0ce-487b-b7be-f7cdc076afdd.png');
INSERT INTO `post_img` VALUES (74, 68, 'fd1c2a3b-3189-4a53-9fa8-4ffeb4b8b122.png');
INSERT INTO `post_img` VALUES (75, 68, 'cbd83571-db86-4b11-8fdf-fa0a07a0060c.png');
INSERT INTO `post_img` VALUES (76, 68, 'a6301c4c-671c-41b1-8e36-1f2530c67277.png');

-- ----------------------------
-- Table structure for post_video
-- ----------------------------
DROP TABLE IF EXISTS `post_video`;
CREATE TABLE `post_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_vertical` int(11) NULL DEFAULT 0,
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `post_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_video
-- ----------------------------
INSERT INTO `post_video` VALUES (1, '1.png', '1.mp4', 0, '1:21', 70);

-- ----------------------------
-- Table structure for post_video_view
-- ----------------------------
DROP TABLE IF EXISTS `post_video_view`;
CREATE TABLE `post_video_view`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `video_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of post_video_view
-- ----------------------------
INSERT INTO `post_video_view` VALUES (1, 71, 1);
INSERT INTO `post_video_view` VALUES (2, 32, 1);
INSERT INTO `post_video_view` VALUES (3, 33, 1);
INSERT INTO `post_video_view` VALUES (4, 71, NULL);

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `department` int(11) NULL DEFAULT NULL COMMENT '1.人事部2.技术部，3.销售部4.国际部',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES (16, '嬴幼晴', '7.png', 1);
INSERT INTO `staff` VALUES (15, '禽妙之', '6.png', 1);
INSERT INTO `staff` VALUES (14, '曹贞静', '5.png', 1);
INSERT INTO `staff` VALUES (13, '圣奇', '4.png', 1);
INSERT INTO `staff` VALUES (12, '莫嘉懿', '3.png', 1);
INSERT INTO `staff` VALUES (11, '大斯文', '2.png', 1);
INSERT INTO `staff` VALUES (10, '叔涵易', '1.png', 1);
INSERT INTO `staff` VALUES (17, '睢康乐', '8.png', 1);
INSERT INTO `staff` VALUES (18, '寿健', '9.png', 1);
INSERT INTO `staff` VALUES (19, '钟离文康', '10.png', 2);
INSERT INTO `staff` VALUES (20, '卿以晴', '11.png', 2);
INSERT INTO `staff` VALUES (21, '藩夏蓉', '12.png', 2);
INSERT INTO `staff` VALUES (22, '项新洁', '13.png', 2);
INSERT INTO `staff` VALUES (23, '上官蓓蕾', '14.png', 2);
INSERT INTO `staff` VALUES (24, '实梦雨', '15.png', 3);
INSERT INTO `staff` VALUES (25, '繁白梅', '16.png', 3);
INSERT INTO `staff` VALUES (26, '乐正含玉', '17.png', 3);
INSERT INTO `staff` VALUES (27, '向学文', '18.png', 3);
INSERT INTO `staff` VALUES (28, '休彤霞', '19.png', 3);
INSERT INTO `staff` VALUES (29, '府懿轩', '20.png', 3);
INSERT INTO `staff` VALUES (30, '苟志业', '21.png', 3);
INSERT INTO `staff` VALUES (31, '褒韵宁', '22.png', 3);
INSERT INTO `staff` VALUES (32, '富察天籁', '23.png', 3);
INSERT INTO `staff` VALUES (33, '夕翠梅', '24.png', 3);
INSERT INTO `staff` VALUES (34, '诺水丹', '25.png', 3);
INSERT INTO `staff` VALUES (35, '针曼雁', '26.png', 3);
INSERT INTO `staff` VALUES (36, '赖嘉丽', '27.png', 3);
INSERT INTO `staff` VALUES (37, '后寻绿', '28.png', 3);
INSERT INTO `staff` VALUES (38, '树磊', '29.png', 3);
INSERT INTO `staff` VALUES (39, '朴绮艳', '30.png', 3);
INSERT INTO `staff` VALUES (40, '呼庄', '31.png', 3);
INSERT INTO `staff` VALUES (41, '奈芳荃', '32.png', 3);
INSERT INTO `staff` VALUES (42, '薄萧曼', '33.png', 3);
INSERT INTO `staff` VALUES (43, '仝紫琼', '34.png', 3);
INSERT INTO `staff` VALUES (44, '么思敏', '35.png', 4);
INSERT INTO `staff` VALUES (45, '之静柏', '36.png', 4);
INSERT INTO `staff` VALUES (46, '籍静涵', '37.png', 4);
INSERT INTO `staff` VALUES (47, '雍俊英', '38.png', 4);
INSERT INTO `staff` VALUES (48, '琴盈', '39.png', 4);
INSERT INTO `staff` VALUES (49, '那梦凡', '40.png', 4);
INSERT INTO `staff` VALUES (50, '秦青亦', '41.png', 4);
INSERT INTO `staff` VALUES (51, '尉笑卉', '42.png', 4);
INSERT INTO `staff` VALUES (52, '韶傲柏', '43.png', 4);
INSERT INTO `staff` VALUES (53, '宿烨烁', '44.png', 4);
INSERT INTO `staff` VALUES (54, '丰津童', '45.png', 4);
INSERT INTO `staff` VALUES (55, '堵寄云', '46.png', 4);
INSERT INTO `staff` VALUES (56, '歧涵柳', '47.png', 4);
INSERT INTO `staff` VALUES (57, '漫顺', '48.png', 4);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gender` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '张三', 1);
INSERT INTO `student` VALUES (2, '李四', 0);
INSERT INTO `student` VALUES (3, '王五', 1);
INSERT INTO `student` VALUES (4, '赵六', 1);
INSERT INTO `student` VALUES (5, '吴七', 0);
INSERT INTO `student` VALUES (6, '周八', 1);
INSERT INTO `student` VALUES (7, '孙九', 0);
INSERT INTO `student` VALUES (8, '郑十', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `auth` int(11) NULL DEFAULT 0,
  `vip` int(11) NULL DEFAULT 0,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `brief` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gender` int(11) NULL DEFAULT 1,
  `wallpaper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default.jpg',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (51, '杨洋', 'b176aa9a-a628-457b-8c18-265daa5aa219.png', 1, 7, '25756858955', '7bc9a574-bfab-4866-b1ab-f19c23aefbb9', '演员杨洋', 1, 'ccc4b747-f80a-4429-a169-ee0c34e231bd.png');
INSERT INTO `user` VALUES (2, '胡歌', '2.jpg', 1, 7, '66677773333', 'fd0abcbd-6d0c-42f1-9e09-9b420c9c1449', '演员', 1, 'default.jpg');
INSERT INTO `user` VALUES (46, '章子怡', '4c4144e7-1f26-4f7d-a976-1a4f9f1b602f.png', 1, 7, '25865456669', '81139514-b951-44d2-8a25-dd0e7eaf09d4', '演员', 0, 'default.jpg');
INSERT INTO `user` VALUES (7, '馬天宇', 'c85defae-ce44-4340-b249-23a485245250.png', 1, 7, '17788889999', '02122f7b-6cdf-42de-9514-130f557b2b9b', '歌手，演员，旅行玩家', 1, '1b51209a-0f60-4e49-b9ba-6c18e4803b65.png');
INSERT INTO `user` VALUES (50, '高圆圆', '367cd826-d637-4024-a7ef-6f54c8168d96.png', 1, 7, '44433336666', '86652514-4d69-4e7a-af17-0c5dc0b5694a', '演员高圆圆', 0, '8e3b44ac-3c68-46f2-bbe4-5bd5a9b5ba35.png');
INSERT INTO `user` VALUES (49, '王一博', '71e665d1-bd84-4a15-9a02-cc4d82cae091.png', 1, 7, '25685898888', '4cc35248-d89c-4367-8489-24d429dfe3d2', 'UNIQ组合成员；演员，代表作《陪你到世界之巅》、《陈情令》', 1, 'default.jpg');
INSERT INTO `user` VALUES (25, '歐陽娜娜Nana', '19.jpg', 1, 7, NULL, NULL, '中國台灣女藝人/大提琴演奏家 歐陽娜娜', 0, 'default.jpg');
INSERT INTO `user` VALUES (48, '刘亦菲', '849b3b8e-f301-4944-9ab0-a2e4887bbc23.png', 1, 7, '25423515565', '2b50c0ab-0431-4c4e-a040-fd6741afacbd', '演员刘亦菲', 0, 'default.jpg');
INSERT INTO `user` VALUES (47, '画画的冷仔', '08468632-afd4-4e45-8b81-249bddb6ce38.png', 2, 0, '55868456856', '50972e55-70cc-4041-bfb2-6bcbf13f7181', '网易认证漫画作者', 1, 'default.jpg');
INSERT INTO `user` VALUES (30, '演员胡先煦', '928c2b52-c060-4463-8bec-5d346aa3f1c0.png', 1, 7, '33344445555', '07da34f6-74ce-4031-8280-45b3e802b1d4', '演员', 1, 'default.jpg');
INSERT INTO `user` VALUES (31, '杨幂', 'bed2074d-371b-433e-870d-373dc1584a7e.png', 1, 7, '', '4aaba493-aad0-4a68-9314-66d8926eb4d0', '演员，代表作《宫》《仙剑奇侠传三》《我是证人》等', 0, 'default.jpg');
INSERT INTO `user` VALUES (32, '蔡徐坤', '8383bc87-ad51-458d-baa1-97affb0d04a6.png', 1, 7, '66677772222', 'f7e0d61a-7089-432b-baeb-2642d7638725', '歌手、制作人、NINE PERCENT队长', 1, 'default.jpg');
INSERT INTO `user` VALUES (33, '贾乃亮', '104240b6-dc9a-4d6a-8632-351e6ae84790.png', 1, 7, '77733332222', '324d3cf3-30c5-4f58-9c71-c925b0ebadc2', '演员', 1, 'default.jpg');
INSERT INTO `user` VALUES (34, '我是娜扎', '66a56c00-7a9e-475c-a1e4-420eddfdac03.png', 1, 7, '', '17998d7a-6f8c-49be-8b4c-fcf17b6ab872', '演员，代表作《择天记》', 0, 'default.jpg');
INSERT INTO `user` VALUES (35, '郭富城', 'c5433339-6063-4bf8-afd5-b2b1c6f5216e.png', 2, 7, '66677773333', 'fd0abcbd-6d0c-42f1-9e09-9b420c9c1449', '香港藝人、歌手，兩屆金馬影帝，舞台皇者', 1, 'default.jpg');
INSERT INTO `user` VALUES (38, 'TFBOYS-易烊千玺', 'fa463dc4-4b43-461a-87d1-16946517a8fd.png', 1, 7, '', 'ec6e3806-8173-4c37-a543-34fe52e4852f', '人气少年偶像组合TFBOYS成员 易烊千玺', 1, 'default.jpg');
INSERT INTO `user` VALUES (41, 'blackpink', '904d71c9-987e-4734-9e92-86051f21e4bd.png', 1, 7, '', '21c27f86-e6ef-4019-b585-b54c4d1362f0', 'yg团队', 0, 'default.jpg');
INSERT INTO `user` VALUES (42, '白敬亭', 'd9866ea1-45bd-4ccc-895d-2f5073eaea91.png', 1, 7, '66677772222', 'f7e0d61a-7089-432b-baeb-2642d7638725', '演员，作品：搜狐视频周播剧《匆匆那年》电影《谁的青春不迷茫》', 1, 'default.jpg');
INSERT INTO `user` VALUES (45, 'angelababy', '343e1c5b-ef7a-4ae1-9e42-9bb0f59c80b1.png', 1, 7, '59856655685', 'c542c64d-08b7-44b8-8964-12e3e5dfe123', '演员、艺人杨颖', 0, '434ee106-0c32-49ce-b9bb-f40619d4b279.png');
INSERT INTO `user` VALUES (44, '萧亚轩', 'edf05d32-f1e8-4691-9da5-824cb89575af.png', 1, 7, '16655554444', 'c14a48d4-c7b9-4ea9-acec-cb7874db31e0', '歌手萧亚轩', 0, 'default.jpg');
INSERT INTO `user` VALUES (52, 'turbosun', 'a67af94c-ae6a-4b07-9e03-4958b73114b3.png', 0, 7, '65558265455', 'dee45238-4a09-4c40-8521-d42a17f935e3', '1+1=4', 0, 'd4001f47-e445-4cbd-b89d-e715506c7366.png');
INSERT INTO `user` VALUES (53, 'X玖少年团肖战DAYTOY', '4ee3ecaa-8caa-4ddd-9c17-8602d3aa5833.png', 1, 7, '75525555855', '95341b54-8acb-4396-b9e0-dc77b9a114d5', 'X玖少年团成员；演员 歌手，余生请多指教、王牌部队、陈情令等', 1, '9f611b71-ffd3-408d-ad7f-6de05b1774ca.png');
INSERT INTO `user` VALUES (54, 'GEM鄧紫棋', '43cdb085-6dfb-45e9-bee6-fceebddc4299.png', 1, 7, '55459555855', '8a057cfd-b573-42f7-b7a7-2ecada285c88', '歌手邓紫棋', 0, '90389e21-4fa1-488a-89c2-93356f3af4a6.png');
INSERT INTO `user` VALUES (55, 'TFBOYS-王源', '48d033e4-da92-4afb-82ae-96040596549d.png', 1, 7, '65587565566', 'e904229c-2474-499b-a8ec-27f852b93fe2', '人气少年偶像组合TFBOYS成员 王源', 1, '1175aa78-f3ff-43c7-a606-9d77988ae63d.png');
INSERT INTO `user` VALUES (56, '赵丽颖', '788a5dc2-abe7-4150-9aee-cf116231a68b.png', 1, 7, '75655566552', '03496f38-f587-470e-ba5d-c75f74d9b6a4', '演员，代表作品《花千骨》《杉杉来了》《陆贞传奇》', 0, 'fc75540f-30eb-45f2-a817-2a66cd006dac.png');
INSERT INTO `user` VALUES (57, '邓超', '27c890ea-52e6-40bf-9a8c-51a7e0e3fe33.png', 1, 7, '44477778888', 'ada01ff4-563c-4c42-a82c-932896caad1f', '演员、导演邓超', 1, '2f5194c5-1d47-4d27-8c5d-b0b1b39c20dc.png');
INSERT INTO `user` VALUES (58, '李冰冰', '22182a45-e9c0-4f63-b241-42d640f01e16.png', 1, 7, '15675625554', '26ab190e-13ad-46e7-b99e-1eb1721f54c3', '演员，曾获第29届百花奖最佳女主角奖，金马奖最佳女演员奖', 0, 'e0029f61-e1ab-4a20-80c1-fd97fbe34bc0.png');
INSERT INTO `user` VALUES (59, '_小宇宙111', 'ef9caf2b-eaba-49c9-b0a0-80dc5e6d6a84.png', 0, 0, '75684568555', '4ab54a8a-e82b-479c-8297-48de5536406f', '爱自己就好', 1, 'default.jpg');
INSERT INTO `user` VALUES (60, '蔡健雅', '20a71533-732a-4b2c-85d3-937fa8a002d1.png', 2, 7, '95564265565', '840a8c03-fb9b-4170-a9f5-2476b9df20ce', '歌手 制作人 蔡健雅', 0, 'default.jpg');
INSERT INTO `user` VALUES (61, '吴磊LEO', '585386c0-7dbb-454c-9292-4a1119bf1396.png', 1, 7, '54665835486', '03fd338b-8507-46bf-aaf8-88f24203dc3e', '演员', 1, '8771dd68-2534-4891-a124-7f24a98e2e48.png');
INSERT INTO `user` VALUES (62, 'Avril_Lavigne', 'e170cae9-becf-4d28-96e0-fb500d24db87.png', 1, 7, '44477779999', '1ea0c8e5-1067-4b44-93d7-5b6ce799834c', '加拿大摇滚歌手艾薇儿', 0, 'default.jpg');
INSERT INTO `user` VALUES (63, '卑鄙的堃君', 'b22d7fac-dfd5-43eb-95b6-d118259c9b5e.png', 0, 0, '65565455355', '7d4d17f1-f29b-4fc7-ba45-48581464d758', '接线上线下健身指导', 1, 'default.jpg');
INSERT INTO `user` VALUES (64, '张韶涵', 'a01b9994-9a5d-4578-aa0f-e2f96afa6390.png', 1, 7, '95568586555', 'e757a52c-ae96-4dd3-9219-1743e2b8cc79', '台湾歌手', 0, '57b89083-e509-45c8-b06b-2907e3905587.png');
INSERT INTO `user` VALUES (65, '何炅', 'bedf0e14-ecc6-4e3d-9910-a6fe4f0a939c.png', 1, 7, '94239756555', 'f5a85c0c-da09-493b-aa9a-4e91f3d56b5c', '湖南卫视主持人', 1, '88c71fff-ff2e-43b3-ae61-c7dd309142a3.png');
INSERT INTO `user` VALUES (66, 'Dear-迪丽热巴', '65af2f8f-3423-48bc-831a-eb4dd88c7a75.png', 1, 7, '87268951633', 'f61f6a58-b1bb-4dd4-be3d-0fe3856792a4', '嘉行传媒签约演员', 0, '11ca1d96-f452-4085-b560-a197db3b2e2b.png');
INSERT INTO `user` VALUES (67, '黄晓明', '2d60508b-0fde-44e5-8bfa-97e880533ed3.png', 1, 7, '13388886666', '7d1cb9eb-13a3-4f4c-bdec-24429d44d419', '演员，明天爱心基金发起人', 1, '29a9a1df-6bad-4433-9631-7969e33ce63a.png');
INSERT INTO `user` VALUES (68, '狼森森森', '20868266-20b9-4b7d-9c1b-95895823ab54.png', 0, 6, '66633339999', 'c4d73afb-f4a0-4f84-af24-83df06cb0820', '要开心哦', 1, 'e686d7a8-a1f4-4606-8243-3a56a9c96a4a.png');
INSERT INTO `user` VALUES (69, '不2不叫周淑怡', 'a28d7f33-4de0-4943-bb47-34f53838de42.png', 1, 7, '99977775555', '83380318-4c19-46ae-b2a1-125046523a1b', '英雄联盟官方解说，斗鱼平台签约主播。', 0, '8325e8a0-733c-4602-a360-cf31ff9dee66.png');
INSERT INTO `user` VALUES (70, 'WBG-TheShy', '3f425109-621e-47c8-8815-b50f1fbd3a72.png', 1, 6, '22233339999', '9dbe86e3-5148-4d24-93ca-74eaa3d080b1', 'WBG电子竞技俱乐部英雄联盟分部选手 英雄联盟S8世界赛冠军', 1, 'default.jpg');
INSERT INTO `user` VALUES (71, '成龙', '1d039858-8678-4dfe-9889-7ca9ddffdc0d.png', 2, 7, '66633331111', 'b52ac9c0-bb30-40e9-9f2e-2bd4cedb5b9f', '香港演员', 1, '198779c3-0a0a-4088-a1a5-58937eee8629.png');

-- ----------------------------
-- Table structure for zan
-- ----------------------------
DROP TABLE IF EXISTS `zan`;
CREATE TABLE `zan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `post_id` int(11) NULL DEFAULT NULL,
  `user_id2` int(11) NULL DEFAULT NULL,
  `zan_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unread` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 79 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan
-- ----------------------------
INSERT INTO `zan` VALUES (78, 33, 32, 2, '2023-02-05 19:05:41', '', 'Nexus 5', 1);
INSERT INTO `zan` VALUES (77, 32, 70, 71, '2023-02-05 19:03:18', '', 'Nexus 5', 1);

-- ----------------------------
-- Table structure for zan_comment
-- ----------------------------
DROP TABLE IF EXISTS `zan_comment`;
CREATE TABLE `zan_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `comment_id` int(11) NULL DEFAULT NULL,
  `user_id2` int(11) NULL DEFAULT NULL COMMENT '评论的作者',
  `zan_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unread` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zan_comment
-- ----------------------------
INSERT INTO `zan_comment` VALUES (62, 42, 38, 2, '2023-01-28 05:30:30', '', 'Nexus 5', 0);

SET FOREIGN_KEY_CHECKS = 1;
