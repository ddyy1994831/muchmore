<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	int sum = 0;
%>
<!-- 체크박스 정상 체크했는지 확인 및 연봉 정상 입력 확인 -->
<script type="text/javascript">
	function credit_check() {
		var x = document.getElementById("myCheck1").checked;
		var y = document.getElementById("myCheck2").checked;
		var totalincome = borrowerinfo.borrower_totalincome.value;
		var amount = borrowerinfo.borrower_amount.value;
		if(totalincome == "")
		{
			alert("연소득 입력란이 비었습니다. 무수입일 경우 0으로 입력해주세요.");
			return false;
		}
			    
		if(x == false || y == false)
	    {
	    	alert("약관에 모두 동의하셔야 합니다");
		    return false;
	    }
		
		if(amount > 5000) {
			alert("최대 대출 가능 금액은 5000만원입니다.\n5000 이하로 입력해 주세요.");
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
</script>

<script type="text/javascript">
//[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자  
//[0-9] => \d , [^0-9] => \D
var rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
var rgx2 = /(\d+)(\d{3})/; 

//총 소득 "," 찍기
function getNumber1(obj){
	
   var num01;
   var num02;
   num01 = obj.value;
   num02 = num01.replace(rgx1,"");
   num01 = setComma(num02);
   document.borrowerinfo.check_totalincome.value = "￦" +num01+"만원";

}

//대출희망금액 "," 찍기
function getNumber2(obj){
	
   var num01;
   var num02;
   num01 = obj.value;
   num02 = num01.replace(rgx1,"");
   num01 = setComma(num02);
   document.borrowerinfo.check_amount.value = "￦" +num01+"만원";

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

	
<section class="container">
	<div class = "row">
	    <div class="container" align="center">
			<div class="jumbotron">
				<h3>대출/한도 확인</h3><br/><br/>     
				<h5><strong>①대출/한도 확인</strong>⇒ ②신용정보확인/③대출 정보 입력⇒④상세 정보 입력⇒⑤서류제출</h5>
			</div>     
		</div>
	</div>
	
	<br/><br/>
	<!-- padding-left:200px;padding-right:200px; -->
	<div class = "row">    
	    <!-- 대출 정보 입력 페이지 -->  
	    <div class = "col-md-8 col-md-offset-2">
	    <div class = "panel panel-primary">
	    	<div class = "panel-heading">
	    		<h4 class = "panel-title">기본 정보 입력</h4>
	    	</div>
	    	<div class = "panel-body">
			    <form id="borrowerinfo" name="borrowerinfo" class="form-horizontal" action="loanCreditCheckAction.do" method="post" onsubmit="return credit_check()">
					<fieldset style = "padding-left: 100px;">
						<!-- <legend>기본 정보 입력</legend> -->
						<div class="form-group">
							<label for="textArea" class="col-sm-2 control-label"><b>회원아이디</b></label>
							<div class="col-sm-10">
								<span class="help-block"><%=id %></span>
							</div>
						</div>
						<div class="form-group">
							<label for="borrower_jobbiz" class="col-sm-2 control-label" ><b>직업 구분</b></label>
							<div class="col-sm-4">
								<select class="form-control" id="borrower_jobbiz" name="borrower_jobbiz">
									<option value="근로소득자">근로 소득자</option>
									<option value="사업소득자(개인)">사업 소득자(개인)</option>
									<option value="사업소득자(법인)">사업 소득자(법인)</option>
									<option value="기타소득자">기타 소득자</option>
								</select>
								<br>
							</div>
						</div>
						
						<div class="form-group">
							<label for="borrower_totalincome" class="col-sm-2 control-label"><b>연소득</b></label>
							<div class="col-sm-3">
								<input type="text" onchange = "getNumber1(this);" onkeyup = "getNumber1(this);" class="form-control" maxlength = "7" 
								id="borrower_totalincome" name="borrower_totalincome" onkeypress = "gNumCheck()" placeholder = "만원단위 입력" required style="text-align:right;">
							</div>
							<div class="col-sm-3">
								<input type = "text" class="form-control" name="check_totalincome" id="check_totalincome" onfocus="javascript:blur();"
								style="cursor: default;text-align:right;" placeholder = "금액 확인" readonly>
							</div>
						</div>
						
				    
						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label"><b>희망대출금액</b></label>
							<div class="col-sm-3">
								<input type="text" onchange = "getNumber2(this);" onkeyup = "getNumber2(this);" onkeypress = "gNumCheck()" class="form-control" id="borrower_amount"
								name = "borrower_amount" maxlength = "4" placeholder = "만원단위 입력" required style="text-align:right;">
							</div>
							<div class="col-sm-3">
								<input type="text"  class="form-control" id="check_amount" name = "check_amount" onfocus="javascript:blur();" style="cursor: default;"
									placeholder = "금액 확인"style="text-align:right;" readonly>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label"><b>대출 용도</b></label>
							<div class="col-sm-10" style = "padding-left:60px">
								<div class="radio">
									<input type="radio" name="goodsVO.goods_object" id="optionsRadios1" value="생활비" checked="">
										급여 및 생활비
								</div>
							
								<div class="radio">
									<input type="radio" name="goodsVO.goods_object" id="optionsRadios2" value="저축/투자">
										저축 및 투자
								</div>
								<div class="radio">
									<input type="radio" name="goodsVO.goods_object" id="optionsRadios3" value="사업">
										사업상 거래
								</div>
								<div class="radio">
									<input type="radio" name="goodsVO.goods_object" id="optionsRadios4" value="학자금">
										학자금
								</div>
								<div class="radio">
									<input type="radio" name="goodsVO.goods_object" id="optionsRadios4" value="기타">
										기타
								</div>
							</div>
						</div>
				    	<br/>
						<div class="form-group" style = "padding-left:100px; padding-right:100px;">
							<div class="checkbox">
								<input type="checkbox" value="" class="check" id="checkAll">&nbsp;아래 항목에 대하여 확인하였으며 전체 동의합니다
							</div>
							<div class="checkbox">
								<label><input type="checkbox" value="" class="check" id="myCheck1">개인(신용) 정보 수집·이용 동의(필수)</label>
								<button type="button" class="btn btn-link" id="myBtn">자세히 보기</button>
							</div> 
					    	<div class="checkbox">
								<label><input type="checkbox" value="" class="check" id="myCheck2">개인(신용) 정보 제공 동의(필수)</label>
								<button type="button" class="btn btn-link" id="myBtn2">자세히 보기</button>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="myModal" role="dialog">
								<div class="modal-dialog">
									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">개인(신용)정보 수집·이용 동의서</h4>
											<p>
											머치모아(이하 “귀사”라 함)와 본인 사이의 (금융)거래와 관련하여 귀사가 본인의 개인(신용)정보를 수집 · 이용하고자 하는 경우,
											 귀사는 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 개인정보 보호법, 신용정보의 이용 및 보호에 관한 법률 등에 따라 본인의 동의를 얻어야 합니다. 
											 이에 본인은 귀사가 아래의 내용과 같이 본인의 개인(신용)정보를 수집 · 이용하는데 동의합니다.
											</p>
											
										</div>
										<div class="modal-body">
											<h4>[개인(신용)정보의 수집 · 이용 목적]</h4>
											<hr/>    
											<ul style = "list-style-type : square">
												<li>
													<p>
													귀사는 이용자 및 대부금융회사 사이의 (금융)거래 중개와 관련하여, 
													대부금융사로의 개인(신용)정보전달 및 대출중개수수료 정산 등 대부중개 관련 제반 업무 수행을 위한 목적으로 이용자의 개인(신용)정보를 수집 이용합니다.
													</p>
												</li>
											</ul>
											
											<br/>
											
											<h4>[개인(신용)정보의 수집 · 이용 항목]</h4>
											<hr/>
											<ul style = "list-style-type : square">
												<li>
													<p>개인식별정보 : 성명, 생년월일, 성별, 전자우편, 직장정보, 휴대전화번호 등 연락처</p>
												</li>
												<li>
													<p>접속일시, IP주소, 이용 전화번호 등 전자금융거래법에 따른 수집정보(전자금융거래 한함)</p>
												</li>
											</ul>
											
											<br/>
											
											<h4>[개인(신용)정보의 보유 · 이용 기간]</h4>
											
											<hr/>
											<ul style = "list-style-type : square">
												<li>
													<p>
													귀사는 이용자가 동의한 날로부터, 귀사가 중개한 대부금융회사에게 이용자의 개인(신용)정보를 제공한 후 2개월 이내까지의 기간 동안 이용자의 개인(신용)정보를 보유 및 이용합니다. 
													단, 귀사는 이용자가 개인(신용)정보의 수집 및 이용에 대한 동의를 철회하는 경우 해당 개인(신용)정보를 지체없이 파기합니다.
													귀사는 관계 법령의 규정에 의하여 별도 규정이 명시되어 있는 경우 관계법령에서 정한 일정한 기간 동안 관련정보를 보관합니다.
													</p>
												</li>
											</ul>
										</div>
										<hr/>
										<div class="modal-footer">
											<ul class = "text-left" style = "list-style-type : square">
												<li>
													<p>상기 내용이 변동되는 경우 머치모아 홈페이지(www.muchmore.com) 게시 등을 통해 그 내용을 안내 드리겠습니다.</p>
												</li>
												<li>
													<p>귀하는 개인(신용)정보 수집동의를 거부할 권리가 있으나, 위 정보는 서비스 제공에 필수적으로 필요한 정보이므로, 동의를 거부하실 경우 거래의 설정 또는 유지가 불가능할 수 있음을 알려드립니다.</p>
												</li>												
											</ul>
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
		
							<!-- Modal -->
							<div class="modal fade" id="myModal2" role="dialog">
								<div class="modal-dialog">
						    	<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">×</button>
											<h4 class="modal-title">개인(신용)정보 제공 동의서</h4>
											<p>
												머치모아(이하 “귀사”라 함)와 본인 사이의 (금융)거래 중개와 관련하여 귀사가 본인의 개인(신용)정보를 제3자에게 제공하고자 하는 경우, 
												귀사는 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 개인정보 보호법 등에 따라 본인의 동의를 얻어야 합니다. 
												이에 본인은 귀사가 아래의 내용과 같이 본인의 개인(신용)정보를 제3자에게 제공하는데 동의합니다.
											</p>
											<hr/>
										</div>
										<div class="modal-body">
											<h4>[개인정보의 제3자 제공에 관한 사항]	</h4>
											<hr/>
											<ul>
												<li>
													<p>개인정보를 제공받는 자 : 머치모아</p>
												</li>
											</ul>
											<br/>
											
											<h4>[개인정보 이용 목적]</h4>
											<ul>
												<li>
													<p>머치모아는 다음과 같은 이용 목적으로 귀사로부터 이용자의 개인정보를 제공받습니다.</p>
												</li>
												<li>
													<p>머치모아 : 이용자를 위한 온라인 대출정보 중개(이용자와 머치모아 사이의 대출계약에 따른 대출채권과 관련하여, 투자자와 머치모아 간 대출채권의 원리금수취권 양수도 거래를 위한 중개 및 지원)</p>
												</li>
												<li>
													<p>머치모아 : 이용자와의 여신(금융)거래관계의 설정여부 판단 및 설정 · 체결 · 유지 · 이행 · 관리(통계, 모형 개발 등 포함) 등 ㈜렌딧소셜대부 및 머치모아와 이용자 사이의 (금융)거래와 관련하여 귀사가 수행하여야 하는 제반 업무 수행</p>
												</li>
											</ul>
											<br/>
											<h4>[제공하는 개인정보 항목]</h4>
											<hr/>
											<ul>
												<li>
													<p>개인식별정보: 성명, 생년월일, 성별, 전자우편, 직장정보, 휴대전화번호 등 연락처</p>
												</li>
											</ul>
											<br/>
											<h4>[개인정보를 제공받는 자의 개인정보 보유 및 이용 기간]</h4>
											<hr/>
											<ul>
												<li>
													<p>귀사는 이용자가 동의한 날로부터 목적달성시까지 이용자의 개인(신용)정보를 제공합니다.</p>
												</li>
											</ul>
										</div>
										<hr/>
										<div class="modal-footer">
											<ul class = "text-left" style = "list-style-type : square" >
												<li>
													<p>상기 내용이 변동되는 경우 머치모아 홈페이지(www.muchmore.com) 게시 등을 통해 그 내용을 안내 드리겠습니다.</p>
												</li>
												<li>
													<p>귀하는 동의를 거부할 권리가 있으나, 위 사항에 대한 동의가 없을 경우 거래의 설정 또는 유지가 불가능할 수 있습니다.</p>
												</li>
											</ul>							
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										</div>
									</div>
						      	</div>
							</div>
						</div>
						
						<br/><br/> 
						<div class="form-group">
							<div class="text-center">
								<button type="reset" class="btn btn-default">취소</button>
								<button type="submit" id = "creditSearch" class="btn btn-primary">지금 조회하기</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			</div>
		</div>
	</div>
	<br/>
    <!-- 자세히보기 버튼-->
    <script>
	$(document).ready(function(){
	    $("#myBtn").click(function(){
	        $("#myModal").modal({backdrop: true});
	    });
	    $("#myBtn2").click(function(){
	        $("#myModal2").modal({backdrop: true});
	    });
	});
	</script>
		
		<!-- 체크박스 모두선택 -->
	<script>
		$("#checkAll").click(function () {
	    	$(".check").prop('checked', $(this).prop('checked'));
		});
	</script>
</section>

