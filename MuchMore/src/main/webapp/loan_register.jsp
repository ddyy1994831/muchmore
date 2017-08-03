<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	//�α��� �������� Ȯ��
	System.out.println("loan_input2_detail.jsp");
	request.setCharacterEncoding("EUC-KR");
	String msg = (String)request.getAttribute("msg");
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	
	//������ ���� ��������
	BorrowerVO borrower = (BorrowerVO)request.getAttribute("borrower");
  
  	
%>

<section class = "container">
	<div class ="row">
		<div class="container" align="center">
			<div class="jumbotron">
				<h3>�Է��Ͻ� ������ ���� ���� ������ Ȯ���Ͻ� �� ��û�� �Ϸ����ּ���.</h3><br/><br/>  
				<h5>�����/�ѵ� Ȯ�΢���ſ�����Ȯ��/��������Է¢�<strong>��ݸ�Ȯ�� �� ��û</strong>���뼭������</h5>     
			</div>      
		</div>
	</div>
		<!-- style = "padding-left:200px;padding-right:200px;" -->
	<div class = "row">
		<div class = "col-md-6 col-md-offset-3">  
			<div class = "panel panel-primary">
				<div class = "panel-heading">
					<h4 class = "panel-title">���� ��û Ȯ��</h4>
				</div>
				<div class = "panel-body" style = "padding-left: 100px;padding-right:100px;padding-top:30px">
					<form method="post" name="writeform" class="form-horizontal" action="loanRegisterAction.do">
						<!-- ������ �� �� ���� -->
						<input type = "hidden" name="borrower_id" value=<%=id %>>
						<input type = "hidden" name="goodsVO.goods_object" value=<%=borrower.getGoodsVO().getGoods_object() %>>
						<input type = "hidden" name="goodsVO.goods_sum" value=<%=borrower.getGoodsVO().getGoods_sum() %>>
						<input type = "hidden" name="borrower_jobname" value=<%=borrower.getBorrower_jobname() %>>
						<input type = "hidden" name="borrower_jobperiod" value=<%=borrower.getBorrower_jobperiod() %>>
						<input type = "hidden" name="borrower_credit" value=<%=borrower.getBorrower_credit() %>>
						<input type = "hidden" name="borrower_limit" value=<%=borrower.getBorrower_limit() %>>
						<input type = "hidden" name="borrower_totalincome" value=<%=borrower.getBorrower_totalincome() %>>
						<input type = "hidden" id = "borrower_jobbiz" name = "borrower_jobbiz" value = "<%=borrower.getBorrower_jobbiz() %>">
						<input type = "hidden" id = "borrower_rate" name = "borrower_rate" value = "<%=borrower.getBorrower_rate() %>">
						<input type = "hidden" id = "borrower_loanperiod" name = "borrower_loanperiod" value = "<%=borrower.getBorrower_loanperiod()%>">
						<input type = "hidden" id = "borrower_amount" name = "borrower_amount" value = "<%=borrower.getBorrower_amount()%>">
						<input type = "hidden" id = "borrower_repay_date" name = "borrower_repay_date" value = "<%=borrower.getBorrower_repay_date() %>">
						<input type = "hidden" id = "borrower_monthlypay" name = "borrower_monthlypay" value = "<%=borrower.getBorrower_monthlypay() %>">
			   			
			   			<table class = "table table-striped">
			   				<tr>
			   					<td>��������</td>
			   					<td><%=borrower.getBorrower_jobbiz() %></td>
			   				</tr>
			   				
			   				<tr>
			   					<td>�������</td>
			   					<td><%=borrower.getGoodsVO().getGoods_object() %></td>
			   				</tr>
			   				
			  				<tr>
			  					<td>�����û �ݾ�</td>
			  					<td>
			  						<fmt:formatNumber value="<%=borrower.getGoodsVO().getGoods_sum() %>" type="currency" currencySymbol="��" />
			  					</td>
			  				</tr>
			  				
			  				<tr>
			  					<td>����ݸ�</td>
			  					<td><%=borrower.getBorrower_rate() %>%</td>
			  				</tr>
			  				<tr>
			  					<td>���� �Ⱓ</td>
			  					<td><%=borrower.getBorrower_loanperiod() %>����</td>
			  				</tr>
			  				
			  				<tr>
			  					<td>�� ��ȯ��</td>
			  					<td>
			  						<fmt:formatNumber value="<%=borrower.getBorrower_amount() %>" type="currency" currencySymbol="��" />
			  					</td>
			  				</tr>
			  				
			  				<tr>
			  					<td>�����Աݾ�</td>
			  					<td>
				  					<fmt:formatNumber value="<%=borrower.getBorrower_monthlypay() %>" type="currency" currencySymbol="��" />
			  					</td>
			  				</tr>
			  				
			  				<tr>
			  					<td>�� ��ȯ��</td>
			  					<td>�ſ� <%=borrower.getBorrower_repay_date() %>��
			  					</td>
			  				</tr>
			  				
			  				<tr>
			  					<td colspan = "2" class = "text-center">
									<button type="submit" class="btn btn-primary">��û�ϱ�</button>
			  					</td>
			  				</tr>
			   			</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>