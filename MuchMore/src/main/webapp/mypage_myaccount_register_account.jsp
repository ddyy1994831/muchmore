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
    	alert("'-'�� ������ ���¹�ȣ�� �Է����ּ���");
	}
}
</script>

<form class = "form-horizontal" id = "registeraccount" action = "mypage_myaccount_real_result.do" method = "post" 
	name = "registeraccount">
	<fieldset>
		<table class = "table table-stripped">
			<tr>
				<td>���༱��</td>
				<td>
					<select class="form-control" id="choice_bank" name = "choice_bank">
						<option value="KB" selected>��������</option>
						<option value="IBK">�������</option>
						<option value="ShinHan">��������</option>
						<option value="Woori">�츮����</option>
						<option value="Hana">�ϳ�����</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>���¹�ȣ</td>
				<td>
					<input type="text" class="form-control" id="real_account" name = "real_account" placeholder="'-'�� ������ ���¹�ȣ" onfocusout="blankCheck()" required>
				</td>
			</tr>
			<tr>
				<td colspan = "2" class = "text-center">
					<button type = "button" id="registbtn" name="registbtn" onclick = "windowclose()" class="btn btn-primary">����ϱ�</button>
				</td>
			</tr>
		</table>
	</fieldset>
</form>
