-- Which brand saw the most dollars spent in the month of June?
SELECT brand_code, MAX(total_paid)
FROM (SELECT Brand.brand_code, SUM(Item.price * ReceiptItem.quantity) as total_paid
        FROM Brand
        INNER JOIN Item 
            ON Item.brand_code=Brand.brand_code
        INNER JOIN ReceiptItem 
            ON ReceiptItem.item_id=Item.id
        INNER JOIN Receipt
            ON ReceiptItem.receipt_id=Receipt.id
        WHERE Receipt.month=6);


-- Which user spent the most money in the month of August?
SELECT user_id, MAX(total_paid)
FROM (SELECT Users.id as user_id, SUM(Item.price * ReceiptItem.quantity) as total_paid
        FROM Users
        INNER JOIN Receipt
            ON Users.id=Receipt.user_id
        INNER JOIN ReceiptItem 
            ON ReceiptItem.receipt_id=Receipt.id
        INNER JOIN Item 
            ON Item.id=ReceiptItem.item_id
        WHERE Receipt.month=8);

-- What user bought the most expensive item?
SELECT Users.id, MAX(Item.price)
    FROM Users
    INNER JOIN Receipt 
        ON Users.id=Receipt.user_id
    INNER JOIN ReceiptItem 
        ON ReceiptItem.receipt_id=Receipt.id
    INNER JOIN Item 
        ON Item.id=ReceiptItem.item_id;


-- What is the name of the most expensive item purchased?
SELECT Item.name, MAX(Item.price)
    FROM Item
    INNER JOIN ReceiptItem ON ReceiptItem.item_id=Item.id;

-- How many users scanned in each month?
SELECT COUNT(*)
FROM Users
INNER JOIN Receipt
    ON Users.id=Receipt.user_id;
