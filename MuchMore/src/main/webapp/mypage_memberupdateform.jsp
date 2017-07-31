<%@ page import="com.spring.muchmore.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	} else {
		out.println("<script>");
		out.println("alert('로그인하세요');");
		out.println("history.back(-1);");
		out.println("</script>");
		out.close();
	}

	MemberVO member = (MemberVO) request.getAttribute("member");
	System.out.println("회원정보수정_로그인한 id : " + member.getMember_id());
%>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
    function update_check() {
    	
    	var password = updateform.member_pw_origin.value;    
    	var password1 = updateform.member_pw1.value;    	
    	var password2 = updateform.member_pw2.value;
    	var email = updateform.member_email.value;    	
		var exptext =  /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var memberPw = '<%=member.getMember_pw1()%>';
		
		//기존 비밀번호 체크
		if(password != memberPw) {
			alert("기존 비밀번호가 일치하지 않습니다.");
			updateform.member_pw_origin.focus();
			return false;
		}
	
    	//새 비밀번호 형식 체크
    	if(password1.length < 6 || password1.length > 10 || password1 == "")
    	{
			alert("비밀번호를 제대로 입력하세요. (영문, 숫자 포함 6~10자리)");
			updateform.member_pw1.focus();
			return false;
		}
    	//새 비밀번호와 기존 비밀번호 다름 여부 체크
    	if(password == password1){
    		alert("기존 비밀번호와 다른 번호를 설정해주세요.");
    		updateform.member_pw1.focus();
    		return false;
    	}
		//새 비밀번호와 비밀번호 확인 일치 체크
		if(password1 != password2) {
			alert("새 비밀번호가 일치하지 않습니다.");
			updateform.member_pw2.focus();
			return false;
		}
		//우편번호 공백 체크
		if (zipcode.value == ""){
			alert("우편번호 검색을 실시하세요.");
			zipcode.focus();
			return false;
		}
		//기본주소 공백 체크
		if (addr1.value == ""){
			alert("우편번호 검색을 실시하세요.");
			zipcode.focus();
			return false;
		}
		//상세주소 공백 체크
		if (addr2.value == ""){
			alert("상세주소를 입력하세요.");
			addr2.focus();
			return false;
		}
		//이메일 체크
    	if(exptext.test(email) == false){
    		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
    		alert("이메일을 제대로 입력하세요.('@' 이하 주소를 모두 입력해주세요)");
    		updateform.member_email.focus();
    		return false;
   	 	}
	return true;
    }
    
  //우편번호 검색 사용
	function sample6_execDaumPostcode() {
		new daum.Postcode({
	    	oncomplete: function(data) {
	        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
		    	// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullAddr = ''; // 최종 주소 변수
				var extraAddr = ''; // 조합형 주소 변수
	
	        	// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	        	if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			        fullAddr = data.roadAddress;
		    	}
	        
	        	else { // 사용자가 지번 주소를 선택했을 경우(J)
	        		fullAddr = data.jibunAddress;
	        	}
	
				// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	        	if(data.userSelectedType === 'R'){
	        		//법정동명이 있을 경우 추가한다.
	            	if(data.bname !== ''){
	            		extraAddr += data.bname;
	            	}
	            
	        		// 건물명이 있을 경우 추가한다.
	            	if(data.buildingName !== ''){
	            		extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            	}
					// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				}
	
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("member_zipcode").value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById("member_addr1").value = fullAddr;
	
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("member_addr2").focus();
			}
		}).open();
	}
    </script>

<!-- page 내용 -->
<section class="container">
	<div class="row" style="height:100%">
		<div class="col-sm-3" id="menu">
			<ul class="nav nav-pills nav-stacked">
				<li class=""><a href="mypageMyaccount.do" id="MyAccount">MyAccount</a></li>
				<li class=""><a href="mypage_myinvest.do" id="MyInvest">투자내역</a></li>
				<li class=""><a href="mypage_myloan.do" id="MyLoan">대출내역</a></li>
				<li class=""><a href="mypage_memberupdate.do" id="MyUpdate">회원정보수정</a></li>
			</ul>
		</div>
		<!-- ./col-sm-3 -->
		<%-- <center> --%>
		<div class="col-md-9">
			<div class="col-md-9 col-md-offset-1">
				<form id="updateform" name="updateform" class="form-horizontal"
					action="mypage_memberupdatesuccess.do" method="post"
					onsubmit="return update_check();">
					<fieldset>
						<legend>회원정보 수정</legend>
						<div class="form-group">
							<label for="member_id" class="col-lg-3 control-label">아이디</label>
							<div class="col-lg-6">
								<input id="member_id" type="text"
									placeholder="영문, 숫자 포함 8~12자리 입력" name="member_id"
									class="form-control" value="<%=member.getMember_id()%>"
									readOnly>
							</div>
						</div>

						<div class="form-group">
							<label for="member_pw_origin" class="col-lg-3 control-label">기존 비밀번호</label>
							<div class="col-lg-6">
								<input type="password" class="form-control"
									id="member_pw_origin" name="member_pw_origin" placeholder="">
							</div>
						</div>

						<div class="form-group">
							<label for="member_pw1" class="col-lg-3 control-label">새 비밀번호</label>
							<div class="col-lg-6">
								<input type="password" class="form-control" id="member_pw1"
									name="member_pw1" placeholder="영문, 숫자 포함 6~10자리 입력">
							</div>
						</div>

						<div class="form-group">
							<label for="member_pw2" class="col-lg-3 control-label">비밀번호 확인</label>
							<div class="col-lg-6">
								<input type="password" class="form-control" id="member_pw2"
									name="member_pw2" placeholder="">
							</div>
						</div>

						<div class="form-group">
							<label for="member_name" class="col-lg-3 control-label">이름</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="member_name"
									name="member_name" placeholder="이름"
									value="<%=member.getMember_name()%>" readOnly>
							</div>
						</div>
						
						<div class="form-group">
							<label for="member_phone" class="col-lg-3 control-label">휴대폰번호</label>
							<div class="col-lg-6">
								<input type="tel" class="form-control" id="member_phone"
									maxlength="13" name="member_phone" placeholder=""
									value="<%=member.getMember_phone()%>" readOnly>
							</div>
						</div>
						
						<div class="form-group">
							<label for="input_addr1" class="col-lg-3 control-label">주소</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="member_zipcode"	name="member_zipcode" value="<%=member.getMember_zipcode()%>"> 
								<input type="button" class="btn btn-primary btn-sm" value="우편번호 검색" onclick="sample6_execDaumPostcode()"><br /><br /> 
								<input type="text" class="form-control" id="member_addr1" name="member_addr1" placeholder="" value="<%=member.getMember_addr1()%>">
							</div>
						</div>

						<div class="form-group">
							<label for="input_addr2" class="col-lg-3 control-label">상세주소</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="member_addr2" name="member_addr2" placeholder="" value="<%=member.getMember_addr2()%>">
							</div>
						</div>						

						<div class="form-group">
							<label for="member_email" class="col-lg-3 control-label">이메일</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="member_email" name="member_email"
									placeholder="@이하 주소를 모두 입력해주세요.(예) abc@naver.com)"
									value="<%=member.getMember_email()%>">
							</div>
						</div>


						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="reset" class="btn btn-default">취소</button>
								<button type="submit" class="btn btn-primary">회원정보 수정</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<%-- </center> --%>
		<!-- ./col-sm-9 -->
	</div>
</section>
<!-- ./page 내용 -->

