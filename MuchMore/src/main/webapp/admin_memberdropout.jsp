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
	System.out.println("대출 상환완료 횟수 : " + borrower_id_complete);
	int invest_id_total = (Integer) request.getAttribute("invest_id_total");
	int invest_id_complete = (Integer) request.getAttribute("invest_id_complete");
	String member_id = (String) request.getAttribute("member_id");
%>
<script type="text/javascript">
	function windowclose() {
		var r = confirm("정말 회원을 탈퇴시키겠습니까?");
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
					<th style="text-align: center">총 대출 건</th>
					<th style="text-align: center">상환완료 건</th>
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
					<th style="text-align: center">총 투자 건</th>
					<th style="text-align: center">지급완료 건</th>
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
		//총 투자건과 상환완료가 같지 않은 경우 투자중이므로 탈퇴 불가
		//통 대출건과 상환완료가 같지 않는 경우 대출중/상환중이므로 탈퇴 불가
		if ((borrower_id_total != borrower_id_complete) || (invest_id_total != invest_id_complete)) {
	%>
			<input type="button" class="btn btn-primary" value="탈퇴시키기" disabled>
	<%
		}
		else {
	%>
			<input type="button" class="btn btn-primary" value="탈퇴시키기" onclick="javascript:windowclose();">
	<%
	}
	%>
	</div>
</div>