<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>


<script>
function windowclose(){
	var amount = depositform.amount.value;
	opener.location.href = "mypageMyaccountDepositAction.do?amount="+amount;
	self.close();
}

//금액 입력에 숫자 입력 방지
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
			<!-- 입금할 금액 -->
			<table class="table table-striped">
				<tr>
					<td>입금할 금액 : </td>
					<td><input type="text" class="form-control col-xs-2" id="amount" name ="amount" 
					onkeypress = "gNumCheck()" placeholder="숫자만 입력 가능!" required ></td>
				</tr>
				
				<tr class = "text-center">
					<td colspan = "2">
						<br/>
						<button type = "button" onclick="windowclose()" class="btn btn-primary">입금하기</button>
					</td>
				</tr>
			</table>
		</div>
	</fieldset>
</form>
