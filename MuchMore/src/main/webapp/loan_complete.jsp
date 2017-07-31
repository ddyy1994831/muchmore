<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	
	request.setCharacterEncoding("utf-8");
	
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
%>

 <section class = "container">
   	<div class = "row" style = "height:100%">
   		<div class = "col-md-6 col-md-offset-3">
   			<p class="text-center"><h3>서류를 제출하셔야 대출 신청이 완료됩니다.</h3><br/><br/><br/><br/><br/>
   			<p class="text-center"><h3>서류를 제출해주세요</h3><br/><br/><br/><br/><br/>
   			<a href = "mypage_myloan.do" class = "btn btn-default btn-lg">서류제출페이지</a>
   		</div>
   	</div>
 </section>
    
