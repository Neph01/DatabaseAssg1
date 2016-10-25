Create TABLE price(
price_id			INT 			NOT NULL,	AUTO_INCREMENT,
price_description 	VARCHAR(1000)	NOT NULL,
price_rentfee		VARCHAR(4)		NOT NULL,
price_dailylatefee	VARCHAR(4)		NOT NULL,
CONSTRAINT PRIMARY KEY (price_id),
CONSTRAINT UNIQUE (price_description, price_rentfee, price_dailylatefee)
);

CREATE TABLE membership(
	mem_id		INT			NOT NULL,	AUTO_INCREMENT,
	mem_fname	CHAR(25)	NOT NULL,
	mem_lname	CHAR(25)	NOT NULL,
	mem_street	CHAR(30)	NOT NULL,
	mem_city	CHAR(35)	NOT NULL,
	mem_state	CHAR(2)		NOT NULL,
	mem_zip		CHAR(5)		NOT NULL,
	mem_balance	INT			NOT NULL,
	CONSTRAINT PRIMARY KEY (mem_id),
	CONSTRAINT UNIQUE (mem_fname, mem_lname)
);

CREATE TABLE movie(
movie_id	INT				NOT NULL,	AUTO_INCREMENT,
movie_title	VARCHAR(100)	NOT NULL,
movie_year	CHAR(4)			NOT NULL,
movie_cost	VARCHAR(5)		NOT NULL,
price_id	INT				NULL,
CONSTRAINT PRIMARY KEY (movie_id),
CONSTRAINT UNIQUE (movie_title, movie_cost),
CONSTRAINT FOREIGN (price_id) REFERENCES price(price_id)
);

CREATE TABLE rental(
rent_id		INT				NOT NULL,	AUTO_INCREMENT,
rent_date	VARCHAR(10)		NOT NULL,
mem_id		INT				NOT NULL,
CONSTRAINT PRIMARY KEY (rent_id),
CONSTRAINT UNIQUE (rent_date),
CONSTRAINT FOREIGN KEY (mem_id) REFERENCES membership(mem_id)
);

