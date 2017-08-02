<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%
 	List<BorrowerVO> borrower_list = (List<BorrowerVO>)request.getAttribute("borrower_list");
 %>

<script>
	function openSend(borrower_id, goods_num) {
		var url = "adminLoanSend.do?borrower_id=" + borrower_id +"&goodsVO.goods_num=" +goods_num;
		open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no," +
			"scrollbars=no,resizeable=no,width=400px,height=400");
	}
	    
</script>
 
<section class = "container">
	<div class = "row" style = "height:100%">
   		<div class = "span12">
   			<legend><b>대출 리스트</b></legend>
   			<table class="table table-striped table-condensed table-hover ">
 				<thead>
   					<tr>
   						<th>날짜</th>
   						<th>상품번호</th>
   						<th>대출자 아이디</th>
   						<th>모집금액</th>
   						<th>대출금액</th>
   						<th>승인/지급하기</th>
   					</tr>
 				</thead>
 				<tbody>
 				<%
 				for(int i = 0; i < borrower_list.size(); i++) {
 					BorrowerVO bg = (BorrowerVO)borrower_list.get(i);
 				%>
 					<tr>
  						<td><%=bg.getGoodsVO().getGoods_date() %></td>
  						<td><%=bg.getGoodsVO().getGoods_num() %></td>
   						<td><a href = "adminLoanDetail.do?borrower_id=<%=bg.getBorrower_id() %>&goodsVO.goods_num=<%=bg.getGoodsVO().getGoods_num() %>"><%=bg.getGoodsVO().getBorrower_id() %></a></td>
  						<td><fmt:formatNumber value="<%=bg.getGoodsVO().getGoods_invest() %>" type="currency" currencySymbol="￦" /></td>
   						<td><fmt:formatNumber value="<%=bg.getGoodsVO().getGoods_sum() %>" type="currency" currencySymbol="￦" /></td>
   						<td>
   						<%
   						if(bg.getGoodsVO().getGoods_status().equals("모집완료") && !(bg.getBorrower_payok().equals("지급완료"))) {
   						%>
   							<input type = "button" class="btn btn-primary btn-xs" 
   								onclick = "openSend('<%=bg.getBorrower_id() %>','<%=bg.getGoodsVO().getGoods_num() %>')" value = "지급하기">
   						<%
   						}
   						
   						else {
   							if(bg.getBorrower_status().equals("심사중")) {
   						%>
   								<a href = "adminLoanDetail.do?borrower_id=<%=bg.getBorrower_id() %>&goodsVO.goods_num=<%=bg.getGoodsVO().getGoods_num() %>"
   								class = "btn btn-warning btn-xs">승인하기</a>
   						<%
   							}
   							else if(bg.getBorrower_payok().equals("지급완료")){
   						%>
   							 	<%=bg.getBorrower_payok() %>
   						<%
   							}
   							else {
   						%>
   								<%=bg.getBorrower_status() %>
   						<%
   							}
   						}
   						%>
						</td>
 					</tr>
				<%
					
				}
				%>
				</tbody>
			</table> 
   		</div>
  	</div>
</section>
    