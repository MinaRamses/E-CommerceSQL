--Tables

CREATE TABLE Users(
username VARCHAR(20),
first_name VARCHAR(20),
last_name VARCHAR(20),
password VARCHAR(20),
email VARCHAR(50),
PRIMARY KEY(username));

select * from User_mobile_numbers

CREATE TABLE User_mobile_numbers(
mobile_number VARCHAR(20),
username VARCHAR(20),
PRIMARY KEY(mobile_number,username),
FOREIGN KEY (username) references Users ON UPDATE CASCADE);

CREATE TABLE User_Addresses(
address VARCHAR(100),
username VARCHAR(20),
PRIMARY KEY(address,username),
FOREIGN KEY (username) references Users ON UPDATE CASCADE);

CREATE TABLE Customer(
username VARCHAR(20),
points INT DEFAULT 0,
PRIMARY KEY(username),
FOREIGN KEY(username) references Users ON UPDATE CASCADE);

CREATE TABLE Admins(
username VARCHAR (20),
PRIMARY KEY(username),
FOREIGN KEY(username) references Users ON UPDATE CASCADE);

CREATE TABLE Vendor(
username VARCHAR(20),
activated BIT DEFAULT 0,
company_name VARCHAR(20),
bank_acc_no VARCHAR(20),
admin_username VARCHAR(20),
PRIMARY KEY(username),
FOREIGN KEY(username) references Users,
FOREIGN KEY(admin_username) references Admins);

CREATE TABLE Delivery_Person(
username VARCHAR (20),
is_activated BIT DEFAULT 0,
PRIMARY KEY(username),
FOREIGN KEY(username) references Users ON UPDATE CASCADE);

CREATE TABLE Credit_Card(
number VARCHAR(20),
expiry_date datetime,
cvv_code INT,
PRIMARY KEY(number));

CREATE TABLE Delivery(
id INT PRIMARY KEY IDENTITY,
type VARCHAR(20),
time_duration VARCHAR(20),
fees DECIMAL(10,2),
username VARCHAR(20)
FOREIGN KEY(username) references Admins ON UPDATE CASCADE);

CREATE TABLE Orders(
order_no INT PRIMARY KEY IDENTITY,
order_date datetime,
total_amount DECIMAL(10,2),
cash_amount DECIMAL(10,2),
credit_amount DECIMAL(10,2),
payment_type VARCHAR(20),
order_status VARCHAR(20),
remaining_days INT,
time_limit INT,
gift_card_code_used VARCHAR(10),
customer_name VARCHAR(20),
delivery_id INT,
creditCard_number VARCHAR(20),
FOREIGN KEY(customer_name) references Customer,
FOREIGN KEY(delivery_id) references Delivery,
FOREIGN KEY(creditCard_number) references Credit_Card,
FOREIGN KEY(gift_card_code_used) references Giftcard);

CREATE TABLE Product(
serial_no INT PRIMARY KEY IDENTITY,
product_name VARCHAR(20),
category VARCHAR(20),
product_description TEXT,
price DECIMAL (10,2),
final_price DECIMAL(10,2),
color VARCHAR(20),
available VARCHAR(20),
rate INT,
vendor_username VARCHAR(20),
customer_username VARCHAR(20),
customer_order_id INT,
FOREIGN KEY(vendor_username) references Vendor ON UPDATE CASCADE,
FOREIGN KEY(customer_order_id) references Orders ON UPDATE CASCADE,
FOREIGN KEY(customer_username) references Customer ON UPDATE CASCADE);

CREATE TABLE CustomerAddstoCartProduct(
serial_no INT,
customer_name VARCHAR(20),
PRIMARY KEY(serial_no,customer_name),
FOREIGN KEY(serial_no) references Product,
FOREIGN KEY(serial_no) references Product,
FOREIGN KEY(customer_name) references Customer,
FOREIGN KEY(customer_name) references Customer);

CREATE TABLE Todays_Deals(
deal_id INT PRIMARY KEY IDENTITY,
deal_amount INT,
expiry_date datetime,
admin_username VARCHAR(20),
FOREIGN KEY(admin_username) references Admins ON UPDATE CASCADE);

