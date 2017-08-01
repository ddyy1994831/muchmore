<%@page import="com.spring.muchmore.member.MemberVO"%>
<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("EUC-KR");

	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}

	int borrower_id_total = (Integer) request.getAttribute("borrower_id_total");
	int borrower_id_complete = (Integer) request.getAttribute("borrower_id_complete");
	System.out.println("���� ��ȯ�Ϸ� Ƚ�� : " + borrower_id_complete);
	int invest_id_total = (Integer) request.getAttribute("invest_id_total");
	int invest_id_complete = (Integer) request.getAttribute("invest_id_complete");
	String member_id = (String) request.getAttribute("member_id");
%>
<script type="text/javascript">
	function windowclose() {
		var r = confirm("���� ȸ���� Ż���Ű�ڽ��ϱ�?");
		if (r == true) {			
			opener.location.href = "admin_member_dropoutAction.do?member_id=" + '<%=member_id%>';
			self.close();
		} else {
			history.back();
		}
		return true;
	}
</script>

<div class ="row" style="height:100%">
	<fieldset>
		<table class="table table-striped table-condensed">
			<thead>
				<tr>
					<th style="text-align: center">�� ���� ��</th>
					<th style="text-align: center">��ȯ�Ϸ� ��</th>
				</tr>
			</thead>
			<tbody>
				<tr class="text-center">
					<td><%=borrower_id_total%></td>
					<td><%=borrower_id_complete%></td>
			</tbody>
		</table>
	</fieldset>

	<fieldset>
		<table class="table table-striped table-condensed">
			<thead>
				<tr>
					<th style="text-align: center">�� ���� ��</th>
					<th style="text-align: center">���޿Ϸ� ��</th>
				</tr>
			</thead>
			<tbody>
				<tr class="text-center">
					<td><%=invest_id_total%></td>
					<td><%=invest_id_complete%></td>
				</tr>
			</tbody>
		</table>
	</fieldset>

	<div class = "text-center">
	<%
		//�� ���ڰǰ� ��ȯ�Ϸᰡ ���� ���� ��� �������̹Ƿ� Ż�� �Ұ�
		//�� ����ǰ� ��ȯ�Ϸᰡ ���� �ʴ� ��� ������/��ȯ���̹Ƿ� Ż�� �Ұ�
		if ((borrower_id_total != borrower_id_complete) || (invest_id_total != invest_id_complete)) {
	%>
			<input type="button" class="btn btn-primary" value="Ż���Ű��" disabled>
	<%
		}
		else {
	%>
			<input type="button" class="btn btn-primary" value="Ż���Ű��" onclick="javascript:windowclose();">
	<%
	}
	%>
	</div>
</div>