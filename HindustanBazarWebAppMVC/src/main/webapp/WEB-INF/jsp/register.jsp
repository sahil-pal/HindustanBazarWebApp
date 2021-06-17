<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hindustan Bazar | Registration Page</title>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</head>
<style>

</style>
<body>


<form:form class="form-horizontal" action="registerthisUser" method="POST" modelAttribute="user">
  <fieldset>
    <div id="legend">
      <legend>Register yourself  <br>
     	<span style="color:red; font-size:15px; padding:1px;">
     	<c:forEach items="${errors }" var="error">
     	 		 ${error.getField() }  ${error.getDefaultMessage() }<br>
     	</c:forEach>
     	</span>
      </legend>
    </div>
    <div class="control-group">
      <!-- Username -->
      <label class="control-label"  for="username">Username</label>
      <div class="controls">
         <form:input type="" id="username" path="username" placeholder="" class="input-xlarge"/>
         <form:errors path="username" cssClass="error"/>
        <p class="help-block">Username should be of 3 minimum characters</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- Password-->
      <label class="control-label" for="password">Password</label>
      <div class="controls">
        <form:input type="password" id="password" path="password" placeholder="" class="input-xlarge"/>
        <form:errors path="password" cssClass="error"/>
        <p class="help-block">Password should be : First letter capital,One special character and Minimum 8 character </p>
      </div>
    </div>
     
	 <div class="control-group">
      <!--  -->
      <label class="control-label"  for="username">Account Type</label>
      <div class="controls">
      <p>Buyer :  
	  <form:radiobutton path="AccountType" value="Buyer"/>
	  &nbsp; Seller
	  <form:radiobutton path="AccountType" value="Seller"/>
	  <form:errors path="AccountType" cssClass="error"></form:errors>
      </div>
    </div>
	
	<div class="control-group">
      <!-- Username -->
      <label class="control-label"  for="username">Your Full Name</label>
      <div class="controls">
        <form:input type="text" id="" path="Name" placeholder="" class="input-xlarge"/>
        <p class="help-block"></p>
      </div>
    </div>
    <div class="control-group">
      <!-- Username -->
      <label class="control-label"  for="username">Phone number </label>
      <div class="controls">
        <form:input type="text" id="username" path="PhoneNumber" placeholder="" class="input-xlarge"/>
         <form:errors path="PhoneNumber" cssClass="error"/>
         <p class="help-block">Enter 10 - digit mobile number</p>
      </div>
    </div>
    
    <div class="control-group">
      <!--  -->
      <label class="control-label"  for="username">Email ID </label>
      <div class="controls">
        <form:input type="email" id="username" path="UserEmailID" placeholder="" class="input-xlarge"/>
        <p class="help-block"></p>
      </div>
    </div>
    
 	<div class="control-group">
      <!--  -->
      <label class="control-label"  for="username">Street/House Number</label>
      <div class="controls">
        <form:input type="text" id="username" path="BuyerHouseNo" placeholder="" class="input-xlarge"/>
        <p class="help-block"></p>
      </div>
    </div>
    <div class="control-group">
      <!--  -->
      <label class="control-label"  for="username">City</label>
      <div class="controls">
        <form:select  path="Buyercity">
   		    <form:option  value="NONE"> -- Select from here --</form:option>
    		<form:option value="Gurugram"> Gurugram </form:option>
    		<form:option value="Delhi"> Delhi </form:option>
    		<form:option value="Faridabad"> Faridabad </form:option>
    		<form:option value="Noida"> Noida </form:option>
    		<form:option value="Sohna"> Sohna </form:option>
  		</form:select>
      </div>
    </div>
    <div class="control-group">
      <!--  -->
      <label class="control-label"  for="username">State</label>
      <div class="controls">
        <form:select  path="State">
   		    <form:option  value="NONE"> -- Select from here --</form:option>
    		<form:option value="Haryana"> Haryana </form:option>
    		<form:option value="UttarPradesh"> UttarPradesh </form:option>
  		</form:select>
      </div>
    </div>
 	
    <div class="control-group">
      <!-- Button -->
      <div class="controls">
        <button class="btn btn-success" type="submit">Register</button>
      </div>
    </div>
  </fieldset>
</form:form>

</body>
</html>