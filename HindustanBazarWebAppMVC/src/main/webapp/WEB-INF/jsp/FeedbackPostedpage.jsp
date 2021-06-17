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
<title>Hindustan Bazar | Your Feedbacks </title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</head>

<style>
body {
    color: #000;
    overflow-x: hidden;
    height: 100%;
    background-color: #2ecc71;
    background-repeat: no-repeat
}

.card {
    z-index: 0;
    background-color: #ECEFF1;
    padding-bottom: 20px;
    margin-top: 10px;
    margin-bottom: 10px;
    border-radius: 10px
}

.top {
    padding-top: 40px;
    padding-left: 13% !important;
    padding-right: 13% !important
}

#progressbar {
    margin-bottom: 30px;
    overflow: hidden;
    color: #455A64;
    padding-left: 0px;
    margin-top: 30px
}

#progressbar li {
    list-style-type: none;
    font-size: 13px;
    width: 20%;
    float: left;
    position: relative;
    font-weight: 400
}

#progressbar .step0:before {
    font-family: FontAwesome;
    content: "\f10c";
    color: #fff
}

#progressbar li:before {
    width: 40px;
    height: 40px;
    line-height: 45px;
    display: block;
    font-size: 20px;
    background: #C5CAE9;
    border-radius: 50%;
    margin: auto;
    padding: 0px
}

#progressbar li:after {
    content: '';
    width: 100%;
    height: 12px;
    background: #C5CAE9;
    position: absolute;
    left: 0;
    top: 16px;
    z-index: -1
}

#progressbar li:last-child:after {
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
    position: absolute;
    left: -50%
}

#progressbar li:nth-child(2):after,
#progressbar li:nth-child(3):after,
#progressbar li:nth-child(4):after {
    left: -50%
}

#progressbar li:first-child:after {
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
    position: absolute;
    left: 50%
}

#progressbar li:last-child:after {
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px
}

#progressbar li:first-child:after {
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px
}

#progressbar li.active:before,
#progressbar li.active:after {
    background: #651FFF
}

#progressbar li.active:before {
    font-family: FontAwesome;
    content: "\f00c"
}

.icon {
    width: 60px;
    height: 60px;
    margin-right: 15px
}

.icon-content {
    padding-bottom: 20px
}

@media screen and (max-width: 992px) {
    .icon-content {
        width: 50%
    }
}
</style>
<body style="background-color:grey;">

<div class="container px-1 px-md-4 py-5 mx-auto" >
	<div class="card" >
        <div class="row d-flex justify-content-between px-3 top">
            <div class="d-flex">
                <h1>YOUR POSTED FEEDBACKS <span class="text-primary font-weight-bold"></span></h1>
            </div>
            <div class="d-flex flex-column text-sm-right">
                <p class="mb-0"><span></span></p>
                <p><span class="font-weight-bold"><a href="Home">Go back to Profile</a></span></p>
            </div>
    </div>
    </div>
    <c:forEach items="${feedback }" var="feedback">
    <div class="card">
        <div class="row d-flex justify-content-between px-3 top">
            <div class="d-flex">
                <h6><span class="text-primary font-weight-bold">Date of Post : </span>${feedback.getDateOfPost() }</h6>
            </div>
             <div class="d-flex">
                <h6><span class="text-primary font-weight-bold">ProductName : </span>${feedback.getProductName() }</h6>
            </div>
            <div class="d-flex">
                <h6><span class="text-primary font-weight-bold">Seller Shop Name and Location : </span>${feedback.getSellerName() } and ${feedback.getSellerLocation() }</h6>
            </div>
             <div class="d-flex">
                <h6><span class="text-primary font-weight-bold">Review Posted : </span><i>${feedback.getReview() }</i></h6>
            </div>
        </div>
    </div>
  </c:forEach>
</div>


</body>
</html>