<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Up For It Home</title>
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
	form#completed, form#uncompleted{
		display:inline-block;
	}
	p#footer{
		margin-bottom:0px;
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
		<h4 class=teal-text>${message}</h4>
	</div>
	
	<c:if test="${currentUser.challenge.theChallenge != null}">
		<div class="row center" id="main">
		<h3 class="teal-text">Hey <c:out value="${currentUser.firstName}"></c:out>!</h3>
		<h5>Did you finish this challenge within 24 hours?</h5>
		<br><br>
		<h5 class="teal-text">${currentUser.challenge.theChallenge}</h5>
		<form:form method="POST" action="/saveCompleted" modelAttribute="completed">
			<input type="hidden" name="completedChallenge" value="${currentUser.challenge.theChallenge}" />
			<input type="submit" value="Yup!" class="btn green"/>
		</form:form>
		<form:form method="POST" action="/saveUncompleted" modelAttribute="uncompleted">
			<input type="hidden" name="completedChallenge" value="${currentUser.challenge.theChallenge}" />
			<input type="submit" value="Nope!" class="btn red"/>
		</form:form>
		</div>
	</c:if>
	
	<c:if test="${currentUser.challenge.theChallenge == null}">
	<div class="row center" id="main">
		<h3 class="teal-text">Hey <c:out value="${currentUser.firstName}"></c:out>!</h3>
		<h5>Are you up for your challenge? Click the teal button until you find a challenge you want to complete!</h5>
		<br><br>
		<div id="theChallenge"></div>
		<br><br>
		<button class="btn teal" id="challenge">Give me a challenge!</button>
	</div>
	</c:if>
	<footer class="page-footer teal center-align" id="footer">
        <p class="white-text" id="footer">Created by Myron Navarrete using Java, JQuery, and Materialize</p>
    </footer>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	<script>
		$('button#challenge').click(function(){
			$.ajax({
				url: "http://18.220.186.114/challenges/random",
				method:"GET",
				dataType:"json",
				success: function(res){
					var html = '<div class="container center-align">'
					html += "<h4 class= teal-text>" + res.challenge + "</h4>"
					html += '</div>'
					html += '<form method="POST" action="/saveChallenge">'
					html += '<input type="hidden" value="' + res.challenge + '" name="challenge"/>'
					html += '<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />'
					html += '<input type="submit" value="Up For It!" class="btn grey"/>'
					html += '</form>'
					$("div#theChallenge").html(html);
				}
			})
		})
	</script>
</body>
</html>