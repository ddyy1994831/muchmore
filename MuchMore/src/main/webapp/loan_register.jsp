<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
	<div class ="row" style = "height: 100%;">
		<div class="container" align="center">
			<div class="jumbotron">
				<h3>������ �������� �Է��� �ּ���</h3><br/><br/>  
				<h6>�����/�ѵ� Ȯ��->��ſ�����Ȯ��->����� ���� �Է�-><strong>��� ���� �Է�</strong></h6>    
			</div>     
		</div>
	
    	<!-- �� ���� �� -->
		<!-- ���� ���� �Է� ������ -->
		<form method="post" name="writeform" class="form-horizontal" action="loanRegisterAction.do">
			<!-- ������ �� �� ���� -->
			<input type = "hidden" name="borrower_id" value=<%=id %>>
			<%-- <input type = "hidden" name="borrower_jobbiz" value=<%=borrower.getBorrower_jobbiz() %>>
			<input type = "hidden" name="borrower_amount" value=<%=borrower.getBorrower_amount() %>>
			<input type = "hidden" name="borrower_monthlypay" value=<%=borrower.getBorrower_monthlypay() %>>
			
			 --%>
			<input type = "hidden" name="goodsVO.goods_object" value=<%=borrower.getGoodsVO().getGoods_object() %>>
			<input type = "hidden" name="goodsVO.goods_sum" value=<%=borrower.getGoodsVO().getGoods_sum() %>>
			<input type = "hidden" name="borrower_jobname" value=<%=borrower.getBorrower_jobname() %>>
			<input type = "hidden" name="borrower_jobperiod" value=<%=borrower.getBorrower_jobperiod() %>>
			<input type = "hidden" name="borrower_credit" value=<%=borrower.getBorrower_credit() %>>
			<input type = "hidden" name="borrower_limit" value=<%=borrower.getBorrower_limit() %>>
			<input type = "hidden" name="borrower_totalincome" value=<%=borrower.getBorrower_totalincome() %>>
			<%-- <input type = "hidden" name="borrower_loanperiod" value=<%=borrower.getBorrower_loanperiod() %>>
   			<input type = "hidden" name="borrower_rate" value=<%=borrower.getBorrower_rate() %>> --%>
   
			<fieldset class="col-md-6 col-md-offset-3">
				<legend>���� ��û ���� Ȯ��</legend>
				<div class="form-group">
					<label for="borrower_jobbiz" class="col-lg-2 control-label">�������� : </label>
					<div class="col-lg-10">
						<input type = "text" id = "borrower_jobbiz" name = "borrower_jobbiz"
							value = "<%=borrower.getBorrower_jobbiz() %>" readonly>
					</div>
	    		</div>
	    		
	    		<div class="form-group">
					<label for="goodVO.goods_object" class="col-lg-2 control-label">���� ���� :</label>
					<div class="col-lg-10">
						<input type = "text" id = "goodVO.goods_object" name = "goodVO.goods_object"
							value = "<%=borrower.getGoodsVO().getGoods_object() %>" readonly>
					</div>
	    		</div>
	    		
	    		<div class="form-group">
					<label for="goodVO.goods_sum" class="col-lg-2 control-label">���� ��û �ݾ� :</label>
					<div class="col-lg-10">
						<input type = "text" id = "goodVO.goods_sum" name = "goodVO.goods_sum"
							value = "<%=borrower.getGoodsVO().getGoods_sum() %>" readonly>
					</div>
	    		</div>
	    		
	    		<div class="form-group">
					<label for="borrower_rate" class="col-lg-2 control-label">���� �ݸ� : </label>
					<div class="col-lg-10">
						<input type = "text" id = "borrower_rate" name = "borrower_rate"
							value = "<%=borrower.getBorrower_rate() %>" readonly>
					</div>
	    		</div>
	    		
	    		<div class="form-group">
					<label for="borrower_loanperiod" class="col-lg-2 control-label">���� �ݸ� : </label>
					<div class="col-lg-10">
						<input type = "text" id = "borrower_loanperiod" name = "borrower_rate"
							value = "<%=borrower.getBorrower_loanperiod()%>" readonly>
					</div>
	    		</div>
	    		
	    		<div class="form-group">
					<label for="borrower_amount" class="col-lg-2 control-label">�� ��ȯ�� : </label>
					<div class="col-lg-10">
						<input type = "text" id = "borrower_amount" name = "borrower_amount"
							value = "<%=borrower.getBorrower_amount() %>" readonly>
					</div>
	    		</div>
	    		
	    		<div class="form-group">
					<label for="borrower_loanperiod" class="col-lg-2 control-label">�� ���Աݾ� : </label>
					<div class="col-lg-10">
						<input type = "text" id = "borrower_loanperiod" name = "borrower_loanperiod"
							value = "<%=borrower.getBorrower_loanperiod() %>" readonly>
					</div>
	    		</div>
   				
   				<div class="form-group">
					<label for="borrower_monthlypay" class="col-lg-2 control-label">�� ���Աݾ� : </label>
					<div class="col-lg-10">
						<input type = "text" id = "borrower_monthlypay" name = "borrower_monthlypay"
							value = "<%=borrower.getBorrower_monthlypay() %>" readonly>
					</div>
	    		</div>
	    		
	    		<div class="form-group">
					<label for="borrower_repay_date" class="col-lg-2 control-label">�� ��ȯ�� : </label>
					<div class="col-lg-10">
						<input type = "text" id = "borrower_repay_date" name = "borrower_repay_date"
							value = "<%=borrower.getBorrower_repay_date() %>" readonly>
					</div>
	    		</div>
	    	
	        	<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button type="reset" class="btn btn-default">���</button>
						<button type="submit" class="btn btn-primary">��û�ϱ�</button>
					</div>
	    		</div>
				<br/><br/><br/><br/><br/>
			</fieldset>
		</form>
	</div>
</section>