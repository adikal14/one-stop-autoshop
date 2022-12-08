CREATE DATABASE one_stop_autoshop;
CREATE USER 'Arielle'@'%' IDENTIFIED BY 'panera_is_awesome';
GRANT ALL PRIVILEGES ON one_stop_autoshop.* TO 'Arielle'@'%';
-- GRANT ALL PRIVILEGES ON one_stop_autoshop.* TO 'webapp'@'%';
FLUSH PRIVILEGES;

-- Move into the database we just created
USE one_stop_autoshop;


CREATE TABLE account (
    account_ID INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    age_of_account INT,
    username TEXT,
    pass TEXT

);

INSERT INTO account
    (account_ID, age_of_account, username, pass)
VALUES
(140,4,'gcasperri0','FU0SGLtK3fX'),
(141,5, 'hello','abc123'),
(142,3,'leslinger1','Rq7MKWhWf7u'),
(143,5,'gfranklen2','M6SgRcJ6qM0X'),
(144,4,'locurran3','KbDlh4CVsf6h'),
(145,1,'czoane4','J0VeNz'),
(146,2,'pdavidovitz5','x5KiCEe4yqFk'),
(147,9,'rkahn6','LYhNAyc'),
(148,6,'kwhittet7','zs074jwHGz'),
(149,8,'cdoherty8','t9peFZhg3O'),
(150,3,'kinglefield9','rXhPoEgiW'),
(151,7,'cmacrinna','155ZBM'),
(152,9,'aovenellb','ndY0E22'),
(153,4,'ggillilandc','aUyYyPG'),
(154,7,'bolennaned','p3kod0xI'),
(155,10,'gblaskette','I0E74m'),
(156,9,'grugerf','5W09Swv'),
(157,6,'gfoddeng','Ljse8ZoKYp8I'),
(158,10,'jbampfordh','gMbcJm'),
(159,5,'mgregsi','LDypjawB'),
(160,15,'cwibrowi',	'FZxeL5L'),
(161,10,'kparnallj','H0b2AFtoz50r'),
(162,11,'epennringtonk','XuPzuQQd'),
(163,8,'tlayburnl',	'bcTmflK'),
(164,7,	'nclaricoatsm',	'd2KbWvUcWw'),
(165,10,'mdowen',	'nflaHGvH'),
(166,5,	'rbullimoreo',	'nDgucoERZZuV'),
(167,6,'tgudgenp',	'2dFHvb'),
(168,2,	'gbruinemanq',	'SBhQSZnl75qn'),
(169,12,	'glosebier',	'LGrPS3d8qf'),
(170,1,	'qszwarcs',	'HUn4sW4arY8'),
(171,15,'meamert',	'rRBFI7w'),
(172,2,	'malfordeu',	'9rJ7pxP'),
(173,15,'sdanelutv',	'aXbPq1'),
(174,11,'speasew',	'bJgtGv'),
(175,14,'awharltonx',	'rcjaMrWE8u7'),
(176,6,	'rfransewichy',	'UrGiJ7WB'),
(177,3,	'dbyerz','dovHO8AOPbHP'),
(178,2,	'cbauer10',	'sAYFlucT'),
(179,9,	'imiche11',	'7xEULOGc'),
(180,11,	'gdumphy12'	, 'S6rBwhxXzY'),
(181,13,'mstreather13',	'abO5S8VCUTbs'),
(182,14,	'bricco14',	'wJ8bCaiz'),
(183,13,	'gminico15',	'7idxi4a'),
(184,10,	'ihooban16',	'B1zr2ma'),
(185,3,	'ckelwick17',	'79Zx2sNIf'),
(186,11,	'bmalshinger18',	'yzuUPW3m'),
(187,14,	'shobble19',	'wr7kaFqcu'),
(188,1,	'pbrowne1a',	'iP4USbktpiD'),
(189,5,	'badlam1b',	'iLtVvC0Pk6'),
(190,6,	'cdalyell1c',	'zXV4BuNyS7cy'),
(191,3,	'alyston1d',	'jblvVB'),
(192,3,	'tbernakiewicz1e',	'1cOxtRwq'),
(193,3,	'bcerman1f', 'oNo4aKsiRl'),
(194,12,	'pprescote1g',	'C2oqBKsok'),
(195,15,'vmoquin1h',	'dzRCfqY0s9n'),
(196,15,	'rdineen1i',	'JxW4J25Zo'),
(197,13,'cconley1j',	'FhctFzmHwaM'),
(198,7,	'mturri1k',	't6m3OmC4u'),
(199,8,	'lstormont1l',	'kvOgqaZQAVK'),
(200,1,	'smaffetti1m',	'WFuiirPUP');

