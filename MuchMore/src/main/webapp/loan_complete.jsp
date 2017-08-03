<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	
	request.setCharacterEncoding("utf-8");
	
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
%>

<section class = "container" style = "height:80%;">
 	<div class ="row">
		<div class="container" align="center">
			<div class="jumbotron">
				<h3>서류를 제출해주세요.</h3><br/><br/>  
				<h5>①대출/한도 확인⇒②신용정보확인/③상세정보입력⇒<strong>④금리확인 후 신청</strong>⇒⑤서류제출</h5>     
			</div>      
		</div>
	</div>
   	<div class = "row">
   		<div class = "col-md-8 col-md-offset-2">
   			<img src = "./resources/image/UploadDocument.png" width = "250px" height = "250px" align = "right">
   			<p class="text-center"><h4>서류를 제출하셔야 대출 신청이 완료됩니다.</h4><br/>
   			<p class="text-center"><h4>서류를 제출해주세요</h4><br/>
   			<p class="text-center"><h5><strong>서류는 마이페이지 - 대출내역 에서 제출 가능합니다.</strong></h5>
			<br/>
			<br/>
			<div class = "text-center">
				<a href = "mypage_myloan.do" class = "btn btn-primary btn-lg">서류제출페이지</a>
			</div>   		
   		</div>
   	</div>
   	<br/>
   	<br/>
</section>
    
