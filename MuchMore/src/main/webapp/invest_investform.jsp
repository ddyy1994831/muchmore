<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("EUC-KR");

	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}

	BorrowerVO bg = (BorrowerVO) request.getAttribute("borrower");
	int balance = (Integer) request.getAttribute("balance");
%>
<script type="text/javascript">
	function calsum(num){
		var investsum = Number(document.payform.invest_sum.value);
		
		if(num == 0){
			investsum = 0;
		}
		if(num == 10000){
			investsum = investsum + 10000;
		}
		if(num == 50000){
			investsum = investsum + 50000;
		}
		if(num == 100000){
			investsum = investsum + 100000;
		}
		if(num == 1000000){
			investsum = investsum + 1000000;
		}
		
		document.payform.invest_sum.value = investsum;
	}
</script>

<div id="content">
	<div class="container">
		<div class="row">
			<!-- 투자할 상품 정보 -->
			<div class="col-md-10 col-md-offset-1">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div align="left">
							<div style="font-size: 20pt">투자상품</div>
						</div>
					</div>
					<div class="panel-body">
						<table class="table table-striped text-center">
							<thead>
								<tr>
									<th style="text-align:center">상품번호</th>
									<th style="text-align:center">상품명</th>
									<th style="text-align:center">등급</th>
									<th style="text-align:center">예상수익률</th>
									<th style="text-align:center">대출기간</th>
									<th style="text-align:center">투자 가능금액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><%=bg.getGoodsVO().getGoods_num()%></td>
									<td><%=bg.getGoodsVO().getGoods_object()%></td>
									<td><%=bg.getBorrower_credit()%></td>
									<td><%=bg.getGoodsVO().getGoods_rate()%>%</td>
									<td><%=bg.getBorrower_loanperiod()%></td>
									<td><fmt:formatNumber value="<%=bg.getGoodsVO().getGoods_sum() - bg.getGoodsVO().getGoods_invest() %>" type="currency" currencySymbol="￦"></fmt:formatNumber></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- 투자할 상품 정보 끝-->
			<div class="col-md-10 col-md-offset-1">
				<form name="payform" id="payform" action="invest_investResult.do" method="post">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div align="left">
								<div style="font-size: 20pt">결제정보</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="panel">
								<div class="panel-body">
									<div class="col-xs-6" style="font-size:12pt">총 투자금액</div>
									<div class="col-xs-6 text-right">
										<input type="text" id="invest_sum" name="invest_sum" value="0" size="10" readOnly>원 
									</div>
									<div class="col-xs-12">
										<div class = "center-block pull-right">									 
									 	 	<button type = "button" class = "btn btn-default" id="invest_sum_format" value="0" onclick="calsum(0);">취소</button>
									 	 	<button type = "button" class = "btn btn-primary" id="invest_sum_1man" value="10000" onclick="calsum(10000);">1만원</button>
										 	<button type = "button" class = "btn btn-primary" id="invest_sum_5man" value="50000" onclick="calsum(50000);">5만원</button>
										 	<button type = "button" class = "btn btn-primary" id="invest_sum_10man" value="100000" onclick="calsum(100000);">10만원</button>
										 	<button type = "button" class = "btn btn-primary" id="invest_sum_100man" value="1000000" onclick="calsum(1000000);">100만원</button>									
										</div>
									</div>
									<div class="col-xs-12" style="font-size:12pt">					
										<div class="text-left">My계좌잔액</div>
										<div class="text-right"><fmt:formatNumber value="<%=balance %>" type="currency" currencySymbol="￦"></fmt:formatNumber></div>
									</div>							
								</div>
								
								<div class="panel-body">
									<div class = "col-xs-10">
										<h5>투자 안내사항</h5><br/>
										<ol type="Ⅰ">
											<li>원리금 수취권 매입 형태의 투자상품이며, 연체 및 부도 발생 시 추심에 도의적 책임을 다합니다.</li>
											<li>모집이 완료된 투자 상품에 대해서는 취소가 불가능합니다.</li>
											<li>대출자가 대출을 취소할 경우, 투자금은 '나의 예치금 계좌’로 입금됩니다.</li>
										</ol>
									</div>
								</div>
							</div>
						</div>

						<input type="hidden" name="balance" value="<%=balance%>" /> 
						<input type="hidden" name="goodsVO.goods_num" value="<%=bg.getGoodsVO().getGoods_num()%>" /> 
						<input type="hidden" name="borrower_id" value="<%=bg.getBorrower_id() %>"/>
						<input type="hidden" name="member_id" value="<%=session.getAttribute("id")%>" />
						<input type="hidden" name="goodsVO.goods_sum" value="<%=bg.getGoodsVO().getGoods_sum() %>"/>
						<input type="hidden" name="goodsVO.goods_invest" value="<%=bg.getGoodsVO().getGoods_invest() %>"/>

						<div class="panel-footer" align="center">
							<button type="button" class="btn btn-default" onclick="history.go(-1);">뒤로</button>							
							<button type="submit" class="btn btn-primary">투자하기</button>
							
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
