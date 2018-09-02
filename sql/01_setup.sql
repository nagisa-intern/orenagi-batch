CREATE DATABASE IF NOT EXISTS orenagi;

CREATE TABLE IF NOT EXISTS orenagi.comics(
  id      INT           NOT NULL  COMMENT '作品ID'  PRIMARY KEY,
  title   VARCHAR(255)  NOT NULL  COMMENT '作品タイトル',
  summary Text          NOT NULL  COMMENT '作品説明文') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='作品一覧';

CREATE TABLE IF NOT EXISTS  orenagi.authors(
  id    INT           NOT NULL  COMMENT '作者ID'  PRIMARY KEY,
  name  VARCHAR(255)  NOT NULL  COMMENT '作者名',
  info  Text          NOT NULL  COMMENT '作者紹介文') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='作者一覧'; 
CREATE TABLE IF NOT EXISTS orenagi.comic_data(
  id        INT           NOT NULL  COMMENT '作品データid'  PRIMARY KEY,
  comic_id  INT           NOT NULL  COMMENT '作品id',
  title     VARCHAR(255)  NOT NULL  COMMENT '作品データタイトル',
  episode   INT           NOT NULL  COMMENT '話数',
  FOREIGN KEY(comic_id)   REFERENCES comics(id)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='作品データ';

CREATE TABLE IF NOT EXISTS orenagi.comic_author(
  comic_id  INT NOT NULL  COMMENT '作品id',
  author_id INT NOT NULL  COMMENT '作者id',
  FOREIGN KEY(comic_id)   REFERENCES orenagi.comics(id),
  FOREIGN KEY(author_id)  REFERENCES orenagi.authors(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='作品と作者の中間テーブル'; 

CREATE TABLE IF NOT EXISTS orenagi.locations (
  id    INT           AUTO_INCREMENT,
  name  VARCHAR(256)  UNIQUE NOT NULL,
  PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地名一覧';

CREATE TABLE IF NOT EXISTS orenagi.location_comic (
  location_id   INT NOT NULL, comic_id      INT NOT NULL,
  FOREIGN KEY(comic_id)     REFERENCES orenagi.locations(id),
  FOREIGN KEY(location_id)  REFERENCES orenagi.comics(id),
  PRIMARY KEY(location_id, comic_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地名と作品の紐付け';
