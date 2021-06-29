create database Hindustanbazar;

use Hindustanbazar;

drop table Seller;

create table Seller(
SellerID int(11),
SellerName varchar (50) NOT NULL,
SellerContactNumber varchar(10) NOT NULL,
SellerAdhaarNumber varchar(12) NOT NULL,
SellerGSTIN varchar(15) NOT NULL,
SellerEmail varchar(50),
SellerShopName varchar(50) NOT NULL,
SellerShopLocation varchar(100) NOT NULL,
Primary Key(SellerID)
);

drop table Product;

create table Product(
ProductID int(15),
ProductName varchar(50) NOT NULL,
ProductCategory varchar (50) NOT NULL,
ProductType varchar(10) NOT NULL,
ProductPrice float(7,2) NOT NULL,
ProductBrand varchar(50),
ProductUOM varchar(15) NOT NULL,
Productperweight int(3),
ProductDiscount int(5),
ProductRating float(5,4),
ExpressDeliveryStatus varchar(10),
ProductImg varchar(200) NOT NULL,
ProductSellerID int(11),
primary key(ProductID),
foreign key(ProductSellerID) references Seller(SellerID)
);

drop table Stocks;

create table Stocks(
ProductID int(15) NOT NULL,
ProductQtyAvailable int(3) NOT NULL,
SellerID int(10)
);

drop table Offer;

create table Offer(
OfferID varchar(10),
OfferName varchar(20),
OfferImg varchar(200) NOT NULL
);

select * from users;
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Inserting data for table `users`
INSERT INTO `users` 
VALUES 
('sahilgrocery@gmail.com','{noop}sahil',1),
('pulkitgrocery@gmail.com','{noop}pulkit',1),
('radhikagrocery@gmail.com','{noop}radhika',1),
('rahulgrocery@gmail.com','{noop}rahul',1),
('pal','{noop}pal',1);


-- Table structure for table `authorities`
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Inserting data for table `authorities`
select * from authorities;
INSERT INTO `authorities` 
VALUES 
('sahilgrocery@gmail.com','ROLE_BUYER'),
('sahilgrocery@gmail.com','ROLE_SELLER'),
('pulkitgrocery@gmail.com','ROLE_BUYER'),
('pulkitgrocery@gmail.com','ROLE_SELLER'),
('radhikagrocery@gmail.com','ROLE_BUYER'),
('radhikagrocery@gmail.com','ROLE_SELLER'),
('rahulgrocery@gmail.com','ROLE_BUYER'),
('rahulgrocery@gmail.com','ROLE_SELLER'),
('pal','ROLE_BUYER');

drop table Buyer;
create table Buyer(
BuyerID varchar(50),
Username varchar(30),
Phonenumber int(11),
Email varchar(50),
Houseno varchar(30),
city varchar(20),
state varchar(30),
Hbcredits int(5)
);

drop table Cart;
create table Cart(
BuyerID varchar(25),
ProductID int(15),
SellerID int(10),
QtySelected int(5)
);

drop table wishlist;
create table wishlist(
BuyerID varchar(25),
ProductID int(15),
SellerID int(10),
QtySelected int(5));

drop table Orders;
create table Orders(
BuyerID varchar(25),
TotalItems int(10),
DateOfPurchase varchar(20),
TotalAmount float(7),
Trackstatus int(3)
);

drop table Feedbacks;
create table Feedbacks(
BuyerID varchar(25),
ProductID int(15),
SellerID int(10),
Review varchar(350),
DateOfPost varchar(20));

-- insertion and selection commands -- 

select * from Product as p,Stocks,Seller as s where  p.ProductSellerID = s.SellerID;
select * from Product,Stocks where ProductCategory = "Fruits and Vegetables" and Product.ProductID = Stocks.ProductID;
select * from Product as p,Stocks as s where p.ProductID = '2' and p.ProductID = s.ProductID;

insert into Seller values(226,"pulkit","9898989898","988998899889","GST226","pulkitgrocery@gmail.com","Pulkit Grocery Store","Gurugram");
insert into Seller values(265,"sahil","7878787878","788778877887","GST265","sahilgrocery@gmail.com","Sahil Grocery Store","Noida");
insert into Seller values(233,"radhika","6868686868","688668866886","GST233","radhikagrocery@gmail.com","Radhika Grocery Store","Faridabad");
insert into Seller values(397,"rahul","5858585858","588558855885","GST397","rahulgrocery@gmail.com","Rahul Grocery Store","Delhi");
select * from Seller;

