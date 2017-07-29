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
   	<div class = "row">
   		<div class = "col-md-6 col-md-offset-3">
   			<p class="text-center"><h3>회원가입이 완료되었습니다.</h3><br/><br/><br/><br/><br/>
   			<p class="text-center"><h5>여러분의 지갑을 불리는</h5><br/>
   			<p class="text-center"><h5>머치모아 서비스를</h5><br/>
   			<p class="text-center"><h5>지금 체험해 보세요!</h5><br/><br/><br/>
   			<a href="login.do" class="btn btn-primary">로그인 하기</a>		
   		</div>
   	</div>
 </section>
    
