<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ include file="header.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/dbed6b6114.js" crossorigin="anonymous" type="text/javascript"></script>
<link rel="stylesheet" href="resources/css/Categorypage.css">
</head>
<body>
	
	        <div class = "products">
            <div class = "container">
                <h1 class = "lg-title">OFFERS SECTION </h1>
                <p class = "text-light"><i>OFFER NAME : ${offerName}</i>
                						<h4 style="color:red; text-align:center;">${alertMessage}</h4>
                </p>
                
                <div class = "product-items" style="margin-top:65px;">
                    <!-- single product -->
                     <c:forEach items="${ProductList }" var="product">
                    <div class = "product">
                        <div class = "product-content">
                            <div class = "product-img">
                                <img src = "${product.getProductImg() }" alt = "product image">
                            </div>
                            <div class = "product-btns">
                            	<form action="addtowishlistOffer" method="post">
                            	<input type="hidden" name="ProductID"  value="${product.getProductID()}" />
                            	<input type="hidden" name="SellerID" value="${product.getProductSellerID() }" />
                            	<input type="hidden" name="keyword" value="${offerName}"/>
                                <button type = "submit" class = "btn-cart"> add to wishlist
                                    <span><i class = "fas fa-plus"></i></span>
                                </button>
                                </form>
                                <button type = "button" class = "btn-buy"><a href="view/${product.getProductID()}/${product.getProductSellerID() } ">view product</a>
                                    <span><i class = "fas fa-shopping-cart"></i></span>
                                </button>
                            </div>
                        </div>

                        <div class = "product-info">
                            <div class = "product-info-top">
                                <h2 class = "sm-title">${product.getProductBrand() }</h2>
                                <div class = "rating">
                                    <span><i class = "fas fa-star"> &nbsp; ${product.getProductRating() }</i></span>
                                </div>
                            </div>
                            <a href = "#" class = "product-name">${product.getProductName() }</a>
                            <hr>
                            <p class = "product-price">₹ ${product.getProductPrice() }</p>
                            <p class = "product-price">₹ ${product.getProductFinalPrice()}/${product.getProductperweight()}${product.getProductUOM()} |<i style="text-align:right;">&nbsp;Savings: <span style="color:red;">${product.getProductDiscount()}%</span></i></p>
                            <p> Available Qty : <span style="color:red;">${product.getProductQtyAvailable()}</span> X  ${product.getProductperweight()}${product.getProductUOM()}</p>
                            <p> ExpressDelivery : ${product.getExpressDeliveryStatus() }</p>
                            <hr>
                            
                            <div class = "action-btns">
                           <c:if test="${product.getProductQtyAvailable() == 0}">
                       			<form action="quantityCheckOffer" method="post">
                       			<input type="hidden" name="message" placeholder=" Enter Qty " value="Product Availability alert will be sent to your registered email-id !" />
                       			<input type="hidden" name="ProductID" value="${product.getProductID()}" />
                       			<input type="hidden" name="keyword" value="${offerName}"/>
       							<input type="hidden" name="SellerID" value="${product.getProductSellerID() }" />
                                <button type = "submit" class = "btn-cart" style="padding:0px; height:40px;"> NOTIFY ME!
                                    <span><i class="fas fa-envelope"></i></span>
                                </button>
                                </form>
                                
        					</c:if>
        					<c:if test="${product.getProductQtyAvailable() > 0}">
       							<form action="quantityCheckOffer" method="post" >
       							<div class="row">
       							<input type="hidden" name="ProductID" value="${product.getProductID()}" />
       							<input type="hidden" name="SellerID" value="${product.getProductSellerID() }" />
       							<input type="hidden" name="keyword" value="${offerName}"/>
                       			<input type="text" name="message" placeholder=" Enter Qty "  />
                                <button type = "submit" class = "btn-cart" style="padding:0px; height:40px;"> Add to Cart
                                 <span><i class = "fas fa-shopping-cart"></i></span>
                                </button>
                                </div>
                                </form>
                            </c:if>
                            </div>
                            
                        </div>

                        <div class = "off-info">
                            <h2 class = "sm-title">${product.getProductType()}</h2>
                        </div>
                    </div>
                    <!-- end of single product -->  
                    </c:forEach>
                    </div>
                     <p style="font-size:16px; text-align:center;"><i>-- That's all folks! --</i></p>
                    </div></div>
                    
                      
                    
</body>
<%@ include file="footer.jsp" %>
</html>