<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>


<script>
function windowclose(){
	var amount = depositform.amount.value;
	opener.location.href = "mypageMyaccountDepositAction.do?amount="+amount;
	self.close();
}

//�ݾ� �Է¿� ���� �Է� ����
function gNumCheck() {
	if(event.keyCode >= 48 && event.keyCode <= 57) {
		return true;
	}
	else {
		event.returnValue = false;
	}
}
</script>

<form class = "form-horizontal" id = "depositform" action = "mypageMyaccountDepositAction.do" method = "post" 
	name = "depositform">
	<fieldset>
		<div >
			<!-- �Ա��� �ݾ� -->
			<table class="table table-striped">
				<tr>
					<td>�Ա��� �ݾ� : </td>
					<td><input type="text" class="form-control col-xs-2" id="amount" name ="amount" 
					onkeypress = "gNumCheck()" placeholder="���ڸ� �Է� ����!" required ></td>
				</tr>
				
				<tr class = "text-center">
					<td colspan = "2">
						<br/>
						<button type = "button" onclick="windowclose()" class="btn btn-primary">�Ա��ϱ�</button>
					</td>
				</tr>
			</table>
		</div>
	</fieldset>
</form>
