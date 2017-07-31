<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	//로그인 상태인지 확인
	System.out.println("loan_input2_detail.jsp");
	request.setCharacterEncoding("EUC-KR");
	String msg = (String)request.getAttribute("msg");
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	
	//대출자 정보 가져오기
	BorrowerVO borrower = (BorrowerVO)request.getAttribute("borrower");
  
  	
%>

<section class = "container">
	<div class ="row">
		<div class="container" align="center">
			<div class="jumbotron">
				<h3>고객님의 상세정보를 입력해 주세요</h3><br/><br/>  
				<h6>①대출/한도 확인->②신용정보확인->③대출 정보 입력-><strong>④상세 정보 입력</strong></h6>    
			</div>      
		</div>
	
		<div class = "row" style = "padding-left:200px;padding-right:200px;">
			<div class = "panel panel-primary">
				<div class = "panel-heading">
					<h4 class = "panel-title">대출 신청 확인</h4>
				</div>
				<div class = "panel-body" style = "padding-left: 100px;padding-right:100px;padding-top:30px">
					<form method="post" name="writeform" class="form-horizontal" action="loanRegisterAction.do">
						<!-- 대출자 그 전 정보 -->
						<input type = "hidden" name="borrower_id" value=<%=id %>>
						<input type = "hidden" name="goodsVO.goods_object" value=<%=borrower.getGoodsVO().getGoods_object() %>>
						<input type = "hidden" name="goodsVO.goods_sum" value=<%=borrower.getGoodsVO().getGoods_sum() %>>
						<input type = "hidden" name="borrower_jobname" value=<%=borrower.getBorrower_jobname() %>>
						<input type = "hidden" name="borrower_jobperiod" value=<%=borrower.getBorrower_jobperiod() %>>
						<input type = "hidden" name="borrower_credit" value=<%=borrower.getBorrower_credit() %>>
						<input type = "hidden" name="borrower_limit" value=<%=borrower.getBorrower_limit() %>>
						<input type = "hidden" name="borrower_totalincome" value=<%=borrower.getBorrower_totalincome() %>>
						<%-- <input type = "hidden" name="borrower_loanperiod" value=<%=borrower.getBorrower_loanperiod() %>>
			   			<input type = "hidden" name="borrower_rate" value=<%=borrower.getBorrower_rate() %>> --%>
			   			<table class = "table table-striped">
			   				<tr>
			   					<td>직업구분</td>
			   					<td>
			   						<input type = "text" id = "borrower_jobbiz" name = "borrower_jobbiz"
										value = "<%=borrower.getBorrower_jobbiz() %>" readonly>
			   					</td>
			   				</tr>
			   				
			   				<tr>
			   					<td>대출사유</td>
			   					<td>
			   						<input type = "text" id = "goodVO.goods_object" name = "goodVO.goods_object"
										value = "<%=borrower.getGoodsVO().getGoods_object() %>" readonly>
			   					</td>
			   				</tr>
			   				
			  				<tr>
			  					<td>대출신청 금액</td>
			  					<td>
			  						<input type = "text" id = "goodVO.goods_sum" name = "goodVO.goods_sum"
										value = "<%=borrower.getGoodsVO().getGoods_sum() %>" readonly>원
			  					</td>
			  				</tr>
			  				
			  				<tr>
			  					<td>대출금리</td>
			  					<td>
			  						<input type = "text" id = "goodVO.goods_sum" name = "goodVO.goods_sum"
										value = "<%=borrower.getBorrower_rate() %>" readonly>%
			  					</td>
			  				</tr>
			  				<tr>
			  					<td>대출 기간</td>
			  					<td>
			  						<input type = "text" id = "goodVO.goods_sum" name = "goodVO.goods_sum"
										value = "<%=borrower.getBorrower_loanperiod() %>" readonly>개월
			  					</td>
			  				</tr>
			  				
			  				<tr>
			  					<td>총 상환액</td>
			  					<td>
			  						<input type = "text" id = "goodVO.goods_sum" name = "goodVO.goods_sum"
										value = "<%=borrower.getBorrower_amount() %>" readonly>원
			  					</td>
			  				</tr>
			  				
			  				<tr>
			  					<td>월납입금액</td>
			  					<td>
			  						<input type = "text" id = "goodVO.goods_sum" name = "goodVO.goods_sum"
										value = "<%=borrower.getBorrower_monthlypay() %>" readonly>원
			  					</td>
			  				</tr>
			  				
			  				<tr>
			  					<td>월 상환일</td>
			  					<td>
			  						매월<input type = "text" id = "goodVO.goods_sum" name = "goodVO.goods_sum"
										value = "<%=borrower.getBorrower_repay_date() %>" readonly>일
			  					</td>
			  				</tr>
			  				
			  				<tr>
			  					<td colspan = "2" class = "text-center">
			  						<button type="reset" class="btn btn-default">취소</button>
									<button type="submit" class="btn btn-primary">신청하기</button>
			  					</td>
			  				</tr>
			   			</table>
						<%-- <fieldset>
							<legend>대출 신청 정보 확인</legend>
							<div class="form-group">
								<label for="borrower_jobbiz" class="col-lg-2 control-label">직업구분 : </label>
								<div class="col-lg-10">
									<input type = "text" id = "borrower_jobbiz" name = "borrower_jobbiz"
										value = "<%=borrower.getBorrower_jobbiz() %>" readonly>
								</div>
				    		</div>
				    		
				    		<div class="form-group">
								<label for="goodVO.goods_object" class="col-lg-2 control-label">대출 사유 :</label>
								<div class="col-lg-10">
									<input type = "text" id = "goodVO.goods_object" name = "goodVO.goods_object"
										value = "<%=borrower.getGoodsVO().getGoods_object() %>" readonly>
								</div>
				    		</div>
				    		
				    		<div class="form-group">
								<label for="goodVO.goods_sum" class="col-lg-2 control-label">대출 신청 금액 :</label>
								<div class="col-lg-10">
									<input type = "text" id = "goodVO.goods_sum" name = "goodVO.goods_sum"
										value = "<%=borrower.getGoodsVO().getGoods_sum() %>" readonly>
								</div>
				    		</div>
				    		
				    		<div class="form-group">
								<label for="borrower_rate" class="col-lg-2 control-label">대출 금리 : </label>
								<div class="col-lg-10">
									<input type = "text" id = "borrower_rate" name = "borrower_rate"
										value = "<%=borrower.getBorrower_rate() %>" readonly>
								</div>
				    		</div>
				    		
				    		<div class="form-group">
								<label for="borrower_loanperiod" class="col-lg-2 control-label">대출기간 : </label>
								<div class="col-lg-10">
									<input type = "text" id = "borrower_loanperiod" name = "borrower_rate"
										value = "<%=borrower.getBorrower_loanperiod()%>" readonly>
								</div>
				    		</div>
				    		
				    		<div class="form-group">
								<label for="borrower_amount" class="col-lg-2 control-label">총 상환액 : </label>
								<div class="col-lg-10">
									<input type = "text" id = "borrower_amount" name = "borrower_amount"
										value = "<%=borrower.getBorrower_amount() %>" readonly>
								</div>
				    		</div>
				    		
			   				<div class="form-group">
								<label for="borrower_monthlypay" class="col-lg-2 control-label">월 납입금액 : </label>
								<div class="col-lg-10">
									<input type = "text" id = "borrower_monthlypay" name = "borrower_monthlypay"
										value = "<%=borrower.getBorrower_monthlypay() %>" readonly>
								</div>
				    		</div>
				    		
				    		<div class="form-group">
								<label for="borrower_repay_date" class="col-lg-2 control-label">월 상환일 : </label>
								<div class="col-lg-10">
									<input type = "text" id = "borrower_repay_date" name = "borrower_repay_date"
										value = "<%=borrower.getBorrower_repay_date() %>" readonly>
								</div>
				    		</div>
				    	
				        	<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="reset" class="btn btn-default">취소</button>
									<button type="submit" class="btn btn-primary">신청하기</button>
								</div>
				    		</div> 
							<br/><br/><br/><br/><br/>
						</fieldset>--%>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>