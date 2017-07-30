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
	
	BoardVO boardVO = (BoardVO)request.getAttribute("getBoard");
%>

<script>
	function replyboard() {
		if(boardform.board_qna_content.value == ""){
			alert("내용을 입력하세요.");
			return false;
		}
		
		document.boardform.submit();
	}
</script>

<section class="container">
    <form action="BoardReplyAction.do" method="post" name="boardform" id="boardform">
    <input type="hidden" name="board_num" value = "<%=boardVO.getBoard_num() %>">
    <input type="hidden" name="board_re_ref" value="<%=boardVO.getBoard_re_ref() %>">
	<input type="hidden" name="board_re_lev" value="<%=boardVO.getBoard_re_lev() %>">
	<input type="hidden" name="board_re_seq" value="<%=boardVO.getBoard_re_seq() %>">

    	<table class="table table-hover">
    		<tbody>
    			<tr>
					<td align="center">글쓴이</td>
					<td>
						<input id="member_id" name = "member_id" type="text" value = "<%=id %>" readonly/>
					</td>
				</tr>
				<tr>
					<td align="center">제목</td>
					<td>
						<input id="board_title" name="board_title" type="text" value="Re: <%=boardVO.getBoard_title() %>" readonly/>		
					</td>
				</tr>
				<tr>
    				<td align="center">작성자</td>
    				<td>
    					<%=boardVO.getMember_id() %>
    				</td>
    			</tr>
				<tr>
					<td align="center">내용</td>
					<td>
						<textarea id="board_content" name="board_content" rows="15" cols="60"></textarea>
					</td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td>
						<input type="radio" id="board_pw_check" name="board_pw_check" value="<%=boardVO.getBoard_pw_check() %>">비밀글여부
						&nbsp;&nbsp;
						<input type="password" id="board_password" name="board_password" value="<%=boardVO.getBoard_password() %>">
				</td>
				<tr>
					<td colspan="2" align="center">
						<div class="col-lg-9 col-lg-offset-1 text-center">
							<button type="button" class="btn btn-default" onclick="replyboard();">등록</button>
							<button type="button" class="btn btn-default" onclick="javascript:history.go(-1)">뒤로</button>
	    				</div>
    				</td>
				</tr>
			</tbody>
		</table>
	</form>
</section>