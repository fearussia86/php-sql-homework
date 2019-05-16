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

