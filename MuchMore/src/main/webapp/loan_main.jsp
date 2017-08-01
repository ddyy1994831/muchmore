<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	
	int borrower_cnt = (Integer)request.getAttribute("borrower_cnt");
	String msg = null;
	if(borrower_cnt != 0) {
		msg = (String)request.getAttribute("msg");	
	}
	
%>

<script>
   function enter_check() {
      if (<%=borrower_cnt%> == 0) {
         return location.href = 'loanCreditCheck.do';
      } 
      else {
         alert("�̹� ���� ���Դϴ�.");
         return false;
      }
   }
</script>

<script>
	function enter(){
		if(id == null) {
			alert("�α����� ���� ���ּ���");
			return;
		}
    			
		else
			location.href='loanCreditCheck.do';
	}
</script>
<section class = "container">
	<div class = "row">
    	<!-- ���� ���� ������ -->
	    <div class="jumbotron text-center">
			<h1>��ġ��� ���� ��û</h1>
			<p>���� �ٷ� ����� �ѵ��� Ȯ���غ�����!</p> 
		</div>
	
	  	<div class="row">
			<div class="col-sm-4 text-center">
				<div class="panel panel-primary">
					<div class="panel-heading">
    					<h3 class="panel-title">MuchMore���� ����1</h3>
  					</div>
  					<div class="panel-body">
  						<font size = "3">
    						<b>2,3 ���� 10%�� �ݸ��� �̰ܳ���<br/><br/>
							P2P ����Ʈ �� ���� �ݸ� ����</b><br/><br/>
						</font>
  					</div>
				</div>
			</div>
		
			<div class="col-sm-4 text-center">
				<div class="panel panel-primary">
					<div class="panel-heading">
  						<h3 class="panel-title">MuchMore���� ����2</h3>
					</div>
					<div class="panel-body text-center">
						<font size = "3">
  							<b>�ּ����� ������ �Է��ϸ� �ȴ�</b><br/><br/>
							<b>�ʿ���� ������ ������ ����</b><br/><br/>
						</font>
					</div>
				</div>
			</div>
			
			<div class="col-sm-4 text-center">
				<div class="panel panel-primary">
					<div class="panel-heading">
   						<h3 class="panel-title">MuchMore���� ����3</h3>
					</div>
					<div class="panel-body text-center">
						<font size = "3">
  							<b>�̹� ������ �����ڸ� Ȯ���Ͽ���!</b><br/><br/>
							<b>������ ������� ���� �� �ִ�!</b><br/><br/>
						</font>
					</div>
				</div>
			</div>
		</div>
	
		<!--  ����, �ѵ� ��ư -->
		<div class = "text-center">
			<br/><br/>
		<%
    	if(id != null) {
    		//��ȯ�Ϸ����� ���� ȸ��
    		if( borrower_cnt != 0) {
    	%>
    			<button type="button" class="btn btn-primary btn-lg" disabled>����/�ѵ� Ȯ���ϱ�</button>
    			<br/><br/>
    			<div class="text-center text-danger" style="font-size: 13pt;padding-top:25px;padding-bottom:50px">
					<strong><%=msg%></strong>
				</div>
				
    			
    	<%
    		}
    		
    		//��ȯ �Ϸ� �� ȸ�� or ���� ���� �̿��� ó���� ȸ��
    		else {
    	%>
    			<button type="button" class="btn btn-primary btn-lg" onclick="enter_check()">����/�ѵ� Ȯ���ϱ�</button>
    			
    	<%
    		}
		}
	
		else{
		%>
			<button type="button" class="btn btn-primary btn-lg" onclick="location.href='login.do'">�α��� �������� �̵�</button>
		<%
		} 
		%>
    	
		</div>
	</div>
</section>

