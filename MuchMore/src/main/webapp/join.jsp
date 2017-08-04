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
<!-- 도로명 주소 찾기 -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
   
   	//입력값 예외처리
    	function check(){
    		var id = joinform.member_id.value;
    		var password1 = joinform.member_pw1.value;
    		var password2 = joinform.member_pw2.value;
    		var email = joinform.member_email.value;
    		var exptext =  /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    		var phone = joinform.member_phone.value;
    		var	name = joinform.member_name.value;
    		var jumin1 = document.getElementById("member_jumin1");
    		var jumin2 = document.getElementById("member_jumin2");
    		var zipcode = document.getElementById("member_zipcode");
    		var addr1 = document.getElementById("member_addr1");
    		var addr2 = document.getElementById("member_addr2");
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
    	
    	//주민번호 체크
     		if (jumin1.value == "") // 빈공백 체크
    		{
    			alert("주민번호(앞자리)를 입력하세요!!")
    			jumin1.focus();
    			return false;
    		}
    		
    		else if (jumin2.value == "") // 빈공백 체크
        	{
    			alert("주민번호(뒷자리)를 입력하세요!!")
    			jumin2.focus();
    			return false;
    		}
    		
    		else // 빈공백이 아닐때
    		{
    			var str1 = jumin1.value;
    			var str2 = jumin2.value;
    			if (str1.length != 6) // 입력 길이 체크
    			{
    				alert("주민번호 확인(생년월일 6자리)!!!")
    				jumin1.focus();
    				return false;
    			}
    			
    			else if (str2.length != 7) // 입력 길이 체크
    			{
    				alert("주민번호 확인(7자리)!!!")
    				jumin2.focus();
    				return false;
    			}
    			
    			else // 입력값 길이에 오류가 없을 때
    			{
    				str = str1 + str2;
    				var w = 2, hap = 0, chk;
    				for (i = 0; i < str.length; i++)
    				{
    					ch = str.substring(i, i+1);
    					if (!(ch >= "0" && ch <= "9")) // 입력문자가 숫자인지 검사 // if()안의 문장을 isNaN(str)로 하고 for문 밖으로 빼놓아도 같은 효과!
    					{
    						alert("특수문자가 포함, 다시 입력!");
    						document.joinform.jumin1.focus();
    						return false;
    					}
    					
    					else
    					{
    						if( i == (str.length-1)) // 마지막은 체크디지트 이므로 합계 계산에서 제외시킴.
    							continue;
    						hap += parseInt(ch) * w; // 가중치(w)를 곱해서 합계를 구함
    						w++;
    						if (w == 10) // 가중치가 10이면 2로 변경
    						w = 2;
    					}
    				}
    				
    				chk = 11 - (hap % 11); // 체크디지트 구함
    				if (chk == 10)
    					chk = 0;
    				else if (chk == 11)
    					chk = 1;
    		
    				if (chk != parseInt(str.substring(str.length-1, str.length)))
    				{
    					alert("주민번호 오류, 다시 입력!!!");
    					document.joinform.jumin1.focus();
    					return false;
    				}
    			}
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
    		var url = "joinCheckId.do?member_id=" + id;
    	
    		if(id.length == 0){
    			alert("아이디를 입력하세요.");
    			joinform.member_id.focus();
    			return false;
    		}
    		open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no," + 
    			"scrollbars=no, resizable=no, width=400, height=200");
    }
    
    //아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다. 이렇게 하는 이유는 중복체크 후 아이디 입력란에 새로운 아이디 입력했을 때 다시 중복체크를 하도록 한다.
    function inputIdChk(){
    	document.joinform.idDuplication.value="idUncheck";
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
	
	function gNumCheck() {
		if(event.keyCode >= 48 && event.keyCode <= 57) {
			return true;
		}
		else {
			event.returnValue = false;
		}
	}
</script>

<section class="container">
	<div class = "row text-center" >		
	    <div class="container" align="center">
			<div class="jumbotron">
				<h3>회원가입</h3><br/><br/>  
			</div>     
		</div>
	</div>	
	<div class="row">
		<div class = "col-md-8 col-md-offset-2">
			<div class = "panel panel-primary">
				<div class = "panel-heading">
					<h4 class = "panel-title">회원가입</h4>    
				</div>
			
				<div class = "panel-body">
					<form id="joinform" name="joinform" class="form-horizontal"
						action="joinAction.do" method="post" onsubmit="return check()">
						<fieldset>
							<div class="form-group">
								<label for="member_id" class="col-sm-3 control-label">아이디</label>
								<div class="col-sm-4">     
									<input id="member_id" type="text"
										placeholder="영문, 숫자 포함 8~12자리 입력" name="member_id"
										class="form-control" onkeydown="inputIdChk()">
								</div>
								<div class="col-sm-3">
									<input type="button" id="checkId" name="checkId"
										class="btn btn-primary" value="아이디 중복체크" onclick="check_Id();" />
									<input type="hidden" name="idDuplication" value="idUncheck" />
								</div>
							</div>
	
							<div class="form-group">
								<label for="member_pw1" class="col-sm-3 control-label">비밀번호</label>
								<div class="col-sm-4">
									<input type="password" class="form-control" id="member_pw1" maxlength = "15"
										name="member_pw1" placeholder="영문, 숫자 포함 6~10자리 입력">
								</div>
							</div>
		
							<div class="form-group">
								<label for="member_pw2" class="col-sm-3 control-label">비밀번호
									확인</label>
								<div class="col-sm-4">
									<input type="password" class="form-control" id="member_pw2" maxlength = "15"
										name="member_pw2" placeholder="">
								</div>
							</div>
		
							<div class="form-group">
								<label for="member_name" class="col-sm-3 control-label">이름</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="member_name"
										name="member_name" placeholder="이름">
								</div>
							</div>
		
							<div class="form-group">
								<label for="input_jumin1" class="col-sm-3 control-label">주민번호</label>
								<div class = "form-inline">
									<div class="col-sm-8">
										<input type="text" class="form-control" id="member_jumin1" maxlength="6" onkeypress = "gNumCheck()"
											name="member_jumin1" placeholder="">-
										<input type="password" class="form-control" id="member_jumin2" maxlength="7" onkeypress = "gNumCheck()"
											name="member_jumin2" placeholder="">
									</div>
								</div>
								<!-- <div class="col-lg-1">-</div>
								<div class="col-sm-4">
									<input type="password" class="form-control" id="member_jumin2" maxlength="7" onkeypress = "gNumCheck()"
										name="member_jumin2" placeholder="">
								</div> -->
							</div>
			
		
							<div class="form-group">
								<label for="member_phone" class="col-sm-3 control-label">휴대폰번호</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="member_phone" maxlength = "11" 
										maxlength="13" name="member_phone" onkeypress = "gNumCheck()"
										placeholder="휴대폰 번호를 제대로 입력하세요.('-' 제외 11자리)">
								</div>
							</div>
		
							<div class="form-group">
								<label for="member_email" class="col-sm-3 control-label">이메일</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="member_email"
										name="member_email"
										placeholder="@이하 주소를 모두 입력해주세요.(예) abc@naver.com)">
								</div>
							</div>
		
							<div class="form-group">
								<label for="input_addr1" class="col-sm-3 control-label">주소</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="member_zipcode"
										name="member_zipcode" placeholder="">
								</div>
								<div class="col-sm-4"> 
									<input type="button" class="btn btn-primary btn-sm" value="우편번호 검색"
										onclick="sample6_execDaumPostcode()">
								</div>
							</div>
							
							<div class = "form-group">
								<label for = "member_addr1" class = "col-sm-3 control-label">기본주소</label>
								<div class = "col-sm-6">
									<input type="text" class="form-control" id="member_addr1"
										name="member_addr1" placeholder="">
								</div>
							</div>
		
							<div class="form-group">
								<label for="input_addr2" class="col-sm-3 control-label">상세주소</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="member_addr2"
										name="member_addr2" placeholder="">
								</div>
							</div>
		
							<div class="form-group">
								<label class="col-sm-3 control-label">가입 약관 동의</label>
								<div class="col-sm-5">
									<button type="button" class="btn btn-default" id="myBtn1">자세히 보기</button>  
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
								<div class="text-center">
									<button type="reset" class="btn btn-default">취소</button>
									<button type="submit" class="btn btn-primary">다음</button>
								</div>
							</div>
						</fieldset>
					</form>
			</div>
		</div>
	</div>
	</div>
	
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">개인정보 제공 동의</h4>
					<p>귀사와 본인 사이의 (금융)거래와 관련하여 귀사가 본인의 개인정보를 제3자에게 제공하고자 하는 경우, 귀사는 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 개인정보 보호법 등에 따라 본인의 동의를 얻어야 합니다. 이에 본인은 귀사가 아래의 내용과 같이 본인의 개인정보를 제3자에게 제공하는데 동의합니다.</p>
				</div>
				<div class="modal-body">
					<h4>[개인정보의 제3자 제공에 관한 사항]</h4>
					<hr/>
					<ol>
						<li>
							<p>개인정보를 제공받는 자</p>
							<p>머치모아</p>
						</li>
						<li>
							<p>개인정보 이용 목적</p>
							<p>머치모아(이라 “회사"라 함)이 아래와 같이 수탁자에게 위탁한 업무를 수행하기 위해 이용자의 개인정보를 (주)렌딧에게 제공합니다.</p>
						</li>
						<li>
							<p>제공하는 개인정보 항목</p>
							<p>성명, 생년월일, 사업자번호, 휴대전화 번호, 은행명, 계좌번호, 예금주명 등</p>
						</li>
						<li>
							<p>개인정보를 제공받은 자의 개인정보 보유 및 이용 기간</p>
							<p>“여신업체”는 이용자가 투자 신청을 한 날부터 모든 투자가 종료되는 날까지의 기간 동안 이용자의 개인정보를 “회사"에 제공합니다.</p>
						</li>
					</ol>
				</div>
				<div class="modal-footer">
					<hr/>
					<ul class = "text-left" style = "list-style-type : square">
						<li>
							<p>상기 내용이 변동되는 경우 당사 홈페이지(www.muchmore.com) 게시 등을 통해 그 내용을 안내 드리겠습니다.</p>
						</li>
						<li>
							<p>귀하는 동의를 거부할 권리가 있으나, 위 사항에 대한 동의가 없을 경우 대출채권에 대한 투자가 불가능할 수 있습니다.</p>
						</li>
					</ul>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	 <!-- 자세히보기 버튼-->
    <script>
	$(document).ready(function(){
	    $("#myBtn1").click(function(){
	        $("#myModal").modal({backdrop: true});
	    });
	});
	</script>
		
</section>

