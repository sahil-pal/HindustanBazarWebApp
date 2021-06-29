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

## Features + How it looks like 
1. Authentication and Authorization using Spring security

<img width="1440" alt="Screenshot 2021-06-29 at 11 21 02 AM" src="https://user-images.githubusercontent.com/69889824/123749476-1a8bca00-d8d3-11eb-9b6f-c817961273b2.png">


2. Homepage : 
   a) Offer of the day Section - Dynamically updates the offers according to days of the week. 
   <img width="1440" alt="Screenshot 2021-06-29 at 12 04 49 PM" src="https://user-images.githubusercontent.com/69889824/123749500-21b2d800-d8d3-11eb-90bd-ca739b9ee7d0.png">
   
   b) Most popular Section - Product shown on the basis of rating according to selected location or by default all over the regions.
   <img width="1440" alt="Screenshot 2021-06-29 at 12 05 00 PM" src="https://user-images.githubusercontent.com/69889824/123749514-25def580-d8d3-11eb-8386-cef56e82a161.png">
   
   c) Brand Store Section - Get all the products of a particular brand.
   <img width="1440" alt="Screenshot 2021-06-29 at 12 12 17 PM" src="https://user-images.githubusercontent.com/69889824/123749633-43ac5a80-d8d3-11eb-8b9c-94e175ac9a26.png">
   
   d) Recipe Revision Section - Recipe Blogging platform where you can add your recipe and view other bloggers recipe and you can directly add all the items required for that recipe to your cart
   
  
3. Shop by category :
  
  i)You can explore five categories here - 
    a) Fruits & vegetables 
    b) Food grains, Oil and Masala
    c) Beverages
    d) Snacks & Branded Food
    e) Egg, Meat and Fish
  
  ii)The category page provides you the filter to organise your view and easy selection -
    a) Popularity (By default)
    b) Price - high to low
    c) Price - Low to High
    d) Alphabetical
    e) Saving - low to high
    f) Saving - High to low
    
    <img width="1440" alt="Screenshot 2021-06-29 at 12 07 43 PM" src="https://user-images.githubusercontent.com/69889824/123750543-56735f00-d8d4-11eb-9d5e-54c392c06548.png">
  
  iii) You can't add greater quantity of product than the available quantity
  
  iv) If quantity is zero in the Stocks you get the options to notify on the email
  <img width="724" alt="Screenshot 2021-06-29 at 12 15 32 PM" src="https://user-images.githubusercontent.com/69889824/123750036-b9182b00-d8d3-11eb-8f96-b5166e880e0f.png">
  
  v) By clicking on view product -> A detailed page describing the product is opened, where the user can post their reviews also.
  <img width="1440" alt="Screenshot 2021-06-29 at 12 16 32 PM" src="https://user-images.githubusercontent.com/69889824/123750146-dcdb7100-d8d3-11eb-8a6a-6bc6c59266d1.png">

  
4. Location button :
   a) By default "All over NCR" is set as the user location
   b) You can update this location by choosing from drop down 
   c) Once you select a location, now the offers as well as the product in the category will be shown according to the selected location
   
5. Search Bar :
   The user can search any product or brand.
   <img width="1440" alt="Screenshot 2021-06-29 at 12 08 29 PM" src="https://user-images.githubusercontent.com/69889824/123750164-e238bb80-d8d3-11eb-9c68-4920a83ec1a4.png">

6. My page button : 
   a) You can view your profile details.
   <img width="1440" alt="Screenshot 2021-06-29 at 12 08 36 PM" src="https://user-images.githubusercontent.com/69889824/123750221-f4b2f500-d8d3-11eb-9d92-e76cec1e6353.png">
   
   b) See order histroy
   <img width="1440" alt="Screenshot 2021-06-29 at 12 09 32 PM" src="https://user-images.githubusercontent.com/69889824/123750248-ff6d8a00-d8d3-11eb-8625-5ab6738770c4.png">
   
   c) View posted reviews
   <img width="1440" alt="Screenshot 2021-06-29 at 12 08 55 PM" src="https://user-images.githubusercontent.com/69889824/123750265-06949800-d8d4-11eb-9239-b5353de18835.png">
   
   ** As a Seller 
   a) All the functionality as a buyer.
   b) View reviews posted on his products.
   <img width="1440" alt="Screenshot 2021-06-29 at 12 10 44 PM" src="https://user-images.githubusercontent.com/69889824/123750279-0b594c00-d8d4-11eb-83b3-d2a962cfad26.png">
   
   c) CRUD operations on the product list in their shop stocks.
   <img width="1440" alt="Screenshot 2021-06-29 at 12 10 53 PM" src="https://user-images.githubusercontent.com/69889824/123750293-0f856980-d8d4-11eb-83d5-712c17d6bab1.png">
   
   d) Update status of products ordered from their shop.
 
7. Cart button : 
  a) Shows all the product added to cart
  ![Uploading Screenshot 2021-06-29 at 12.09.14 PM.png…]()
  
  b) Delete product from cart
  c) Payment options : Netbanking, Card, UPI or COD 
  d) On clicking buy now : User's cart get updated, Seller get the Order, User's Order list get updated and the Stocks of the store gets updated.
  <img width="1440" alt="Screenshot 2021-06-29 at 12 09 24 PM" src="https://user-images.githubusercontent.com/69889824/123750340-1d3aef00-d8d4-11eb-8673-6476731d7e26.png">
  

 
  
  
  
  
