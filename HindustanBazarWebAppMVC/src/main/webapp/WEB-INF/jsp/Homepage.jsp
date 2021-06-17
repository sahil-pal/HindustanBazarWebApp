<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="resources/css/Home.css">
</head>

<body style="margin-left:0px; margin-top:1px;">

<main>
	<h1>${category }</h1>
		<section>
		  <h2>Offer of the day!</h2>
            <br>
            <div class="slider-frame" style="height:625px;">
                <div class="slide-images" style="width:3600px;">
                
                <div class="image-container">
                    <img src="${offerList.get(0).getOfferImg() }" alt="This is an image" width="100%" height="35%" />
                    <h3 style="text-align:left; padding:20px;"> ${offerList.get(0).getOfferName() }&nbsp; 
                    <form action="searchOffer" method="post" style="display:inline;">
						 <input type="hidden" class="searchTerm" name="keyword" value="${offerList.get(0).getOfferName()}"/>
     			 		<button class="offer-btn" type="submit">GRAB NOW!</button>
     			 		</form>
                    </h3>
                    
                    <img src="${offerList.get(1).getOfferImg() }" alt="This is an image" width="100%" height="35%"/>
                    <h3 style="text-align:left; padding:20px;"> ${offerList.get(1).getOfferName() }&nbsp; 
                    <form action="searchOffer" method="post" style="display:inline;">
						 <input type="hidden" class="searchTerm" name="keyword" value="${offerList.get(1).getOfferName()}"/>
     			 		<button class="offer-btn" type="submit">GRAB NOW!</button>
     			 		</form>
                    </h3>
                </div>
                <div class="image-container">
                    <img src="${offerList.get(2).getOfferImg() }" alt="This is an image" width="100%" height="85%" />
                    <h3 style="text-align:left; padding:20px;"> ${offerList.get(2).getOfferName() }&nbsp; 
                    <form action="searchOffer" method="post" style="display:inline;">
						 <input type="hidden" class="searchTerm" name="keyword" value="${offerList.get(2).getOfferName()}"/>
     			 		<button class="offer-btn" type="submit">GRAB NOW!</button>
     			 		</form>
                    </h3>
                </div>
                <div class="image-container">
                    <img src="${offerList.get(3).getOfferImg() }" alt="This is an image" width="100%" height="35%" />
                    <h3 style="text-align:left; padding:20px;"> ${offerList.get(3).getOfferName() }&nbsp; 
                    <form action="searchOffer" method="post" style="display:inline;">
						 <input type="hidden" class="searchTerm" name="keyword" value="${offerList.get(3).getOfferName()}"/>
     			 		<button class="offer-btn" type="submit">GRAB NOW!</button>
     			 		</form>
                    </h3>
                    
                    <img src="${offerList.get(4).getOfferImg() }" alt="This is an image" width="100%" height="35%"/>
                    <h3 style="text-align:left; padding:20px;"> ${offerList.get(4).getOfferName() }&nbsp; 
                    <form action="searchOffer" method="post" style="display:inline;">
						 <input type="hidden" class="searchTerm" name="keyword" value="${offerList.get(4).getOfferName()}"/>
     			 		<button class="offer-btn" type="submit">GRAB NOW!</button>
     			 		</form>
                    </h3>
                </div>
                
                
                </div>
            </div>
		</section>

		<section>
			<h2> Most Popular </h2>
               <br>
			 <div id="slider">
                    <input type="radio" name="slider" id="slide1" checked>
                    <input type="radio" name="slider" id="slide2">
                    <input type="radio" name="slider" id="slide3">
                    <input type="radio" name="slider" id="slide4">
                         <div id="slides">
                           <div id="overflow">
                              <div class="inner">
                                   <div class="slide slide_1">
                                        <div class="slide-content" style="width:1100px; height:650px;">
                                             <table style="width:100% height:100%">
                                                  <tr>
                                                  <th><tr><a href="view/${ProductList.get(0).getProductID()}/${ProductList.get(0).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(0).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(1).getProductID()}/${ProductList.get(1).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(1).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(2).getProductID()}/${ProductList.get(2).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(2).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(3).getProductID()}/${ProductList.get(3).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(3).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(4).getProductID()}/${ProductList.get(4).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(4).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(5).getProductID()}/${ProductList.get(5).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(5).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  </tr>
                                             </table>
                                        </div>
                                   </div>
                                   <div class="slide slide_2">
                                       <div class="slide-content" style="width:1100px; height:650px;">
                                             <table style="width:100% height:100%">
                                                  <tr>
                                                  <th><tr><a href="view/${ProductList.get(6).getProductID()}/${ProductList.get(6).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(6).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(7).getProductID()}/${ProductList.get(7).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(7).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(8).getProductID()}/${ProductList.get(8).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(8).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(9).getProductID()}/${ProductList.get(9).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(9).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(10).getProductID()}/${ProductList.get(10).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(10).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(11).getProductID()}/${ProductList.get(11).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(11).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  </tr>
                                             </table>
                                        </div>
                                   </div>
                                   <div class="slide slide_3">
                                        <div class="slide-content" style="width:1100px; height:650px;">
                                             <table style="width:100% height:100%">
                                                  <tr>
                                                  <th><tr><a href="view/${ProductList.get(12).getProductID()}/${ProductList.get(12).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(12).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(13).getProductID()}/${ProductList.get(13).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(13).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(14).getProductID()}/${ProductList.get(14).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(14).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(15).getProductID()}/${ProductList.get(15).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(15).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(16).getProductID()}/${ProductList.get(16).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(16).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(17).getProductID()}/${ProductList.get(17).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(17).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  </tr>
                                             </table>
                                        </div>
                                   </div>
                                   <div class="slide slide_4">
                                       <div class="slide-content" style="width:1100px; height:650px;">
                                             <table style="width:100% height:100%">
                                                  <tr>
                                                  <th><tr><a href="view/${ProductList.get(18).getProductID()}/${ProductList.get(18).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(18).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(19).getProductID()}/${ProductList.get(19).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(19).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(20).getProductID()}/${ProductList.get(20).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(20).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(21).getProductID()}/${ProductList.get(21).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(21).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(22).getProductID()}/${ProductList.get(22).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(22).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  <th><tr><a href="view/${ProductList.get(23).getProductID()}/${ProductList.get(23).getProductSellerID() } "><img class="img-popular" src="${ProductList.get(23).getProductImg() }" alt="This is an image" width="50%" height="44%" /></tr></th></a>
                                                  </tr>
                                             </table>
                                    </div>
                              </div>
                         </div>
                     </div>
                    </div>
                    <div id="controls">
                         <label for="slide1"></label>
                         <label for="slide2"></label>
                         <label for="slide3"></label>
                         <label for="slide4"></label>
                    </div>
                    <div id="bullets">
                         <label for="slide1"></label>
                         <label for="slide2"></label>
                         <label for="slide3"></label>
                         <label for="slide4"></label>
                    </div>
               </div>
		</section>

		<section style="height:900px;">
			<h2>BRAND STORE </h2>
			   <form action="searchOffer" method="post" style="display:inline;">
				  <input type="hidden" class="searchTerm" name="keyword" value="Aashirvaad"/>
     			  <button class="offer-btn" type="submit"><img class="img-brand" src="resources/product/brands/Aashirvaad.png" alt="This is an image"></button>
     			</form>
     			<form action="searchOffer" method="post" style="display:inline;">
				  <input type="hidden" class="searchTerm" name="keyword" value="Fortune"/>
     			  <button class="offer-btn" type="submit"><img class="img-brand" src="resources/product/brands/Fortune.png" alt="This is an image"  /></button>
     			</form>
     			<form action="searchOffer" method="post" style="display:inline;">
				  <input type="hidden" class="searchTerm" name="keyword" value="Fresho"/>
     			  <button class="offer-btn" type="submit"><img class="img-brand" src="resources/product/brands/Fresho.png" alt="This is an image"  /></button>
     			</form>
     			<form action="searchOffer" method="post" style="display:inline;">
				  <input type="hidden" class="searchTerm" name="keyword" value="India gate"/>
     			  <button class="offer-btn" type="submit"><img class="img-brand" src="resources/product/brands/India gate.png" alt="This is an image"  /></button>
     			</form>
               
			<br><br>
            <h4 style="border:1px solid black; width:450px; margin-left:500px; margin-right:300px; background-color:orange;">TAP ON THE BRAND TO EXPLORE !</h4>
			<br>
			   <form action="searchOffer" method="post" style="display:inline;">
				  <input type="hidden" class="searchTerm" name="keyword" value="Tata Products"/>
     			  <button class="offer-btn" type="submit"><img class="img-brand" src="resources/product/brands/Tata Products.png" alt="This is an image"  /></button>
     			</form>
     			<form action="searchOffer" method="post" style="display:inline;">
				  <input type="hidden" class="searchTerm" name="keyword" value="Tasties"/>
     			  <button class="offer-btn" type="submit"><img class="img-brand" src="resources/product/brands/Tasties.png" alt="This is an image"  /></button>
     			</form>
     			<form action="searchOffer" method="post" style="display:inline;">
				  <input type="hidden" class="searchTerm" name="keyword" value="Nescafe"/>
     			  <button class="offer-btn" type="submit"><img class="img-brand" src="resources/product/brands/Nescafe.png" alt="This is an image"  /></button>
     			</form>
     			<form action="searchOffer" method="post" style="display:inline;">
				  <input type="hidden" class="searchTerm" name="keyword" value="Mothers Receipe"/>
     			  <button class="offer-btn" type="submit"><img class="img-brand" src="resources/product/brands/Mothers Receipe.png" alt="This is an image" /></button>
     			</form>
			    <br><br>
		</section>


        <section>
            <br>
            <h2>Recipe Revision</h2>
            <br>
            <div class="slider-frame">
                <div class="slide-images">
                <div class="image-container">
                    <img src="images/Homepage-Design.jpg" alt="This is an image" width="30%" />
                    <h3> CLICK TO ADD YOUR RECIPE </h3>
                </div>
                <div class="image-container">
                    <img src="images/Homepage-Design.jpg" alt="This is an image" width="80%" />
                    <h3> Recipe 1 </h3>
                </div>
                <div class="image-container">
                     <img src="images/Homepage-Design.jpg" alt="This is an image" width="80%" />
                     <h3> Recipe 2 </h3>
                </div>
                <div class="image-container">
                     <img src="images/Homepage-Design.jpg" alt="This is an image" width="80%" />
                     <h3> Recipe 3 </h3>
                </div>
                </div>
            </div>
        </section>
	</main>
	
<%@ include file="footer.jsp" %>
</body>
</html>