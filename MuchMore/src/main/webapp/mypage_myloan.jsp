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
	
	List<BorrowerVO> borrower_list = (List<BorrowerVO>)request.getAttribute("borrower_list");
		
%>

<section class="container">
	<div class="row" style = "min-height:80%;">
		<div class = "col-sm-3" id="menu">
			<ul class="nav nav-pills nav-stacked">
				<li class=""><a href="mypageMyaccount.do" id="MyAccount" >My Account</a></li>
				<li class=""><a href="mypage_myinvest.do" id="MyInvest">���ڳ���</a></li>
				<li class=""><a href="mypage_myloan.do" id="MyLoan">���⳻��</a></li>
				<li class=""><a href="mypage_memberupdate.do" id="MyUpdate" >ȸ����������</a></li>
			</ul>
		</div>
		<!-- ./col-sm-3 -->

		<div class="col-md-9" id="MyLoan">
				<fieldset>
					<legend><b>���⳻��</b></legend>
					<div class="form-group">
						<table class="table table-hover">
							<tbody>							
								<tr>
									<th>����ݾ�</th>
									<th>�ѻ�ȯ��</th>
									<th>��ȯ��</th>
									<th>�����Աݾ�</th>
									<th>�ܾ�</th>
									<th>����Ⱓ</th>
									<th>�������</th>
									<th>��������</th>
									<th>��ȯ�ϱ�</th>
								</tr>
								<%
									if(borrower_list != null) {
  										for(int i = 0; i < borrower_list.size(); i++) {
  											BorrowerVO bg = (BorrowerVO)borrower_list.get(i);
  								%>
								<tr>
									<td><fmt:formatNumber value="<%=bg.getGoodsVO().getGoods_sum() %>" type="currency" currencySymbol="��"></fmt:formatNumber></td>
									<td><fmt:formatNumber value="<%=bg.getBorrower_amount() %>" type="currency" currencySymbol="��"></fmt:formatNumber></td>
									<td><%=bg.getBorrower_repay_date() %></td>
									<td><fmt:formatNumber value="<%=bg.getBorrower_monthlypay() %>" type="currency" currencySymbol="��"></fmt:formatNumber></td>
									<td><%=bg.getBorrower_balance() %></td>
									<td><%=bg.getBorrower_loanperiod() %></td>
									<td><%=bg.getBorrower_status() %></td>
								<%
											//���� ����
											//������°� ���������� �̸� ���� ���� ��ư
											if(bg.getBorrower_status().equals("����������")) {
												
								%>
												<td><a href = "mypage_myloan_fileUpload.do?borrower_id=<%=id %>&goodsVO.goods_num=<%=bg.getGoodsVO().getGoods_num() %>" class = "btn btn-default btn-md">��������</a>
												<td><input type="button" class="btn btn-default btn-md" value="��ȯ�ϱ�" disabled/></td>
								<%
											}
											else {
								%>
												<td>�Ϸ�</td>
								<%
												/* 2017-08-01 �ٿ� : ���⳻�� : ����� ��ȯ ��ư disabled */
												if((bg.getBorrower_status().equals("�ɻ���")) || (bg.getBorrower_status().equals("�����û")) || (bg.getBorrower_status().equals("��ȯ�Ϸ�")) ) {											
								%>
													<td><input type="button" class="btn btn-default btn-md" value="��ȯ�ϱ�" disabled/></td>								
								<%		
												}
												else {
								%>
													<td><a href="mypageMyloanDeposit.do?borrower_id=<%=bg.getBorrower_id() %>&goodsVO.goods_num=<%=bg.getGoodsVO().getGoods_num() %>" class="btn btn-default btn-md">��ȯ�ϱ�</a></td>
								<%
												} 
  											}
  								%>
  								</tr>
  								<%
										}
									}
									else {
								%>
								<tr>
									<td colspan="7" align="center">���� ������ �����ϴ�.</td>
								</tr>
								<%	
									}
								%>
							</tbody>
						</table>
					</div>
				</fieldset>				
			</div>
	</div>
</section>