insert into Product values(1,"Onions","Fruits and Vegetables","Veg",40.00,"Fresho","kg",1,20,2.2,"True","resources/product/product-1.png",226);
insert into Product values(2,"Banganapali Mango","Fruits and Vegetables","Veg",83.75,"Fresho","kg",1,18,2.3,"False","resources/product/product-2.png",265);
insert into Product values(3,"Potato","Fruits and Vegetables","Veg",39,"Fresho","kg",1,19,2.4,"True","resources/product/product-3.png",233);
insert into Product values(4,"Tomato","Fruits and Vegetables","Veg",15,"Fresho","kg",1,20,2.5,"False","resources/product/product-4.png",397);
insert into Product values(5,"Carrot","Fruits and Vegetables","Veg",45,"Fresho","g",500,18,2.6,"True","resources/product/product-5.png",226);
insert into Product values(6,"Pomegranate","Fruits and Vegetables","Veg",187,"Fresho","kg",1,19,2.7,"False","resources/product/product-6.png",233);
insert into Product values(7,"Ladies Finger","Fruits and Vegetables","Veg",17,"Fresho","g",500,20,2.8,"True","resources/product/product-7.png",397);
insert into Product values(8,"Apple - Regular","Fruits and Vegetables","Veg",230,"Fresho - 4pcs","g (approx)",600,18,2.9,"False","resources/product/product-8.png",265);
insert into Product values(9,"Mushrooms","Fruits and Vegetables","Veg",62,"Fresho - 1pack ","g",450,19,3.0,"True","resources/product/product-9.png",226);
insert into Product values(10,"Banana","Fruits and Vegetables","Veg",80,"Fresho","dozen",1,20,3.1,"False","resources/product/product-10.png",233);
insert into Product values(11,"Cauli Flower","Fruits and Vegetables","Veg",48,"Fresho - 1pc","g approx",500,15,3.2,"True","resources/product/product-11.png",397);
insert into Product values(12,"Capsicum","Fruits and Vegetables","Veg",39,"Fresho","g",500,12,3.3,"False","resources/product/product-12.png",265);
insert into Product values(13,"Cucumber","Fruits and Vegetables","Veg",24,"Fresho","g",500,12,3.4,"True","resources/product/product-13.png",226);
insert into Product values(14,"Lemon","Fruits and Vegetables","Veg",37,"Fresho","g",250,20,3.5,"False","resources/product/product-14.png",265);
insert into Product values(15,"Water melon","Fruits and Vegetables","Veg",54,"Fresho - 1pcs","kg approx",2,29,3.6,"True","resources/product/product-15.png",233);
insert into Product values(16,"Tomato - Hybrid","Fruits and Vegetables","Veg",24,"Fresho","kg",1,18,3.7,"False","resources/product/product-16.png",397);
insert into Product values(17,"Coriander leaves","Fruits and Vegetables","Veg",16,"Fresho","g",100,10,3.8,"True","resources/product/product-17.png",226);
insert into Product values(18,"Garlic","Fruits and Vegetables","Veg",153,"Fresho","g",250,20,3.9,"False","resources/product/product-18.png",397);
insert into Product values(19,"Mosambi","Fruits and Vegetables","Veg",178,"Fresho","kg",1,19,4.0,"True","resources/product/product-19.png",265);
insert into Product values(20,"Orange - Imported","Fruits and Vegetables","Veg",187,"Fresho","kg",1,20,4.1,"False","resources/product/product-20.png",233);
insert into Product values(21,"Green peas","Fruits and Vegetables","Veg",278,"Fresho","kg",1,15,4.2,"True","resources/product/product-21.png",226);
insert into Product values(129,"Organic Sprouts Mixed Gram","Fruits and Vegetables","Veg",60,"Fresho","g",200,20,3.9,"True","resources/product/product-129.png",226);
insert into Product values(130,"Organic Sprouts Moong Green","Fruits and Vegetables","Veg",60,"Fresho","g",200,18,3.8,"True","resources/product/product-130.png",226);
insert into Product values(131,"Organic Sprouts Channa Gram","Fruits and Vegetables","Veg",60,"Fresho","g",200,19,4.1,"True","resources/product/product-131.png",226);
insert into Product values(132,"Organic Sprouts Horse Gram","Fruits and Vegetables","Veg",60,"Fresho","g",200,20,3.5,"True","resources/product/product-132.png",226);
insert into Product values(141,"Muskmelon - Striped","Fruits and Vegetables","Veg",90,"Fresho","g(approx)",600,12,3.8,"True","resources/product/product-141.png",233);
insert into Product values(142,"Watermelon - Large","Fruits and Vegetables","Veg",100,"Fresho","kg(approx)",4,10,3.9,"True","resources/product/product-142.png",233);