-- Put your DDL
CREATE TABLE customer (
    cust_ID INTEGER  PRIMARY KEY NOT NULL  ,
    first_name TEXT  NOT NULL,
    last_name TEXT  NOT NULL,
    zip_code  INT  NOT NULL,
    a_ID INT NOT Null,
    FOREIGN KEY (a_ID) REFERENCES account(account_ID) ON UPDATE cascade
);

-- Add sample data
INSERT INTO customer
    (cust_ID, first_name, last_name, zip_code, a_ID)
VALUES
    (1,'Lynea','Antonias',	10444,140),
    (2,	'Merissa', 'Matzl',	19444,141),
    (3,'Malanie' ,'Connechy',19428,142),
(4,'Deena','Plank',23046,143),
(5,'Elizabet','Libbey',22046,144),
(6,'Olivia','Barnson',02115,145),
(7,'Terrill', 'Bentjens',0211,146),
(8,'Modesty','Beesley',12345,147),
(9,'Sinclare','Mibourne',19462,148),
(10,'Ruthie','Tyer',16841,149),
(11,'Hermann','Hempshall',16831,150),
(12,'Elsy','Queripel',15851,151),
(13,'Ginnie','Horwell',16851,152),
(14,'Finley','Westell',12346,153),
(15,'Mady','McAnulty',12347,154),
(16,'Brander','Meatyard',12348,155),
(17,'Robena','Pocock',12349,156),
(18,'Florette','Cruttenden',12344,157),
(19,'Lodovico','Amdohr',90210,158),
(20,'Jesse','Baggs',54321,159)
    ;

CREATE TABLE manager (
    manager_ID INTEGER  PRIMARY KEY NOT NULL,
    first_name TEXT,
    last_name TEXT,
    a_ID INT NOT Null,
    FOREIGN KEY (a_ID) REFERENCES account(account_ID) ON UPDATE cascade

);

INSERT INTO manager
    (manager_ID, first_name, last_name, a_ID)
VALUES
(41, 'Milzie' , 'Hallybone',160),
(42, 'Riple', 'Crewdson',161),
(43, 'Vite', 'Lyosik',162),
(44, 'Carver', 'Skerratt',163),
(45, 'Aldrich', 'Hirsthous',164),
(46, 'Dorolisa' , 'Almeida',165),
(47, 'Yurik', 'Chew',166),
(48, 'Kelly', 'Aspenlon',167),
(49, 'Cass', 'Quaif',168),
(50, 'Ruprecht' , 'Ladel',169),
(51, 'Juieta', 'Stiggers',170),
(52, 'Glyn', 'Standering',171),
(53, 'Glenden', 'Connelly',172),
(54, 'Shannon', 'Macrow',173),
(55, 'Chicky' , 'OShevlin',174),
(56, 'Micheil' , 'Mussared',175),
(57, 'Pepito' , 'Cosstick',176),
(58, 'Karita','Croall',177),
(59, 'Layne', 'Kienle',178),
(60, 'Yale', 'Sweetzer',179);


CREATE TABLE autoshop (
    auto_ID INTEGER  PRIMARY KEY NOT NULL,
    name TEXT,
    street TEXT,
    city TEXT,
    state TEXT,
    postalcode TEXT,
    managerID INT,
    FOREIGN KEY (managerID) REFERENCES manager(manager_ID) ON UPDATE cascade
);

INSERT INTO autoshop
    (auto_ID, name, street, city, state, postalcode, managerID)
