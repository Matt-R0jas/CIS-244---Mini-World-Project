
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `customer` WRITE;
INSERT INTO `customer` VALUES (1,'Jane','Smith','jane.smith@gmail.com','876-435-7289'),(2,'Bobby','Brown','bobby.brown@gmail.com','555-342-4321'),(3,'Claire','Redfield','claire.redfield@yahoo.com','647-942-6354'),(4,'David','Lee','david.lee@yahoo.com','347-543-1234'),(5,'Carla','Davis','carla.davis@gmail.com','555-444-6789');
UNLOCK TABLES;

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `ProductID` int NOT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `StockQuantity` int DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `product` WRITE;
INSERT INTO `product` VALUES (1,'Acrylic Paint','Paint',4.99,50),(2,'Hot Glue Gun','Tools',14.99,15),(3,'Paint Brush Set','Tools',9.99,40),(4,'Canvas Board','Canvas',7.5,25),(5,'Colored Beads','Accessories',3.75,100),(6,'Sketch Pad','Paper Goods',5.25,30),(7,'Yarn Bundle','Textiles',6.75,20);
UNLOCK TABLES;

DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale` (
  `SaleID` int NOT NULL,
  `SaleDate` datetime DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  PRIMARY KEY (`SaleID`),
  KEY `fk_sale_customer` (`CustomerID`),
  CONSTRAINT `fk_sale_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `sale` WRITE;
INSERT INTO `sale` VALUES (1,'2024-05-07 00:00:00',1),(2,'2024-05-07 00:00:00',2),(3,'1998-03-24 00:00:00',3),(4,'2020-01-15 00:00:00',4),(5,'2017-02-14 00:00:00',5);
UNLOCK TABLES;

DROP TABLE IF EXISTS `saledetail`;
CREATE TABLE `saledetail` (
  `SaleDetailID` int DEFAULT NULL,
  `SaleID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `saledetail` WRITE;
INSERT INTO `saledetail` VALUES (1,1,1,2,4.99),(2,2,3,3,9.99),(3,3,4,2,7.5),(4,3,2,1,14.99),(5,3,5,3,3.75),(6,4,6,3,5.25),(7,5,7,2,6.75),(8,5,3,1,9.99);
UNLOCK TABLES;
