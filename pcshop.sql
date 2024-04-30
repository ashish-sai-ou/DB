--
-- Database: 'pcshop'
--

-- --------------------------------------------------------

--
-- Table structure for table 'customers'
--

CREATE TABLE IF NOT EXISTS customers (
  customer_id char(10) NOT NULL,
  firstname varchar(32) DEFAULT NULL,
  lastname varchar(32) DEFAULT NULL,
  city varchar(32) DEFAULT NULL,
  address varchar(128) DEFAULT NULL,
  email varchar(128) DEFAULT NULL UNIQUE,
  PRIMARY KEY (customer_id)
);

--
-- Dumping data for table 'customers'
--

INSERT INTO customers (customer_id, firstname, lastname, city, address, email) VALUES
('NL11223344', 'Eva', 'Janssen', 'Maastricht', 'Vrijthof 9', 'eva.j@maashop.nl'),
('NL22334455', 'Lucas', 'van Dam', 'Heerlen', 'Geleenstraat 12', 'lucas.vd@limburgnet.nl'),
('NL33445566', 'Sophie', 'Peeters', 'Sittard', 'Markt 22', 'sophie.p@sittardmail.nl'),
('NL44556677', 'Bram', 'Kuijpers', 'Venlo', 'Parade 33', 'bramk@venlopost.nl'),
('NL55667788', 'Fleur', 'Hoekstra', 'Kerkrade', 'Kerkplein 44', 'fleur.h@zuidlimburgmail.nl');

-- --------------------------------------------------------

--
-- Table structure for table 'laptops'
--

CREATE TABLE IF NOT EXISTS laptops (
  model char(4) NOT NULL DEFAULT '',
  speed double DEFAULT NULL,
  ram int(11) DEFAULT NULL,
  hd int(11) DEFAULT NULL,
  screen double DEFAULT NULL,
  price double DEFAULT NULL,
  PRIMARY KEY (model)
);

--
-- Dumping data for table 'laptops'
--

INSERT INTO laptops (model, speed, ram, hd, screen, price) VALUES
('2001', 2, 2048, 240, 20.1, 3673),
('2002', 1.73, 1024, 80, 17, 949),
('2003', 1.8, 512, 60, 15.4, 549),
('2004', 2, 512, 60, 13.3, 1150),
('2005', 2.16, 1024, 120, 17, 2500),
('2006', 2, 2048, 80, 15.4, 1700),
('2007', 1.83, 1024, 120, 13.3, 1429),
('2008', 1.6, 1024, 100, 15.4, 900),
('2009', 1.6, 512, 80, 14.1, 680),
('2010', 2, 2048, 160, 15.4, 2300);

-- --------------------------------------------------------

--
-- Table structure for table 'pcs'
--

CREATE TABLE IF NOT EXISTS pcs (
  model char(4) NOT NULL,
  speed double NOT NULL,
  ram int(11) NOT NULL,
  hd int(11) NOT NULL,
  price double NOT NULL,
  PRIMARY KEY (model)
);

--
-- Dumping data for table 'pcs'
--

INSERT INTO pcs (model, speed, ram, hd, price) VALUES
('1001', 2.66, 1024, 250, 2114),
('1002', 2.1, 512, 250, 995),
('1003', 1.42, 512, 80, 478),
('1004', 2.8, 1024, 250, 649),
('1005', 3.2, 512, 250, 630),
('1006', 3.2, 1024, 320, 1049),
('1007', 2.2, 1024, 200, 510),
('1008', 2.2, 2048, 250, 770),
('1009', 2, 1024, 250, 650),
('1010', 2.8, 2048, 300, 770),
('1011', 1.86, 2048, 160, 959),
('1012', 2.8, 1024, 160, 649),
('1013', 3.06, 512, 80, 529);

-- --------------------------------------------------------

--
-- Table structure for table 'printers'
--

CREATE TABLE IF NOT EXISTS printers (
  model char(4) NOT NULL DEFAULT '',
  color varchar(5) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  price double DEFAULT NULL,
  PRIMARY KEY (model)
);

--
-- Dumping data for table 'printers'
--

INSERT INTO printers (model, color, `type`, price) VALUES
('3001', 'TRUE', 'ink-jet', 99),
('3002', 'FALSE', 'laser', 239),
('3003', 'TRUE', 'laser', 899),
('3004', 'TRUE', 'ink-jet', 120),
('3005', 'FALSE', 'laser', 120),
('3006', 'TRUE', 'ink-jet', 100),
('3007', 'TRUE', 'laser', 200);

-- --------------------------------------------------------

--
-- Table structure for table 'products'
--

CREATE TABLE IF NOT EXISTS products (
  maker char(1) DEFAULT NULL,
  model char(4) NOT NULL DEFAULT '',
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (model)
);

--
-- Dumping data for table 'products'
--

INSERT INTO products (maker, model, `type`) VALUES
('A', '1001', 'pc'),
('A', '1002', 'pc'),
('A', '1003', 'pc'),
('B', '1004', 'pc'),
('B', '1005', 'pc'),
('B', '1006', 'pc'),
('C', '1007', 'pc'),
('D', '1008', 'pc'),
('D', '1009', 'pc'),
('D', '1010', 'pc'),
('E', '1011', 'pc'),
('E', '1012', 'pc'),
('E', '1013', 'pc'),
('E', '2001', 'laptop'),
('E', '2002', 'laptop'),
('E', '2003', 'laptop'),
('A', '2004', 'laptop'),
('A', '2005', 'laptop'),
('A', '2006', 'laptop'),
('B', '2007', 'laptop'),
('F', '2008', 'laptop'),
('F', '2009', 'laptop'),
('G', '2010', 'laptop'),
('E', '3001', 'printer'),
('E', '3002', 'printer'),
('E', '3003', 'printer'),
('D', '3004', 'printer'),
('D', '3005', 'printer'),
('H', '3006', 'printer'),
('H', '3007', 'printer');

-- --------------------------------------------------------

--
-- Table structure for table 'sales'
--

CREATE TABLE IF NOT EXISTS sales (
  customer_id char(10) NOT NULL DEFAULT '',
  model char(4) NOT NULL DEFAULT '',
  quantity int(11) DEFAULT NULL,
  `day` date NOT NULL DEFAULT '0000-00-00',
  paid double DEFAULT NULL,
  type_of_payment varchar(32) DEFAULT NULL,
  PRIMARY KEY (customer_id,model,`day`)
);

--
-- Dumping data for table 'sales'
--

INSERT INTO sales (customer_id, model, quantity, `day`, paid, type_of_payment) VALUES
('NL11223344', '2010', 1, '2023-03-19', 2300, 'mastercard credit'),
('NL11223344', '3001', 1, '2023-03-18', 99, 'cash'),
('NL22334455', '2002', 2, '2023-03-19', 1898, 'visa credit'),
('NL22334455', '3002', 1, '2023-03-18', 239, 'cash'),
('NL33445566', '1001', 1, '2023-03-20', 1902.6, 'mastercard credit'),
('NL44556677', '1007', 1, '2023-03-17', 510, 'visa debit'),
('NL44556677', '1007', 3, '2023-03-19', 1530, 'visa debit'),
('NL44556677', '2002', 1, '2023-03-17', 949, 'visa debit'),
('NL55667788', '1007', 1, '2023-03-20', 459, 'visa credit'),
('NL55667788', '3007', 2, '2023-03-20', 360, 'visa credit');
