<%@ page import="com.spring.muchmore.board.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% 
	request.setCharacterEncoding("EUC-KR");

	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	
	int board_num = Integer.parseInt(request.getParameter("board_num"));
%>

<section class = "container">
  	<div class = "row" style = "min-height:80%; padding-left:120px; padding-right:120px;">
   	<form id="deleteForm" name="deleteForm" action="BoardDeleteAction.do" method="post">
		<input type="hidden" id="board_num" name="board_num" value="<%=board_num %>">
		<table class="table table-hover">
			<tr>
				<td>글 비밀번호</td>
				<td><input type="password" id="board_password" name="board_password"></td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="col-lg-9 col-lg-offset-1 text-center">
   						<a href="javascript:deleteForm.submit()" class="btn btn-default">삭제</a>
   						<a href="javascript:history.go(-1)" class="btn btn-default">돌아가기</a>
   					</div>
				</td>
			</tr>
		</table>
	</form>
	</div>
</section>