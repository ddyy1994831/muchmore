<%@page import="com.spring.muchmore.invest.InvestVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	
	/* int cnt = Integer.parseInt((String)request.getAttribute("cnt")); 
	System.out.println("인베스트 인포 창에서 cnt : " + cnt);  */
	List<InvestVO> invest_memberlist = (List<InvestVO>)request.getAttribute("invest_memberlist");

%>
	
<!-- body 부분 -->
<section class = "container">
   	<div class = "row">
   		<div class = "span12">
   			<table class="table table-striped table-hover table-condensed">
 				<thead>
    				<tr>
      					<th>상품 번호</th>
      					<th>아이디</th>
      					<th>투자 금액</th>
      					<th>예상 수익률</th>
      					<th>총 지급액</th>
      					<th>투자하기</th>
    				</tr>
  				</thead>
  				<tbody>
  				<%
  				for(int i = 0; i < invest_memberlist.size(); i++) {
  					InvestVO invest = (InvestVO)invest_memberlist.get(i);
  				%>
  					<tr>
      					<td><%=invest.getGoodsVO().getGoods_num() %></td>
   						<td><%=invest.getMember_id() %></td>
      					<td><%=invest.getInvest_sum() %></td>
      					<td><%=invest.getGoodsVO().getGoods_rate() %></td>
      					<td><%=invest.getInvest_return() %></td>
      					<%
   						if(invest.getInvest_payok().equals("미지급")) {
   						%>
      					<td><button type="button" class="btn-primary btn-xs" id="myBtn">투자금 상환</button><td>
		    
						<!-- Modal -->
						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">투자금 상환</h4>
									</div>
									<div class="modal-body">
										<p><%=invest.getMember_id() %> 고객님께 
										<fmt:formatNumber value="<%=invest.getInvest_return() %>" type="currency" currencySymbol="￦" />원을 지급하시겠습니까?</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										<a href = "adminInvestSendAction.do?goodsVO.goods_num=<%=invest.getGoodsVO().getGoods_num()%>&invest_id=<%=invest.getMember_id()%>"></a>
									</div>
								</div>
							</div>
						</div>
  
  
    					<%
  						}
    					else {
   						%>
   						<td>
   							<%=invest.getInvest_payok() %>
   						</td>
   						<%
   						}
   					%>
   					</tr>
   					<% 
  					}
   					%>							 					
  				</tbody>
			</table> 
    	</div>
	</div>
</section>

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