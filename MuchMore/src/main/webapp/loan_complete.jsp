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
   			<p class="text-center"><h3>������ �����ϼž� ���� ��û�� �Ϸ�˴ϴ�.</h3><br/><br/><br/><br/><br/>
   			<p class="text-center"><h3>������ �������ּ���</h3><br/><br/><br/><br/><br/>
   			<a href = "mypage_myloan.do" class = "btn btn-default btn-lg">��������������</a>
   		</div>
   	</div>
 </section>
    