VALUES
(61, 'Gutkowski Raynor and Luettgen' ,'0262 Lakeland Circle', 'Agen', 'VA', 22046, 41),
(62, 'Connelly, Pagac and Kulas', '96311 Monica Center', 'Falls Church', 'PA', 33456, 42),
(63, 'Champlin, Bailey and Frami' , '0590 Burning Wood Hill', 'Newcomb', 'MA', 09876, 43),
(64, 'OKeefe, Thiel and Zulauf' ,'277 Havey Junction', 'Alor Setar', 'FL', 12567, 44),
(65, 'Johnston, Franecki and Macejkovic' ,'77186 Hermina Center', 'Kayangel', 'NC', 87623, 45),
(66, 'Prohaska Inc' ,'406 Dahle Parkway','San Francisco', 'CA', 12098, 46),
(67, 'Cormier, Schmidt and Koelpin' ,'3 Arapahoe Center', 'Bello', 'AZ', 65439, 47),
(68, 'Brekke-Nicolas','50 Schiller Avenue', 'McLean', 'VA', 54091, 48),
(69, 'Murray, Collins and Swift' ,'744 Fairview Pass','Saint Lucia', 'SC', 53012, 49),
(70, 'Heidenreich Inc', '63 Hoffman Street', 'Liuqiao', 'CT', 02115, 50),
(71, 'Koss, Dickens and Conroy', '3313 Farwell Point', 'Pancevo', 'WA', 33567, 51),
(72, 'McDermott-Von' ,'4236 Schmedeman Alley', 'Ouango', 'SD', 66891, 52),
(73, 'Dibbert-Ratke' ,'9519 Parkside Street', 'Sumberan', 'TN', 73456, 53),
(74, 'OHara LLC' ,'07298 Jenifer Center', 'Arlington', 'TX', 09541, 54),
(75, 'Satterfield Group' , '979 Kenwood Point', 'Chicago', 'IL', 14703, 55),
(76, 'Welch-Zemlak' ,'15222 Dexter Crossing', 'Kabala', 'OR', 25845, 56),
(77, 'Murphy-Jacobson' ,'26482 Morning Plaza', 'Reston', 'NJ', 90210, 57),
(78, 'Franecki-Kulas','5666 Heffernan Terrace', 'Amparo', 'NY', 80220, 58),
(79, 'Pouros-Bartoletti' ,'8 Kensington Avenue', 'Wooster', 'MA', 87234, 59),
(80, 'Medhurst, Nienow and Zulauf','2457 Muir Court', 'Gudong', 'NM', 22334, 60);

CREATE TABLE mechanic (
    mechanic_ID INTEGER  PRIMARY KEY NOT NULL ,
    years_of_experience INTEGER,
    first_name TEXT,
    last_name TEXT,
    average_rating FLOAT,
    autoid INTEGER,
    a_ID INTEGER NOT NULL,
    FOREIGN KEY (autoid) REFERENCES autoshop(auto_ID) ON UPDATE cascade,
    FOREIGN KEY (a_ID) REFERENCES account(account_ID) ON UPDATE cascade
);

INSERT INTO mechanic
    (mechanic_ID, years_of_experience, first_name, last_name, average_rating, autoID, a_ID)
VALUES
(101,47,'Flossie','Smittoune',2.8,65,180),
(102,27,'Drucy','Eliez',2.7,75,181),
(103,42,'Oralle','Paterson',2.6,64,182),
(104,14,'Kimberlyn','Winsiowiecki',3.2,73,183),
(105,43,'Christan','Breeze',4.1,62,184),
(106,12,'Laurianne','Saben',2.4,63,185),
(107,41,'Donielle','Ribbon',2.3,77,186),
(108,47,'Perceval','Parmley',4.6,74,187),
(109,43,'Matelda','McGarrell',4.9,63,188),
(110,39,'Alejandro','Ollenbuttel',4.9,69,189),
(111,30,'Ethel','Boraston',3.2,76,190),
(112,6,'Shandy','Fruser',4.1,72,191),
(113,35,'Yancey','Slot',5.0,70,192),
(114,24,'Cyrill','Targe',4.1,69,193),
(115,8,'Augustine','Chasle',4.0,76,194),
(116,2,'Nobe','De Andisie',4.9,77,195),
(117,4,'Hadlee','Philler',2.7,67,196),
(118,45,'Betteanne','Gaskamp',4.9,70,197),
(119,35,'Udall','McHarry',1.4,64,198),
(120,2,'Brannon','Cork',5.0,68,199);


CREATE TABLE skills (
    skill_ID INTEGER PRIMARY KEY NOT NULL,
    description TEXT,
    price FLOAT,
    duration FLOAT
);

