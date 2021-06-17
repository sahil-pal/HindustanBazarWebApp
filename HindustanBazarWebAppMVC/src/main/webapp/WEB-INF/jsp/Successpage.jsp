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
</header>
<title>Hindustan Bazar | Order Confirmation!</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat&display=swap');

body {
    background-color: #ffe8d2;
    font-family: 'Montserrat', sans-serif
}

.card {
    border: none
}

.logo {
    background-color: #eeeeeea8
}

.totals tr td {
    font-size: 13px
}

.footer {
    background-color: #eeeeeea8
}

.footer span {
    font-size: 12px
}

.product-qty span {
    font-size: 12px;
    color: #dedbdb
}
</style>
<body>

<div class="container mt-5 mb-5">
    <div class="row d-flex justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="text-left logo p-2 px-5"> <img src="resources/images/logo2.png" width="120" height="60"> </div>
                <div class="invoice p-5">
                    <h5>Your order Confirmed!</h5> 
                    <c:if test="${Role == 'Buyer' }">
                    <span class="font-weight-bold d-block mt-4">Hello, ${buyer.getFullName() }</span> <span>You order has been confirmed and will be delivered in next two days!</span>
                    <div class="payment border-top mt-3 mb-3 border-bottom table-responsive">
                        <table class="table table-borderless">
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="py-2"> <span class="d-block text-muted">Order Date</span> <span>${date }</span> </div>
                                    </td>
                                    <td>
                                        <div class="py-2"> <span class="d-block text-muted">Order No</span> <span>XYZ</span> </div>
                                    </td>
                                    <td>
                                        <div class="py-2"> <span class="d-block text-muted">Payment</span> <span><img src="https://img.icons8.com/color/48/000000/mastercard.png" width="20" />${paymentMethod }</span> </div>
                                    </td>
                                    <td>
                                        <div class="py-2"> <span class="d-block text-muted">Delivery Address</span> <span>House no. ${buyer.getHousenumber() }, ${buyer.getCity() }, State :  ${buyer.getState() }</span> </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    </c:if>
                    
                    <c:if test="${Role == 'Seller' }">
                    <span class="font-weight-bold d-block mt-4">Hello, ${seller.getSellerName() }</span> <span>You order has been confirmed and will be delivered in next two days!</span>
                    <div class="payment border-top mt-3 mb-3 border-bottom table-responsive">
                        <table class="table table-borderless">
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="py-2"> <span class="d-block text-muted">Order Date</span> <span>${date }</span> </div>
                                    </td>
                                    <td>
                                        <div class="py-2"> <span class="d-block text-muted">Order No</span> <span>XYZ</span> </div>
                                    </td>
                                    <td>
                                        <div class="py-2"> <span class="d-block text-muted">Payment</span> <span><img src="https://img.icons8.com/color/48/000000/mastercard.png" width="20" /> ${paymentMethod }</span> </div>
                                    </td>
                                    <td>
                                        <div class="py-2"> <span class="d-block text-muted">Delivery Address</span> <span>${seller.getSellerShopName() }, ${seller.getSellerShopLocation() }</span> </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    </c:if>
                
                    <div class="row d-flex justify-content-end">
                        <div class="col-md-5">
                            <table class="table table-borderless">
                                <tbody class="totals">
                                    <tr>
                                        <td>
                                            <div class="text-left"> <span class="text-muted">Subtotal</span> </div>
                                        </td>
                                        <td>
                                            <div class="text-right"> <span>INR. ${Subtotal}</span> </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="text-left"> <span class="text-muted">Delivery Charges</span> </div>
                                        </td>
                                        <td>
                                            <div class="text-right"> <span>INR. 50</span> </div>
                                        </td>
                                    </tr>
                                    <tr class="border-top border-bottom">
                                        <td>
                                            <div class="text-left"> <span class="font-weight-bold">Total Amount</span> </div>
                                        </td>
                                        <td>
                                            <div class="text-right"> <span class="font-weight-bold">INR. ${Total }</span> </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <p>We will be sending order confirmation email when the item is ready to deliver !</p>
                    <p class="font-weight-bold mb-0">Thanks for shopping with us!</p> <span>Hindustan Bazar Team</span>
                    <br>
                    <a href="Orders" style="text-align:center;">Track Orders !</a>
                </div>
                <div class="d-flex justify-content-between footer p-3"> <span>12 June, 2020</span> </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>