<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%	
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
	
	List<BorrowerVO> borrower_list = (List<BorrowerVO>)request.getAttribute("borrower_list");
		
%>

<section class="container">
	<div class="row" style = "height: 100%;">
		<div class = "col-sm-3" id="menu">
			<ul class="nav nav-pills nav-stacked">
				<li class=""><a href="mypageMyaccount.do" id="MyAccount" >My Account</a></li>
				<li class=""><a href="mypage_myinvest.do" id="MyInvest">투자내역</a></li>
				<li class=""><a href="mypage_myloan.do" id="MyLoan">대출내역</a></li>
				<li class=""><a href="mypage_memberupdate.do" id="MyUpdate" >회원정보수정</a></li>
			</ul>
		</div>
		<!-- ./col-sm-3 -->

		<div class="col-md-9" id="MyInvest">
				<fieldset>
					<legend><b>대출내역</b></legend>
					<div class="form-group">
						<table class="table table-hover">
							<tbody>							
								<tr>
									<th>대출금액</th>
									<th>총상환액</th>
									<th>상환일</th>
									<th>월납입금액</th>
									<th>잔액</th>
									<th>대출기간</th>
									<th>진행상태</th>
									<th>서류제출</th>
									<th>입금하기</th>
								</tr>
								<%
									if(borrower_list != null) {
  										for(int i = 0; i < borrower_list.size(); i++) {
  											BorrowerVO bg = (BorrowerVO)borrower_list.get(i);
  								%>
								<tr>
									<td><%=bg.getGoodsVO().getGoods_sum() %></td>
									<td><%=bg.getBorrower_amount() %></td>
									<td><%=bg.getBorrower_repay_date() %></td>
									<td><%=bg.getBorrower_monthlypay() %></td>
									<td><%=bg.getBorrower_balance() %></td>
									<td><%=bg.getBorrower_loanperiod() %></td>
									<td><%=bg.getBorrower_status() %></td>
								<%
								//서류 제출
								//진행상태가 서류미제출 이면 서류 제출 버튼
								if(bg.getBorrower_status().equals("서류미제출")) {
								%>
									<td><a href = "mypage_myloan_fileUpload.do?borrower_id=<%=id %>&goodsVO.goods_num=<%=bg.getGoodsVO().getGoods_num() %>" class = "btn btn-default btn-md">서류제출</a>
								<%
								}
									
								else {
								%>
									<td>완료</td>
								<%
								}
								//진행상태가 대출 
								%>
									<td><a href = "mypage_loan_deposit.do?borrower_id=<%=bg.getBorrower_id() %>&goodsVO.goods_num=<%=bg.getGoodsVO().getGoods_num() %>" class = "btn btn-default btn-md">입금하기</a>
								</tr>
								<%		}
									} else {
								%>
								<tr>
									<td colspan="7" align="center">대출 내역이 없습니다.</td>
								</tr>
								<%	}%>
							</tbody>
						</table>
					</div>
				</fieldset>				
			</div>
	</div>
</section>