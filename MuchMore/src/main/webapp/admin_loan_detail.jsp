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
								<th>���</th>
								<th>����ݸ�</th>
								<th>����Ⱓ</th>
								<th>����ݾ�</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td><%=borrower.getBorrower().getBorrower_credit()%>���</td>
								<td><%=borrower.getBorrower().getBorrower_rate()%>%</td>
								<td><%=borrower.getBorrower().getBorrower_loanperiod()%>����</td>
								<td><fmt:formatNumber value="<%=borrower.getBorrower().getGoodsVO().getGoods_sum()%>" type="currency" currencySymbol="��" /></td>

							</tr>
						</tbody>
					</table>

					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">������ ��������</div>
							<div class="panel-body">
								<div class="col-xs-6">����</div>
								<div class="col-xs-6 text-right">
									<%=borrower.getMember_gender()%>
								</div>
								<div class="col-xs-6">����</div>
								<div class="col-xs-6 text-right">
									<%=borrower.getMember_age()%>
								</div>
								<div class="col-xs-6">�̸�</div>
								<div class="col-xs-6 text-right"><%=borrower.getMember_name()%></div>
								<div class="col-xs-6">��ȭ��ȣ</div>
								<div class="col-xs-6 text-right"><%=borrower.getMember_phone()%></div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">������ �ҵ�����</div>
							<div class="panel-body">
								<div class="col-xs-6">���ҵ�</div>
								<div class="col-xs-6 text-right">
									<fmt:formatNumber value="<%=borrower.getBorrower().getBorrower_totalincome()%>" type="currency" currencySymbol="��" />
								</div>
								<div class="col-xs-6">��������</div>
								<div class="col-xs-6 text-right">
									<%=borrower.getBorrower().getBorrower_jobbiz()%>
								</div>
								<div class="col-xs-6">������</div>
								<div class="col-xs-6 text-right">
									<%=borrower.getBorrower().getBorrower_jobname()%>
								</div>
								<div class="col-xs-6">�����Ⱓ</div>
								<div class="col-xs-6 text-right">
									<%=borrower.getBorrower().getBorrower_jobperiod()%>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">��������</div>
							<div class="panel-body">
								<div class="col-xs-6">�����û�ݾ�</div>
								<div class="col-xs-6 text-right"><fmt:formatNumber value="<%=borrower.getBorrower().getGoodsVO().getGoods_sum()%>" type="currency" currencySymbol="��" /></div>
								<div class="col-xs-6">�����ȯ�ݾ�</div>
								<div class="col-xs-6 text-right"><fmt:formatNumber value="<%=borrower.getBorrower().getBorrower_amount()%>" type="currency" currencySymbol="��" /></div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">���� �̿� ����</div>
							<div class="panel-body">
								<div class="col-xs-6">����� ���� ����</div>
								<div class="col-xs-6 text-right"><%=borrower.getBorrower().getBorrower_payok()%></div>
								<div class="col-xs-6">������¹�ȣ</div>
								<div class="col-xs-6 text-right"><%=borrower.getAccount().getAccount_virtual()%></div>
							</div>
						</div>
					</div>
					 
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">��������</div>
							<div class="panel-body">
								<div class="col-xs-6">���� ����</div> 
								<div class="col-xs-6 text-right">
									<%
									if(borrower.getBorrower().getBorrower_file() == null){
									%>
										������
									<%
									}
									else {
										String downlink = "loanFileDownload.do?of="+URLEncoder.encode(borrower.getBorrower().getBorrower_stored(), "UTF-8")
										  +"&of2=" +URLEncoder.encode(borrower.getBorrower().getBorrower_file(), "UTF-8");
										
									%>
										<a href = "<%=downlink%>"><%=borrower.getBorrower().getBorrower_file() %></a> 
										<a href = "<%=downlink %>" class = "btn btn-default btn-xs">�ٿ�ε�</a>
									<%
									}
									
									%>
									 
								</div>
								<div class="col-xs-6">���� ����(�ܰ�)</div>
								<div class="col-xs-6 text-right">
									<%=borrower.getBorrower().getBorrower_status()%>
									<%
									if(borrower.getBorrower().getBorrower_status().equals("�ɻ���")){
									%>
										<a href = "loanApproval.do?borrower_id=<%=borrower.getBorrower().getBorrower_id() %>&goodsVO.goods_num=<%=borrower.getBorrower().getGoodsVO().getGoods_num()%>"
										 class = "btn btn-warning btn-xs">�����ϱ�</a>
									<%
									}
									%>
								</div> 
							</div>
						</div>
					</div>
					
				</div>
				<div class="panel-footer text-center">
					<a class = "btn btn-default" href="adminLoanList.do">�ڷ�</a>
					
					<%
					//��ư�� ���� ���
					//1.���޿Ϸ� �� ���
					//2.�������� ��� (���� �Ϸ� ���� ���� ���)
					//3.���� ������ ���� ���� ���
					//if(borrower.getBorrower().getBorrower_payok().equals("���޿Ϸ�") || borrower.getBorrower().getGoodsVO().getGoods_status() != null) {
						//���� ������ ���� �ʾҰų�. �̹� ���ε� ���
						if((borrower.getBorrower().getBorrower_status().equals("�ɻ���"))) {
					%>
							<a href = "loanApproval.do?borrower_id=<%=borrower.getBorrower().getBorrower_id() %>&goodsVO.goods_num=<%=borrower.getBorrower().getGoodsVO().getGoods_num()%>"
										 class = "btn btn-warning">�����ϱ�</a>
					<%
							
						}
						
					//}
					
					else if(borrower.getBorrower().getGoodsVO().getGoods_status().equals("�����Ϸ�")) {
						
					%>
						<button type="submit" class="btn btn-primary"
						onclick="openSend('<%=borrower.getBorrower().getBorrower_id() %>','<%=borrower.getBorrower().getGoodsVO().getGoods_num() %>')">�����ϱ�</button>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
</section>
<br/><br/>