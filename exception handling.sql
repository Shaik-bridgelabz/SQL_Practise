#Syntax

DECLARE action HANDLER FOR condition_value statement;

/* action can be CONTINUE / EXIT

Examples */
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
SET hasError = 1;

DECLARE CONTINUE HANDLER FOR NOT FOUND 
SET RowNotFound = 1;

DECLARE CONTINUE HANDLER FOR 1062
SELECT 'Error, duplicate key occurred';

CREATE TABLE SupplierProducts (
    supplierId INT,
    productId INT,
    PRIMARY KEY (supplierId , productId)
);
Drop procedure InsertSupplierProduct;

DELIMITER $$

CREATE procedure InsertSupplierProduct(
    IN inSupplierId INT, 
    IN inProductId INT
)
BEGIN
    DECLARE EXIT HANDLER FOR 1062
    BEGIN
 	SELECT CONCAT('Duplicate key (',inSupplierId,',',inProductId,') occurred') AS message;
    END;

    INSERT INTO SupplierProducts(supplierId,productId)
    VALUES(inSupplierId,inProductId);

    SELECT COUNT(*) 
    FROM SupplierProducts
    WHERE supplierId = inSupplierId;
    
END$$

DELIMITER ;

CALL InsertSupplierProduct(1,1);
CALL InsertSupplierProduct(1,2);
CALL InsertSupplierProduct(1,3);
CALL InsertSupplierProduct(1,3);

DELIMITER $$

CREATE PROCEDURE InsertSupplierProduct1(
    IN inSupplierId INT, 
    IN inProductId INT
)
BEGIN
    -- exit if the duplicate key occurs
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
	SELECT CONCAT('Duplicate key (',inSupplierId,',',inProductId,') occurred') AS message;
    END;
    
    -- insert a new row into the SupplierProducts
    INSERT INTO SupplierProducts(supplierId,productId)
    VALUES(inSupplierId,inProductId);
    
    -- return the products supplied by the supplier id
    SELECT COUNT(*) 
    FROM SupplierProducts
    WHERE supplierId = inSupplierId;
    
END$$

DELIMITER ;

CALL InsertSupplierProduct1(1,3);