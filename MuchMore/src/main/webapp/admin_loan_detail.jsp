<%@page import="java.net.URLEncoder"%>
<%@page import="com.spring.muchmore.member.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("EUC-KR");

	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}

	MemberVO borrower = (MemberVO)request.getAttribute("borrower");
%>

<script>
	function openSend(borrower_id, goods_num) {
		var url = "adminLoanSend.do?borrower_id=" + borrower_id +"&goodsVO.goods_num=" +goods_num;
		open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no," +
			"scrollbars=no,resizeable=no,width=400px,height=400px");
	}
</script>


<section class="container">
	<div class="row" style = "height:100%;"> 
		<div class="col-md-8 col-md-offset-2">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div align="center"><%=borrower.getBorrower().getGoodsVO().getGoods_num()%></div>
					<div align="center"><%=borrower.getBorrower().getGoodsVO().getGoods_object()%></div>
				</div>
				<div class="panel-body">
					<table class="table table-striped table-hover ">
						<thead>
							<tr>
								<th>등급</th>
								<th>대출금리</th>
								<th>대출기간</th>
								<th>대출금액</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td><%=borrower.getBorrower().getBorrower_credit()%>등급</td>
								<td><%=borrower.getBorrower().getBorrower_rate()%>%</td>
								<td><%=borrower.getBorrower().getBorrower_loanperiod()%>개월</td>
								<td><fmt:formatNumber value="<%=borrower.getBorrower().getGoodsVO().getGoods_sum()%>" type="currency" currencySymbol="￦" /></td>

							</tr>
						</tbody>
					</table>

					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">대출자 개인정보</div>
							<div class="panel-body">
								<div class="col-xs-6">성별</div>
								<div class="col-xs-6 text-right">
									<%=borrower.getMember_gender()%>
								</div>
								<div class="col-xs-6">나이</div>
								<div class="col-xs-6 text-right">
									<%=borrower.getMember_age()%>
								</div>
								<div class="col-xs-6">이름</div>
								<div class="col-xs-6 text-right"><%=borrower.getMember_name()%></div>
								<div class="col-xs-6">전화번호</div>
								<div class="col-xs-6 text-right"><%=borrower.getMember_phone()%></div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">대출자 소득정보</div>
							<div class="panel-body">
								<div class="col-xs-6">연소득</div>
								<div class="col-xs-6 text-right">
									<fmt:formatNumber value="<%=borrower.getBorrower().getBorrower_totalincome()%>" type="currency" currencySymbol="￦" />
								</div>
								<div class="col-xs-6">직업구분</div>
								<div class="col-xs-6 text-right">
									<%=borrower.getBorrower().getBorrower_jobbiz()%>
								</div>
								<div class="col-xs-6">직업명</div>
								<div class="col-xs-6 text-right">
									<%=borrower.getBorrower().getBorrower_jobname()%>
								</div>
								<div class="col-xs-6">재직기간</div>
								<div class="col-xs-6 text-right">
									<%=borrower.getBorrower().getBorrower_jobperiod()%>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">대출정보</div>
							<div class="panel-body">
								<div class="col-xs-6">대출신청금액</div>
								<div class="col-xs-6 text-right"><fmt:formatNumber value="<%=borrower.getBorrower().getGoodsVO().getGoods_sum()%>" type="currency" currencySymbol="￦" /></div>
								<div class="col-xs-6">대출상환금액</div>
								<div class="col-xs-6 text-right"><fmt:formatNumber value="<%=borrower.getBorrower().getBorrower_amount()%>" type="currency" currencySymbol="￦" /></div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">대출 이용 정보</div>
							<div class="panel-body">
								<div class="col-xs-6">대출금 지급 여부</div>
								<div class="col-xs-6 text-right"><%=borrower.getBorrower().getBorrower_payok()%></div>
								<div class="col-xs-6">가상계좌번호</div>
								<div class="col-xs-6 text-right"><%=borrower.getAccount().getAccount_virtual()%></div>
							</div>
						</div>
					</div>
					 
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">서류제출</div>
							<div class="panel-body">
								<div class="col-xs-6">제출 서류</div> 
								<div class="col-xs-6 text-right">
									<%
									if(borrower.getBorrower().getBorrower_file() == null){
									%>
										미제출
									<%
									}
									else {
										String downlink = "loanFileDownload.do?of="+URLEncoder.encode(borrower.getBorrower().getBorrower_stored(), "UTF-8")
										  +"&of2=" +URLEncoder.encode(borrower.getBorrower().getBorrower_file(), "UTF-8");
										
									%>
										<a href = "<%=downlink%>"><%=borrower.getBorrower().getBorrower_file() %></a> 
										<a href = "<%=downlink %>" class = "btn btn-default btn-xs">다운로드</a>
									<%
									}
									
									%>
									 
								</div>
								<div class="col-xs-6">대출 상태(단계)</div>
								<div class="col-xs-6 text-right">
									<%=borrower.getBorrower().getBorrower_status()%>
									<%
									if(borrower.getBorrower().getBorrower_status().equals("심사중")){
									%>
										<a href = "loanApproval.do?borrower_id=<%=borrower.getBorrower().getBorrower_id() %>&goodsVO.goods_num=<%=borrower.getBorrower().getGoodsVO().getGoods_num()%>"
										 class = "btn btn-warning btn-xs">승인하기</a>
									<%
									}
									%>
								</div> 
							</div>
						</div>
					</div>
					
				</div>
				<div class="panel-footer text-center">
					<a class = "btn btn-default" href="adminLoanList.do">뒤로</a>
					
					<%
					//버튼이 없는 경우
					//1.지급완료 된 경우
					//2.모집중인 경우 (모집 완료 되지 않은 경우)
					//3.서류 제출을 하지 않은 경우
					//if(borrower.getBorrower().getBorrower_payok().equals("지급완료") || borrower.getBorrower().getGoodsVO().getGoods_status() != null) {
						//서류 제출을 하지 않았거나. 이미 승인된 경우
						if((borrower.getBorrower().getBorrower_status().equals("심사중"))) {
					%>
							<a href = "loanApproval.do?borrower_id=<%=borrower.getBorrower().getBorrower_id() %>&goodsVO.goods_num=<%=borrower.getBorrower().getGoodsVO().getGoods_num()%>"
										 class = "btn btn-warning">승인하기</a>
					<%
							
						}
						
					//}
					
					else if(borrower.getBorrower().getGoodsVO().getGoods_status().equals("모집완료")) {
						
					%>
						<button type="submit" class="btn btn-primary"
						onclick="openSend('<%=borrower.getBorrower().getBorrower_id() %>','<%=borrower.getBorrower().getGoodsVO().getGoods_num() %>')">지급하기</button>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
</section>
<br/><br/>