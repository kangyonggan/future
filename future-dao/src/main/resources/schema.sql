DROP DATABASE IF EXISTS future;

CREATE DATABASE future
  DEFAULT CHARACTER SET utf8
  COLLATE utf8_general_ci;

USE future;

-- ----------------------------
--  Table structure for role
-- ----------------------------
DROP TABLE
IF EXISTS role;

CREATE TABLE role
(
  id           BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  code         VARCHAR(32)                           NOT NULL
  COMMENT '角色代码',
  name         VARCHAR(32)                           NOT NULL
  COMMENT '角色名称',
  is_deleted   TINYINT                               NOT NULL                DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time TIMESTAMP                             NOT NULL                DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time TIMESTAMP                             NOT NULL                DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '角色表';
CREATE UNIQUE INDEX id_UNIQUE
  ON role (id);
CREATE INDEX created_time_ix
  ON role (created_time);
CREATE UNIQUE INDEX code_UNIQUE
  ON role (code);

-- ----------------------------
--  Table structure for menu
-- ----------------------------
DROP TABLE
IF EXISTS menu;

CREATE TABLE menu
(
  id           BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  code         VARCHAR(32)                           NOT NULL
  COMMENT '菜单代码',
  name         VARCHAR(32)                           NOT NULL
  COMMENT '菜单名称',
  pcode        VARCHAR(32)                           NOT NULL                DEFAULT ''
  COMMENT '父菜单代码',
  url          VARCHAR(128)                          NOT NULL                DEFAULT ''
  COMMENT '菜单地址',
  sort         INT(11)                               NOT NULL                DEFAULT 0
  COMMENT '菜单排序(从0开始)',
  icon         VARCHAR(128)                          NOT NULL                DEFAULT ''
  COMMENT '菜单图标的样式',
  is_deleted   TINYINT                               NOT NULL                DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time TIMESTAMP                             NOT NULL                DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time TIMESTAMP                             NOT NULL                DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '菜单表';
CREATE UNIQUE INDEX id_UNIQUE
  ON menu (id);
CREATE INDEX created_time_ix
  ON menu (created_time);
CREATE INDEX sort_ix
  ON menu (sort);
CREATE UNIQUE INDEX code_UNIQUE
  ON menu (code);

-- ----------------------------
--  Table structure for user_role
-- ----------------------------
DROP TABLE
IF EXISTS user_role;

CREATE TABLE user_role
(
  username  VARCHAR(15) NOT NULL
  COMMENT '用户名',
  role_code VARCHAR(32) NOT NULL
  COMMENT '角色代码',
  PRIMARY KEY (username, role_code)
)
  COMMENT '用户角色表';

-- ----------------------------
--  Table structure for role_menu
-- ----------------------------
DROP TABLE
IF EXISTS role_menu;

CREATE TABLE role_menu
(
  role_code VARCHAR(32) NOT NULL
  COMMENT '角色代码',
  menu_code VARCHAR(32) NOT NULL
  COMMENT '菜单代码',
  PRIMARY KEY (role_code, menu_code)
)
  COMMENT '角色菜单表';

-- ----------------------------
--  Table structure for dictionary
-- ----------------------------
DROP TABLE
IF EXISTS dictionary;

CREATE TABLE dictionary
(
  id           BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  code         VARCHAR(32)                           NOT NULL
  COMMENT '代码',
  value        VARCHAR(128)                          NOT NULL
  COMMENT '值',
  type         VARCHAR(16)                           NOT NULL
  COMMENT '类型',
  sort         INT(11)                               NOT NULL                DEFAULT 0
  COMMENT '排序(从0开始)',
  is_deleted   TINYINT                               NOT NULL                DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time TIMESTAMP                             NOT NULL                DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time TIMESTAMP                             NOT NULL                DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '字典表';
CREATE UNIQUE INDEX id_UNIQUE
  ON dictionary (id);
CREATE UNIQUE INDEX type_code_UNIQUE
  ON dictionary (type, code);
CREATE INDEX created_time_ix
  ON dictionary (created_time);
CREATE INDEX type_ix
  ON dictionary (type);
CREATE INDEX sort_ix
  ON dictionary (sort);

-- ----------------------------
--  Table structure for user
-- ----------------------------
DROP TABLE
IF EXISTS user;

CREATE TABLE user
(
  id            BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  username      VARCHAR(20)                           NOT NULL
  COMMENT '用户名（手机号）',
  realname      VARCHAR(32)                           NOT NULL                    DEFAULT ''
  COMMENT '真实姓名',
  password      VARCHAR(64)                           NOT NULL
  COMMENT '密码',
  salt          VARCHAR(64)                           NOT NULL
  COMMENT '密码盐',
  small_avatar  VARCHAR(256)                          NOT NULL                    DEFAULT '/upload/default-user-small.jpg'
  COMMENT '小头像',
  medium_avatar VARCHAR(256)                          NOT NULL                    DEFAULT '/upload/default-user-medium.jpg'
  COMMENT '中头像',
  large_avatar  VARCHAR(256)                          NOT NULL                    DEFAULT '/upload/default-user-large.jpg'
  COMMENT '大头像',
  email         VARCHAR(64)                           NOT NULL                    DEFAULT ''
  COMMENT '电子邮箱',
  is_deleted    TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time  TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time  TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '用户表';
CREATE UNIQUE INDEX id_UNIQUE
  ON user (id);
CREATE INDEX created_time_ix
  ON user (created_time);
CREATE UNIQUE INDEX username_UNIQUE
  ON user (username);

-- ----------------------------
--  Table structure for token
-- ----------------------------
DROP TABLE
IF EXISTS token;

CREATE TABLE token
(
  id           BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  mobile       VARCHAR(16)                           NOT NULL
  COMMENT '手机号',
  code         VARCHAR(64)                           NOT NULL
  COMMENT '代码',
  type         VARCHAR(16)                           NOT NULL
  COMMENT '类型',
  is_deleted   TINYINT                               NOT NULL                DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time TIMESTAMP                             NOT NULL                DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time TIMESTAMP                             NOT NULL                DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '短信验证码表';
CREATE UNIQUE INDEX id_UNIQUE
  ON token (id);
CREATE INDEX created_time_ix
  ON token (created_time);

# 图书馆

-- ----------------------------
--  Table structure for book
-- ----------------------------
DROP TABLE
IF EXISTS book;

CREATE TABLE book
(
  id                BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  name              VARCHAR(32)                           NOT NULL
  COMMENT '书名',
  author            VARCHAR(32)                           NOT NULL
  COMMENT '作者',
  category_code     VARCHAR(32)                           NOT NULL
  COMMENT '分类代码',
  category_name     VARCHAR(32)                           NOT NULL
  COMMENT '分类名称',
  pic_url           VARCHAR(256)                          NOT NULL                    DEFAULT '/upload/default-book.png'
  COMMENT '封面图片地址',
  code              INT(11)                               NOT NULL
  COMMENT '书籍代码',
  descp             VARCHAR(1024)                         NOT NULL
  COMMENT '描述',
  is_finished       TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '是否完结{1: 完结, 0: 连载}',
  is_hot            TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '推荐{1: 是, 0: 否}',
  is_auto_update    TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '自动更新{1: 是, 0: 否}',
  new_section_code  INT(11)                               NOT NULL                    DEFAULT 0
  COMMENT '最新章节代码',
  new_section_title VARCHAR(256)                          NOT NULL                    DEFAULT ''
  COMMENT '最新章节标题',
  is_deleted        TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time      TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time      TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '书籍表';
CREATE UNIQUE INDEX id_UNIQUE
  ON book (id);
CREATE UNIQUE INDEX code_UNIQUE
  ON book (code);
CREATE INDEX created_time_ix
  ON book (created_time);

-- ----------------------------
--  Table structure for section
-- ----------------------------
DROP TABLE
IF EXISTS section;

CREATE TABLE section
(
  id                BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  code              INT(11)                               NOT NULL
  COMMENT '章节代码',
  title             VARCHAR(64)                           NOT NULL
  COMMENT '标题',
  content           LONGTEXT                              NOT NULL
  COMMENT '内容',
  book_code         INT(11)                               NOT NULL
  COMMENT '书籍代码',
  prev_section_code INT(11)                               NOT NULL                    DEFAULT 0
  COMMENT '上一章节代码',
  next_section_code INT(11)                               NOT NULL                    DEFAULT 0
  COMMENT '下一章节代码',
  is_deleted        TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time      TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time      TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '章节表';
CREATE UNIQUE INDEX id_UNIQUE
  ON section (id);
CREATE UNIQUE INDEX code_UNIQUE
  ON section (code);
CREATE INDEX created_time_ix
  ON section (created_time);

-- ----------------------------
--  Table structure for category
-- ----------------------------
DROP TABLE
IF EXISTS category;

CREATE TABLE category
(
  id           BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  code         VARCHAR(32)                           NOT NULL
  COMMENT '分类代码',
  name         VARCHAR(32)                           NOT NULL
  COMMENT '分类名称',
  type         VARCHAR(16)                           NOT NULL
  COMMENT '分类类型{"book": "小说", "blog": "博客"}',
  picUrl       VARCHAR(256)                          NOT NULL                    DEFAULT '/upload/default-category.png'
  COMMENT '图片地址',
  sort         INT(11)                               NOT NULL                    DEFAULT 0
  COMMENT '菜单排序(从0开始)',
  is_deleted   TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '分类表';
CREATE UNIQUE INDEX id_UNIQUE
  ON category (id);
CREATE UNIQUE INDEX code_type_UNIQUE
  ON category (code, type);
CREATE INDEX created_time_ix
  ON category (created_time);

#====================初始数据====================#

# 用户 admin
INSERT INTO user
(username, realname, password, salt, email)
VALUES
  ('15121149571', '管理员', '25500f5b85a66895e0b99117a12cd51b6d07eb13', '93fab0ba521763fc', 'java@kangyonggan.com');

-- ----------------------------
--  data for role
-- ----------------------------
INSERT INTO role
(code, name)
VALUES
  ('ROLE_ADMIN', '管理员'),
  ('ROLE_USER', '普通用户');

-- ----------------------------
--  data for menu
-- ----------------------------
INSERT INTO menu
(code, name, pcode, url, sort, icon)
VALUES
  ('DASHBOARD', '工作台', '', 'index', 0, 'menu-icon fa fa-dashboard'),

  ('SYSTEM', '系统', 'DASHBOARD', 'system', 1, 'menu-icon fa fa-cogs'),
  ('SYSTEM_USER', '用户管理', 'SYSTEM', 'system/user', 0, ''),
  ('SYSTEM_ROLE', '角色管理', 'SYSTEM', 'system/role', 1, ''),
  ('SYSTEM_MENU', '菜单管理', 'SYSTEM', 'system/menu', 2, ''),
  ('SYSTEM_CACHE', '缓存管理', 'SYSTEM', 'system/cache', 3, ''),
  ('SYSTEM_DICTIONARY', '字典管理', 'SYSTEM', 'system/dictionary', 4, ''),

  ('BOOK', '小说', 'DASHBOARD', 'book', 2, 'menu-icon fa fa-book'),
  ('BOOK_MANAGER', '小说管理', 'BOOK', 'book/manager', 0, ''),

  ('USER', '我的', 'DASHBOARD', 'user', 3, 'menu-icon fa fa-user'),
  ('USER_INFO', '基本信息', 'USER', 'user/info', 0, '');

-- ----------------------------
--  data for user_role
-- ----------------------------
INSERT INTO user_role
VALUES
  ('15121149571', 'ROLE_ADMIN');

-- ----------------------------
--  data for role_menu
-- ----------------------------
INSERT INTO role_menu SELECT
                        'ROLE_ADMIN',
                        code
                      FROM menu;

INSERT INTO role_menu SELECT
                        'ROLE_USER',
                        code
                      FROM menu
                      WHERE code LIKE 'USER%' OR code = 'DASHBOARD';

# 书籍
INSERT INTO category
(code, name, type, sort)
VALUES
  ('xuanhuan', '玄幻', 'book', 0),
  ('xiuzhen', '修真', 'book', 1),
  ('dushi', '都市', 'book', 2),
  ('lishi', '历史', 'book', 3),
  ('wangyou', '网游', 'book', 4),
  ('kehuan', '科幻', 'book', 5),
  ('yanqing', '言情', 'book', 6),
  ('qita', '其他', 'book', 7);

# 验证码查询
INSERT INTO menu
(code, name, pcode, url, sort, icon)
  VALUE
  ('SYSTEM_TOKEN', '验证码查询', 'SYSTEM', 'system/token', 5, '');
INSERT INTO role_menu (role_code, menu_code) VALUE ('ROLE_ADMIN', 'SYSTEM_TOKEN');

# 数据迁移
-- ----------------------------
--  Table structure for article
-- ----------------------------
DROP TABLE
IF EXISTS article;

CREATE TABLE article
(
  id            BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  username      VARCHAR(20)                           NOT NULL                    DEFAULT ''
  COMMENT '用户名（手机号）',
  title         VARCHAR(64)                           NOT NULL
  COMMENT '文章标题',
  category_code VARCHAR(32)                           NOT NULL
  COMMENT '栏目代码',
  category_name VARCHAR(32)                           NOT NULL
  COMMENT '栏目名称',
  content       LONGTEXT                              NOT NULL
  COMMENT '文章内容',
  visit_count   INTEGER(11)                           NOT NULL                    DEFAULT 0
  COMMENT '访问量',
  comment_count INTEGER(11)                           NOT NULL                    DEFAULT 0
  COMMENT '评论量',
  is_comment    TINYINT                               NOT NULL                    DEFAULT 1
  COMMENT '是否允许评论:{0:不允许, 1:允许}',
  is_stick      TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '是否置顶:{0:未置顶, 1:已置顶}',
  is_deleted    TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  status        VARCHAR(16)                           NOT NULL                    DEFAULT 'waiting'
  COMMENT '状态:{"waiting":"待审核", "reject":"审核未通过", "complete":"审核通过"}',
  created_time  TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time  TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '文章表';
CREATE INDEX id_category_code
  ON article (category_code);
CREATE INDEX id_created_time
  ON article (created_time);

INSERT INTO category (code, name, type, sort)
VALUES
  ('jishu', '技术分享', 'article', 0),
  ('tongzhi', '通知公告', 'article', 1);

# 我的文章，文章审核
INSERT INTO menu
(code, name, pcode, url, sort, icon)
  VALUE
  ('USER_ARTICLE', '我的文章', 'USER', 'user/article', 1, ''),
  ('USER_REVIEW', '文章审核', 'USER', 'user/review', 2, '');

INSERT INTO role_menu (role_code, menu_code) VALUES
  ('ROLE_ADMIN', 'USER_ARTICLE'),
  ('ROLE_ADMIN', 'USER_REVIEW');

INSERT INTO role_menu (role_code, menu_code) VALUE ('ROLE_USER', 'USER_ARTICLE');

## 系统消息
-- ----------------------------
--  Table structure for message
-- ----------------------------
DROP TABLE
IF EXISTS message;

CREATE TABLE message
(
  id               BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  title            VARCHAR(64)                           NOT NULL
  COMMENT '消息标题',
  content          LONGTEXT                              NOT NULL
  COMMENT '消息内容',
  type             VARCHAR(16)                           NOT NULL                    DEFAULT 'SYSTEM'
  COMMENT '消息类型',
  created_username VARCHAR(20)                           NOT NULL                    DEFAULT ''
  COMMENT '创建人',
  is_group         TINYINT                               NOT NULL                    DEFAULT '0'
  COMMENT '是否群发:{0:群发, 1:部分发送}',
  is_deleted       TINYINT                               NOT NULL                    DEFAULT '0'
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time     TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time     TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '系统消息表';
CREATE INDEX id_created_time
  ON message (created_time);

-- ----------------------------
--  Table structure for message_user
-- ----------------------------
DROP TABLE
IF EXISTS message_user;

CREATE TABLE message_user
(
  message_id       BIGINT(20)  NOT NULL
  COMMENT '系统消息ID',
  username         VARCHAR(20) NOT NULL
  COMMENT '接收人',
  is_read          TINYINT     NOT NULL                    DEFAULT '0'
  COMMENT '是否已读:{0:未读, 1:已读}',
  reply_message_id BIGINT(20)  NOT NULL                    DEFAULT '0'
  COMMENT '回复的消息的ID',
  updated_time     TIMESTAMP   NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间',
  PRIMARY KEY (message_id, username)
)
  COMMENT '消息分发中间表';

INSERT INTO menu
(code, name, pcode, url, sort, icon)
  VALUE
  ('SYSTEM_MESSAGE', '系统消息', 'SYSTEM', 'system/message', 6, '');

INSERT INTO role_menu (role_code, menu_code) VALUES
  ('ROLE_ADMIN', 'SYSTEM_MESSAGE');

INSERT INTO dictionary (code, value, type, sort)
VALUES
  ('SYSTEM', '系统消息', 'MESSAGE_TYPE', 0),
  ('UPDATE_PASSWORD', '修改密码', 'MESSAGE_TYPE', 1),
  ('ADVICE', '意见反馈', 'MESSAGE_TYPE', 2),
  ('REPLY', '反馈结果', 'MESSAGE_TYPE', 3);

-- ----------------------------
--  Table structure for guestbook
-- ----------------------------
DROP TABLE
IF EXISTS guestbook;

CREATE TABLE guestbook
(
  id              BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  realname        VARCHAR(32)                           NOT NULL
  COMMENT '昵称',
  email           VARCHAR(64)                           NOT NULL
  COMMENT '邮箱',
  content         VARCHAR(2048)                         NOT NULL
  COMMENT '内容',
  status          VARCHAR(16)                           NOT NULL                    DEFAULT 'waiting'
  COMMENT '状态:{"waiting":"待审核", "reject":"审核未通过", "complete":"审核通过"}',
  adjust_username VARCHAR(16)                           NOT NULL                    DEFAULT ''
  COMMENT '审核人',
  ip              VARCHAR(32)                           NOT NULL                    DEFAULT ''
  COMMENT 'IP',
  ip_info         VARCHAR(32)                           NOT NULL                    DEFAULT ''
  COMMENT 'IP信息',
  reply_message   LONGTEXT                              NOT NULL
  COMMENT '回复信息',
  reply_username  VARCHAR(16)                           NOT NULL                    DEFAULT ''
  COMMENT '回复人',
  is_deleted      TINYINT                               NOT NULL                    DEFAULT '0'
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time    TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time    TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '留言表';
CREATE INDEX id_created_time
  ON guestbook (created_time);

INSERT INTO menu
(code, name, pcode, url, sort, icon)
  VALUE
  ('WEB', '网站', 'DASHBOARD', 'web', 1, 'menu-icon fa fa-laptop'),
  ('WEB_GUESTBOOK', '留言审核', 'WEB', 'web/guestbook', 0, '');

INSERT INTO role_menu (role_code, menu_code) VALUES
  ('ROLE_ADMIN', 'WEB'),
  ('ROLE_ADMIN', 'WEB_GUESTBOOK');

-- ----------------------------
--  Table structure for music
-- ----------------------------
DROP TABLE
IF EXISTS music;

CREATE TABLE music
(
  id              BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  name            VARCHAR(64)                           NOT NULL
  COMMENT '歌曲名',
  singer          VARCHAR(64)                           NOT NULL
  COMMENT '歌手',
  album           VARCHAR(64)                           NOT NULL
  COMMENT '专辑',
  album_cover_path  VARCHAR(128)                          NOT NULL
  COMMENT '专辑封面路径',
  duration        INT(11)                               NOT NULL
  COMMENT '时长(秒)',
  size            BIGINT(20)                            NOT NULL
  COMMENT '文件大小(byte)',
  upload_username VARCHAR(16)                           NOT NULL                    DEFAULT ''
  COMMENT '上传人',
  status          VARCHAR(16)                           NOT NULL                    DEFAULT 'waiting'
  COMMENT '状态:{"waiting":"待审核", "reject":"审核未通过", "complete":"审核通过"}',
  adjust_username VARCHAR(16)                           NOT NULL                    DEFAULT ''
  COMMENT '审核人',
  is_stick        TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '是否置顶:{0:未置顶, 1:已置顶}',
  is_deleted      TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time    TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time    TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '音乐表';
CREATE INDEX id_updated_time
  ON music (updated_time);
CREATE UNIQUE INDEX  id_unique_name_singer
  ON music (name, singer);

INSERT INTO menu
(code, name, pcode, url, sort, icon)
  VALUE
  ('WEB_MUSIC_STORE', '音乐库', 'WEB', 'web/music/store', 1, ''),
  ('WEB_MUSIC_MANAGER', '音乐管理', 'WEB', 'web/music/manager', 2, '');

INSERT INTO role_menu (role_code, menu_code) VALUES
  ('ROLE_ADMIN', 'WEB_MUSIC_STORE'),
  ('ROLE_ADMIN', 'WEB_MUSIC_MANAGER'),
  ('ROLE_USER', 'WEB'),
  ('ROLE_USER', 'WEB_MUSIC_STORE');

