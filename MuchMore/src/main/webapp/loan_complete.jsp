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
   			<p class="text-center"><h3>ȸ�������� �Ϸ�Ǿ����ϴ�.</h3><br/><br/><br/><br/><br/>
   			<p class="text-center"><h5>�������� ������ �Ҹ���</h5><br/>
   			<p class="text-center"><h5>��ġ��� ���񽺸�</h5><br/>
   			<p class="text-center"><h5>���� ü���� ������!</h5><br/><br/><br/>
   			<a href="login.do" class="btn btn-primary">�α��� �ϱ�</a>		
   		</div>
   	</div>
 </section>
    
