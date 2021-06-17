<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<header>
<img src="resources/images/logo2.png" width="100%" style="border:2px solid black;">
<br>
<hr>
</header>
<meta charset="UTF-8">
<title>Hindustan Bazar | Seller zone</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/Cart.css">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</head>
<body>

<div class="container mt-5 p-3 rounded cart">
    <div class="row no-gutters" style="width:1200px; height:1000px;">
        <div class="col-md-8" style="width:1200px;">
            <div class="product-details mr-2" style="width:1130px;">
                <div class="d-flex flex-row align-items-center"><i class="fa fa-long-arrow-left"></i><span class="ml-2"><a href="Home">Back to Profile</a></span></div>
                <hr>
                <h3 class="mb-0">Seller's Product Section</h3>
                <div class="d-flex justify-content-between"><span>You have <span style="color:blue;">${storesize}</span> items in your Hindustan Bazar store !
                <br><span style="color:red;">${alertMessage }</span>
                </span>
                    <div class="d-flex flex-row align-items-center"><span class="text-black-50">
                    <form action="addproduct" method="post">
                    <input type="hidden" name="add" value="yes"/>
					<button type = "submit" class = "btn-cart" style="padding:0px; height:40px;">ADD NEW PRODUCT</button></span>
                        <div class="price ml-2"><span class="mr-1"></span></div>
                     </form>
                    </div>
                </div>
                
                <c:if test="${show == 'yes'}">
                 <%@ include file="addProduct.jsp" %>
                
                </c:if>
                
                <c:if test="${show != 'yes'}">
                <c:forEach items="${SellerProducts }" var="product">
                <div class="d-flex justify-content-between align-items-center mt-3 p-2 items rounded">
                    <div class="d-flex flex-row"><img class="rounded" src="${product.getProductImg() }" width="40">
                        <div class="ml-2"><span class="font-weight-bold d-block">ProductID: <span style="color:red;">${product.getProductID() }</span>
                        <br> ${product.getProductName() }</span><span class="spec">${product.getProductBrand() } | ${product.getProductCategory() } | Rating : ${product.getProductRating() } | UOM : ${product.getProductUOM()}</span></div>
                    </div>
                    <div class="d-flex flex-row align-items-center">
                    <span class="d-block">Qty in Stocks : <span style="color:blue;">${product.getProductQtyAvailable() }</span>
                    <form action="quantityUpdateSeller" method="post" >
       						<div class="row">
       						<input type="hidden" name="ProductID" value="${product.getProductID()}" />
       						<input type="hidden" name="SellerID" value="${product.getProductSellerID() }" />
                  			<input type="text" name="qty" placeholder=" Enter updated Qty "  />
                            <button type = "submit" class = "btn-cart" style="padding:0px; height:40px;">EDIT QTY
                            </button>
                            </div>
                    </form>
                    </span>
                    <span class="d-block ml-5 font-weight-bold">UNIT PRICE : INR <span style="color:red;">${product.getProductPrice()}&nbsp;&nbsp;
                    <form action="priceUpdateSeller" method="post" >
       						<div class="row">
       						<input type="hidden" name="ProductID" value="${product.getProductID()}" />
       						<input type="hidden" name="SellerID" value="${product.getProductSellerID() }" />
                  			<input type="text" name="price" placeholder=" Enter updated price "  />
                            <button type = "submit" class = "btn-cart" style="padding:0px; height:40px;">UPDATE 
                            </button>
                            </div>
                    </form>
                    </span></span>
                    	
                    <form action="removeProductfromSeller" method="post">
                    	<input type="hidden" name="ProductID" value="${ product.getProductID()}" />
                    	<input type="hidden" name="SellerID" value="${ product.getProductSellerID()}" />
                   		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   		<button style="height:50px; width:55px;" type="submit"><i class="fa fa-trash-o ml-3 text-black-50" style="text-align:left;" ></i></button>
                   	</form>
                    </div>
                </div>
                 </c:forEach>
                 </c:if>
            	</div>
          </div>
        </div>
</div>
</body>
</html>