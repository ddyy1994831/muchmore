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
    			<p class="text-center"><h3>���ڰ� �Ϸ�Ǿ����ϴ�.</h3><br/><br/><br/><br/><br/>
    			<p class="text-center"><h5>�������������� ���� ������ Ȯ���ϼ���.</h5><br/>    			
    			<p class="text-center"><a href="mypage_myinvest.do" class="col-md-4 btn btn-primary">������������ �̵��ϱ�</a></p>		
    		</div>
    	</div>
</section>
	