insert into Product values(22,"Sugar","Food grains, Oil and Masala","Veg",275,"hbPopular","kg",5,10,2.1,"True","resources/product/product-22.png",233);
insert into Product values(23,"Sugar","Food grains, Oil and Masala","Veg",43,"hbPopular","kg",1,6,2.1,"False","resources/product/product-23.png",265);
insert into Product values(24,"Jaggery","Food grains, Oil and Masala","Veg",72,"hbPopular","g",450,5,2.2,"True","resources/product/product-24.png",397);
insert into Product values(25,"Orangic Jaggery","Food grains, Oil and Masala","Veg",95,"hbPopular","g",500,5,2.2,"False","resources/product/product-25.png",233);
insert into Product values(26,"multi-grain Atta","Food grains, Oil and Masala","Veg",104,"hbPopular","kg",2,15,2.3,"True","resources/product/product-26.png",226);
insert into Product values(27,"Basmati Rice - Rozanna","Food grains, Oil and Masala","Veg",91,"India gate","kg",1,5,2.3,"False","resources/product/product-27.png",265);
insert into Product values(28,"Basmati Rice - Classic","Food grains, Oil and Masala","Veg",210,"India gate","kg",128,5,2.4,"True","resources/product/product-28.png",397);
insert into Product values(29,"Basmati Rice - Jeera","Food grains, Oil and Masala","Veg",128,"India gate","kg",1,5,2.5,"False","resources/product/product-29.png",226);
insert into Product values(30,"Basmati Rice - Classic ","Food grains, Oil and Masala","Veg",1055,"India gate","kg",5,5,2.5,"True","resources/product/product-30.png",233);
insert into Product values(31,"Basmati Rice - Mogra","Food grains, Oil and Masala","Veg",305,"India gate","kg",5,5,2.6,"False","resources/product/product-31.png",265);
insert into Product values(32,"Ginger & garlic paste","Food grains, Oil and Masala","Veg",75,"Mothers Receipe","g",300,6,2.6,"True","resources/product/product-33.png",397);
insert into Product values(33,"Panner butter Masala","Food grains, Oil and Masala","Veg",55,"Mothers Receipe","g",75,6,2.7,"False","resources/product/product-34.png",226);
insert into Product values(34,"Mix- Mutton Curry","Food grains, Oil and Masala","Veg",165,"Mothers Receipe","g",300,6,2.7,"True","resources/product/product-35.png",233);
insert into Product values(35,"Mix- Fish Curry","Food grains, Oil and Masala","Veg",165,"Mothers Receipe","g",270,6,2.8,"False","resources/product/product-36.png",265);
insert into Product values(36,"Vegetable Biryani","Food grains, Oil and Masala","Veg",165,"Mothers Receipe","g",225,6,2.9,"True","resources/product/product-37.png",397);
insert into Product values(37,"Toor dal","Food grains, Oil and Masala","Veg",160,"Aashirvaad","kg",1,6,2.9,"False","resources/product/product-37.png",226);
insert into Product values(38,"Atta","Food grains, Oil and Masala","Veg",490,"Aashirvaad","kg",10,6,2.8,"True","resources/product/product-38.png",265);
insert into Product values(39,"Select Atta","Food grains, Oil and Masala","Veg",300,"Aashirvaad","kg",5,6,3.0,"False","resources/product/product-39.png",233);
insert into Product values(40,"Turmeric Powder","Food grains, Oil and Masala","Veg",64,"Aashirvaad","kg",1,6,3.0,"True","resources/product/product-40.png",397);
insert into Product values(41,"Corriander Powder","Food grains, Oil and Masala","Veg",32,"Aashirvaad","g",100,6,3.1,"False","resources/product/product-41.png",226);
insert into Product values(42,"Shahi Garam Masala","Food grains, Oil and Masala","Veg",90,"Aashirvaad","g",100,6,3.2,"True","resources/product/product-42.png",265);
insert into Product values(43,"Sambhar Masala","Food grains, Oil and Masala","Veg",62,"Aashirvaad","g",100,6,3.3,"False","resources/product/product-43.png",397);
insert into Product values(44,"Moong dal","Food grains, Oil and Masala","Veg",260,"Aashirvaad","kg",1,6,3.3,"True","resources/product/product-44.png",233);
insert into Product values(45,"Powder Chilly","Food grains, Oil and Masala","Veg",36,"Aashirvaad","g",100,6,3.3,"False","resources/product/product-45.png",226);
insert into Product values(46,"Powder Chilly","Food grains, Oil and Masala","Veg",72,"Aashirvaad","g",200,6,3.4,"True","resources/product/product-46.png",265);
insert into Product values(47,"Paneer Masala","Food grains, Oil and Masala","Veg",140,"Aashirvaad","g",500,6,3.4,"False","resources/product/product-47.png",397);
insert into Product values(48,"Toor Dal","Food grains, Oil and Masala","Veg",179,"Tata Products","kg",1,5,3.4,"True","resources/product/product-48.png",233);
insert into Product values(49,"Urad Dal","Food grains, Oil and Masala","Veg",200,"Tata Products","kg",1,5,3.5,"False","resources/product/product-49.png",226);
insert into Product values(50,"Moong Dal","Food grains, Oil and Masala","Veg",180,"Tata Products","kg",1,5,3.5,"True","resources/product/product-50.png",233);
insert into Product values(51,"Iodized Salt","Food grains, Oil and Masala","Veg",21,"Tata Products","kg",1,5,3.5,"False","resources/product/product-51.png",265);
insert into Product values(52,"Iodized Crystal Salt","Food grains, Oil and Masala","Veg",18,"Tata Products","kg",1,5,3.5,"True","resources/product/product-52.png",397);
insert into Product values(53,"Salt lite - 15% low Sodium","Food grains, Oil and Masala","Veg",34,"Tata Products","kg",1,5,3.5,"False","resources/product/product-53.png",226);
insert into Product values(54,"Sunlite - Sunflower Refind Oil","Food grains, Oil and Masala","Veg",1195,"Fortune","L",5,5,3.7,"True","resources/product/product-54.png",265);
insert into Product values(55,"Kachi ghani Mustard Oil","Food grains, Oil and Masala","Veg",112,"Fortune","ml",500,5,3.7,"False","resources/product/product-55.png",397);
insert into Product values(56,"Rice brain health Oil","Food grains, Oil and Masala","Veg",215,"Fortune","L",1,5,3.6,"True","resources/product/product-56.png",233);
insert into Product values(57,"Soya bean Oil","Food grains, Oil and Masala","Veg",190,"Fortune","L",1,5,3.6,"False","resources/product/product-57.png",226);
insert into Product values(58,"Xpert Pro Oil","Food grains, Oil and Masala","Veg",185,"Fortune","L",1,5,3.8,"True","resources/product/product-58.png",265);
insert into Product values(59,"Basmati Rice","Food grains, Oil and Masala","Veg",130,"Fortune","kg",1,5,3.8,"False","resources/product/product-59.png",397);
insert into Product values(60,"Xpert Pro Immunity Oil","Food grains, Oil and Masala","Veg",175,"Fortune","L",1,5,3.9,"True","resources/product/product-60.png",233);
insert into Product values(61,"Gold Pro Healthy Oil","Food grains, Oil and Masala","Veg",228,"Saffola","L",1,5,4.0,"False","resources/product/product-61.png",226);
insert into Product values(62,"Active Pro Weight Edible Oil","Food grains, Oil and Masala","Veg",213,"Saffola","L",1,5,4.1,"True","resources/product/product-62.png",265);
insert into Product values(63,"Tasty Pro Fitness Conscious","Food grains, Oil and Masala","Veg",945,"Saffola","L",5,5,4.1,"False","resources/product/product-63.png",397);
insert into Product values(64,"Refind Olive Oil","Food grains, Oil and Masala","Veg",1380,"Saffola","L",2,5,4.2,"True","resources/product/product-64.png",233);
insert into Product values(65,"Salt","Food grains, Oil and Masala","Veg",35,"Saffola","kg",1,5,4.2,"False","resources/product/product-65.png",226);
insert into Product values(66,"Basmati Rice - Dubar","Food grains, Oil and Masala","Veg",585,"India gate","kg",5,6,4.3,"True","resources/product/product-66.png",265);
insert into Product values(67,"Basmati Rice - Super","Food grains, Oil and Masala","Veg",405,"India gate","kg",5,6,4.3,"False","resources/product/product-67.png",397);

