# HindustanBazarWebApp
Online Grocery solution that enables easy interaction, management and organization of products between the buyer and seller.

## How to run the App
1. Fork or download the project and extract it.
2. Run the database query to create the database for the Application (Provided in the DATABASE folder of Project)
3. Open IDE - Eclipse/EntelliJ and import the project from fileSystem
4. GO to persistence-mysql.properties file inside main->resources
5. Add configuration details of your database
6. Start the server and run the project.
7. Use username="buyer" and password= "Buyer@123" for demo accessing demo buyer account. 

## Dependencies used
1. java Spring framework
2. java Spring webmvc
3. java Spring Security
4. javax security tag libs
5. jstl
6. javax servlets
7. hibernate validators
8. javax validation
9. my-sql connector
10. spring jdbc

## Features
1. Authentication and Authorization using Spring security

2. Homepage :  
a) Offer of the day Section - Dynamically updates the offers according to days of the week.      
b) Most popular Section - Product shown on the basis of rating according to selected location or by default all over the regions.  
c) Brand Store Section - Get all the products of a particular brand.    
d) Recipe Revision Section - Recipe Blogging platform where you can add your recipe and view other bloggers recipe and you can directly add all the items required for that recipe to your cart.  
  
3. Shop by category :  
i)You can explore five categories here -   
a) Fruits & vegetables.  
b) Food grains, Oil and Masala.   
c) Beverages.   
d) Snacks & Branded Food.   
e) Egg, Meat and Fish.   
ii)The category page provides you the filter to organise your view and easy selection -  
a) Popularity (By default).   
b) Price - high to low.   
c) Price - Low to High.   
d) Alphabetical.   
e) Saving - low to high.   
f) Saving - High to low.     
iii) You can't add greater quantity of product than the available quantity.    
iv) If quantity is zero in the Stocks you get the options to notify on the email.   
v) By clicking on view product -> A detailed page describing the product is opened, where the user can post their reviews also.    
  
4. Location button :  
a) By default "All over NCR" is set as the user location.  
b) You can update this location by choosing from drop down.   
c) Once you select a location, now the offers as well as the product in the category will be shown according to the selected location.   
   
5. Search Bar :  
   The user can search any product or brand.  

6. My page button :     
a) You can view your profile details.  
b) See order histroy.  
c) View posted reviews.   

** As a Seller.  
a) All the functionality as a buyer.  
b) View reviews posted on his products.  
c) CRUD operations on the product list in their shop stocks.  
d) Update status of products ordered from their shop.  
 
7. Cart button :     
a) Shows all the product added to cart.  
b) Delete product from cart.  
c) Payment options : Netbanking, Card, UPI or COD.    
d) On clicking buy now : User's cart get updated, Seller get the Order, User's Order list get updated and the Stocks of the store gets updated.  

## How it looks like 
   
<img width="1440" alt="Screenshot 2021-06-29 at 11 21 02 AM" src="https://user-images.githubusercontent.com/69889824/123752092-2200a280-d8d6-11eb-9d37-42514d6aa688.png">
<img width="1440" alt="Screenshot 2021-06-29 at 12 04 49 PM" src="https://user-images.githubusercontent.com/69889824/123752102-2462fc80-d8d6-11eb-913e-840fda00a80a.png">
<img width="1440" alt="Screenshot 2021-06-29 at 12 05 00 PM" src="https://user-images.githubusercontent.com/69889824/123752108-25942980-d8d6-11eb-83e2-03d85ae751b3.png">
<img width="1440" alt="Screenshot 2021-06-29 at 12 07 43 PM" src="https://user-images.githubusercontent.com/69889824/123752165-2f1d9180-d8d6-11eb-8d61-874cf89dbb50.png">
<img width="1440" alt="Screenshot 2021-06-29 at 12 08 29 PM" src="https://user-images.githubusercontent.com/69889824/123752177-304ebe80-d8d6-11eb-8f9a-38aa2337471c.png">
<img width="1440" alt="Screenshot 2021-06-29 at 12 16 32 PM" src="https://user-images.githubusercontent.com/69889824/123752197-35ac0900-d8d6-11eb-9631-f4a0681770f1.png">
<img width="1440" alt="Screenshot 2021-06-29 at 12 08 36 PM" src="https://user-images.githubusercontent.com/69889824/123752207-3775cc80-d8d6-11eb-85aa-bd663a693e29.png">
<img width="1440" alt="Screenshot 2021-06-29 at 12 08 55 PM" src="https://user-images.githubusercontent.com/69889824/123752209-38a6f980-d8d6-11eb-9d81-3678368804d3.png">
<img width="1440" alt="Screenshot 2021-06-29 at 12 09 32 PM" src="https://user-images.githubusercontent.com/69889824/123752223-3a70bd00-d8d6-11eb-8f0e-ef10bcaf0e3d.png">
<img width="1440" alt="Screenshot 2021-06-29 at 12 10 44 PM" src="https://user-images.githubusercontent.com/69889824/123752233-3c3a8080-d8d6-11eb-947b-db6142755276.png">
<img width="1440" alt="Screenshot 2021-06-29 at 12 10 53 PM" src="https://user-images.githubusercontent.com/69889824/123752263-40ff3480-d8d6-11eb-98ed-cf3a6c0cba09.png">
<img width="1440" alt="Screenshot 2021-06-29 at 12 09 14 PM" src="https://user-images.githubusercontent.com/69889824/123752287-4492bb80-d8d6-11eb-9816-6ff206200716.png">
<img width="724" alt="Screenshot 2021-06-29 at 12 15 32 PM" src="https://user-images.githubusercontent.com/69889824/123752795-c97dd500-d8d6-11eb-91b5-e08f92cd345a.png">



## Future Update 
1. Email OTP verification while signing up.
2. Order Confirmation and Status update Email
3. Payment Options
  
