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
  small_avatar  VARCHAR(256)                          NOT NULL                    DEFAULT '/upload/default-user-small.png'
  COMMENT '小头像',
  medium_avatar VARCHAR(256)                          NOT NULL                    DEFAULT '/upload/default-user-medium.png'
  COMMENT '中头像',
  large_avatar  VARCHAR(256)                          NOT NULL                    DEFAULT '/upload/default-user-large.png'
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
  id              BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  name            VARCHAR(32)                           NOT NULL
  COMMENT '书名',
  author          VARCHAR(32)                           NOT NULL
  COMMENT '作者',
  category_code   VARCHAR(16)                           NOT NULL
  COMMENT '分类代码',
  category_name   VARCHAR(32)                           NOT NULL
  COMMENT '分类名称',
  pic_url         VARCHAR(256)                          NOT NULL                    DEFAULT '/upload/default-book.png'
  COMMENT '封面图片地址',
  code            INT(11)                               NOT NULL
  COMMENT '书籍代码',
  descp           VARCHAR(1024)                         NOT NULL
  COMMENT '描述',
  isFinished      TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '是否完结{1: 完结, 0: 连载}',
  isHot           TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '推荐{1: 是, 0: 否}',
  newSectionId    BIGINT(20)                            NOT NULL                    DEFAULT 0
  COMMENT '最新章节id',
  newSectionTitle VARCHAR(256)                          NOT NULL                    DEFAULT ''
  COMMENT '最新章节标题',
  is_deleted      TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time    TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time    TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
  id               BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  title            VARCHAR(64)                           NOT NULL
  COMMENT '标题',
  content          LONGTEXT                              NOT NULL
  COMMENT '内容',
  prevSectionId    BIGINT(20)                            NOT NULL                    DEFAULT 0
  COMMENT '上一章节ID',
  prevSectionTitle VARCHAR(64)                           NOT NULL                    DEFAULT ''
  COMMENT '上一章节标题',
  nextSectionId    BIGINT(20)                            NOT NULL                    DEFAULT 0
  COMMENT '下一章节ID',
  nextSectionTitle VARCHAR(64)                           NOT NULL                    DEFAULT ''
  COMMENT '下一章节标题',
  is_deleted       TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time     TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time     TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '章节表';
CREATE UNIQUE INDEX id_UNIQUE
  ON section (id);
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
  code         VARCHAR(16)                           NOT NULL
  COMMENT '分类代码',
  name         VARCHAR(32)                           NOT NULL
  COMMENT '分类名称',
  type         VARCHAR(16)                           NOT NULL
  COMMENT '分类类型{"book": "小说", "blog": "博客"}',
  picUrl       VARCHAR(256)                          NOT NULL                    DEFAULT '/upload/default-category.png'
  COMMENT '图片地址',
  book_cnt     INT(11)                               NOT NULL                    DEFAULT 0
  COMMENT '书籍数量',
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

-- ----------------------------
--  Table structure for book_category
-- ----------------------------
DROP TABLE
IF EXISTS book_category;

CREATE TABLE book_category
(
  book_id       BIGINT(20)  NOT NULL
  COMMENT '书籍ID',
  category_code VARCHAR(16) NOT NULL
  COMMENT '书籍分类代码'
)
  COMMENT '书籍分类表';
CREATE UNIQUE INDEX book_id_category_code_UNIQUE
  ON book_category (book_id, category_code);

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

  ('USER', '用户', 'DASHBOARD', 'user', 1, 'menu-icon fa fa-user'),
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
                      FROM menu
                      WHERE code LIKE 'SYSTEM%' OR code = 'DASHBOARD';

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