CREATE TABLE video(
vid_id		INT				NOT NULL,	AUTO_INCREMENT,
vid_indate	VARCHAR(10)		NOT NULL,
movie_id	INT				NOT NULL,
CONSTRAINT PRIMARY KEY (vid_id),
CONSTRAINT UNIQUE (vid_indate),
CONSTRAINT FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

CREATE TABLE detail_rental(
rent_id 			INT				NOT NULL,	AUTO_INCREMENT,
vid_id				INT				NOT NULL,
detail_fee			VARCHAR(5)		NOT NULL,
detail_duedate		VARCHAR(10)		NOT NULL,
detial_returndate	VARCHAR(10)		NULL,
detail_dailylatefee	VARCHAR(5)		NOT NULL,
CONSTRAINT PRIMARY KEY (rent_id, vid_id),
CONSTRAINT UNIQUE (detail_fee, detail_duedate, detial_returndate, detail_dailylatefee),
CONSTRAINT FOREIGN KEY (rent_id) REFERENCES rental(rent_id),
CONSTRAINT FOREIGN KEY (vid_id) REFERENCES video(vid_id)
);


PRICE
--------------------------------------------------------------------------------------------
INSERT INTO price VALUES
(1, 'Standard',       2.00, 1)
(2, 'New Release',    3.50, 3),
(3, 'Discount',       1.50, 1),
(4, 'Weekly Special', 1.00, .5);

MOVIE
--------------------------------------------------------------------------------------------\
INSERT INTO movies VALUES
(1234, 'The Cesar Family Christmas', 2009, 39.95, 'Family', 2),
(1235, 'Smokey Mountain Wildlife',   2006, 59.95, 'Action', 1),
(1236, 'Richard Goodhope',           2010, 59.95, 'Drama' , 2),
(1237, 'Beatnik Fever',              2009, 29.95, 'Comedy', 2),
(1238, 'Constant Companion',         2010, 89.95, 'Drama' , NULL),
(1239, 'Where Hope Dies',            2000, 25.49, 'Drama' , 3),
(1245, 'Time to Burn',               2007, 45.49, 'Action', 1),
(1246, 'What He Doesnt Know',       2008, 58.29, 'Comedy', 1);


VIDEO
--------------------------------------------------------------------------------------------
INSERT INTO video VALUES
(34341, '2009-01-22', 1235),
(34342, '2009-01-22', 1235),
(34366, '2011-03-02', 1236),
(34367, '2011-03-02', 1236),
(34368, '2011-03-02', 1236),
(34369, '2011-03-02', 1236),
(44392, '2010-10-21', 1237),
(44397, '2010-10-21', 1237),
(54321, '2010-05-18', 1234),
(54324, '2010-05-18', 1234),
(54325, '2010-05-18', 1234),
(59237, '2011-02-14', 1237),
(61353, '2008-01-28', 1245),
(61354, '2008-01-28', 1245),
(61367, '2010-07-30', 1246),
(61369, '2010-07-30', 1246),
(61388, '2009-01-25', 1239);

MEMBERSHIP
--------------------------------------------------------------------------------------------
INSERT INTO membership VALUES
(102, 'Tami',    'Dawson',   '2632 Takli Circle',       'Norene',       'TN', '37136', 11),
(103, 'Curt',    'Knight',   '4025 Cornell Court',      'Flatgap',      'KY', '41219', 6),
(104, 'Jamal',   'Melendez', '788 East 145th Avenue',   'Quebeck',      'TN', '38579', 0),
(105, 'Iva',     'McClain',  '6045 Musket Ball Circle', 'Summit',       'KY', '42783', 15),
(106, 'Miranda', 'Parks',    '4469 Maxwell Place',      'Germantown',   'TN', '38183', 0),
(107, 'Rosario', 'Elliott',  '7578 Danner Avenue',      'Columbia',     'TN', '38402', 5),
(108, 'Mattie',  'Guy',      '4390 Evergreen Street',   'Lily',         'KY', '40740', 0),
(109, 'Clint',   'Ochoa',    '1711 Elm Street',         'Greeneville',  'TN', '37745', 10),
(110, 'Lewis',   'Rosales',  '4524 Southwind Circle',   'Counce',       'TN', '38326', 0),
(111, 'Stacy',   'Mann',     '2789 East Cook Avenue',   'Murfreesboro', 'TN', '37132', 8),
(112, 'Luis',    'Trujillo', '7267 Melvin Avenue',      'Heiskell',     'TN', '37754', 3),
(113, 'Minnie',  'Gonzales', '6430 Vasili Drive',       'Williston',    'TN', '38076', 0);

RENTAL
--------------------------------------------------------------------------------------------
INSERT INTO rental VALUES
(1001, '2011-03-01', 103),
(1002, '2011-03-01', 105),
(1003, '2011-03-02', 102),
(1004, '2011-03-02', 110),
(1005, '2011-03-02', 111),
(1006, '2011-03-02', 107),
(1007, '2011-03-02', 104),
(1008, '2011-03-03', 105),
(1009, '2011-03-03', 111);

DETAILRENTAL
--------------------------------------------------------------------------------------------
INSERT INTO detailrental VALUES
(1001, 34342, 2.00, '2011-03-04', '2009-03-02', 1.00),
(1001, 34366, 3.50, '2011-03-04', '2009-03-02', 3.00),
(1001, 61353, 2.00, '2011-03-04', '2009-03-03', 1.00),
(1002, 59237, 3.50, '2011-03-04', '2009-03-04', 3.00),
(1003, 54325, 3.50, '2011-03-04', '2009-03-09', 3.00),
(1003, 61369, 2.00, '2011-03-06', '2009-03-09', 1.00),
(1003, 61388, 0.00, '2011-03-06', '2009-03-09', 1.00),
(1004, 34341, 2.00, '2011-03-07', '2009-03-07', 1.00),
(1004, 34367, 3.50, '2011-03-05', '2009-03-07', 3.00),
(1004, 44392, 3.50, '2011-03-05', '2009-03-07', 3.00),
(1005, 34342, 2.00, '2011-03-07', '2009-03-05', 1.00),
(1005, 44397, 3.50, '2011-03-05', '2009-03-05', 3.00),
(1006, 34366, 3.50, '2011-03-05', '2009-03-04', 3.00),
(1006, 61367, 2.00, '2011-03-07', NULL,         1.00),
(1007, 34368, 3.50, '2011-03-05', NULL,         3.00),
(1008, 34369, 3.50, '2011-03-05', '2009-03-05', 3.00),
(1009, 54324, 3.50, '2011-03-05', NULL,         3.00);