CREATE TABLE Todays_Deals_Product(
deal_id INT,
serial_no INT,
PRIMARY KEY(deal_id,serial_no),
FOREIGN KEY(deal_id) references Todays_Deals,
FOREIGN KEY(serial_no) references Product);

CREATE TABLE Offer(
offer_id int PRIMARY KEY IDENTITY,
offer_amount INT,
expiry_date datetime);

CREATE TABLE offersOnProduct(
offer_id INT,
serial_no INT,
PRIMARY KEY(offer_id,serial_no),
FOREIGN KEY(offer_id) references Offer ON UPDATE CASCADE,
FOREIGN KEY(serial_no) references Product ON UPDATE CASCADE);

CREATE TABLE Customer_Question_Product(
serial_no INT,
customer_name VARCHAR(20),
question VARCHAR(50),
answer TEXT,
PRIMARY KEY(serial_no,customer_name),
FOREIGN KEY(serial_no) references Product,
FOREIGN KEY(customer_name) references Customer);

CREATE TABLE Wishlist(
username VARCHAR(20),
name VARCHAR(20),
PRIMARY KEY(username,name),
FOREIGN KEY(username) references Customer ON UPDATE CASCADE);

CREATE TABLE Giftcard(
code VARCHAR(10),
expiry_date datetime,
amount INT,
username VARCHAR(20),
PRIMARY KEY(code),
FOREIGN KEY(username) references Admins ON UPDATE CASCADE);

CREATE TABLE Wishlist_Product(
username VARCHAR(20),
wish_name VARCHAR(20),
serial_no INT,
PRIMARY KEY(username,wish_name,serial_no),
FOREIGN KEY(username,wish_name) references Wishlist,
FOREIGN KEY(serial_no) references Product);

CREATE TABLE Admin_Customer_Giftcard(
code VARCHAR(10),
customer_name VARCHAR(20),
admin_username VARCHAR(20),
remaining_points INT,
PRIMARY KEY(code,customer_name,admin_username),
FOREIGN KEY(code) references Giftcard,
FOREIGN KEY(customer_name) references Customer,
FOREIGN KEY(admin_username) references Admins);

CREATE TABLE Admin_Delivery_Order(
delivery_username VARCHAR(20),
order_no INT,
admin_username VARCHAR(20),
delivery_window VARCHAR(50),
PRIMARY KEY(delivery_username,order_no),
FOREIGN KEY(admin_username) references Admins,
FOREIGN KEY(delivery_username) references Delivery_Person,
FOREIGN KEY(order_no) references Orders);

CREATE TABLE Customer_CreditCard(
customer_name VARCHAR(20),
cc_number VARCHAR(20),
PRIMARY KEY(customer_name,cc_number),
FOREIGN KEY(customer_name) references Customer ON UPDATE CASCADE,
FOREIGN KEY(cc_number) references Credit_Card ON UPDATE CASCADE);


select * from Users

--Procedures:

CREATE PROC customerRegister
@username VARCHAR(20),
@first_name VARCHAR(20),
@last_name VARCHAR(20),
@password VARCHAR(20),
@email VARCHAR(50)
AS
INSERT INTO Users(username,first_name,last_name,password,email)
VALUES (@username,@first_name,@last_name,@password,@email)
INSERT INTO Customer(username)
VALUES(@username);

select * from Vendor

CREATE PROC vendorRegister
@username VARCHAR(20),
@first_name VARCHAR(20),
@last_name VARCHAR(20),
@password VARCHAR(20),
@email VARCHAR(50),
@company_name VARCHAR(20),
@bank_acc_no VARCHAR(20)
AS
INSERT INTO Users(username,first_name,last_name,password,email)
VALUES (@username,@first_name,@last_name,@password,@email)
INSERT INTO Vendor(username,company_name,bank_acc_no)
VALUES(@username,@company_name,@bank_acc_no);


CREATE PROC userLogin
@username VARCHAR(20),
@password VARCHAR(20),
@success int output,
@type int output
AS

IF @username = ANY 
(SELECT u.username FROM Users u WHERE u.username = @username AND u.password = @password) 
SET @success = 1
ELSE
SET @success = 0