insert into Product values(68,"Whey protein - Health drink","Beverages","Veg",175,"Amul Pro","g",500,6,2.1,"True","resources/product/product-68.png",233);
insert into Product values(69,"Sunrise Coffee","Beverages","Veg",10,"Nescafe","g",12,1,2.2,"False","resources/product/product-69.png",226);
insert into Product values(70,"Sunrise Instant","Beverages","Veg",150,"Nescafe","g",100,5,2.2,"True","resources/product/product-70.png",265);
insert into Product values(71,"Instant - Coffee Classic","Beverages","Veg",140,"Nescafe","g",50,5,2.3,"False","resources/product/product-71.png",397);
insert into Product values(72,"Sunrise Rich Aroma","Beverages","Veg",685,"Nescafe","g",500,5,2.3,"True","resources/product/product-72.png",233);
insert into Product values(73,"Gold Choco Mocha","Beverages","Veg",150,"Nescafe","g",25,5,2.3,"False","resources/product/product-73.png",226);
insert into Product values(74,"Blend instant coffee","Beverages","Veg",290,"Nescafe","g",50,5,2.4,"True","resources/product/product-74.png",265);
insert into Product values(75,"Diet Coke - Soft Drink","Beverages","Veg",40,"Coca-cola","ml",300,5,2.5,"False","resources/product/product-75.png",397);
insert into Product values(76,"Soft Drink - Original Taste","Beverages","Veg",40,"Coca-cola","ml",700,2,2.6,"True","resources/product/product-76.png",233);
insert into Product values(77,"Coke zero - Soft Drink","Beverages","Veg",40,"Coca-cola","ml",40,2,2.6,"False","resources/product/product-77.png",226);
insert into Product values(78,"Tata Tea Gold","Beverages","Veg",315,"Tata products","g",500,2,2.7,"True","resources/product/product-78.png",265);
insert into Product values(79,"Tata Tea Agni","Beverages","Veg",150,"Tata products","g",500,2,2.7,"False","resources/product/product-79.png",397);
insert into Product values(80,"Tata Tea Premium","Beverages","Veg",140,"Tata products","g",250,2,2.8,"True","resources/product/product-80.png",233);
insert into Product values(81,"Tea Gold Dust","Beverages","Veg",170,"Tata products","g",250,2,2.8,"False","resources/product/product-81.png",226);
insert into Product values(82,"Tea Strong","Beverages","Veg",257,"Tata products","lg",1,2,2.9,"True","resources/product/product-82.png",265);
insert into Product values(83,"Grand Coffee","Beverages","Veg",104,"Tata products","g",50,2,2.9,"False","resources/product/product-83.png",397);
insert into Product values(84,"Care Tea","Beverages","Veg",230,"Tata products","g",500,2,2.9,"True","resources/product/product-84.png",233);
insert into Product values(85,"Fruit Drink - Pulpy Orange","Beverages","Veg",35,"Minute maid","ml",400,2,3.0,"False","resources/product/product-85.png",226);
insert into Product values(86,"Soft Drink - Real Lemon Juice","Beverages","Veg",20,"7up Nimbooz","ml",250,2,3.1,"True","resources/product/product-86.png",265);
insert into Product values(87,"Club Soda","Beverages","Veg",20,"Kinley","ml",750,2,3.2,"False","resources/product/product-87.png",233);
insert into Product values(88,"Drinking water with minerals","Beverages","Veg",23,"Kinley","L",1,2,3.3,"True","resources/product/product-88.png",397);
insert into Product values(89,"Fruit Juice - Cranbery","Beverages","Veg",115,"Real","L",1,2,4.2,"True","resources/product/product-89.png",226);
insert into Product values(90,"Fruit Juice - Mixed","Beverages","Veg",110,"Real","L",1,2,4.5,"False","resources/product/product-90.png",265);
insert into Product values(91,"Fruit Juice - Lichi","Beverages","Veg",110,"Real","L",1,2,4.4,"True","resources/product/product-91.png",397);
insert into Product values(92,"Fruit Juice - Guava","Beverages","Veg",105,"Real","L",1,2,3.5,"False","resources/product/product-92.png",233);
insert into Product values(93,"Fruit Juice - Orange","Beverages","Veg",110,"Real","L",1,2,3.6,"True","resources/product/product-93.png",226);
insert into Product values(94,"Fruit Juice - Mango","Beverages","Veg",100,"Real","L",1,2,3.7,"False","resources/product/product-94.png",397);
insert into Product values(95,"Fruit Juice - Mosambi","Beverages","Veg",110,"Real","L",1,2,3.8,"True","resources/product/product-95.png",233);
insert into Product values(96,"Fruit Juice - Pineapple","Beverages","Veg",105,"Real","L",1,2,3.8,"False","resources/product/product-96.png",265);
insert into Product values(97,"Soft Drink - Black, Slim","Beverages","Veg",30,"Pepsi","ml",250,2,3.9,"True","resources/product/product-97.png",226);
insert into Product values(98,"Soft Drink","Beverages","Veg",40,"Pepsi","ml",750,2,4.1,"False","resources/product/product-98.png",265);
insert into Product values(99,"Soft Drink","Beverages","Veg",90,"Pepsi","L",2,2,4.2,"True","resources/product/product-99.png",233);
insert into Product values(100,"Swag can","Beverages","Veg",27,"Pepsi","ml",250,2,4.5,"False","resources/product/product-100.png",397);
insert into Product values(150,"Tang Instant Drink Mix - Orange","Beverages","Veg",270,"Tang","g",500,20,4.1,"False","resources/product/product-150.png",226);
insert into Product values(151,"Tang Instant Drink Mix - Lemon","Beverages","Veg",270,"Tang","g",500,20,3.9,"False","resources/product/product-151.png",226);
insert into Product values(152,"Tang Instant Drink Mix - Mango","Beverages","Veg",270,"Tang","g",500,20,4.5,"False","resources/product/product-152.png",226);

