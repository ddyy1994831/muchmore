<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	
	//loan_credit_check에서 입력받은 정보들과 controller에서 저장된 정보들 가져오기
	BorrowerVO borrower = (BorrowerVO)request.getAttribute("borrower");
%>    

<script type="text/javascript">
function check(){
		
	var form = document.getElementById("inputbasic");
		
	var sum = document.getElementById("goodsVO.goods_sum").value;
	var borrower_limit = <%=borrower.getBorrower_limit()%>;
		
	for (i = 0; i < sum.length; i++)
	{
		ch = sum.substring(i, i+1);
		if (!(ch >= "0" && ch <= "9")) // 입력문자가 숫자인지 검사 // if()안의 문장을 isNaN(str)로 하고 for문 밖으로 빼놓아도 같은 효과!
		{
			alert("특수문자가 포함, 다시 입력!");
			return false;
		}
	}
		
	if(sum * 10000 > borrower_limit)
	{
		alert("한도 금액을 초과하셨습니다. \n"+borrower_limit+"만원이하로 적어주세요.");
		return false;
	}
			
	return true;
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
   document.inputbasic.check_sum.value = "￦" +num01+"만원";
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

<section class = "container">
	<div class = "row text-center" >		
	    <div class="container" align="center">
			<div class="jumbotron">
				<h3>고객님의 상세정보 확인 및 상세정보를 입력해 주세요</h3><br/><br/>  
				<h5>①대출/한도 확인⇒<strong>②신용정보확인/③상세정보입력</strong>⇒④금리확인 후 신청⇒⑤서류제출</h5>    
			</div>     
		</div>
	</div>	
	 <!-- style = "padding-left:300px;padding-right:300px;" -->
	<div class="row">
		<div class = "col-md-6 col-md-offset-3">
			<br/><br/>
			<div class="panel panel-warning">
				<div class="panel-heading"><h4 class = "panel-title"><b>신용 등급 조회 결과 확인</b></h4></div>
				<div class="panel-body" style = "padding-left:100px;padding-right:100px">
		  			<table class="table table-striped" >
		  				<tr>
		  					<td>신용등급</td>
							<td><%=borrower.getBorrower_credit() %> 등급</td>
		  				</tr>
						<tr>
							<td>대출한도금액</td>
							<td><fmt:formatNumber value="<%=borrower.getBorrower_limit() %>" type="currency" currencySymbol="￦" /></td>
						</tr>
					</table>
	  			</div>
			</div>
			<br/><br/>
		</div>
	</div>
	<!-- 추가정보 입력 받기  -->
	 <!-- style = "padding-left:200px;padding-right:200px" -->
	<div class = "row">
		<div class = "col-md-8 col-md-offset-2">
			<div class = "panel panel-primary">
				<div class ="panel-heading">
					<h4 class = "panel-title">상세 정보 입력</h4>
				</div>
					
				<div class = "panel-body">
					<form class = "form-horizontal" name = "inputbasic" id = "inputbasic" method = "post"
						onsubmit = "return check();" action = "loanDetail.do">
						<input type = "hidden" name = "borrower_totalincome" value = "<%=borrower.getBorrower_totalincome() %>">
						<input type = "hidden" name = "borrower_credit" value = "<%=borrower.getBorrower_credit() %>">
						<input type = "hidden" name = "borrower_limit" value = "<%=borrower.getBorrower_limit() %>">
						<input type = "hidden" name = "goodsVO.goods_object" value = "<%=borrower.getGoodsVO().getGoods_object() %>">
						<input type = "hidden" name = "borrower_jobbiz" value = "<%=borrower.getBorrower_jobbiz() %>">
						<fieldset style = "padding-left: 100px">
							<!-- <legend>상세 정보 입력</legend> -->
							<div class = "form-group">
								<label for = "borrower_id" class = "col-sm-2 control-label"><b>아이디</b></label>
								<div class = "col-sm-4">
									<input type = "text" class = "form-control" id = "borrower_id" name = "borrower_id"
										value = "<%=id %>">
								</div>
							</div>
									
							<div class = "form-group">
								<label for = "goodsVO.goods_sum" class = "col-sm-2 control-label"><b>대출금액</b></label>
								<div class = "col-sm-3">
									<input type = "text" onchange = "getNumber(this)" onkeyup = "getNumber(this)" class = "form-control" 
									id = "goodsVO.goods_sum" name = "goodsVO.goods_sum" maxlength = "8" onkeypress = "gNumCheck()" 	required>
								</div>
								<div class = "col-sm-3">
									<input type = "text" class = "form-control" id = "check_sum" name = "check_sum" 
										placeholder = "금액 확인 " readonly>
								</div>
							</div>
							
							<div class="form-group">
								<label for="borrower_loanperiod" class="col-sm-2 control-label" ><b>대출 기간</b></label>
								<div class="col-sm-4">
									<select class="form-control" id="borrower_loanperiod" name="borrower_loanperiod">
										<option value="12">12개월</option>
										<option value="24">24개월</option>
										<option value="36">36개월</option>
									</select>
								</div>
					    	</div>
						    	
					    	<div class="form-group">
								<label for="borrower_jobname" class="col-sm-2 control-label"><b>직업명</b></label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="borrower_jobname" placeholder="개발자" name="borrower_jobname" required="required">
								</div>
				    		</div>
					    		
				    		<div class="form-group">
								<label for="borrower_jobperiod" class="col-sm-2 control-label"><b>재직기간</b></label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="borrower_jobperiod" placeholder="3년2개월" name="borrower_jobperiod" required="required">
								</div>
				    		</div>	
							    	
				    		<div class="form-group">
								<label class="col-sm-2 control-label"><b>대출 상환일</b></label>
								<div class="col-sm-4">
									<div class="radio">
										<label>
											<input type="radio" name="borrower_repay_date" id="optionsRadios1" value="5" checked="">
													매월 5일
										</label>
									</div>
									
									<div class="radio">
										<label>
											<input type="radio" name="borrower_repay_date" id="optionsRadios2" value="15">
												매월 15일
										</label>
									</div>
									
									<div class="radio">
										<label>
											<input type="radio" name="borrower_repay_date" id="optionsRadios3" value="25">
												매월 25일
										</label>
									</div>
								</div>
				    		</div>
				    		<br/>
				    		<div class="form-group">
								<div class="text-center">
									<button type="reset" class="btn btn-default">다시작성</button>
									<button type="submit" class="btn btn-primary">지금 확인하기</button>
								</div>
				    		</div>
				    		<br/>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br/>
</section>