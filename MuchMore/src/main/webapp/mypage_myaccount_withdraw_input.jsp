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

//[] <--���� ���� [^] <--���� [0-9] <-- ����  
//[0-9] => \d , [^0-9] => \D
var rgx1 = /\D/g;  // /[^0-9]/g �� ���� ǥ��
var rgx2 = /(\d+)(\d{3})/; 
//����ݾ� "," ���
function getNumber(obj){
	var num01;
	var num02;
	num01 = obj.value;
	num02 = num01.replace(rgx1,"");
	num01 = setComma(num02);
	document.withdrawform.check_amount.value =  "��" +num01+"��";
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

<form class = "form-horizontal" id = "withdrawform" action = "mypageMyaccountWithdrawAction.do" method = "post" 
	name = "withdrawform">
	<fieldset>
		<div >
			<!-- �Ա��� �ݾ� -->
			<table class="table table-striped">
				<tr>
					<td>����� �ݾ� : </td>
					<td><input type="text" class="form-control col-xs-2" id="amount" name ="amount"
					onchange = "getNumber(this)" onkeyup = "getNumber(this)" placeholder = "���ڸ� �Է� ����!" onkeypress="gNumCheck()" maxlength="8" required ></td>
				</tr>
				<tr>
					<td>�ݾ� Ȯ�� : </td>
					<td>
						<input type="text" class="form-control col-xs-2" id="check_amount" name ="check_amount" 
						placeholder="�ݾ� Ȯ��!" onfocus="javascript:blur();" style="sursor: default" readonly>
					</td>
				</tr>
				
				<tr class = "text-center">
					<td colspan = "2">
						<br/>
						<button type = "button" onclick="windowclose()" class="btn btn-primary">����ϱ�</button>
					</td>
				</tr>
			</table>
		</div>
	</fieldset>
</form>