INSERT INTO skills
    (skill_ID, description, price, duration)
VALUES
(81,'donec quis orci eget orci vehicula condimentum curabitur in libero ut',477.27,67),
(82,'lacus morbi quis tortor id nulla ultrices aliquet',338.35,72),
(83,'rutrum nulla tellus in sagittis dui vel nisl',396.34,30),
(84,'fusce lacus purus aliquet at feugiat non',85.81,11),
(85,'neque duis bibendum morbi non quam nec',407.19,25),
(86,'viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis',239.43,3),
(87,'nulla integer pede justo lacinia eget tincidunt',108.52,70),
(88,'purus sit amet nulla quisque arcu libero rutrum ac lobortis',238.02,32),
(89,'proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis',89.62,47),
(90,'dui vel sem sed sagittis nam congue',412.83,18),
(91,'dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit',142.00,3),
(92,'nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy',122.39,4),
(93,'libero nullam sit amet turpis elementum ligula vehicula consequat morbi a',258.99,72),
(94,'erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin',414.60,27),
(95,'pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus',241.99,35),
(96,'in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing',126.46,61),
(97,'cursus vestibulum proin eu mi nulla ac enim in',277.26,30),
(98,'morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo',325.90,65),
(99,'sit amet sem fusce consequat nulla nisl',359.35,3),
(100,'odio cras mi pede malesuada in imperdiet et commodo vulputate justo in',192.64,29);


CREATE TABLE mechanic_skills (
    skill_ID INTEGER,
    mechanic_ID INTEGER,
    FOREIGN KEY (skill_ID) REFERENCES skills(skill_ID) ON UPDATE cascade,
    FOREIGN KEY (mechanic_ID) REFERENCES mechanic(mechanic_ID) ON UPDATE cascade
);

INSERT INTO mechanic_skills
    (skill_ID, mechanic_ID)
VALUES
    (81, 101),
    (82,119),
    (83, 101),
    (84, 102),
    (85, 103),
    (86, 118),
    (87, 117),
    (88, 111),
    (89, 112),
    (90, 119),
    (91, 103),
    (92, 116),
    (93, 115),
    (94, 104),
    (95, 113),
    (96, 114),
    (97, 102),
    (98, 108),
    (99, 107),
    (100, 106);


CREATE TABLE cars (
    vin_num char(17) PRIMARY KEY NOT NULL,
    make TEXT,
    model TEXT,
    car_year INTEGER,
    miles FLOAT,
    cust_ID INTEGER,
    FOREIGN KEY (cust_ID) REFERENCES customer(cust_ID));

INSERT INTO cars
    (vin_num, make, model, car_year, miles, cust_ID)
VALUES
    ('WA1YD64B33N581646','Hummer','H3T',2010,7,1),
('1N6AA0ED9FN040079','Chrysler','LHS',1995,20,2),
('YV1902AH5B1486996','Ford','Explorer Sport',2001,15,3),
('JN8AF5MV3FT012290','Saab','9-3',2000,26,4),
('1GYUCGEFXAR404042','Mazda','Mazdaspeed 3',2009,7,5),
('2HNYD28478H177124','Mazda','Miata MX-5',2004,11,6),
('1D4RD4GG5BC148980','GMC','Safari',2000,11,7),
('WBAVB73537K075304','Ford','ZX2',2003,61,8),
('WAULC58E04A455140','Pontiac','Firebird',1997,21,9),
('2C3CDYCJ4EH430920','Pontiac','Firebird',2001,54,10),
('1G6DP5EV3A0941865','Mercedes-Benz','CLK-Class',2004,9,11),
('WA1DVAFE3AD486819','Mercury','Mountaineer',2000,92,12),
('WAUJGAFC7DN244662','Mazda','929',1995,54,13),
('1G6DH8EY1B0105059','Eagle','Talon',1994,59,14),
('JN1CV6EK2CM922670','Mazda','MPV',1997,87,15),
('WAUNF98P78A491258','Jaguar','XF',2009,4,16),
('KNAGM4ADXB5839233','Chevrolet','Camaro',1974,78,17),
('WBAYF8C59ED228390','Pontiac','Grand Prix',1990,46,18),
('1G6AB5R35F0787256','Toyota','Celica',1978,67,19),
('WAUSG74FX9N744682','Chrysler','Town & Country',2012,67,20);