insert into Product values(101,"Marie Gold Biscuits","Snacks and Branded food","Veg",15,"Britannia","g",120,2,2.4,"True","resources/product/product-101.png",226);
insert into Product values(102,"Burborn - choclate Biscuit","Snacks and Branded food","Veg",10,"Britannia","g",60,2,2.7,"False","resources/product/product-102.png",265);
insert into Product values(103,"Good day chocochips","Snacks and Branded food","Veg",30,"Britannia","g",100,2,4.5,"True","resources/product/product-103.png",233);
insert into Product values(104,"Good day Butter cookies","Snacks and Branded food","Veg",40,"Britannia","g",100,2,4.2,"True","resources/product/product-104.png",397);
insert into Product values(105,"Nutrichoice digestive","Snacks and Branded food","Veg",30,"Britannia","g",100,2,3.5,"False","resources/product/product-105.png",265);
insert into Product values(106,"2 Minute Instant Noodles","Snacks and Branded food","Veg",46,"Maggi","g",280,2,3.6,"True","resources/product/product-106.png",226);
insert into Product values(107,"Hot & Sweet Tamato Chili Sauce","Snacks and Branded food","Veg",160,"Maggi","kg",1,2,2.8,"True","resources/product/product-107.png",397);
insert into Product values(108,"Cheese Macaroni Pazzta","Snacks and Branded food","Veg",35,"Maggi","g",70,2,3.4,"True","resources/product/product-108.png",233);
insert into Product values(109,"Masala penne Pazzta","Snacks and Branded food","Veg",35,"Maggi","g",65,2,3.7,"True","resources/product/product-109.png",265);
insert into Product values(110,"Oats","Snacks and Branded food","Veg",320,"Quaker","kg",2,2,4.2,"True","resources/product/product-110.png",226);
insert into Product values(111,"Oats Plus - multigrain","Snacks and Branded food","Veg",145,"Quaker","g",600,2,4.3,"False","resources/product/product-111.png",265);
insert into Product values(112,"Namkeen - Moong dal","Snacks and Branded food","Veg",100,"Haldirams","g",350,2,4.4,"True","resources/product/product-112.png",397);
insert into Product values(113,"Namkeen - Aloo Bhujia","Snacks and Branded food","Veg",10,"Haldirams","g",50,2,4.5,"True","resources/product/product-113.png",233);
insert into Product values(114,"Namkeen - Salted peanuts","Snacks and Branded food","Veg",47,"Haldirams","g",400,2,4.5,"True","resources/product/product-114.png",226);
insert into Product values(115,"Potato chips - Magic masala","Snacks and Branded food","Veg",10,"Lays","g",28,2,4.1,"False","resources/product/product-115.png",233);
insert into Product values(116,"Potato chips - Onion & Cream","Snacks and Branded food","Veg",10,"Lays","g",28,2,4.2,"True","resources/product/product-116.png",265);
insert into Product values(117,"Potato chips - Salted classic","Snacks and Branded food","Veg",20,"Lays","g",52,2,3.8,"True","resources/product/product-117.png",397);
insert into Product values(135,"Rich Dark Chocolate Bar","Snacks and Branded food","Veg",180,"Cadbury","pcs",2,10,4.1,"True","resources/product/product-135.png",397);
insert into Product values(159,"Diary Milk Mousse Chocolate Bar","Snacks and Branded food","Veg",180,"Cadbury","pcs",1,10,4.1,"True","resources/product/product-159.png",397);
insert into Product values(136,"Premium Wafer Bites - Dark Choco","Snacks and Branded food","Veg",50,"Tasties","pack",1,5,3.9,"True","resources/product/product-136.png",233);
insert into Product values(137,"Premium Wafer Bites - Strawberry","Snacks and Branded food","Veg",50,"Tasties","pack",1,5,3.9,"True","resources/product/product-137.png",233);
insert into Product values(138,"Premium Wafer Bites - Orange","Snacks and Branded food","Veg",50,"Tasties","pack",1,5,3.8,"True","resources/product/product-138.png",233);
insert into Product values(140,"Premium Wafer Bites - Cappucino","Snacks and Branded food","Veg",50,"Tasties","pack",1,5,4.1,"True","resources/product/product-140.png",233);
insert into Product values(143,"Butter Cookies - Tasties","Snacks and Branded food","Veg",30,"Tasties","g",75,8,3.8,"True","resources/product/product-143.png",265);
insert into Product values(144,"Butter Cashew Cookies - Tasties","Snacks and Branded food","Veg",30,"Tasties","g",75,8,3.8,"True","resources/product/product-144.png",265);
insert into Product values(145,"Honey Oats Cookies - Tasties","Snacks and Branded food","Veg",30,"Tasties","g",75,8,3.8,"True","resources/product/product-145.png",265);
insert into Product values(146,"Fruit Nut Cookies - Tasties","Snacks and Branded food","Veg",30,"Tasties","g",75,8,3.8,"True","resources/product/product-146.png",265);
insert into Product values(147,"Multigrain Cookies - Tasties","Snacks and Branded food","Veg",30,"Tasties","g",75,8,3.8,"True","resources/product/product-147.png",265);
insert into Product values(148,"Jeera Cookies - Tasties","Snacks and Branded food","Veg",30,"Tasties","g",75,8,3.8,"True","resources/product/product-148.png",265);
insert into Product values(149,"CocoChip Cookies - Tasties","Snacks and Branded food","Veg",30,"Tasties","g",75,8,3.8,"True","resources/product/product-149.png",265);
insert into Product values(154,"Nacho chips - Jalapeno","Snacks and Branded food","Veg",30,"Tasties","g",60,10,4.3,"True","resources/product/product-154.png",265);
insert into Product values(155,"Nacho chips - Cheese","Snacks and Branded food","Veg",30,"Tasties","g",60,10,4.3,"True","resources/product/product-155.png",265);
insert into Product values(156,"Nacho chips - SweetChill","Snacks and Branded food","Veg",30,"Tasties","g",60,10,4.3,"True","resources/product/product-156.png",265);
insert into Product values(157,"Nacho chips - PeriPeri","Snacks and Branded food","Veg",30,"Tasties","g",60,10,4.3,"True","resources/product/product-157.png",265);

