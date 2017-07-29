<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	/* 2017-07-29 ���� : �α��� ȭ��  */
	request.setCharacterEncoding("EUC-KR");
	String msg = (String)request.getAttribute("msg");
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
%>
    <script>
	    function openConfirmId(loginform) {
			var url = "login_find_id.do";
			open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no," +
					"scrollbars=no,resizeable=no,width=450px,height=420");
		}
	    
	    function openConfirmPw(loginform) {
			var url = "login_find_pw.do";
			open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no," +
					"scrollbars=no,resizeable=no,width=450px,height=450");
		}
    </script>

<section class="container">
	<div class="row" style = "height:80%">
		<div class="col-md-4 col-md-offset-4">
			<form action="loginAction.do" method="post" name="loginform" id = "loginform">
				<fieldset>
					<h3 class="form-signin-heading">Login</h3>
					<!-- ���̵��Է� -->
					<div class = "form-group">
						<label for="member_id" class="sr-only">ID</label>
						<input type="text" id="member_id" name="member_id" class="form-control" placeholder="���̵�" required autofocus>
					</div>
					
					<!-- ��й�ȣ �Է� -->
					<div class = "form-group">
						<label for="member_password" class="sr-only">PW</label>
						<input type="password" id="member_pw1" name="member_pw1" class="form-control" placeholder="��й�ȣ" required>
					</div>
					
					<div class="checkbox text-right">
						<label> 
							<input type="checkbox" value="remember-me"> Remember me
						</label>
					</div>
					
					<div class = "text-center">
						<button class="btn btn-primary btn-md" type="submit">�α���</button>
					</div>
					
					<div class = "text-center" style = "margin-top:5px">
						<input type = "button" class = "btn-sm btn-default" onclick = "openConfirmId(this.form)" value = "���̵� ã��">
						<input type = "button" class = "btn-sm btn-default" onclick = "openConfirmPw(this.form)" value = "��й�ȣ ã��">
					</div>
				</fieldset>
			</form>
			<%
			if(msg != null) {
			%>
			<div class="text-center text-danger" style="font-size: 10pt;">
				<strong>error!</strong> ���̵� �Ǵ� ��й�ȣ�� �߸� �Է��ϼ̽��ϴ�.
			</div>
			<%
			}
			%>
		</div>
	</div>
</section>

