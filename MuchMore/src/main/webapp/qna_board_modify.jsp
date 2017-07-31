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
	function modifyboard() {
		if(modifyform.board_content.value == ""){
			alert("������ �Է��ϼ���.");
			return false;
		}
		else if(modifyform.board_password.value == ""){
			alert("��й�ȣ�� �Է��ϼ���.");
			return false;
		}
			
		document.modifyform.submit();
	}
</script>

<section class="container">
   	<form action="BoardModifyAction.do" method = "post" name = "modifyform" id="modifyform">
	<input type="hidden" id="board_num" name="board_num" value="<%=boardVO.getBoard_num() %>">
		<table class="table table-hover">
			<tbody>
    			<tr>
					<td align="center">����</td>
					<td>
						<div align="left">
							<input id="board_title" name="board_title" size="50" maxlength="100" value="<%=boardVO.getBoard_title() %>">
						</div>
					</td>
				</tr>
				<tr>
					<td align="center">�ۼ���</td>
					<td>
						<div align="left">
							<input type="text" class="form-control" id="member_id" name = "member_id" value="<%=boardVO.getMember_id()%>" readonly>
						</div>
					</td>
				</tr>
				<tr>
					<td align="center">��  ��</td>
					<td>
						<div align="left">
							<textarea class="form-control" rows="10" style="resize: none;" id="board_content" name = "board_content"><%= boardVO.getBoard_content() %></textarea>			
						</div>
					</td>
				</tr>
				<tr>
					<td align="center">��й�ȣ</td>
    				<td>
    					<div align="left">
    						<input type="checkbox" id="board_pw_check" name="board_pw_check" value="1">��бۿ���
							<input type="password" class="form-control" id="board_password" name = "board_password" value="<%= boardVO.getBoard_password() %>">
    					</div>	
    				</td>
    			</tr>
    			<tr>
    				<td colspan="2">
    					<div class = "row">
    						<div class="col-lg-9 col-lg-offset-1 text-center">
								<button type="button" class="btn btn-default" onclick="modifyboard()">����</button>
								<button type="button" class="btn btn-default" onclick="javascript:history.go(-1)">�ڷ�</button>
							</div>
    					</div>
    				</td>
    			</tr>
			</tbody>
		</table>
	</form>
</section>