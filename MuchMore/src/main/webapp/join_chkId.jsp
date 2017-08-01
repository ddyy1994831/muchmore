<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	System.out.println("join_chk.jsp");
	request.setCharacterEncoding("EUC-KR");
	String msg = (String)request.getAttribute("msg");
	
	String id  = (String)request.getAttribute("id");
	int check = ((Integer)(request.getAttribute("checkId"))).intValue();
%>
	
	<script> // 이 표현 잘봐놓기. opener는 member_join.jsp의 회원가입 창. 회원가입 창의 MEMBER_ID 안에 입력한 id 값을 넣겠다는 뜻. self는 중복체크를 하는 창, 즉 자기자신 창을 의미.
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
		<!-- 이미 가입된 아이디가 있다면 -->
		<table width="360" border="0" cellspacing="0" cellpadding="5">
			<tr align="center">
				<td height="30"><font size="2"><%=id %>는 이미 사용중인 아이디입니다.</font>
				</td>
			</tr>
		</table>

		<form action="joinCheckId.do" method="post" name="checkForm">
			<table width="360" border="0" cellspacing="0" cellpadding="5">
				<tr>
					<td align="center"><font size="2">다른 아이디를 선택하세요.</font>
					<p>
							<input type="text" size="10" maxlength="12" name="member_id" /> 
							<input type="submit" value="중복확인" /></td>
				</tr>
			</table>
		</form>

		<%}else{%>
		<table width="360" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center"><font size="2">입력하신 <%=id %>는 사용할 수
						있는 아이디입니다.
				</font> <br />
				<br /> <input type="button" value="닫기" onclick="windowclose()" /></td>
			</tr>
		</table>
		<%} %>
	</div>
</section>
</html>