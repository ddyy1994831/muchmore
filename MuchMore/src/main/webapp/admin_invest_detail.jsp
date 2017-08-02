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
	System.out.println("�κ���Ʈ ���� â���� cnt : " + cnt);  */
	List<InvestVO> invest_memberlist = (List<InvestVO>)request.getAttribute("invest_memberlist");

%>
	
<!-- body �κ� -->
<section class = "container">
   	<div class = "row">
   		<div class = "span12">
   			<table class="table table-striped table-hover table-condensed">
 				<thead>
    				<tr>
      					<th>��ǰ ��ȣ</th>
      					<th>���̵�</th>
      					<th>���� �ݾ�</th>
      					<th>���� ���ͷ�</th>
      					<th>�� ���޾�</th>
      					<th>�����ϱ�</th>
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
   						if(invest.getInvest_payok().equals("������")) {
   						%>
      					<td><button type="button" class="btn-primary btn-xs" id="myBtn">���ڱ� ��ȯ</button><td>
		    
						<!-- Modal -->
						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">���ڱ� ��ȯ</h4>
									</div>
									<div class="modal-body">
										<p><%=invest.getMember_id() %> ���Բ� 
										<fmt:formatNumber value="<%=invest.getInvest_return() %>" type="currency" currencySymbol="��" />���� �����Ͻðڽ��ϱ�?</p>
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