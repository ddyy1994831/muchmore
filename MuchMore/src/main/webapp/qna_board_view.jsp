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
  	<div class = "row" style="height: 100%">
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
			<tr>
				<td colspan="2">
				<%
					/*2017-07-30 다예 : 게시글을 볼때 접속자가 muchmore라면 해당 게시글에 대해 답변, 삭제, 목록이동만 할 수 있다. */
					if(id.equals("muchmore")) {
				%>
						<div class="col-lg-9 col-lg-offset-1 text-center">
    						<a href="./BoardReplyForm.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">답변</a>
    						<a href="./BoardDeleteForm.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">삭제</a>
    						<a href="./BoardList.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">목록</a>
    					</div>
    			<%	
    				}
					/*2017-07-30 다예 : 게시글을 볼때 접속자가 일반회원이라면  */
					else {
						/*2017-07-31 다예 : 게시글이 muchmore의 글이라면 해당 게시글에 대해 삭제, 목록이동만 할 수 있다. */
						if(writer.equals("muchmore")) {
    			%>
    						<div class="col-lg-9 col-lg-offset-1 text-center">
    							<a href="./BoardDeleteForm.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">삭제</a>
    							<a href="./BoardList.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">목록</a>
    						</div>
    			<%
						}
						/*2017-07-31 다예 : 게시글이 일반회원의 글이라면 해당 게시글에 대해 수정, 삭제, 목록이동만 할 수 있다. */
						else {
    			%>
    						<div class="col-lg-9 col-lg-offset-1 text-center">
    							<a href="./BoardModifyForm.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">수정</a>
    							<a href="./BoardDeleteForm.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">삭제</a>
    							<a href="./BoardList.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">목록</a>
    						</div>
    			<%
						}
					}
    			%>
    			</td>
    		</tr>
    	</tbody>
    </table>
    </div>
</section>