<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	System.out.println("join_chk.jsp");
	request.setCharacterEncoding("EUC-KR");
	String msg = (String)request.getAttribute("msg");
	
	String id  = (String)request.getAttribute("id");
	int check = ((Integer)(request.getAttribute("checkId"))).intValue();
%>
	
	<script> // �� ǥ�� �ߺ�����. opener�� member_join.jsp�� ȸ������ â. ȸ������ â�� MEMBER_ID �ȿ� �Է��� id ���� �ְڴٴ� ��. self�� �ߺ�üũ�� �ϴ� â, �� �ڱ��ڽ� â�� �ǹ�.
		function windowclose(){
			opener.document.joinform.member_id.value="<%=id%>"; 
			opener.document.joinform.idDuplication.value="idCheck";
			self.close();
		}		
	</script>
</head>

<section class="container">
	<div class="row" style="height: 100%">
		<% if(check==1){ %>
		<!-- �̹� ���Ե� ���̵� �ִٸ� -->
		<table width="360" border="0" cellspacing="0" cellpadding="5">
			<tr align="center">
				<td height="30"><font size="2"><%=id %>�� �̹� ������� ���̵��Դϴ�.</font>
				</td>
			</tr>
		</table>

		<form action="joinCheckId.do" method="post" name="checkForm">
			<table width="360" border="0" cellspacing="0" cellpadding="5">
				<tr>
					<td align="center"><font size="2">�ٸ� ���̵� �����ϼ���.</font>
					<p>
							<input type="text" size="10" maxlength="12" name="member_id" /> 
							<input type="submit" value="�ߺ�Ȯ��" /></td>
				</tr>
			</table>
		</form>

		<%}else{%>
		<table width="360" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center"><font size="2">�Է��Ͻ� <%=id %>�� ����� ��
						�ִ� ���̵��Դϴ�.
				</font> <br />
				<br /> <input type="button" value="�ݱ�" onclick="windowclose()" /></td>
			</tr>
		</table>
		<%} %>
	</div>
</section>
</html>