IF EXISTS (SELECT username FROM Customer WHERE username = @username AND @success = 1)
SET @type = 0
ELSE IF EXISTS (SELECT username FROM Vendor WHERE username = @username AND @success = 1)
SET @type = 1
ELSE IF EXISTS (SELECT username FROM Admins WHERE username = @username AND @success = 1)
SET @type = 2
ELSE IF EXISTS (SELECT username FROM Delivery_Person WHERE username = @username AND @success = 1)
SET @type = 3

DECLARE @success int
DECLARE @type int

EXEC userLogin 'ahmed.ashraf', 'pass123',@success output,@type output
print @success
print @Type
Select * from Users
Select * from Admins



CREATE PROC addMobile
@username VARCHAR(20),
@mobile_number VARCHAR(20)
AS
INSERT INTO User_mobile_numbers(mobile_number,username)
VALUES(@mobile_number,@username);


CREATE PROC addAddress
@username VARCHAR(20),
@address VARCHAR(100)
AS
INSERT INTO User_Addresses(address,username)
VALUES(@address,@username);


CREATE PROC showProducts 
AS
SELECT * FROM Product;


CREATE PROC ShowProductsByPrice 
AS
SELECT * FROM Product
ORDER BY final_price ASC;


CREATE PROC searchbyname
@text VARCHAR(20)
AS
SELECT * 
FROM Product
WHERE product_name = @text;


CREATE PROC AddQuestion 
@serial INT,
@Customer VARCHAR(20),
@Question VARCHAR(50)
AS 
INSERT INTO Customer_Question_Product(serial_no,customer_name,question)
VALUES (@serial,@Customer,@Question);

CREATE PROC addToCart 
@customername VARCHAR(20),
@serial INT
AS 
INSERT INTO CustomerAddstoCartProduct(serial_no,customer_name)
VALUES (@serial,@customername);

select*from Users


CREATE PROC removefromCart 
@customername VARCHAR(20),
@serial INT
AS 
DELETE FROM CustomerAddstoCartProduct 
WHERE serial_no = @serial AND customer_name = @customername;



CREATE PROC createWishlist 
@customername VARCHAR(20),
@wishlistname VARCHAR(20)
AS 
INSERT INTO Wishlist(username,name)
VALUES (@customername,@wishlistname);


select * from Wishlist_Product


CREATE PROC AddtoWishlist
@customername VARCHAR(20),
@wishlistname VARCHAR(20),
@serial INT 
AS 
INSERT INTO Wishlist_Product(username,wish_name,serial_no)
VALUES (@customername,@wishlistname,@serial);
SELECT * FROM Wishlist_Product


CREATE PROC removefromWishlist
@customername VARCHAR(20),
@wishlistname VARCHAR(20),
@serial INT 
AS 
DELETE FROM Wishlist_Product
WHERE username = @customername  AND wish_name = @wishlistname AND serial_no = @serial ;


Select * FROM Credit_Card


CREATE PROC showWishlistProduct
@customername VARCHAR(20),
@name VARCHAR(20)
AS
SELECT P.*
FROM  Product P Inner Join Wishlist_Product W ON P.serial_no = W.serial_no
WHERE W.wish_name = @name;


CREATE PROC viewMyCart
@customername VARCHAR (20)
AS
SELECT P.*
FROM Product P INNER JOIN CustomerAddstoCartProduct CP ON P.serial_no = CP.serial_no
WHERE CP.customer_name = @customername;



CREATE PROC calculatepriceOrder
@customername VARCHAR(20)
AS 
SELECT SUM(P.price)
FROM Product P INNER JOIN CustomerAddstoCartProduct CP ON P.serial_no =  CP.serial_no
WHERE CP.customer_name = @customername;


CREATE PROC productsinorder 
@customername VARCHAR(20),
@orderID INT
AS
UPDATE Product
SET customer_username = @customername
WHERE serial_no = ANY (SELECT serial_no FROM CustomerAddstoCartProduct WHERE customer_name = @customername);
UPDATE Product
SET customer_order_id = @orderID
WHERE customer_username = ANY (SELECT customer_name FROM Orders WHERE customer_name = @customername);
SELECT * FROM Product WHERE customer_username = @customername;



