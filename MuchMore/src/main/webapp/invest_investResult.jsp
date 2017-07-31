<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("EUC-KR");

	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}

	BorrowerVO bg = (BorrowerVO) request.getAttribute("borrower");
	int balance = (Integer) request.getAttribute("balance");
%>

<section class = "container">
    	<div class = "row" style="height:100%">
    		<div class = "col-md-6 col-md-offset-2 text-center">
    			<p class="text-center"><h3>투자가 완료되었습니다.</h3><br/><br/><br/><br/><br/>
    			<p class="text-center"><h5>마이페이지에서 투자 내역을 확인하세요.</h5><br/>    			
    			<p class="text-center"><a href="mypage_myinvest.do" class="col-md-4 btn btn-primary">마이페이지로 이동하기</a></p>		
    		</div>
    	</div>
</section>
	
