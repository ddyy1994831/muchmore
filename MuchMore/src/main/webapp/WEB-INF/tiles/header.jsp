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
					<!-- ./navigation-header -->

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li>
								<a href="loan.do">대출하기</a>
							</li>
							<li>
								<a href="invest_list.do">투자하기</a>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">고객센터 <b class="caret"></b></a>
								<ul class="dropdown-menu" role="menu">
									<li>
										<a href="faq_layout.do">자주하는 질문</a>
									</li>
									<li>
										<a href="qna_board_list.do">Q & A</a>
									</li>
								</ul>
							</li>
						</ul>
						
						<ul class="nav navbar-nav navbar-right">
                    	<!-- 로그인 하면 바뀌기 -->
                     	<%
                        	if (id != null) {
                     	%>

                     			<li><a href="logout.do">로그아웃</a></li>
                     	<%
                        			if (id.equals("muchmore")) {
                     	%>
                     					<li><a href="admin_account.do">입출금내역</a></li>
                     					<li><a href="admin_invest.do">투자금지급</a></li>
                     					<li><a href="admin_loan.do">대출금지급</a></li>
                     					<li><a href="admin_member.do">회원관리</a></li>
                     	<%
                     				}
                        			else {
                     	%>
                    					<li><a href="mypage_main.do">My Page</a></li>
                     	<%
                        			}
                        	}
                        	else {
                     	%>
                     			<li><a href="login.do">로그인</a></li>
                     			<li><a href="join.do">회원가입</a></li>
                     	<%
                        	}
                     	%>
                  		</ul>
					</div>
				</div>
			</div>
		</header>
	</div>
	
	<!-- 메뉴바 -->
    <!-- Navigation -->
    
    <!-- jQuery -->
    <!-- <script src="./resources/js/jquery.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    </script>
    
    <!-- Bootstrap Core JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
    </script>

    <!-- Bootstrap Core JavaScript -->
    <!-- <script src="./resources/js/bootstrap.js"></script>
    <script src="./resources/js/bootstrap.min.js"></script> -->
</body>
</html>