CREATE PROC emptyCart
@customername VARCHAR(20)
AS
DELETE FROM CustomerAddstoCartProduct
WHERE customer_name = @customername;


CREATE PROC makeOrder 
@customername VARCHAR(20)
AS
INSERT INTO Orders(customer_name,order_status)
VALUES (@customername,'not processed');
UPDATE Orders
SET total_amount = (SELECT SUM(P.price)
FROM Product P INNER JOIN CustomerAddstoCartProduct CP ON P.serial_no =  CP.serial_no
WHERE CP.customer_name = @customername)
WHERE customer_name = @customername;


CREATE PROC cancelOrder
@orderid INT
AS
IF GETDATE() < (SELECT expiry_date FROM Giftcard WHERE code = (SELECT gift_card_code_used FROM Orders WHERE order_no = @orderid AND (payment_type = 'points' OR payment_type = 'credit card')))
UPDATE Admin_Customer_Giftcard
SET remaining_points = remaining_points + (SELECT amount FROM Giftcard WHERE code = (SELECT gift_card_code_used FROM Orders WHERE order_no = @orderid))

DELETE FROM Orders
WHERE order_no = @orderid AND (order_status  = 'not processed' OR  order_status  = 'in process')


CREATE PROC recommmend
@customername VARCHAR(20)
AS  
SELECT top (3) with WP.username , WP.serial_no,
COUNT FROM Wishlist_Product WP
ORDER by COUNT DESC, (
SELECT top (3) P1.category,
COUNT from Product P1
ORDER by count desc, P1.category);

EXEC recommmend 'ahmed.hassan';

CREATE PROC returnProduct 
@serialno INT,
@orderid INT
AS
DELETE FROM Orders
WHERE order_no = @orderid AND order_status = 
ANY( SELECT order_status
FROM Orders
WHERE order_status = 'Delivered' AND order_no = @orderid);
INSERT INTO Product(serial_no)
VALUES (@serialno);

CREATE PROC ShowproductsIbought
@customername VARCHAR(20)
AS
SELECT * 
FROM Product
WHERE customer_username = @customername;

CREATE PROC rate
@serial_no INT,
@rate INT,
@customername VARCHAR(20)
AS 
UPDATE Product
SET rate = @rate
WHERE customer_username = @customername AND serial_no = @serial_no;


CREATE PROC SpecifyAmount
@customername VARCHAR(20),
@orderID INT,
@cash decimal(10,2),
@credit decimal(10,2)
AS
UPDATE Orders
SET cash_amount = @cash,
credit_amount = @credit
WHERE order_no = @orderID;
UPDATE Customer
SET points = (SELECT total_amount FROM Orders WHERE customer_name = @customername) - @cash - @credit 
WHERE username = @customername;

EXEC SpecifyAmount 'youssefboy',6,0,40
SELECT * FROM Customer
Select * from Orders
Update Orders set creditCard_number = '123456123456' where customer_name = 'youssefboy'
Select * from Customer_CreditCard


CREATE PROC  AddCreditCard
@creditcardnumber VARCHAR(20),
@expirydate date,
@cvv VARCHAR(4),
@customername VARCHAR(20)
AS
INSERT INTO Credit_Card(number,expiry_date,cvv_code)
VALUES (@creditcardnumber,@expirydate,@cvv)

INSERT INTO Customer_CreditCard (customer_name,cc_number)
VALUES (@customername,@creditcardnumber);


CREATE PROC ChooseCreditCard
@creditcard VARCHAR(20), 
@orderid INT
AS
UPDATE Orders
SET creditCard_number = @creditcard
WHERE order_no = @orderid;

CREATE PROC viewDeliveryTypes
AS 
SELECT  type
FROM  Delivery;

--Questionable
CREATE PROC specifydeliverytype
@orderID INT,
@deliveryID INT
AS
UPDATE  Orders
SET remaining_days =
(SELECT time_duration
FROM Delivery
WHERE id = @deliveryID)
WHERE order_no = @orderID;
UPDATE Orders
SET delivery_id = (SELECT delivery_id
FROM Delivery
WHERE id = @deliveryID)
WHERE order_no = @orderID;


