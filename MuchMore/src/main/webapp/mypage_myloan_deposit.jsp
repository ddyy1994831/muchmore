<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%	
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
	
	BorrowerVO borrower = (BorrowerVO)request.getAttribute("borrower");
	//�����Աݾ�
	int monthly_pay = (Integer)request.getAttribute("monthly_pay");
	//�ܾ�(borrower_balance)
	int balance = (Integer)request.getAttribute("balance");
	//���� ���� ���� �ܾ�
	int account_virtual_balance = (Integer)request.getAttribute("account_virtual_balance");
%>

<script>
	function check_pay() {
		//�Ա����� ��ȯ�� �Աݱݾ� ��
		var pay_amount = loanDepositform.deposit_amount.value;
		
		/*
			1. monthly_pay <= pay_amount : �Է��� �ݾ��� �����Աݾ׺��� Ŀ�� ��ȯ�� �����ϴ�.
			2. monthly_pay >= balance : ���ƾ��� �ܾ�(balance)�� �����Աݾ׺��� �۰ų� ���Ƶ� ��ȯ�� �����ϴ�.
				ex) �����Աݾ��� 13����, ���ƾ��� �ܾ��� 12�����̶�� ���ƾ��� �ݾ��� �����Աݾ׺��� �۾Ƶ� ��ȯ�� �����ϴ�.
			3. !(pay_amount > account_virtual_balance) : �Է��� �ݾ��� ���� ���� �ܾ׺��� ũ�� �ʾƾ� ��ȯ�� �ȴ�.
			4. pay_amount <= balance : �Է��� �ݾ��� ���ƾ��� �ݾ׺��� �۰ų� ���ƾ� ��ȯ�� �����ϴ�.
				ex) ���ƾ��� �ܾ��� 2�����̶�� 3������ �Ա�(��ȯ)�� �� ����.
		*/
		if(((<%= monthly_pay %> <= pay_amount) || (<%= monthly_pay %> >= <%= balance %>))
				&& (!(pay_amount > <%= account_virtual_balance %>))
				&& (pay_amount <= <%= balance %>)) {
			alert(pay_amount + "���� ��ȯ�Ǿ����ϴ�.");
			document.loanDepositform.submit();
		}
		else {
			if(pay_amount > <%= account_virtual_balance %>) {
				alert("������� �ܾ� ����");
			}
			else if(pay_amount > <%= balance %>) {
				alert("��ȯ���� �ܾ׺��� �����ϴ�.");
			}
			else {
				alert("'" + <%= monthly_pay %> + "' �̻� �Ա��ϼ���.");
			}
		}
	}
</script>

<section class="container">
	<div class="row" style = "height: 100%;">
		<div class = "col-sm-3" id="menu">
			<ul class="nav nav-pills nav-stacked">
				<li class=""><a href="mypageMyaccount.do" id="MyAccount" >My Account</a></li>
				<li class=""><a href="mypage_myinvest.do" id="MyInvest">���ڳ���</a></li>
				<li class=""><a href="mypage_myloan.do" id="MyLoan">���⳻��</a></li>
				<li class=""><a href="mypage_memberupdate.do" id="MyUpdate" >ȸ����������</a></li>
			</ul>
		</div>
		<div class="col-md-9" id="MyLoan">
			<div class="col-md-9 col-md-offset-1">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4 class="panel-title">����� ��ȯ</h4>
					</div>
					<div class="panel-body" id="LoanDeposit">
						<div>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>�̸�</th>
										<th>���¹�ȣ</th>
									</tr>
								</thead>
								<tr>
									<td><font size="4">muchmore</font></td>
									<td><font size="4">44372837801689</font></td>
								</tr>
							</table>
						</div>
						<!-- action="mypageMyloanDepositAction.do" -->
						<form class="form-horizontal" id="loanDepositform" name="loanDepositform" method="post">
						<input type="hidden" id="borrower_id" name="borrower_id" value="<%=borrower.getBorrower_id() %>">
						<input type="hidden" id="goods_num" name="goods_num" value="<%=borrower.getGoodsVO().getGoods_num()%>">
							<fieldset>
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon"><b>�Ա� �ݾ�</b></span>
											<input type="text" class="form-control" id="deposit_amount" name="deposit_amount" placeholder="��������">
											<fmt:formatNumber value="deposit_amount" type="currency" currencySymbol="��" />
										<span class="input-group-btn">
											<button type="submit" class="btn btn-default">�Ա��ϱ�</button>
										</span>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>