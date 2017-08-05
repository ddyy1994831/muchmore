<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("EUC-KR");

	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content=""> 

    <title>MuchMore</title>

    <!-- Bootstrap Core CSS -->
<!--
    <link href="./resources/css/bootstrap.css" rel="stylesheet"> 
-->
    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom Fonts -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    
    <!-- jQuery -->
    <!-- <script src="./resources/js/jquery.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    
    
    </script>
</head>

<body>
<div id="master-wrap">
		<header>
			<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				<div class="container-fluid">
					<!-- navigation header -->
					<div class="navbar-header">
						<a class="navbar-brand" href="home.do">MuchMore</a>
					</div>
				</div>
			</div>
		</header>
	</div>
</body>
</html>