CREATE PROC trackRemainingDays
@orderid INT, 
@customername VARCHAR(20)
AS
UPDATE Orders
SET remaining_days = (time_limit + DAY(order_date))-DAY(GETDATE())
SELECT remaining_days FROM Orders;



select * from Vendor
update Vendor
SET activated ='0' where username = 'vendor1'




update Product 
set final_price = 15.00 where product_name = 'Bag'

CREATE PROC postProduct
@vendorUsername VARCHAR(20),
@product_name VARCHAR(20),
@category VARCHAR(20),
@product_description TEXT, 
@price DECIMAL(10,2),
@color VARCHAR(20)
AS
INSERT INTO Product(vendor_username,product_name,category,product_description,price,color,final_price)
VALUES(@vendorUsername,@product_name,@category,@product_description,@price,@color,@price);



SELECT * FROM Users;

CREATE PROC vendorviewProducts
@vendorname VARCHAR(20)
AS
SELECT * 
FROM Product
WHERE vendor_username = @vendorname;


CREATE PROC EditProduct
@vendorname VARCHAR(20),
@serialnumber INT,
@product_name VARCHAR(20),
@category VARCHAR(20),
@product_description TEXT,
@price DECIMAL(10,2),
@color VARCHAR(20)
AS
UPDATE Product
SET vendor_username = @vendorname,
product_name = @product_name,
category = @category,
product_description = @product_description,
price = @price,
color = @color
WHERE serial_no = @serialnumber;


CREATE PROC deleteProduct
@vendorname VARCHAR(20),
@serialnumber INT
AS
DELETE FROM Product
WHERE serial_no = @serialnumber AND vendor_username = @vendorname;


CREATE PROC viewQuestions
@vendorname VARCHAR(20)
AS
SELECT CQ.*
FROM Customer_Question_Product CQ
INNER JOIN Product P ON CQ.serial_no = P.serial_no;

EXEC viewQuestions 'eslam.mahmod';

CREATE PROC answerQuestions
@vendorname VARCHAR(20),
@serialno INT,
@customername VARCHAR(20),
@answer TEXT
AS
UPDATE Customer_Question_Product
SET answer = @answer
WHERE serial_no = @serialno AND customer_name = @customername;



CREATE PROC addOﬀer
@offeramount INT,
@expiry_date DATETIME
AS
INSERT INTO Offer(offer_amount,expiry_date)
VALUES(@offeramount,@expiry_date);

SELECT * from Offer

Insert into Offer(offer_amount,expiry_date)
Values (100,2020-01-02)

CREATE PROC checkOfferonProduct
@serial INT
AS
DECLARE @activeoffer BIT
IF EXISTS (SELECT o1.serial_no , o2.expiry_date FROM offersOnProduct o1 , Offer o2 WHERE o1.serial_no = @serial
AND o2.expiry_date < GETDATE())
SET @activeoffer = 1
ELSE
SET @activeoffer = 0
Print @activeoffer;


CREATE PROC applyOffer
@vendorname VARCHAR(20), 
@oﬀerid INT,
@serial INT
AS
INSERT INTO offersOnProduct (offer_id,serial_no)
VALUES (@offerid,@serial);
UPDATE Product
SET final_price = final_price - (SELECT offer_amount FROM Offer WHERE offer_id = @oﬀerid AND NOT expiry_date = GETDATE())
WHERE serial_no = @serial;

 
CREATE PROC checkandremoveExpiredoﬀer
@offerid INT
AS
DELETE FROM Offer 
WHERE @offerid = offer_id AND  expiry_date > GETDATE();

Select * from Users

CREATE PROC activateVendors 
@admin_username varchar(20),
@vendor_username varchar(20)
AS
UPDATE Vendor
SET activated = 1,
admin_username = @admin_username
WHERE username = @vendor_username;

exec activateVendors 'hana.aly', 'eslam.mahmod'


CREATE PROC reviewOrders 
AS
SELECT * FROM Orders;


CREATE PROC updateOrderStatusInProcess
@order_no INT
AS
UPDATE Orders
SET order_status = 'in process'
WHERE order_no = @order_no;


