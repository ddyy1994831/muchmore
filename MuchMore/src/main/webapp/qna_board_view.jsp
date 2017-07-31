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
	String writer = (String)request.getAttribute("writer");
%>

<section class = "container">
    <table class = "table table-hover">
    	<tbody>
    		<tr>
    			<td align="center">제목</td>
    			<td>
    				<div align="left">
    					<%=boardVO.getBoard_title() %>
    				</div>
    			</td>
    		</tr>
    		<tr>
    			<td align="center">작성자</td>
    			<td>
    				<div align="left">
    					<%=boardVO.getMember_id() %>
    				</div>
    			</td>
    		</tr>
    		<tr>
				<td align="center">내  용</td>
				<td>
					<div align = "left">
						<textarea rows="10" cols="70" readonly><%= boardVO.getBoard_content() %></textarea>
					</div>
				</td>
			</tr>
			
<%-- 	<% 
		if(writer.equals("muchmore")) { 
	%> --%>
			<tr>
				<td colspan="2">
				<%
					if(id.equals("muchmore")) {
				%>
						<div class="col-lg-9 col-lg-offset-1 text-center">
    						<a href="./BoardReplyForm.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">답변</a>
    						<a href="./BoardDeleteForm.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">삭제</a>
    						<a href="./BoardList.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">목록</a>
    					</div>
    			<%	
    				}
					else {
    			%>
    					<div class="col-lg-9 col-lg-offset-1 text-center">
    						<a href="./BoardModifyForm.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">수정</a>
    						<a href="./BoardDeleteForm.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">삭제</a>
    						<a href="./BoardList.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">목록</a>
    					</div>
    			<%
    				}
    			%>
    			</td>
    		</tr>
<%--     <%
    	}
    %> --%>
    	</tbody>
    </table>
</section>