<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<th>상품번호</th>
						<th>상품명</th>
						<th>대출자</th>
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
						<td><%=bg.getGoodsVO().getGoods_num() %></td>
						<td><%=bg.getGoodsVO().getGoods_object() %>
						<td><%=bg.getBorrower_id() %></td>
						<td><fmt:formatNumber value="<%=bg.getBorrower_amount() %>" type="currency" currencySymbol="￦" /></td>	
						<td><fmt:formatNumber value="<%=bg.getBorrower_balance() %>" type="currency" currencySymbol="￦" /></td>
					
						<td>
							<%=bg.getBorrower_status() %>
						</td>	
						<td>		
				<%		
				if( bg.getBorrower_status().equals("상환완료")) {
				%>
						
							<a href = "adminInvestMemberList.do?goods_num=<%=bg.getGoodsVO().getGoods_num() %>" class="btn btn-default">지급하기</a>
				<%
						}
										
						else {
				%>
							<button class="btn btn-default btn-sm" disabled >지급하기</button>
				<%	
						}
				%> 
						</td>
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