CREATE PROC inviteDeliveryPerson
@delivery_username VARCHAR(20),
@delivery_email VARCHAR(50)
AS
INSERT INTO Users(username,email)
VALUES (@delivery_username,@delivery_email)
INSERT INTO Delivery_Person(username,is_activated)
VALUES(@delivery_username,DEFAULT);




CREATE PROC acceptAdminInvitation 
@delivery_username VARCHAR(20)
AS
UPDATE Delivery_Person
SET is_activated = 1
WHERE username = @delivery_username;



CREATE PROC deliveryPersonUpdateInfo 
@username VARCHAR(20),
@ﬁrst_name VARCHAR(20),
@last_name VARCHAR(20),
@password VARCHAR(20),
@email VARCHAR(50)
AS
UPDATE Users
SET first_name = @first_name,
last_name = @last_name,
password = @password,
email = @email
WHERE username = @username;



CREATE PROC viewmyorders
@deliveryperson VARCHAR(20),
@order_no INT
AS
SELECT O.*
FROM Orders O
INNER JOIN Admin_Delivery_Order AD ON AD.order_no = O.order_no
INNER JOIN Delivery_Person DP ON DP.username = AD.delivery_username
WHERE AD.delivery_username = @deliveryperson AND AD.order_no = @order_no;



CREATE PROC specifyDeliveryWindow
@delivery_username VARCHAR(20),
@order_no INT,
@delivery_window VARCHAR(50)
AS
UPDATE Admin_Delivery_Order
SET delivery_window = @delivery_window
WHERE delivery_username = @delivery_username
AND order_no = @order_no;



CREATE PROC updateOrderStatusOutforDelivery
@order_no INT
AS
UPDATE Orders
SET order_status = 'Out For Delivery'
WHERE order_no = @order_no
AND remaining_days < time_limit
AND remaining_days <> 0;

SELECT * from Orders
UPDATE Orders
SET order_status = 'in process'

CREATE PROC updateOrderStatusDelivered
@order_no INT
AS
UPDATE Orders
SET order_status = 'Delivered'
WHERE order_no = @order_no
AND remaining_days >= 0;

EXEC updateOrderStatusDelivered 1


CREATE PROC addDelivery
@delivery_type varchar(20),
@time_duration int,
@fees decimal(5,3),
@admin_username varchar(20) 
AS
INSERT INTO Delivery(type,time_duration,fees,username)
VALUES (@delivery_type,@time_duration,@fees,@admin_username);



CREATE PROC assignOrdertoDelivery
 @delivery_username varchar(20),
 @order_no int,
 @admin_username varchar(20)
 AS
 INSERT INTO Admin_Delivery_Order(delivery_username,order_no,admin_username)
 VALUES (@delivery_username,@order_no,@admin_username);



 
 CREATE PROC createTodaysDeal 
 @deal_amount int,
 @admin_username varchar(20),
 @expiry_date datetime
 AS
 INSERT INTO Todays_Deals (deal_amount,admin_username,expiry_date)
 VALUES (@deal_amount, @admin_username,@expiry_date);

 



 CREATE PROC checkTodaysDealOnProduct 
 @serial_no INT
 AS 
 DECLARE @activeDeal BIT 
IF @serial_no = ANY(SELECT serial_no FROM Todays_Deals_Product WHERE serial_no = @serial_no)
 SET     @activeDeal = 0
 ELSE  SET @activeDeal = 1
 PRINT @activeDeal;


 CREATE PROC addTodaysDealOnProduct
 @deal_id int, 
 @serial_no int
 AS 
 INSERT INTO  Todays_Deals_Product(deal_id ,serial_no)
 VALUES (@deal_id,@serial_no);

 EXEC addTodaysDealOnProduct 30,3



 CREATE PROC  removeExpiredDeal
