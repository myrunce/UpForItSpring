<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<!--Let browser know website is optimized for mobile-->
<link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Up For It</title>
<style>
	li.move{
		margin-right:20px;
	}
	li.move2{
		margin-right:10px;
	}
	#random{
		background-color:#85C1E9;
		padding-top:50px;
		padding-left:10px;
		padding-right:10px;
		width:200px;
		height:200Px;
	}
	#random2{
		background-color:#F9E79F;
		padding-top:50px;
		padding-left:10px;
		padding-right:10px;
		width:200px;
		height:200Px;
	}
	#random3{
		background-color:#FF5733;
		padding-top:50px;
		padding-left:10px;
		padding-right:10px;
		width:200px;
		height:200Px;
	}
	#random4{
		background-color:#BB8FCE;
		padding-top:50px;
		padding-left:10px;
		padding-right:10px;
		width:200px;
		height:200Px;
	}
	#random5{
		background-color:#FAD7A0;
		padding-top:50px;
		padding-left:10px;
		padding-right:10px;
		width:200px;
		height:200Px;
	}
	span.head{
		font-family: 'Monoton', cursive;
	}
	p#footer{
		margin-bottom:0px;
	}
</style>
</head>
<body>
<nav>
	<div class="nav-wrapper teal">
		<a href="/" class="brand-logo"><span class="head">UFI</span></a>
		<ul id="nav-mobile" class="right">
			<form method="POST" action="/login">
			<c:if test="${logoutMessage != null}">
				<li class="move"><c:out value="${logoutMessage}"></c:out></li>
			</c:if>
			<c:if test="${errorMessage != null}">
				<li class="move"><c:out value="${errorMessage}"></c:out></li>
			</c:if>
			<li class="move2">Email:</li>
			<li><input type="email" id="username" name="username" class="validate"></li>
			<li class="move2">Password:</li>
			<li class="move"><input type="password" id="password" name="password" class="validate"/></li>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<li class="move2"><input type="submit" value="Login!" class="btn grey"/></li>
			</form>
		</ul>
	</div>
	</nav>
	
	<div class="row center">
		<h4 class=teal-text>${message}</h4>
	</div>

	<div class="container" id="main">
      <br><br>
      <h1 class="header center teal-text"><span class="head">Up For It</span></h1>
      <div class="row center">
        <h5 class="header col s12 light">Daily feel good tasks to enrich the soul</h5>
      </div>
      <div class="carousel">
    	<div id="random" class="carousel-item"><p id="random_challenge_1" class="center-align black-text"></p></div>
    	<div id="random2" class="carousel-item"><p id="random_challenge_2" class="center-align black-text"></p></div>
    	<div id="random3" class="carousel-item"><p id="random_challenge_3" class="center-align black-text"></p></div>
    	<div id="random4" class="carousel-item"><p id="random_challenge_4" class="center-align black-text"></p></div>
    	<div id="random5" class="carousel-item"><p id="random_challenge_5" class="center-align black-text"></p></div>
 	 </div>
      <div class="row center">
        <a href="" id="register-button" class="btn-large waves-effect waves-light teal">Register</a>
      </div>
      <div id="registering" style="display:none;">
      <form:form method="POST" action="/registration" modelAttribute="user">
      	<p>
			<form:errors path="user.*" />
		</p>
		<p>
			<form:label path="username">Email:</form:label>
			<form:input path="username" />
		</p>
		<p>
			<form:label path="firstName">First Name:</form:label>
			<form:input path="firstName" />
		</p>
		<p>
			<form:label path="lastName">Last Name:</form:label>
			<form:input path="lastName" />
		</p>
		<p>
			<form:label path="password">Password:</form:label>
			<form:password path="password" />
		</p>
		<p>
			<form:label path="passwordConfirmation">Password Confirmation:</form:label>
			<form:password path="passwordConfirmation" />
		</p>
		<div class="row center">
		<input type="submit" value="Register!" class="btn grey" />
		</div>
	</form:form>
	</div>
      </div>
      <br><br>
      <div class="container">
      	<h2 class="header center teal-text"><span class="head">About</span></h2>
      	<div class="row center">
        	<h5 class="header col s12 light">Up For It gives people a chance to do a good deed for themselves in forms of daily challenges. A challenge will be randomly generated with a click of a button! So are you Up For It?</h5>
      </div>
      </div>
    <footer class="page-footer teal center-align">
        <p class="white-text" id="footer">Created by Myron Navarrete using Java, JQuery, and Materialize</p>
    </footer>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	<script>
		$.ajax({
			url: "http://18.220.143.149/challenges/random",
			method:"GET",
			dataType:"json",
			success: function(res){
				$("p#random_challenge_1").append(res.challenge);
			}
		})
		
		$.ajax({
			url: "http://18.220.143.149/challenges/random",
			method:"GET",
			dataType:"json",
			success: function(res){
				$("p#random_challenge_2").append(res.challenge);
			}
		})
		
		$.ajax({
			url: "http://18.220.143.149/challenges/random",
			method:"GET",
			dataType:"json",
			success: function(res){
				$("p#random_challenge_3").append(res.challenge);
			}
		})
		
		$.ajax({
			url: "http://18.220.143.149/challenges/random",
			method:"GET",
			dataType:"json",
			success: function(res){
				$("p#random_challenge_4").append(res.challenge);
			}
		})
		
		$.ajax({
			crossOrigin: true,
			url: "http://18.220.143.149/challenges/random",
			method:"GET",
			dataType:"json",
			success: function(res){
				$("p#random_challenge_5").append(res.challenge);
			}
		})
		
      	$('.carousel').carousel();
    	
		$('#register-button').click(function(e){
			e.preventDefault();
			$('#registering').slideToggle();
		})
		
		
	</script>
</body>
</html>