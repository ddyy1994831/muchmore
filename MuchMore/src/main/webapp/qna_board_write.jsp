<%@ page import="com.spring.muchmore.board.BoardVO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- jQuery �ε� -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<% 
	request.setCharacterEncoding("EUC-KR");

	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	
	String writer = (String)request.getAttribute("writer");
%>

<script>
	function board_Check() {
		var pw_check = document.boardform.board_pw_check.checked;
		
		if(boardform.board_title.value == ""){
			alert("������ �Է��ϼ���.");
			return false;
		}
		else if(boardform.board_content.value == ""){
			alert("������ �Է��ϼ���.");
			return false;
		}
		else if(boardform.board_password.value == ""){
			alert("��й�ȣ�� �Է��ϼ���.");
			return false;
		}
		else if(!pw_check){
			boardform.board_pw_check.value = 0;
			document.boardform.submit();
		}
		
		document.boardform.submit();
	}
</script>

<section class="container">
	<div class="row">
		<div class="span12">
			<form id="boardform" name = "boardform" action="BoardWriteAction.do" method="post" class = "form-horizontal">
				<fieldset>
					<legend>Q & A</legend>
					<!-- ������ -->
					<div class="form-group">
						<label for="board_title" class="col-lg-2 control-label">������</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="board_title" name = "board_title" placeholder="������">
						</div>
					</div>
					
					<!-- �ۼ��� -->
					<div class="form-group">
						<label for="board_id" class="col-lg-2 control-label">�ۼ���</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="member_id" name = "member_id" value="<%=writer %>" readonly>
						</div>
					</div>
					
					<!-- ���ǳ��� -->
					<div class="form-group">
						<label for="board_qna_content" class="col-lg-2 control-label">���ǳ���</label>
						<div class="col-lg-10">
							<!-- style="resize: none;"�� ���� textarea ũ�⸦ ������ų �� �ִ�. -->
							<textarea class="form-control" rows="10" style="resize: none;" id="board_content" name = "board_content"></textarea>
						</div>
					</div>
					
					<!-- ��й�ȣ -->
					<div class="form-group">
						<label for="board_password" class="col-lg-2 control-label">��й�ȣ</label>
						<div class="col-lg-10">
							<input type="checkbox" id="board_pw_check" name="board_pw_check" value="1">��бۿ���
							<input type="password" class="form-control" id="board_password" name = "board_password" placeholder="��й�ȣ�� �Է��ϼ���.">
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-lg-9 col-lg-offset-1 text-center">
							<button type="reset" class="btn btn-default">�ٽ��ۼ�</button>
							<button type="button" class="btn btn-default" onclick="board_Check();">�۾���</button>
							<a href = "BoardList.do" class = "btn btn-default">�������</a>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</section>