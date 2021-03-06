DROP DATABASE myBook;

CREATE DATABASE homeworkBook;
USE homeworkBook;



CREATE TABLE IF NOT EXISTS tablebook (
# Далее идут столбцы

`id` INT NOT NULL AUTO_INCREMENT, 
`titlebook` VARCHAR(50) NOT NULL,
`description` VARCHAR(250) NOT NULL,
`price` INT NOT NULL,
`quantityStock` INT NOT NULL,
`quantityPages` INT NOT NULL,
`image` TEXT NOT NULL,
`id_author` INT NOT NULL,
PRIMARY KEY(id)

 


) ENGINE=InnoDB;

INSERT INTO tablebook(id, titlebook, description, price, quantityStock, quantityPages, image, id_author) VALUES(1, 'Маша и Медведи', 'description1', 1000, 5, 5, '1.jpg', 1);
INSERT INTO tablebook(id, titlebook, description, price, quantityStock, quantityPages, image, id_author) VALUES(2, 'Маша и Медведи', 'description1', 1000, 15, 150, 'localhost/images/imagebook1', 1);
INSERT INTO tablebook(id, titlebook, description, price, quantityStock, quantityPages, image, id_author) VALUES(3, 'Программирование компутера', 'description1', 1500, 12, 150, 'localhost/images/imagebook1', 2);
INSERT INTO tablebook(id, titlebook, description, price, quantityStock, quantityPages, image, id_author) VALUES(4, 'Природа IT решений', 'description1 вот это природа', 1000, 10, 150, 'localhost/images/imagebook1', 3);
INSERT INTO tablebook(id, titlebook, description, price, quantityStock, quantityPages, image, id_author) VALUES(5, 'Программирование на PHP', 'description1', 1200, 5, 150, 'localhost/images/imagebook1', 4);
INSERT tablebook(id, titlebook, description, price, quantityStock, quantityPages, image, id_author) VALUES(6, 'Природа и ланшафт Африки', 'description1', 1400, 4, 150, 'localhost/images/imagebook1', 5);
INSERT INTO tablebook(id, titlebook, description, price, quantityStock, quantityPages, image, id_author) VALUES(7, 'Три Мушкетера', 'description1', 1900, 2, 150, 'localhost/images/imagebook1', 3);
INSERT INTO tablebook(id, titlebook, description, price, quantityStock, quantityPages, image, id_author) VALUES(8, 'By whom the bell rings', 'description1', 2000, 25, 150, 'localhost/images/imagebook1', 7);
INSERT INTO tablebook(id, titlebook, description, price, quantityStock, quantityPages, image, id_author) VALUES(9, 'By whom the bell rings2', 'description1', 2000, 25, 150, 'localhost/images/imagebook1', 3);
SELECT titlebook,price,image FROM tablebook WHERE price BETWEEN 500 and 1500 ORDER BY price DESC;
SELECT titlebook,description FROM tablebook WHERE id=3 ORDER BY id ASC;
SELECT price FROM tablebook WHERE quantityStock<10;
SELECT * FROM tablebook WHERE description like '%природа%';
SELECT titlebook FROM tablebook WHERE price < 1700 AND id_author=2;
SELECT quantityStock FROM tablebook WHERE titlebook like 'программирование%';
SELECT * FROM tablebook WHERE id !=5;

USE homeworkBook;

# Вносим команду на изменение столбца таблицы. 

ALTER TABLE tablebook ADD surename VARCHAR(50); 
ALTER TABLE tablebook MODIFY surename VARCHAR(100) DEFAULT 'DEF';
ALTER TABLE tablebook ADD lasname VARCHAR (150) DEFAULT 'ВАШЕ ИМЯ';

desc tablebook;

SELECT * FROM tablebook;

SELECT concat(titlebook, ' ', description) AS names FROM tablebook;

USE homeworkBook;

CREATE TABLE IF NOT EXISTS `homeworkBook`.`comment` (
  `idComment` INT NOT NULL,
  `text` VARCHAR(450) NOT NULL,
  `parent` MEDIUMTEXT NOT NULL,
  `comment_idComment` INT NOT NULL,
  PRIMARY KEY (`idComment`),
  INDEX `fk_comment_comment_idx` (`comment_idComment` ASC),
  CONSTRAINT `fk_comment_comment`
    FOREIGN KEY (`comment_idComment`)
    REFERENCES `homeworkBook`.`comment` (`idComment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SELECT c1.text as parent1, c2.text as child
FROM comment c1
JOIN comment c2
ON c1.idcomment = c2.comment_idcomment;

INSERT INTO comment (idComment, `text`, parent, comment_idComment) values (1, 'Текст комментария', 'parent1', 0);


USE books;



CREATE TABLE IF NOT EXISTS `books`.`comment` (
  `idComment` INT NOT NULL AUTO_INCREMENT,
  `textComment` VARCHAR(450) NOT NULL,
  `comment_idComment` INT NOT NULL,
  PRIMARY KEY (`idComment`),
  INDEX `fk_comment_comment_idx` (`comment_idComment` ASC),
  CONSTRAINT `fk_comment_comment`
    FOREIGN KEY (`comment_idComment`)
    REFERENCES `homeworkBook`.`comment` (`idComment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SELECT c1. textComment as parent1, c2. textComment as child
FROM comment c1
JOIN comment c2
ON c1.idcomment = c2.comment_idcomment;

SELECT * FROM cart_good;
SELECT * FROM good;
SELECT * FROM cart;
SHOW tables;

#Уникальные товары в корзине 1
SELECT COUNT(DISTINCT idGood) FROM cart_good WHERE idCart = 1;

# Сумма заказа по корзине 3
#Где cg и g - это псевдонимы Таблиц card_good и g - это таблица good

SELECT SUM(cg.amount*g.price) AS res
FROM cart_good cg, good g 
WHERE cg.idGood = g.idGood
AND idCart = 3; #Работаем с данными, по корзине 3. 


SELECT cg.idCart, SUM(cg.amount*g.price) AS res
FROM cart_good cg, good g
WHERE cg.idGood = g.idGood
GROUP BY cg.IdCart
HAVING SUM(cg.amount*g.price) > 1000;

#Если сервер слабенький, то лучше сделать так, чтобы в базе делались расчеты
# Если сервер сильный, то лучше на сервере делать. 
# Либо можно посчитать в базе данных и закешировать результат



