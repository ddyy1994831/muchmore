<%@ page import="com.spring.muchmore.board.BoardVO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- jQuery 로드 -->
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
			alert("제목을 입력하세요.");
			return false;
		}
		else if(boardform.board_content.value == ""){
			alert("내용을 입력하세요.");
			return false;
		}
		else if(boardform.board_password.value == ""){
			alert("비밀번호를 입력하세요.");
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
					<!-- 글제목 -->
					<div class="form-group">
						<label for="board_title" class="col-lg-2 control-label">글제목</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="board_title" name = "board_title" placeholder="글제목">
						</div>
					</div>
					
					<!-- 작성자 -->
					<div class="form-group">
						<label for="board_id" class="col-lg-2 control-label">작성자</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="member_id" name = "member_id" value="<%=writer %>" readonly>
						</div>
					</div>
					
					<!-- 문의내용 -->
					<div class="form-group">
						<label for="board_qna_content" class="col-lg-2 control-label">문의내용</label>
						<div class="col-lg-10">
							<!-- style="resize: none;"을 통해 textarea 크기를 고정시킬 수 있다. -->
							<textarea class="form-control" rows="10" style="resize: none;" id="board_content" name = "board_content"></textarea>
						</div>
					</div>
					
					<!-- 비밀번호 -->
					<div class="form-group">
						<label for="board_password" class="col-lg-2 control-label">비밀번호</label>
						<div class="col-lg-10">
							<input type="checkbox" id="board_pw_check" name="board_pw_check" value="1">비밀글여부
							<input type="password" class="form-control" id="board_password" name = "board_password" placeholder="비밀번호를 입력하세요.">
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-lg-9 col-lg-offset-1 text-center">
							<button type="reset" class="btn btn-default">다시작성</button>
							<button type="button" class="btn btn-default" onclick="board_Check();">글쓰기</button>
							<a href = "BoardList.do" class = "btn btn-default">목록으로</a>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</section>