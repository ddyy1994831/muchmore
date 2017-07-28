<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("utf-8");

	//로그인상태인지 체크
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
%>
<script type="text/javascript">
    
    	function check(){
    		var id = joinform.member_id.value;
    		var password1 = joinform.member_pw1.value;
    		var password2 = joinform.member_pw2.value;
    		var email = joinform.member_email.value;
    		var exptext =  /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    		var phone = joinform.member_phone.value;
    		var	name = joinform.member_name.value;
    		var agreement = joinform.member_agreement.value;
    	
    		var forms = document.getElementById("joinform");
    	
    		//아이디 체크
    		if(id.length < 8 || id.length > 12){
	    		alert("아이디를 제대로 입력해주세요. (영문, 숫자 포함 8~12자리)");
    			joinform.member_id.focus();
    			return false;
    		}    		
    		else{
    			for(i=0; i<id.length; i++)
    			{
    				ch = id.substring(i, i+1);
    				if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z")))
    				{
    					alert("특수문자가 포함, 다시 입력!!!");
    					joinform.member_id.focus();
    					return false;
    				}
    			}	
    		}
    	//아이디 중복확인 체크
    	if(joinform.idDuplication.value != "idCheck"){
    		alert("아이디 중복체크를 해주세요.");
    		return false;
    	}
    		
    	//비밀번호 체크
    		if(password1.length < 6 || password1.length > 10){
    			alert("비밀번호를 제대로 입력하세요. (영문, 숫자 포함 6~10자리)");
    			joinform.member_pw1.focus();
    			return false;    			
    		}    		
    		else
			{
				for(i=0; i<password1.length; i++)
				{
					ch = password1.substring(i, i+1);
					if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z")))
					{
						alert("특수문자가 포함, 다시 입력!!!");
						joinform.member_pw1.focus();
						return false;
					}
				}
			}
    	
    	//비밀번호 확인 체크
    		if(password1 != password2){
    			alert("비밀번호가 일치하지 않습니다.");
    			password2="";
    			joinform.member_pw1.focus();
    			return false;
    		}
    	
    	//이름 체크
    		if(name.length<=1){
    			alert("이름을 제대로 입력해 주세요.");
    			joinform.member_name.focus();
    			return false;
    		}  	   
    	//휴대폰 번호 체크
    		if( phone.length == 0 || phone.length > 13) {
    			alert("휴대폰 번호를 제대로 입력하세요.('-' 포함 13자리)");
    			joinform.member_phone.focus();
    			return false;
    		}
    	
    	//이메일 체크
    		if(exptext.test(email) == false){
    			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
    			alert("이메일을 제대로 입력하세요.('@' 이하 주소를 모두 입력해주세요)");
    			joinform.member_email.focus();
    			return false;
    		}
    	
    	//개인정보약관 동의 체크
    		if(agreement == "0"){
    			alert("개인정보약관에 동의하지 않으시면 회원가입을 하실 수 없습니다.");
    			joinform.member_email.focus();
    			return false;
    		}
    		else
    			{
    			return true;
    			}
    	
    		return false;
    	}
    
    //아이디 중복체크
    	function check_Id(){
    		var joinform = document.getElementById("joinform");
    		var id = joinform.member_id.value;
    		var url = "join_chkId.do?member_id=" + id;
    	
    		if(id.length == 0){
    			alert("아이디를 입력하세요.");
    			joinform.member_id.focus();
    			return false;
    		}
    		open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no," + 
    			"scrollbars=no, resizable=no, width=400, height=200");
    	}
    
    //아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다. 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디 입력했을 때 다시 중복체크를 하도록 한다.
    function inputIdChk(){
    	document.joinform.idDuplication.value="idUncheck";
    }
    </script>

<section class="container">
	<div class="row">
		<form id="joinform" name="joinform" class="form-horizontal"
			action="joinform2.do" method="post" onsubmit="return check()">
			<fieldset>
				<legend>회원가입</legend>
				<div class="form-group">
					<label for="member_id" class="col-lg-2 control-label">아이디</label>
					<div class="col-lg-9">
						<input id="member_id" type="text"
							placeholder="영문, 숫자 포함 8~12자리 입력" name="member_id"
							class="form-control" onkeydown="inputIdChk()">
					</div>
					<div class="col-lg-1">
						<input type="button" id="checkId" name="checkId"
							class="btn btn-primary" value="아이디 중복체크" onclick="check_Id();" />
						<input type="hidden" name="idDuplication" value="idUncheck" />
					</div>
				</div>

				<div class="form-group">
					<label for="member_pw1" class="col-lg-2 control-label">비밀번호</label>
					<div class="col-lg-10">
						<input type="password" class="form-control" id="member_pw1"
							name="member_pw1" placeholder="영문, 숫자 포함 6~10자리 입력">
					</div>
				</div>

				<div class="form-group">
					<label for="member_pw2" class="col-lg-2 control-label">비밀번호
						확인</label>
					<div class="col-lg-10">
						<input type="password" class="form-control" id="member_pw2"
							name="member_pw2" placeholder="">
					</div>
				</div>

				<div class="form-group">
					<label for="member_name" class="col-lg-2 control-label">이름</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="member_name"
							name="member_name" placeholder="이름">
					</div>
				</div>
				<div class="form-group">
					<label for="member_phone" class="col-lg-2 control-label">휴대폰번호</label>
					<div class="col-lg-10">
						<input type="phone" class="form-control" id="member_phone"
							maxlength="13" name="member_phone"
							placeholder="휴대폰 번호를 제대로 입력하세요.('-' 포함 13자리)">
					</div>
				</div>

				<div class="form-group">
					<label for="member_email" class="col-lg-2 control-label">이메일</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="member_email"
							name="member_email"
							placeholder="@이하 주소를 모두 입력해주세요.(예) abc@naver.com)">
					</div>
				</div>

				<div class="form-group">
					<label class="col-lg-2 control-label">개인정보 약관 동의</label>
					<div class="col-lg-10">
						<div class="radio">
							<label> <input type="radio" name="member_agreement"
								id="optionsRadios1" value="1" checked> 동의합니다.
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="member_agreement"
								id="optionsRadios2" value="0"> 동의하지 않습니다.
							</label>
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button type="reset" class="btn btn-default">취소</button>
						<button type="submit" class="btn btn-primary">다음</button>
					</div>
				</div>
			</fieldset>
		</form>

	</div>
</section>

