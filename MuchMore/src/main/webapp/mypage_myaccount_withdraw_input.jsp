<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>


<script>
function windowclose(){
	var amount = withdrawform.amount.value;
	opener.location.href = "mypageMyaccountWithdrawAction.do?amount="+amount;
	self.close();
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

<form class = "form-horizontal" id = "withdrawform" action = "mypageMyaccountWithdrawAction.do" method = "post" 
	name = "depositform">
	<fieldset>
		<div >
			<!-- 입금할 금액 -->
			<table class="table table-striped">
				<tr>
					<td>출금할 금액 : </td>
					<td><input type="text" class="form-control col-xs-2" id="amount" name ="amount"
					onkeypress="gNumCheck()" placeholder = "숫자만 입력 가능!" required ></td>
				</tr>
				
				<tr class = "text-center">
					<td colspan = "2">
						<br/>
						<button type = "button" onclick="windowclose()" class="btn btn-primary">출금하기</button>
					</td>
				</tr>
			</table>
		</div>
	</fieldset>
</form>