insert into Product values(118,"Farm eggs - brown medium","Eggs, Meat and Fish","Non-Veg",85,"Fresho","pcs",6,2,4.1,"True","resources/product/product-118.png",233);
insert into Product values(119,"Farm Prawns - Large","Eggs, Meat and Fish","Non-Veg",135,"Fresho","g",250,2,4.2,"False","resources/product/product-119.png",265);
insert into Product values(120,"Duck Roasted","Eggs, Meat and Fish","Non-Veg",2700,"Fresho","kg approx",1.3,2,3.5,"True","resources/product/product-120.png",226);
insert into Product values(121,"Turkey Roasted","Eggs, Meat and Fish","Non-Veg",3200,"Fresho","kg approx",3.5,2,3.6,"True","resources/product/product-121.png",265);
insert into Product values(122,"Chicken Roasted","Eggs, Meat and Fish","Non-Veg",800,"Fresho","g",900,2,2.9,"True","resources/product/product-122.png",233);
insert into Product values(123,"Eggs","Eggs, Meat and Fish","Non-Veg",250,"Farm Made","pcs",12,2,4.1,"True","resources/product/product-123.png",226);
insert into Product values(124,"Eggs","Eggs, Meat and Fish","Non-Veg",130,"Farm Made","pcs",6,2,4.4,"True","resources/product/product-124.png",265);
insert into Product values(125,"Plus Eggs","Eggs, Meat and Fish","Non-Veg",73,"best","pcs",6,2,3.9,"True","resources/product/product-125.png",233);
insert into Product values(126,"Brown Eggs","Eggs, Meat and Fish","Non-Veg",84,"best","pcs",6,2,3.8,"True","resources/product/product-126.png",265);
insert into Product values(127,"Prawns - medium","Eggs, Meat and Fish","Non-Veg",185,"ITC Master chef","g",200,2,3.9,"True","resources/product/product-127.png",226);
insert into Product values(128,"Prawns - large","Eggs, Meat and Fish","Non-Veg",250,"ITC Master chef","g",200,2,4.0,"True","resources/product/product-128.png",265);
insert into Product values(133,"Mackerel Fish - Large Cleaned","Eggs, Meat and Fish","Non-Veg",450,"Fresho","g",500,15,4.1,"True","resources/product/product-133.png",265);
insert into Product values(134,"Catla Fish - Large Cleaned","Eggs, Meat and Fish","Non-Veg",389,"Fresho","pcs",12-15,18,4.2,"True","resources/product/product-134.png",265);
insert into Product values(158,"Farm eggs - White medium","Eggs, Meat and Fish","Non-Veg",50,"Fresho","pcs",6,5,4.1,"True","resources/product/product-158.png",397);
select * from Product;

