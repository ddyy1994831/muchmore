<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//loginFindIdAction.to���� ã�ƿ� id
	String foundid = (String)request.getAttribute("foundid");
%>

<script>
	function windowclose() {
		self.close();
	}
</script>

<section class = "container">
   	<div class = "row">
   		<div class = "col-sm col-md-4">
			<legend>���̵� ã��</legend>
			<table class = "table">
				<tr>
					<%
					if(foundid == null) {
					%>
					<td colspan = "2">
						<font size = "2"><b>�������� �ʴ� ȸ���Դϴ�.</b></font>
					</td>
					<%
					}
					
					else {
					%>
					<td>���̵�</td>
					<td><font size = "2"><b>���̵�  : </b><%=foundid %></font></td>
					<%
					}
					%>
				</tr>
				<tr class = "text-center">
					<td colspan = "2">
						<a href = "windowclose()" class = "btn btn-primary">�ݱ�</a>
					</td>
				</tr>
			</table>
    	</div>
    </div>
</section>