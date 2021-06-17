<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>Hindustan Bazar | Home Page</title>
	<!-- icon at title bar -->
	<link rel="icon" type="image/png" href="resources/images/icon.png">
	<link rel="apple-touch-icon" type="image/png" href="resources/images/icon.png">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="resources/css/header.css">
	<!-- icons-->
	<link rel="stylesheet" href="resources/fontawesome-free-5.15.3-web/css/all.css">
	<!-- header-->

</head>
<body>
	
	<header>
	<div class="header-image">
		<img class="img-heading" src="resources/images/logo2.png" alt="" width="1423px" />
		<form action="searchKeyword" method="post">
		 <div class="search">
     	 <input type="text" class="searchTerm" name="keyword" placeholder="Search Products or Brands...">
     	 <button type="submit" class="searchButton">
         <i class="fa fa-search"></i>
    	 </button>
		</div>
		</form>
	</div>
	</header>
	
	
	<nav>
		<a href="Homepagebutton" id="nav-home"><i class="fas fa-laptop-house"></i>
			&nbsp; Home </a>
		<div class="nav-dropdown">
			<button class="dropbtn">
				<i class="fas fa-bars"></i> &nbsp; SHOP BY CATEGORY
			</button>
			<div class="dropdown-content">
				<a href="category/${page.getCategoryNames().get(0) }">&nbsp;
					Fruits & Vegetables &nbsp;</a> <a
					href="category/${page.getCategoryNames().get(1) }">&nbsp;
					Foodgrains, Oil & Masala &nbsp;</a> <a
					href="category/${page.getCategoryNames().get(2) }">&nbsp;
					Beverages &nbsp;</a> <a
					href="category/${page.getCategoryNames().get(3) }">&nbsp;
					Snacks & Branded food &nbsp;</a> <a
					href="category/${page.getCategoryNames().get(4) }">&nbsp; Eggs,
					Meat & Fish &nbsp;</a>
			</div>
		</div>
		<a href="#" id="nav-offer">&nbsp;&nbsp;&nbsp;<i
			class="fas fa-gifts"></i> &nbsp; Cashback
		</a>
		<div class="nav-dropdown-location">
			<button class="dropbtn">
				<i class="fas fa-search-location"></i> &nbsp; Location
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<i class="fa fa-chevron-circle-down" aria-hidden="true"></i>
			</button>
			<div class="dropdown-content">
				<a href="location/${page.getLocationNames().get(0) }">&nbsp; Gurugram &nbsp;</a>
				<a href="location/${page.getLocationNames().get(1) }">&nbsp; Delhi&nbsp;</a> 
				<a href="location/${page.getLocationNames().get(2) }">&nbsp; Noida &nbsp;</a> 
				<a href="location/${page.getLocationNames().get(3) }">&nbsp;Faridabad &nbsp;</a>
				<a href="location/${page.getLocationNames().get(4) }">&nbsp; Sohna &nbsp;</a>
			</div>
		</div>
		<a href="Home" id="nav-login"><i class="fas fa-users"></i> &nbsp;
			My page</a>
		<a href="Cart" id="nav-cart" style="width:150px;" ><i
			class="fas fa-shopping-cart"></i> &nbsp; Cart</a>
	</nav>
	

</body>
</html>