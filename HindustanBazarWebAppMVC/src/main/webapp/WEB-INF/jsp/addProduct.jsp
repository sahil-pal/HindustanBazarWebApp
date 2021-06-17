<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add new Product</title>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</head>
<style type="text/css">
	.error {
		color: red;
		font-family: BlinkMacSystemFont;
		text-size: 10px;
	}
</style>
<body>

<form:form action="addThisProduct" method="post" modelAttribute="product"  class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>ADD NEW PRODUCT </legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">Product Name (*)</label>  
  <div class="col-md-4">
  <form:input id="product_id" path="ProductName" placeholder="Enter Product Name" class="form-control input-md" required="" type="text"/>
  <form:errors path="ProductName" cssClass="error"/>
  </div>
</div>

<!-- List input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_name">Product Category (*)</label>  
  <div class="col-md-4">
  <form:select  path="ProductCategory">
   		    <form:option  value="NONE"> -- Select from here --</form:option>
    		<form:options items="${Category}"></form:options>
  </form:select>
  <form:errors path="ProductCategory" cssClass="error"></form:errors>
  </div>
</div>

<!-- radio input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_name_fr">Product Type (*)</label>  
  <div class="col-md-4">
  <p>Veg :  
	<form:radiobutton path="ProductType" value="Veg"/>
	 &nbsp; Non-Veg:
	<form:radiobutton path="ProductType" value="Non-Veg"/>
	<form:errors path="ProductType" cssClass="error"></form:errors>
  </p>  
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">Product Price (*)</label>  
  <div class="col-md-4">
  <form:input  path="ProductPrice" placeholder="Enter Product Price" class="form-control input-md" required="" type="text"/>
  <form:errors path="ProductPrice" cssClass="error"></form:errors>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">Product BrandName</label>  
  <div class="col-md-4">
  <form:input id="product_id" path="ProductBrand" placeholder="Enter Product BrandName" class="form-control input-md" required="" type="text"/>
  <form:errors path="ProductBrand" cssClass="error"></form:errors>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" >Product UOM</label>  
  <div class="col-md-4">
  <form:select  path="ProductUOM">
   		    <form:option  value="NONE"> -- Select from here --</form:option>
    		<form:options items="${UOM}"></form:options>
  </form:select>
  <form:errors path="ProductUOM" cssClass="error"></form:errors>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" >Product Qty per UOM</label>  
  <div class="col-md-4">
  <form:input id="product_id" path="Productperweight" placeholder="" class="form-control input-md" required="" type="text"/>
  <form:errors path="Productperweight" cssClass="error"></form:errors>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">Discount Offered % </label>  
  <div class="col-md-4">
  <form:input id="product_id" path="ProductDiscount" placeholder="" class="form-control input-md" required="" type="text"/>
  <form:errors path="ProductDiscount" cssClass="error"></form:errors>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">Available Quantity (*)</label>  
  <div class="col-md-4">
  <form:input id="product_id" path="ProductQtyAvailable" placeholder="" class="form-control input-md" required="" type="text"/>
  <form:errors path="ProductQtyAvailable" cssClass="error"></form:errors>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="product_name_fr">Express Delivery Available </label>  
  <div class="col-md-4">
  <p>Yes  
	<form:radiobutton path="ExpressDeliveryStatus" value="True"/>
	No
	<form:radiobutton path="ExpressDeliveryStatus" value="False"/>
	<form:errors path="ExpressDeliveryStatus" cssClass="error"></form:errors>
  </p>  
  </div>
</div>

 <!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="filebutton">Product Image</label>
  <div class="col-md-4">
    <input id="filebutton" path="ProductImg" class="input-file" type="file">
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">Seller ID (*)</label>  
  <div class="col-md-4">
  <form:input id="product_id" path="ProductSellerID" placeholder="" class="form-control input-md" required="" type="text"/>
  <form:errors path="ProductSellerID" cssClass="error"></form:errors>
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"></label>
  <div class="col-md-4">
    <button id="singlebutton" type="submit" name="singlebutton" class="btn btn-primary">ADD THIS PRODUCT!</button>
  </div>
  </div>
</fieldset>
</form:form>


</body>
</html>