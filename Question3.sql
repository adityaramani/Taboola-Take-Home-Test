CREATE TABLE Product (
    ProductNumber INT      NOT NULL,
    NAME      VARCHAR(30) NOT NULL,
    Category VARCHAR(30) NOT NULL,

    CONSTRAINT Product_PK PRIMARY KEY (ProductNumber)
);



CREATE TABLE Price (
    ProductNumber INT  NOT NULL,
    StartDate     DATE NOT NULL,
    EndDate       DATE,
    Amount        INT  NOT NULL,
    --
    CONSTRAINT Price_PK            PRIMARY KEY (ProductNumber, StartDate),
    CONSTRAINT Price_to_Product_FK FOREIGN KEY (ProductNumber)
    REFERENCES Product (ProductNumber),
    CONSTRAINT DatesOrder_CK       CHECK       (EndDate >= StartDate)
);



INSERT INTO Product
    (ProductNumber, NAME,Category)
VALUES
    (1750, 'iPhone', 'Phone'),
    (100, 'MacBook', 'Laptop'), 
    (200, 'Echo', 'Speaker'); 
    

INSERT INTO Price
    (ProductNumber, StartDate, EndDate,Amount)
VALUES
    (1750, '20170601','20170603' ,1000),
    (1750, '20170603','20170605' ,3000),   
    (1750, '20170605','20170607' ,4000),
    (1750, '20170607',NULL ,3000),
    
    (100, '20180601','20180703' ,12),
    (100, '20180703','20181020' ,4343),   
    (100, '20181020','20181225' ,555),
    (100, '20181225', NULL,20),

    (200, '20190601','20190703' ,1000),
    (200, '20190703','20191020' ,3000),   
    (200, '20191020','20191225' ,4000),
    (200, '20191225', NULL,3000);


Select * from Price;

Select * from Product;



SELECT  PR.ProductNumber, P.Name, P.Category, PR.StartDate, 
    CASE
        When EndDate is NULL THEN 'Current'
        else EndDate
     END as EndDate
,PR.Amount
FROM Price PR
JOIN Product P USING (ProductNumber)
ORDER BY PR.ProductNumber, PR.StartDate DESC;