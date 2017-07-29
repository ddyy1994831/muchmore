<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
%>

<%-- <script>
   function enter_check() {
      if (<%=borrower_cnt%> == 0) {
         return location.href = 'loan_input.do';
      } 
      else {
         alert("�̹� ���� ���Դϴ�.");
         return false;
      }
   }
</script>
 --%>
<section class = "container">
	<div class = "row" style = "height: 80%;">
    	<!-- ���� ���� ������ -->
	    <div class="jumbotron text-center">
			<h1>��ġ��� ���� ��û</h1>
			<p>���� �ٷ� ����� �ѵ��� Ȯ���غ�����!</p> 
		</div>
	
		<div>
	  		<div class="row">
				<div class="col-sm-4">
					<h3>��ġ���� ���� 1!</h3>
					<p>2,3 ���� 10%�� �ݸ��� �̰ܳ���</p>
					<p>P2P ����Ʈ �� ���� �ݸ� ����</p>
				</div>
				
				<div class="col-sm-4">
					<h3>��ġ���� ���� 2!</h3>
					<p>�ּ����� ������ �Է��ϸ� �ȴ�</p>
					<p>�ʿ���� ������ ������ ����</p>
				</div>
			
				<div class="col-sm-4">
					<h3>��ġ���� ���� 3!</h3> 
					<p>�̹� ������ �����ڸ� Ȯ���Ͽ���!</p>
					<p>������ ������� ���� �� �ִ�!</p>
				</div>
				
				
				<!--  ����, �ѵ� ��ư -->
				<%
	    		if(id != null) {
	    		%>
	    		<div>
					<br/><br/>	
					<button type="button" class="btn btn-primary btn-lg btn-block" onclick="enter_check()">����/�ѵ� Ȯ���ϱ�</button>
				</div>
				<%
				}
		
				else{
				%>
				<div>
					<br/><br/>
					<button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='login.do'">�α��� �������� �̵�</button>
				</div>
				<%
				} 
				%>
		  	</div>
		</div>
    	
	    <script>
    		function enter(){
    			if(id == null) {
    				alert("�α����� ���� ���ּ���");
    				return;
    			}
    			
    			else
    				location.href='loan_input.do';
    		}
    	</script>
	</div>
</section>

