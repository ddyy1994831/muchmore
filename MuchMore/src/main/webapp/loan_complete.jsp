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
				<h3>������ �������ּ���.</h3><br/><br/>  
				<h5>�����/�ѵ� Ȯ�΢���ſ�����Ȯ��/��������Է¢�<strong>��ݸ�Ȯ�� �� ��û</strong>���뼭������</h5>     
			</div>      
		</div>
	</div>
   	<div class = "row">
   		<div class = "col-md-8 col-md-offset-2">
   			<img src = "./resources/image/UploadDocument.png" width = "250px" height = "250px" align = "right">
   			<p class="text-center"><h4>������ �����ϼž� ���� ��û�� �Ϸ�˴ϴ�.</h4><br/>
   			<p class="text-center"><h4>������ �������ּ���</h4><br/>
   			<p class="text-center"><h5><strong>������ ���������� - ���⳻�� ���� ���� �����մϴ�.</strong></h5>
			<br/>
			<br/>
			<div class = "text-center">
				<a href = "mypage_myloan.do" class = "btn btn-primary btn-lg">��������������</a>
			</div>   		
   		</div>
   	</div>
   	<br/>
   	<br/>
</section>
    
