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
				<li class=""><a href="mypage_myaccount.do" id="MyAccount" >My Account</a></li>
				<li class=""><a href="mypage_myinvest.do" id="MyInvest">���ڳ���</a></li>
				<li class=""><a href="mypage_myloan.do" id="MyLoan">���⳻��</a></li>
				<li class=""><a href="mypage_memberupdate.do" id="MyUpdate" >ȸ����������</a></li>
			</ul>
		</div>
		<!-- ./col-sm-3 -->

		<div class="col-md-9" id="MyInvest">
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
									<th>�Ա��ϱ�</th>
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
								//���� ����
								//������°� ���������� �̸� ���� ���� ��ư
								if(bg.getBorrower_status().equals("����������")) {
								%>
									<td><a href = "mypage_myloan_fileUpload.do?borrower_id=<%=id %>&goodsVO.goods_num=<%=bg.getGoodsVO().getGoods_num() %>" class = "btn btn-default btn-md">��������</a>
								<%
								}
									
								else {
								%>
									<td>�Ϸ�</td>
								<%
								}
								//������°� ���� 
								%>
									<td><a href = "mypage_loan_deposit.do?borrower_id=<%=bg.getBorrower_id() %>&goodsVO.goods_num=<%=bg.getGoodsVO().getGoods_num() %>" class = "btn btn-default btn-md">�Ա��ϱ�</a>
								</tr>
								<%		}
									} else {
								%>
								<tr>
									<td colspan="7" align="center">���� ������ �����ϴ�.</td>
								</tr>
								<%	}%>
							</tbody>
						</table>
					</div>
				</fieldset>				
			</div>
	</div>
</section>