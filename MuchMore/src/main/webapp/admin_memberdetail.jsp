<%@page import="com.spring.muchmore.invest.InvestVO"%>
<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("EUC-KR");

	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}

	List<BorrowerVO> borrower_list = (List<BorrowerVO>) request.getAttribute("borrower_list");
	List<InvestVO> invest_list = (List<InvestVO>) request.getAttribute("invest_list");
	String member_id = (String) request.getAttribute("id");
	
	int borrower_id_total = (Integer) request.getAttribute("borrower_id_total");
	int borrower_id_complete = (Integer) request.getAttribute("borrower_id_complete");
	int invest_id_total = (Integer) request.getAttribute("invest_id_total");
	int invest_id_complete = (Integer) request.getAttribute("invest_id_complete");
%>



<script type="text/javascript">
	function dropout(member_id) {
		var url = "admin_member_dropout.do?member_id=" + member_id;

		open( url, "confirm", "toolbar=no, location=no, status=no, menubar=no,"
			+ "scrollbars=no, resizable=no, width=500, height=300, left=400, top=150");
	}
</script>
<section class="container">
	<div class="row">
		<div class="span12">
			<div class="col-md-8 col-md-offset-2">
				<legend><b>ȸ�� ������</b></legend>
				<div class="form-group">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th colspan="7" class="text-center">��������</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th style="text-align:center">������</th>
								<th style="text-align:center">������</th>
								<th style="text-align:center">����Ⱓ</th>
								<th style="text-align:center">�� ��ȯ��</th>
								<th style="text-align:center">�� ���Աݾ�</th>
								<th style="text-align:center">�ܾ�</th>
								<th style="text-align:center">�������</th>
							</tr>
							<%
							if(borrower_list.size() != 0){
								for (int i = 0; i < borrower_list.size(); i++) {
									BorrowerVO bg = borrower_list.get(i);									
							%>

							<tr class = "text-center">
								<td><%=bg.getBorrower_startdate()%></td>
								<td><%=bg.getBorrower_enddate()%></td>
								<td><%=bg.getBorrower_loanperiod()%></td>
								<td><fmt:formatNumber value="<%=bg.getBorrower_amount()%>" type="currency" currencySymbol="��" /></td>
								<td><fmt:formatNumber value="<%=bg.getBorrower_monthlypay()%>" type="currency" currencySymbol="��" /></td>
								<td><fmt:formatNumber value="<%=bg.getBorrower_balance()%>" type="currency" currencySymbol="��" /></td>
								<td><%=bg.getBorrower_status()%></td>
							</tr>
							<%
								}
									}else {
							%>
							<tr>
								<td colspan="7" class="text-center">������ ������ �����ϴ�.</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>

					<table class="table table-bordered">
						<thead>
							<tr>
								<th colspan="5" class="text-center">��������</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th style="text-align:center">������</th>
								<th style="text-align:center">���ڱݾ�</th>
								<th style="text-align:center">��ǰ��ȣ</th>
								<th style="text-align:center">���ڼ��ͱ�</th>
								<th style="text-align:center">���ڻ���</th>
							</tr>
							<%if (invest_list.size() != 0) {
								for (int i = 0; i < invest_list.size(); i++) {
									InvestVO invest = invest_list.get(i);
									String invest_status = null;
									
									if (invest.getInvest_payok().equals("������")) {
										invest_status = "����������";
									} else {
										invest_status = "���ڿϷ�";
									}
									
							%>
							<tr class = "text-center">
								<td><%=invest.getInvest_date()%></td>
								<td><%=invest.getInvest_sum()%></td>
								<td><%=invest.getGoodsVO().getGoods_num()%></td>
								<td><%=invest.getInvest_return()%></td>
								<td><%=invest_status%></td>
							</tr>
							<%
							} 
								}else {
							%>
							<tr>
								<td colspan="5" class="text-center">������ ������ �����ϴ�.</td>
							</tr>
							<%
							}							
							%>
						</tbody>
					</table>
					<div class = "text-center">
						<input type="button" class="btn btn-default" value="�ڷ�" onclick="history.go(-1);"> 
						<%
							//�� ���ڰǰ� ��ȯ�Ϸᰡ ���� ���� ��� �������̹Ƿ� Ż�� �Ұ�
							//�� ����ǰ� ��ȯ�Ϸᰡ ���� �ʴ� ��� ������/��ȯ���̹Ƿ� Ż�� �Ұ�
							if( ((borrower_id_total != borrower_id_complete) || (invest_id_total != invest_id_complete))) {
						%>
							<input type="button" class="btn btn-primary" value="Ż��" disabled>
						<%
							}
							else {
						%>
							<input type="button" class="btn btn-primary" value="Ż��" onclick="dropout('<%=member_id%>')">
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>