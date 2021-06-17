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
<img src="resources/images/logo2.png" width="100%">
</header>
<title>Hindustan Bazar | User Dashboard</title>
<!-- icon at title bar -->
<link rel="icon" type="image/png" href="resources/images/icon.png">
<link rel="apple-touch-icon" type="image/png" href="resources/images/icon.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/header.css">
<!-- icons-->
<link rel="stylesheet" href="resources/fontawesome-free-5.15.3-web/css/all.css">
<!-- header-->
<link rel="stylesheet" href="resources/css/Userhomepage.css">
</head>

<body style="margin:1px;">


<!-- The sidebar -->
<div class="sidebar">
  <a class="active" href="Home">Profile</a>
  <a href="Homepage">Explore Products!</a>
  <a href="Cart">View cart</a>
  <a href="wishlist">My wishlist</a>
  <a href="Orders">My Orders</a>
  <a href="Feedbacks">Feedback Posted</a>
  <security:authorize access="hasRole('SELLER')">
 	<!-- Add a link to point to /leaders ... this is for the managers -->
 	<a href="${pageContext.request.contextPath}/receivedFeedbacks">Received Feedbacks</a>
	<a href="${pageContext.request.contextPath}/SellerProducts">My Products</a>
 </security:authorize>
</div>

<!-- Page content -->
<div class="content">
  <h2>  User: <security:authentication property="principal.username"/> </h2>
  <h2>  Roles: <security:authentication property="principal.authorities"/></h2>
  
  <!-- method get will not work here -->
  <form:form action="logout" method="post" style="height:20px;">
  <input class="logout-btn" type="submit" value="Logout"/>
  </form:form>
  
  <hr>
  <br>
 <div class="card" style="border:2px solid black; width:1100px height:250px;">
  <div class="card-body" style="width:1420px; padding:5px;">
    <h4 class="card-title" style="font-size:25px;">Profile Page</h4>
    <p class="card-text"> 
    <c:if test="${Role == 'Buyer' }">
		<p>
		Full name : ${buyer.getFullName() }<br><br>
		Phone number : ${buyer.getPhonenumber() }<br><br>
		Email id :  ${buyer.getEmail() }<br><br>
		
		<b><legend>Address</legend></b><br>
		House Number :  ${buyer.getHousenumber() }<br><br>
		City :  ${buyer.getCity() }<br><br>
		State :  ${buyer.getState() }<br><br>
		
		Hindustan Bazar credit Point :  ${buyer.getHbcredits() }<br><br>
		</p>
	
	</c:if>
	
	<c:if test="${Role == 'Seller' }">
		<p>
		Full name : ${seller.getSellerName() }<br><br>
		Phone number : ${seller.getSellerContactNumber() }<br><br>
		Email id :  ${seller.getSellerEmail() }<br><br>
		Aadhar Number : ${seller.getSellerAdhaarNumber() }<br><br>
		
		<b><legend>Shop Details</legend></b><br>
		GST IN : ${seller.getSellerGSTIN() }<br><br>
		Shop Name : ${seller.getSellerShopName() }<br><br>
		Shop Location : ${seller.getSellerShopLocation() }<br><br>
		</p>
		
	</c:if></p>
    <!--  <a href="#" class="card-link">Card link</a>
    <a href="#" class="card-link">Another link</a> -->
  </div>
</div>
</div>
</body>
</html>