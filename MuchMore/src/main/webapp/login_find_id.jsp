<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">
	function check(){
		
		var email = findform.member_email.value;
		var exptext =  /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		
		var forms = document.getElementById("findform");
	
		//이메일 체크
		if(exptext.test(email) == false){
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
			alert("이메일을 제대로 입력하세요.('@' 이하 주소를 모두 입력해주세요)");
			joinform.member_email.focus();
			return false;
		}
	
		return true;
	}
</script>

<section class = "container">
 	<div class = "row">
		<div class = "col-sm col-md-4">
			<form class = "form-horizontal" id = "findform" name = "findform" action = "loginFindIdAction.do" 
				method = "post" onsubmit="return check()">
				<fieldset>
					<legend>아이디 찾기</legend>
					<div class="form-group">
						<label for="member_name" class="col-lg-2 control-label">이름</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="member_name" name = "member_name" placeholder="이름" required>
						</div>
					</div>
						
					<div class="form-group">
						<label for="member_email" class="col-lg-2 control-label">이메일</label>
						<div class="col-lg-10">
							<input type="email" class="form-control" id="member_email" name = "member_email" placeholder="이메일" required>
						</div>
					</div>
				
					<div class="form-group">
						<div class="col-lg-10 col-lg-offset-2">
							<button type="submit" class="btn btn-primary">아이디찾기</button>
						</div>
					</div>
				</fieldset>
			</form>
    	</div>
    </div>
</section>