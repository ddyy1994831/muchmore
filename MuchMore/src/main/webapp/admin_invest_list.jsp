<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%	
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
		
	List<BorrowerVO> borrower_list = (List<BorrowerVO>)request.getAttribute("list");
%>

<section class="container">
	<div class="row" style = "height: 100%;">
		<div class="span12" id="Admin_invest">
		<legend><b>투자관리</b></legend>
			<table class="table table-striped table-hover table-condensed">
				<tbody>							
					<tr>
						<th>날짜</th>
						<th>상품번호</th>
						<th>대출자</th>
						<th>만기일</th>
						<th>총상환액</th>
						<th>잔액</th>
						<th>상환상태</th>
						<th>지급</th>
					</tr>
				<%
				if(borrower_list != null) {
  					for(int i = 0; i < borrower_list.size(); i++) {
  						BorrowerVO bg = (BorrowerVO)borrower_list.get(i);
  				%>
					<tr>
						<td><%=bg.getBorrower_startdate() %></td>
						<td><%=bg.getGoodsVO().getGoods_num() %></td>
						<td><%=bg.getBorrower_id() %></td>
						<td><%=bg.getBorrower_enddate() %></td>
						<td><%=bg.getBorrower_amount() %></td>
						<td><%=bg.getBorrower_balance() %></td>
						<td><%=bg.getBorrower_status() %></td>
				<%
						if( bg.getBorrower_status().equals("상환완료")) {
				%>
						<td>
							<a href = "adminInvestMemberList.do?goods_num=<%=bg.getGoodsVO().getGoods_num() %>" class="btn btn-default">지급</a>
						</td>
				<%
						}
										
						else {
				%>
						<td>
							<button class="btn btn-default" value = "지급" disabled ></button>
						</td>
				<%	
						}
				%> 
					</tr>
				<%
					}
				}
								
				else {
				%>
					<tr>
						<td colspan="8" align="center">투자금 지급 내역이 없습니다.</td>
					</tr>
				<%
				}
				%>
				</tbody>
			</table>
		</div>
	</div>
</section>