select * from Product where ProductCategory = "Fruits and Vegetables";
select * from Product,Seller where ProductCategory = "Fruits and Vegetables" and SellerShopLocation = 'Gurugram' and ProductSellerID = SellerID;

insert into Stocks values(1,1,226);
insert into Stocks values(2,2,265);
insert into Stocks values(3,3,233);
insert into Stocks values(4,0,397);
insert into Stocks values(5,4,226);
insert into Stocks values(6,1,233);
insert into Stocks values(7,2,397);
insert into Stocks values(8,3,265);
insert into Stocks values(9,4,226);
insert into Stocks values(10,5,233);
insert into Stocks values(11,5,397);
insert into Stocks values(12,5,265);
insert into Stocks values(13,5,226);
insert into Stocks values(14,6,265);
insert into Stocks values(15,3,233);
insert into Stocks values(16,3,397);
insert into Stocks values(17,4,226);
insert into Stocks values(18,0,397);
insert into Stocks values(19,3,265);
insert into Stocks values(20,2,233);
insert into Stocks values(21,4,226);
insert into Stocks values(129,5,226);
insert into Stocks values(130,6,226);
insert into Stocks values(131,7,226);
insert into Stocks values(132,3,226);
insert into Stocks values(141,7,233);
insert into Stocks values(142,0,233);
insert into Stocks values(22,2,233);
insert into Stocks values(23,4,265);
insert into Stocks values(24,5,397);
insert into Stocks values(25,3,233);
insert into Stocks values(26,6,226);
insert into Stocks values(27,8,265);
insert into Stocks values(28,8,397);
insert into Stocks values(29,6,226);
insert into Stocks values(30,5,233);
insert into Stocks values(31,3,265);
insert into Stocks values(32,4,397);
insert into Stocks values(33,5,226);
insert into Stocks values(34,2,233);
insert into Stocks values(35,3,265);
insert into Stocks values(36,5,397);
insert into Stocks values(37,6,226);
insert into Stocks values(38,2,265);
insert into Stocks values(39,3,233);
insert into Stocks values(40,4,397);
insert into Stocks values(41,0,226);
insert into Stocks values(42,3,265);
insert into Stocks values(43,4,397);
insert into Stocks values(44,0,233);
insert into Stocks values(45,4,226);
insert into Stocks values(46,5,265);
insert into Stocks values(47,0,397);
insert into Stocks values(48,3,233);
insert into Stocks values(49,4,226);
insert into Stocks values(50,6,233);
insert into Stocks values(51,2,265);
insert into Stocks values(52,5,397);
insert into Stocks values(53,8,226);
insert into Stocks values(54,4,265);
insert into Stocks values(55,4,397);
insert into Stocks values(56,3,233);
insert into Stocks values(57,0,226);
insert into Stocks values(58,0,265);
insert into Stocks values(59,4,397);
insert into Stocks values(60,6,233);
insert into Stocks values(61,7,226);
insert into Stocks values(62,8,265);
insert into Stocks values(63,6,397);
insert into Stocks values(64,7,233);
insert into Stocks values(65,4,226);
insert into Stocks values(66,3,265);
insert into Stocks values(67,7,397);
insert into Stocks values(68,6,233);
insert into Stocks values(69,7,226);
insert into Stocks values(70,3,265);
insert into Stocks values(71,4,397);
insert into Stocks values(72,5,233);
insert into Stocks values(73,6,226);
insert into Stocks values(74,7,265);
insert into Stocks values(75,4,397);
insert into Stocks values(76,5,233);
insert into Stocks values(77,4,226);
insert into Stocks values(78,3,265);
insert into Stocks values(79,2,397);
insert into Stocks values(80,4,233);
insert into Stocks values(81,5,226);
insert into Stocks values(82,6,265);
insert into Stocks values(83,3,397);
insert into Stocks values(84,3,233);
insert into Stocks values(85,4,226);
insert into Stocks values(86,5,265);
insert into Stocks values(87,2,233);
insert into Stocks values(88,0,397);
insert into Stocks values(89,4,226);
insert into Stocks values(90,5,265);
insert into Stocks values(91,3,397);
insert into Stocks values(92,4,233);
insert into Stocks values(93,5,226);
insert into Stocks values(94,5,397);
insert into Stocks values(95,3,233);
insert into Stocks values(96,5,265);
insert into Stocks values(97,3,226);
insert into Stocks values(98,4,265);
insert into Stocks values(99,3,233);
insert into Stocks values(100,4,397);
insert into Stocks values(150,4,226);
insert into Stocks values(151,4,226);
insert into Stocks values(152,3,226);
insert into Stocks values(101,4,226);
insert into Stocks values(102,3,265);
insert into Stocks values(103,2,233);
insert into Stocks values(104,4,397);
insert into Stocks values(105,5,265);
insert into Stocks values(106,6,226);
insert into Stocks values(107,7,397);
insert into Stocks values(108,2,233);
insert into Stocks values(109,3,265);
insert into Stocks values(110,2,226);
insert into Stocks values(111,4,265);
insert into Stocks values(112,5,397);
insert into Stocks values(113,3,233);
insert into Stocks values(114,4,226);
insert into Stocks values(115,5,233);
insert into Stocks values(116,3,265);
insert into Stocks values(117,5,397);
insert into Stocks values(135,4,397);
insert into Stocks values(159,3,397);
insert into Stocks values(136,4,233);
insert into Stocks values(137,5,233);
insert into Stocks values(138,3,233);
insert into Stocks values(140,5,233);
insert into Stocks values(143,3,265);
insert into Stocks values(144,5,265);
insert into Stocks values(145,3,265);
insert into Stocks values(146,5,265);
insert into Stocks values(147,2,265);
insert into Stocks values(148,4,265);
insert into Stocks values(149,3,265);
insert into Stocks values(154,4,265);
insert into Stocks values(155,5,265);
insert into Stocks values(156,6,265);
insert into Stocks values(157,2,265);
insert into Stocks values(118,3,233);
insert into Stocks values(119,4,265);
insert into Stocks values(120,3,226);
insert into Stocks values(121,4,265);
insert into Stocks values(122,5,233);
insert into Stocks values(123,6,226);
insert into Stocks values(124,3,265);
insert into Stocks values(125,5,233);
insert into Stocks values(126,2,265);
insert into Stocks values(127,4,226);
insert into Stocks values(128,5,265);
insert into Stocks values(133,6,265);
insert into Stocks values(134,5,265);
insert into Stocks values(158,4,397);

