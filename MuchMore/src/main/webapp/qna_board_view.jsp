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
    			<td align="center">����</td>
    			<td>
    				<div align="left">
    					<%=boardVO.getBoard_title() %>
    				</div>
    			</td>
    		</tr>
    		<tr>
    			<td align="center">�ۼ���</td>
    			<td>
    				<div align="left">
    					<%=boardVO.getMember_id() %>
    				</div>
    			</td>
    		</tr>
    		<tr>
				<td align="center">��  ��</td>
				<td>
					<div align = "left">
						<textarea rows="10" cols="70" readonly><%= boardVO.getBoard_content() %></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<%
					/*2017-07-30 �ٿ� : �Խñ��� ���� �����ڰ� muchmore��� �ش� �Խñۿ� ���� �亯, ����, ����̵��� �� �� �ִ�. */
					if(id.equals("muchmore")) {
				%>
						<div class="col-lg-9 col-lg-offset-1 text-center">
    						<a href="./BoardReplyForm.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">�亯</a>
    						<a href="./BoardDeleteForm.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">����</a>
    						<a href="./BoardList.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">���</a>
    					</div>
    			<%	
    				}
					/*2017-07-30 �ٿ� : �Խñ��� ���� �����ڰ� �Ϲ�ȸ���̶��  */
					else {
						/*2017-07-31 �ٿ� : �Խñ��� muchmore�� ���̶�� �ش� �Խñۿ� ���� ����, ����̵��� �� �� �ִ�. */
						if(writer.equals("muchmore")) {
    			%>
    						<div class="col-lg-9 col-lg-offset-1 text-center">
    							<a href="./BoardDeleteForm.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">����</a>
    							<a href="./BoardList.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">���</a>
    						</div>
    			<%
						}
						/*2017-07-31 �ٿ� : �Խñ��� �Ϲ�ȸ���� ���̶�� �ش� �Խñۿ� ���� ����, ����, ����̵��� �� �� �ִ�. */
						else {
    			%>
    						<div class="col-lg-9 col-lg-offset-1 text-center">
    							<a href="./BoardModifyForm.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">����</a>
    							<a href="./BoardDeleteForm.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">����</a>
    							<a href="./BoardList.do?board_num=<%=boardVO.getBoard_num()%>" class="btn btn-default">���</a>
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