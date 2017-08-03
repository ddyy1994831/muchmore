<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	response.setCharacterEncoding("EUC-KR");
%>
<script>
function windowclose(){
	var bank = registeraccount.choice_bank.value;
	var real_account = registeraccount.real_account.value;
	if(real_account == "") {
		registeraccount.registbtn.disabled = 'disabled';
	}
	else{
	opener.location.href = "mypageRegisterAccountAction.do?real_account="+real_account+"&bank="+bank;
	}
	self.close();
}

function blankCheck() {
	if(registeraccount.real_account.value == "") {
    	alert("'-'을 포함한 계좌번호를 입력해주세요");
	}
}
</script>

<form class = "form-horizontal" id = "registeraccount" action = "mypage_myaccount_real_result.do" method = "post" 
	name = "registeraccount">
	<fieldset>
		<table class = "table table-stripped">
			<tr>
				<td>은행선택</td>
				<td>
					<select class="form-control" id="choice_bank" name = "choice_bank">
						<option value="KB" selected>국민은행</option>
						<option value="IBK">기업은행</option>
						<option value="ShinHan">신한은행</option>
						<option value="Woori">우리은행</option>
						<option value="Hana">하나은행</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>계좌번호</td>
				<td>
					<input type="text" class="form-control" id="real_account" name = "real_account" placeholder="'-'을 포함한 계좌번호" onfocusout="blankCheck()" required>
				</td>
			</tr>
			<tr>
				<td colspan = "2" class = "text-center">
					<button type = "button" id="registbtn" name="registbtn" onclick = "windowclose()" class="btn btn-primary">등록하기</button>
				</td>
			</tr>
		</table>
	</fieldset>
</form>
