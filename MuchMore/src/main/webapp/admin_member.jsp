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

	List<MemberVO> member_list = (List<MemberVO>) request.getAttribute("member");
%>

<script type="text/javascript">
function dropout(member_id){
	var url = "admin_memberdropout.do?member_id=" + member_id;
	
	open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no," + 
	"scrollbars=no, resizable=no, width=400, height=500, left=400, top=150");	
}
</script>

<section class="container">
	<div class="row" style="height:100%">
		<div class="span12">
			<div class="col-md-10 col-md-offset-1">
			
				<legend><b>회원관리</b></legend>
				
					<table class="table table-striped table-condensed table-hover ">
						<thead>
							<tr>
								<th>ID</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>주민번호</th>
								<th>이메일</th>
								<th>나이</th>
								<th>성별</th>
								<th>탈퇴</th>
								
							</tr>
						</thead>
						<tbody>
							<%
								for (int i = 0; i < member_list.size(); i++) {
									MemberVO member = member_list.get(i);
							%>
							<tr>
								<td><a href="admin_memberdetail.do?member_id=<%=member.getMember_id()%>"><%=member.getMember_id()%></a></td>
								<td><%=member.getMember_name()%></td>
								<td><%=member.getMember_phone()%></td>
								<td><%=member.getMember_jumin1()%> - <%=member.getMember_jumin2()%></td>
								<td><%=member.getMember_email()%></td>
								<td><%=member.getMember_age()%></td>
								<td><%=member.getMember_gender()%></td>
								<td><input type="button" class="btn btn-primary btn-xs"
									value="탈퇴" onclick="dropout('<%=member.getMember_id()%>')"></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				
			</div>
		</div>
	</div>
</section>