CREATE TABLE repairs (
    repair_ID INTEGER PRIMARY KEY NOT NULL,
    name TEXT,
    duration FLOAT
);

INSERT INTO repairs
    (repair_ID, name, duration)
VALUES
    (170,	'in imperdiet et commodo vulputate justo in blandit ultrices',	2),
    (171,	'sit amet turpis elementum ligula vehicula consequat',	48),
(172,	'diam erat fermentum justo nec condimentum neque sapien placerat ante',	29),
(173,	'eget elit'	,26),
(174,	'vel augue vestibulum rutrum',	37),
(175,	'platea dictumst aliquam augue quam sollicitudin vitae consectetuer', 47),
(176,	'eu tincidunt in leo maecenas pulvinar',	17),
(177,	'maecenas leo odio condimentum id luctus nec molestie',	22),
(178,	'arcu libero rutrum ac lobortis vel dapibus at diam nam', 70),
(179,	'lectus vestibulum quam sapien varius'	,40),
(180,	'amet sapien dignissim vestibulum vestibulum ante ipsum primis',	60),
(181,	'nulla nisl nunc',	67),
(182,	'orci luctus et ultrices posuere',	67),
(183,	'quam nec dui luctus',	29),
(184,	'at nunc commodo placerat praesent blandit',	47),
(185,	'nibh ligula nec sem duis aliquam convallis nunc proin',	10),
(186,	'in consequat ut nulla sed accumsan felis ut at',	68),
(187,	'elit proin',	54),
(188,	'vitae nisl aenean lectus pellentesque eget nunc donec quis orci',	19),
(189,	'volutpat convallis morbi',	34);



CREATE TABLE reviews(
    review_ID INTEGER NOT NULL AUTO_INCREMENT,
    customer_ID INTEGER NOT NULL,
    repair_ID INTEGER NOT NULL,
    mechanic_ID INTEGER NOT NULL,
    duration FLOAT,
    price_paid FLOAT,
    star_rating INTEGER,
    review_description TEXT,
    PRIMARY KEY (review_ID, customer_ID, repair_ID, mechanic_ID),
    FOREIGN KEY (customer_ID) REFERENCES customer(cust_ID) ON UPDATE cascade ON DELETE restrict,
    FOREIGN KEY (repair_ID) REFERENCES repairs(repair_ID) ON UPDATE cascade,
    FOREIGN KEY (mechanic_ID) REFERENCES mechanic(mechanic_ID) ON UPDATE cascade

);

INSERT INTO reviews
    (review_ID, customer_ID, repair_ID, mechanic_ID, duration, price_paid, star_rating, review_description)
VALUES
(213,1,170,101,17,370.15,1.8,'ac nibh fusce lacus purus aliquet at feugiat non pretium'),
(210,2,171,102,55,267.06,3.3,'pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula'),
(201,3,172,103,15,15.01,3.9,'imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat'),
(219,4,173,104,1,293.59,3.8,'enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula'),
(214,5,174,105,8,110.43,3.6,'quis justo maecenas rhoncus aliquam'),
(211,6,175,106,23,362.74,2.3,'eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat'),
(203,7,176,107,2,462.40,2.9,'sit amet eleifend pede libero'),
(218,8,177,108,67,369.26,3.4,'rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus'),
(212,9,178,109,71,339.63,1.4,'metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum'),
(202,10,179,110,46,127.48,1.9,'augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat'),
(220,11,180,111,21,383.41,4.7,'blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum'),
(206,12,181,112,27,416.68,1.4,'accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel'),
(205,13,182,113,50,345.63,2.4,'condimentum curabitur in libero ut massa'),
(219,14,183,114,63,213.86,2.2,'id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit'),
(215,15,184,115,43,352.30,4.8,'ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam'),
(216,16,185,116,18,147.90,2.0,'ac est lacinia nisi venenatis tristique fusce'),
(214,17,186,117,18,117.48,1.9,'orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi'),
(201,18,187,118,56,370.93,3.3,'risus semper porta volutpat quam'),
(204,19,188,119,6,457.51,1.7,'in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat'),
(217,20,189,120,65,415.37,4.9,'felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu');
