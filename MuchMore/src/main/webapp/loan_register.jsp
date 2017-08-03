<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<h3>입력하신 정보와 대출 관련 정보를 확인하신 후 신청을 완료해주세요.</h3><br/><br/>  
				<h5>①대출/한도 확인⇒②신용정보확인/③상세정보입력⇒<strong>④금리확인 후 신청</strong>⇒⑤서류제출</h5>     
			</div>      
		</div>
	</div>
		<!-- style = "padding-left:200px;padding-right:200px;" -->
	<div class = "row">
		<div class = "col-md-6 col-md-offset-3">  
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
						<input type = "hidden" id = "borrower_jobbiz" name = "borrower_jobbiz" value = "<%=borrower.getBorrower_jobbiz() %>">
						<input type = "hidden" id = "borrower_rate" name = "borrower_rate" value = "<%=borrower.getBorrower_rate() %>">
						<input type = "hidden" id = "borrower_loanperiod" name = "borrower_loanperiod" value = "<%=borrower.getBorrower_loanperiod()%>">
						<input type = "hidden" id = "borrower_amount" name = "borrower_amount" value = "<%=borrower.getBorrower_amount()%>">
						<input type = "hidden" id = "borrower_repay_date" name = "borrower_repay_date" value = "<%=borrower.getBorrower_repay_date() %>">
						<input type = "hidden" id = "borrower_monthlypay" name = "borrower_monthlypay" value = "<%=borrower.getBorrower_monthlypay() %>">
			   			
			   			<table class = "table table-striped">
			   				<tr>
			   					<td>직업구분</td>
			   					<td><%=borrower.getBorrower_jobbiz() %></td>
			   				</tr>
			   				
			   				<tr>
			   					<td>대출사유</td>
			   					<td><%=borrower.getGoodsVO().getGoods_object() %></td>
			   				</tr>
			   				
			  				<tr>
			  					<td>대출신청 금액</td>
			  					<td>
			  						<fmt:formatNumber value="<%=borrower.getGoodsVO().getGoods_sum() %>" type="currency" currencySymbol="￦" />
			  					</td>
			  				</tr>
			  				
			  				<tr>
			  					<td>대출금리</td>
			  					<td><%=borrower.getBorrower_rate() %>%</td>
			  				</tr>
			  				<tr>
			  					<td>대출 기간</td>
			  					<td><%=borrower.getBorrower_loanperiod() %>개월</td>
			  				</tr>
			  				
			  				<tr>
			  					<td>총 상환액</td>
			  					<td>
			  						<fmt:formatNumber value="<%=borrower.getBorrower_amount() %>" type="currency" currencySymbol="￦" />
			  					</td>
			  				</tr>
			  				
			  				<tr>
			  					<td>월납입금액</td>
			  					<td>
				  					<fmt:formatNumber value="<%=borrower.getBorrower_monthlypay() %>" type="currency" currencySymbol="￦" />
			  					</td>
			  				</tr>
			  				
			  				<tr>
			  					<td>월 상환일</td>
			  					<td>매월 <%=borrower.getBorrower_repay_date() %>일
			  					</td>
			  				</tr>
			  				
			  				<tr>
			  					<td colspan = "2" class = "text-center">
									<button type="submit" class="btn btn-primary">신청하기</button>
			  					</td>
			  				</tr>
			   			</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>