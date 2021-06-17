<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	
	body{
		background-image:url('resources/images/login.png');
		background-repeat: no-repeat;
  		background-size:cover;
		
	}
	
	.error {
		color: red;
		font-family: BlinkMacSystemFont;
		text-size: 10px;
		
}
	
</style>
<meta charset="ISO-8859-1">
<title>LoginPage | MVC</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<!------ Include the above in your HEAD tag ---------->

<body>
    <div id="login" style="border:2px solid black; width:550px; margin-left:810px; height:450px; margin-top:50px;">
        <h3 class="text-center pt-5" style="text-color:black";>Login</h3>
        <div class="container" style="width:100%";>
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12" style="width:400px";>
                        <form:form id="login-form" class="form" modelAttribute="user" action="AuthenticationOfUser" method="post">
                            <h5 class="text-center text-info">Enter credentials !</h5>
                            <div class="form-group">
                                <label for="username" class="text-info">Username:</label><br>
                                <form:input type="text" path="username" id="username" class="form-control"/>
                                <form:errors path="username" cssClass="error"></form:errors>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <form:input type="password" path="password" id="password" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="remember-me" class="text-info"><span>Remember me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
                            </div>
                            <div id="register-link" class="text-right">
                                <a href="registeruser" class="text-info">Register here</a>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>