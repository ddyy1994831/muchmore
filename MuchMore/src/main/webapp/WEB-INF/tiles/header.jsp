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
								<a href="loan.do">�����ϱ�</a>
							</li>
							<li>
								<a href="invest_list.do">�����ϱ�</a>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">������ <b class="caret"></b></a>
								<ul class="dropdown-menu" role="menu">
									<li>
										<a href="faq_layout.do">�����ϴ� ����</a>
									</li>
									<li>
										<a href="qna_board_list.do">Q & A</a>
									</li>
								</ul>
							</li>
						</ul>
						
						<ul class="nav navbar-nav navbar-right">
                    	<!-- �α��� �ϸ� �ٲ�� -->
                     	<%
                        	if (id != null) {
                     	%>

                     			<li><a href="logout.do">�α׾ƿ�</a></li>
                     	<%
                        			if (id.equals("muchmore")) {
                     	%>
                     					<li><a href="admin_account.do">����ݳ���</a></li>
                     					<li><a href="admin_invest.do">���ڱ�����</a></li>
                     					<li><a href="admin_loan.do">���������</a></li>
                     					<li><a href="admin_member.do">ȸ������</a></li>
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
                     			<li><a href="login.do">�α���</a></li>
                     			<li><a href="join.do">ȸ������</a></li>
                     	<%
                        	}
                     	%>
                  		</ul>
					</div>
				</div>
			</div>
		</header>
	</div>
	
	<!-- �޴��� -->
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
