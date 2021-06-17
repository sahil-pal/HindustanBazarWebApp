<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <%@ include file="header.jsp" %>
    <!--  This file has been downloaded from bootdey.com    @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="resources/css/Productdetail.css">
</head>
<body>

<div class="container bootdey" style="height:900px;">
<div class="col-md-12">

<section class="panel">
      <div class="panel-body">
          <div class="col-md-6" style="background-color:grey;">
              <div class="pro-img-details">
                  <img src="${product.getProductImg() }" alt="product-image/${product.getProductName() }">
              </div>
          </div>
          <div class="col-md-6">
              <h4 class="pro-d-title">
                  <a href="#" class="">
                      ${product.getProductName() }
                  </a>
              </h4>
              <p>
                  Product by - ${product.getProductBrand() } Pvt Ltd. <br>
                  Seller Shop : ${seller.getSellerShopName() } <br>
                  Seller Shop Location : ${seller.getSellerShopLocation() }<br>
              </p>
              <div class="product_meta">
                  <span class="posted_in"> <strong>Category:</strong> <a rel="tag" href="#">${product.getProductCategory() }</a></span>
                  <span class="posted_in"> <strong>Discount%:</strong> <a rel="tag" href="#">${product.getProductDiscount() }</a></span>
                  <span class="posted_in"> <strong>Rating:</strong> <a rel="tag" href="#">${product.getProductRating() }</a></span>
                  <span class="posted_in"> <strong>Your Feedback : </strong> 
                    <textarea form="feedbackform" name="feedback" rows="4" cols="80" placeholder="Enter your views here..."></textarea>
                  </span>
					
              </div>
              <form action="sendFeedback" method="post" id="feedbackform">
              	  <input type="hidden" name="ProductID" value="${product.getProductID() }" />
              	  <input type="hidden" name="SellerID" value="${product.getProductSellerID() }" />
              	  <button class="btn btn-round btn-danger" type="submit"><i class="fa fa-shopping-cart"></i> send feedback</button>
              </form>
              <br>
              <div class="m-bot15"> <strong>Price : </strong> <span class="amount-old">₹ ${product.getProductPrice() }</span>  <span class="pro-price">₹ ${product.getProductFinalPrice()}</span></div>
              <div class="m-bot15"> <strong>Available Qty :</strong> <span class="pro-price">  ${product.getProductQtyAvailable()}</span></div>
              <div class="m-bot15"> <strong>ExpressDelivery :</strong> <span class="pro-price"> ${product.getExpressDeliveryStatus() }</span></div><br>
              <div class="form-group">
              </div>
              <p>
              <c:if test="${product.getProductQtyAvailable() == 0}">
               <button class="btn btn-round btn-danger" type="button"><i class="fas fa-envelope"></i> NOTIFY ME!</button>                   
        	  </c:if>
              <c:if test="${product.getProductQtyAvailable() > 0}">
              <div class="row">
              <form action="checkQuantity" method="post">
              <div class="row">
       			<input type="hidden" name="ProductID" value="${product.getProductID()}" />
       		    <input type="hidden" name="SellerID" value="${product.getProductSellerID() }" />
       			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" name="enteredQuantity" placeholder=" Enter Qty " style="padding:margin-left:40px; padding:left:10px; height:38px; width:120px;" />
                <button type = "submit" class = "btn-cart" style="padding:0px; height:40px;"> &nbsp;&nbsp;&nbsp;Add to Cart
                <span><i class = "fas fa-shopping-cart"></i></span>
                </button>
              </div>
              </form>
              <h4 style="text-align:center; color:red;">${alertMessage }</h4>
              </div>
              </c:if>
              </p>
                
             </div>
      </div>
  </section>
  </div>
  </div>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
</body>
</html>
<%@ include file="footer.jsp" %>