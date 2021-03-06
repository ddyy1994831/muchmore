<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>


<script>
function windowclose(){
	var amount = depositform.amount.value;
	if(amount == "") {
		alert("입금할 금액을 입력해주세요.");
		return false;
	}
	else{
		opener.location.href = "mypageMyaccountDepositAction.do?amount="+amount;
	}
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

//[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자  
//[0-9] => \d , [^0-9] => \D
var rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
var rgx2 = /(\d+)(\d{3})/; 
//대출금액 "," 찍기
function getNumber(obj){
	var num01;
	var num02;
	num01 = obj.value;
	num02 = num01.replace(rgx1,"");
	num01 = setComma(num02);
	document.depositform.check_amount.value =  "￦" +num01+"원";
}

function setComma(inNum){
	var outNum;
	outNum = inNum;
	outNum = outNum;
	while (rgx2.test(outNum)) {
		outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
	}
 	return outNum;
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
					<td>
						<input type="text" class="form-control col-xs-2" id="amount" name ="amount" 
						onchange = "getNumber(this)" onkeyup = "getNumber(this)" placeholder="금액 입력!" maxlength="8" onkeypress="gNumCheck()" required >
					</td>
				</tr>
				
				<tr>
					<td>금액 확인 : </td>
					<td>
						<input type="text" class="form-control col-xs-2" id="check_amount" name ="check_amount" 
						placeholder="금액 확인!" onfocus="javascript:blur();" style="cursor: default" readonly>
					</td>
				</tr>
				
				<tr class = "text-center">
					<td colspan = "2">
						<br/>
						<button type = "button" id="depositbtn" name="depositbtn" onclick="windowclose()" class="btn btn-primary">입금하기</button>
					</td>
				</tr>
			</table>
		</div>
	</fieldset>
</form>