select * from Product;

select distinct * from Product where ProductName like '%rice%' or ProductCategory like '%rice%' or ProductBrand like '%rice%' or ProductType like "";

select count(distinct ProductID ) from Product where ProductName like "%rice%" or ProductCategory like "%rice%" or ProductBrand like "%rice%" or ProductType like "";

select * from Product order by ProductPrice desc;


insert into Offer values(1,"Vinegar","resources/product/offers/sunday1.png");
insert into Offer values(1,"Cocunut","resources/product/offers/sunday2.png");
insert into Offer values(1,"Mosambis","resources/product/offers/sunday3.png");
insert into Offer values(1,"Kiwis","resources/product/offers/sunday4.png");
insert into Offer values(1,"Dry Fruits","resources/product/offers/sunday5.png");
insert into Offer values(2,"Organic Sprouts","resources/product/offers/monday1.png");
insert into Offer values(2,"Fish - Large","resources/product/offers/monday2.png");
insert into Offer values(2,"Chocolate Bar","resources/product/offers/monday3.png");
insert into Offer values(2,"Premium Wafer Bites","resources/product/offers/monday4.png");
insert into Offer values(2,"bb Atta","resources/product/offers/monday5.png");
insert into Offer values(3,"India Rice","resources/product/offers/tuesday1.png");
insert into Offer values(3,"Ketup Fresho","resources/product/offers/tuesday2.png");
insert into Offer values(3,"Immunity Boosters","resources/product/offers/tuesday3.png");
insert into Offer values(3,"Fresh grapes","resources/product/offers/tuesday4.png");
insert into Offer values(3,"Olive Oil","resources/product/offers/tuesday5.png");
insert into Offer values(4,"melon","resources/product/offers/wednesday1.png");
insert into Offer values(4,"Cookies - Tasties","resources/product/offers/wednesday2.png");
insert into Offer values(4,"Instant Drink Mix","resources/product/offers/wednesday3.png");
insert into Offer values(4,"Farm eggs","resources/product/offers/wednesday4.png");
insert into Offer values(4,"Nacho Chips","resources/product/offers/wednesday5.png");

select * from Offer;
select * from Product order by ProductRating desc, ProductCategory asc limit 16;
select * from Product order by ProductBrand asc;

insert into Buyer values("pal","sahil pal","1212121212","sp@gmail.com","2121","Gurugram","Haryana",100);
select * from Buyer where BuyerID = 'pal';
select * from Buyer;
select * from Cart;

select * from Product as p inner join Cart as c on p.productID = c.ProductID where p.ProductSellerID=c.SellerID and c.BuyerID="pal";
update Stocks as s inner join Cart as c on s.SellerID=c.SellerID set ProductQtyAvailable = s.ProductQtyAvailable - c.QtySelected where s.ProductID=c.ProductID;

select * from wishlist;

select * from Orders order by DateOfPurchase desc;

select * from Feedbacks;

select distinct * from Product inner join Stocks on Product.ProductID = Stocks.ProductID where (ProductName like '%Aashirvaad%'
				 or ProductCategory like '%Aashirvaad%' or ProductBrand like '%Aashirvaad%' or ProductType like '%Aashirvaad%');

select distinct * from (Product inner join Feedbacks on Product.ProductID = Feedbacks.ProductID) join Seller where BuyerID = 'pal' and Feedbacks.SellerID = Seller.SellerID;

select * from (Product inner join Seller on Product.ProductSellerID = Seller.SellerID) inner join Stocks on Seller.SellerID = Stocks.SellerID where SellerEmail='sahilgrocery@gmail.com';

select distinct * from Seller,(Product inner join Stocks on Product.ProductID = Stocks.ProductID) where Seller.SellerEmail = 'sahilgrocery@gmail.com' and Product.ProductSellerID = Seller.SellerID;

update Stocks set ProductQtyAvailable = 2 where ProductID = '12' and SellerID= '265';