@deal_iD INT
AS
IF  GETDATE() > ANY(SELECT expiry_date FROM Todays_Deals WHERE deal_id = @deal_iD)
 DELETE FROM Todays_Deals WHERE deal_id = @deal_iD;



 CREATE PROC  createGiftCard 
 @code varchar(10),
 @expiry_date datetime,
 @amount int,
 @admin_username varchar(20)
 AS
 INSERT INTO Giftcard (code,expiry_date,amount,username)
 VALUES ( @code,@expiry_date,@amount,@admin_username);

 

 CREATE PROC removeExpiredGiftCard
 @code varchar(10)
 AS 
 IF  (GETDATE()) > (SELECT expiry_date FROM Giftcard WHERE code = @code)  
 DELETE FROM Giftcard WHERE code =@code;


 CREATE PROC checkGiftCardOnCustomer
 @code VARCHAR(10)
 AS 
 DECLARE  @activeGiftCard BIT
 IF @code = ANY(SELECT code FROM Giftcard WHERE code = @code)
 SET @activeGiftCard = 1
 else SET @activeGiftCard = 0
 Print @activeGiftCard;



 CREATE PROC  giveGiftCardtoCustomer
 @code VARCHAR(10),
 @customer_name VARCHAR(20),
 @admin_username VARCHAR(20)
 AS 
 INSERT INTO  Admin_Customer_Giftcard(code,customer_name,admin_username)
 VALUES (@code,@customer_name,@admin_username);
 UPDATE Customer
 SET points = points + (SELECT remaining_points FROM Admin_Customer_Giftcard WHERE code = @code 
 AND customer_name = @customer_name);

 SELECT * FROM Customer

 --Insertions

 --Set identity_insert Product on;
--INSERT INTO Product (serial_no,product_name,category,product_description,price,final_price,color,available,rate,vendor_username,customer_username,customer_order_id)
--VALUES
--(1,'Bag','Fashion','backbag',100,100,'yellow','1',0,'hadeel.adel',NULL,NULL),
--(3,'Blue pen','stationary','useful pen',10,10,'Blue','1',0,'hadeel.adel',NULL,NULL),
--(4,'Blue pen','stationary','useful pen',10,10,'Blue','0',0,'hadeel.adel',NULL,NULL);
--Set identity_insert Product off;


--Insert into Vendor (username,activated,company_name,bank_acc_no,admin_username)
--Values ('hadeel.adel','1','Dello','47449349234','hana.aly');

--Insert into Admins(username)
--Values ('hana.aly'),('nada.sharaf');

--Insert into Users(username,first_name,last_name,password,email)
--Values ('hana.aly','hana','aly','pass1','hana.aly@guc.edu.eg'),
--('ammar.yasser','ammar','yasser','pass4','ammar.yasser@guc.edu.eg'),
--('nada.sharaf','nada','sharaf','pass7','nada.sharaf@guc.edu.eg'),
--('hadeel.adel','hadeel','adel','pass13','hadeel.adel@guc.edu.eg'),
--('mohamed.tamer','mohamed','tamer','pass16','mohamed.tamer@guc.edu.eg');

--insert into Customer (username,points)
--Values('ammar.yasser',15);

--insert into CustomerAddstoCartProduct (serial_no,customer_name)
--Values(1,'ammar.yasser');

--insert into Delivery_Person (is_activated,username)
--values(1,'mohamed.tamer');

--insert into User_Addresses (address,username)
--values('New Cairo','hana.aly'),
--('Heliopolis','hana.aly');

--insert into User_mobile_numbers(mobile_number,username)
--Values('01111111111','hana.aly'),
--('1211555411','hana.aly');

--insert into Credit_Card(number,expiry_date,cvv_code)
--Values('4444-5555-6666-8888','2028-10-19',232);

--insert into Delivery(type,time_duration,fees)
--Values('pick-up',7,10),
--('regular',14,30),
--('speedy',1,50);

--insert into Todays_Deals(deal_amount,admin_username,expiry_date)
--Values (30,'hana.aly',30-11-2019),
--(40,'hana.aly',18-11-2019),
--(50,'hana.aly',12-12-2019);


--Set identity_insert Offer on;
--insert into Offer (offer_id,offer_amount,expiry_date)
--values(1,50,30-11-2019);
--Set identity_insert Offer off;

--insert into Wishlist(username,name)
--Values('ammar.yasser','fashion');

--insert into Giftcard (code,expiry_date,amount)
--Values('G101',18-11-2019,100);

--insert into Customer_CreditCard (customer_name,cc_number)
--Values('ammar.yasser','4444-5555-6666-8888');