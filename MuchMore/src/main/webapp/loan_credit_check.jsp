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
		var totalincome = writeform.borrower_totalincome.value;
		
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

	
<section class="container">
	<div class = "row">
	    <div class="container" align="center">
			<div class="jumbotron">
				<h3>대출/한도 확인</h3><br/><br/>     
				<h6><strong>①대출/한도 확인</strong>->②신용정보확인->③대출 정보 입력->④상세 정보 입력</h6> 
			</div>     
		</div>
	</div>
	
	<br/><br/>
	
	<div class = "row" style = "padding-left:200px;padding-right:200px;">
	    <!-- 대출 정보 입력 페이지 -->
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
							<div class="col-sm-4">
								<input type="text" onkeypress = "gNumCheck()" class="form-control" 
								id="borrower_totalincome" name="borrower_totalincome" placeholder = "만원단위 입력">
							</div>
						</div>
				    
						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label"><b>희망대출금액</b></label>
							<div class="col-sm-4">
								<input type="text" onkeypress = "gNumCheck()" class="form-control" id="borrower_amount"
								placeholder = "만원단위 입력">
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
									<input type="radio" name="goodsVO.goods_object" id="optionsRadios4" value="결재">
										결제
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
											<h4 class="modal-title">Modal with Dark Overlay</h4>
										</div>
										<div class="modal-body">
											<p>This modal has a dark overlay.</p>
										</div>
										<div class="modal-footer">
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
											<h4 class="modal-title">Modal without Overlay</h4>
										</div>
										<div class="modal-body">
											<p>This modal has no overlay.</p>
											<p><strong>Note:</strong> You cannot click outside of this modal to close it.</p>
										</div>
										<div class="modal-footer">
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

