<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<header>
<img src="resources/images/logo2.png" width="100%" style="border:2px solid black;">
<br>
<hr>
</header>
<title>Hindustan Bazar | Cart page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/Cart.css">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">

</head>
<body>

<div class="container mt-5 p-3 rounded cart">
    <div class="row no-gutters">
        <div class="col-md-8">
            <div class="product-details mr-2">
                <div class="d-flex flex-row align-items-center"><i class="fa fa-long-arrow-left"></i><span class="ml-2"><a href="Homepage">Continue Shopping</a></span></div>
                <hr>
                <h3 class="mb-0">HindustanBazar Basket</h3>
                <div class="d-flex justify-content-between"><span>You have ${cartsize} items in your cart</span>
                    <div class="d-flex flex-row align-items-center"><span class="text-black-50">Sort by:</span>
                        <div class="price ml-2"><span class="mr-1">price</span><i class="fa fa-angle-down"></i></div>
                    </div>
                </div>
                
                 <c:forEach items="${cartProducts }" var="cart">
                <div class="d-flex justify-content-between align-items-center mt-3 p-2 items rounded">
                    <div class="d-flex flex-row"><img class="rounded" src="${cart.getProductImg() }" width="40">
                        <div class="ml-2"><span class="font-weight-bold d-block">${cart.getProductName() }</span><span class="spec">${cart.getProductBrand() } | ${cart.getProductCategory() } | Rating : ${cart.getProductRating() }</span></div>
                    </div>
                    <div class="d-flex flex-row align-items-center"><span class="d-block">Qty Selected : ${cart.getQtySelected() }</span><span class="d-block ml-5 font-weight-bold">INR. ${cart.getProductFinalPrice()}&nbsp;&nbsp;</span>
                    	<form action="removeSingleProductfromCart" method="post">
                    	<input type="hidden" name="ProductID" value="${ cart.getProductID()}" />
                    	<button type="submit"><i class="fa fa-trash-o ml-3 text-black-50" style="text-align:center;"></i></button>
                    	</form>
                    </div>
                </div>
                 </c:forEach>
            	</div>
          
        </div>
        <div class="col-md-4">
            <div class="payment-info">
            	 <div class="filter">
                	<form method="post" action="applypaymentFilter" >
                	<div class="row">
    					&nbsp;&nbsp;&nbsp;&nbsp;<h5>Payment Method :&nbsp; </h5>
    					<select name='paymentType' onchange='if(this.value != 0) { this.form.submit(); }'>
    					<option value='#'>Select from here</option>
        				<option value='Card Payment'>Card Payment</option>
       			   		<option value='UPI'>UPI</option>
         				<option value='Cash on Delivery'>Cash on delivery</option>
   						</select>
   						</div>
					</form>
				</div>
				<form method="post" action="BuyProducts">
				<c:if test="${method == 'Card Payment' }">
                <div class="d-flex justify-content-between align-items-center"><span>Card details</span><img class="rounded" src="https://i.imgur.com/WU501C8.jpg" width="30"></div><span class="type d-block mt-3 mb-1">Card type</span><label class="radio"> <input type="radio" name="card" value="payment" checked> <span><img width="30" src="https://img.icons8.com/color/48/000000/mastercard.png" /></span> </label>
                <label class="radio"> <input type="radio" name="card" value="payment"> <span><img width="30" src="https://img.icons8.com/officel/48/000000/visa.png" /></span> </label>
                <label class="radio"> <input type="radio" name="card" value="payment"> <span><img width="30" src="https://img.icons8.com/ultraviolet/48/000000/amex.png" /></span> </label>
                <label class="radio"> <input type="radio" name="card" value="payment"> <span><img width="30" src="https://img.icons8.com/officel/48/000000/paypal.png" /></span> </label>
                <div><label class="credit-card-label">Name on card</label><input type="text" class="form-control credit-inputs" placeholder="Name"></div>
                <div><label class="credit-card-label">Card number</label><input type="text" class="form-control credit-inputs" placeholder="0000 0000 0000 0000"></div>
                <div class="row">
                    <div class="col-md-6"><label class="credit-card-label">Date</label><input type="text" class="form-control credit-inputs" placeholder="12/24"></div>
                    <div class="col-md-6"><label class="credit-card-label">CVV</label><input type="text" class="form-control credit-inputs" placeholder="342"></div>
                </div>
                </c:if>
                <c:if test="${method == 'UPI' }">
                <div><label class="credit-card-label">UPI user ID</label><input type="text" class="form-control credit-inputs" placeholder="Name"></div>
                <div><label class="credit-card-label">UPI Transaction Password</label><input type="password" class="form-control credit-inputs" placeholder="****"></div>
                </c:if>
                <c:if test="${method == 'Cash on Delivery' }">
                	<div><label class="credit-card-label" style="color:red; font-size:12px;">CASH ON DELIVERY SELECTED!</label></div>
                	<br>
                	<br>
                </c:if>
                <hr class="line">
                <div class="d-flex justify-content-between information"><span>Subtotal</span><span>INR. ${TotalAmount }</span></div>
                <div class="d-flex justify-content-between information"><span>Shipping</span><span>INR. 50</span></div>
                <div class="d-flex justify-content-between information"><span>Total(Incl. taxes)</span><span>INR. ${TotalAmount + 50 }</span>
                <input type="hidden" name="paymentType" value="${method }"/>
                <input type="hidden" name="Subtotal" value="${TotalAmount }"/>
                 <input type="hidden" name="totalItems" value="${cartsize }"/>
                <input type="hidden" name="Total" value=" ${TotalAmount + 50 }"/>
                </div><button class="btn btn-primary btn-block d-flex justify-content-between mt-3" type="submit">
                <span>INR. ${TotalAmount + 50 }</span>
                <span>Checkout<i class="fa fa-long-arrow-right ml-1"></i>
                </span></button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
