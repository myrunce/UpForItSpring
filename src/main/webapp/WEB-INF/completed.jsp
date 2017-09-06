<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Completed Challenges</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<!--Let browser know website is optimized for mobile-->
<link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style>
	span.head{
		font-family: 'Monoton', cursive;
	}
	div.completedChallenge{
		padding-top:50px;
		padding-left:10px;
		padding-right:10px;
		width:200px;
		height:200Px;
		display:inline-block;
		vertical-align: top;
		margin-left: 40px;
		margin-bottom: 20px;
		margin-top: 20px;
	}
	footer#footer{
		position: fixed;
    	bottom: 0;
    	width: 100%;
	}
</style>
</head>
<body>
<nav>
	<div class="nav-wrapper teal">
		<a href="/" class="brand-logo"><span class="head">UFI</span></a>
		<ul id="nav-mobile" class="right">
			<form id="logoutForm" method="POST" action="/logout">
			<li><a href="/home">Home</a></li>
			<li><a href="/completed">Completed Challenges</a></li>
			<li><a href="/uncompleted">Uncompleted Challeges</a></li>
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        	<li><input type="submit" value="Logout!" class="btn grey"/></li>
    		</form>
		</ul>
	</div>
</nav>

<div class="row center">
	<h3 class="teal-text">Heres all the challenges you completed!</h3>
</div>
	
<c:forEach items="${completed}" var="completed">
	<div class="completedChallenge" style=background-color:#A9DFBF>
		<p>${completed.completedChallenge}</p>
	</div>
</c:forEach>

<footer class="page-footer teal center-align" id="footer">
	<p class="white-text" id="footer">Created by Myron Navarrete using Java, JQuery, and Materialize</p>
</footer>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<script>
</script>
</body>
</html>