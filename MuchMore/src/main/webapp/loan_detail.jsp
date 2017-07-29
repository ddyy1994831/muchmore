<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	
	//loan_credit_check���� �Է¹��� ������� controller���� ����� ������ ��������
	BorrowerVO borrower = (BorrowerVO)request.getAttribute("borrower");
%>    

<script type="text/javascript">
	function check(){
		
		var form = document.getElementById("inputbasic");
		
		var sum = document.getElementById("goodsVO.goods_sum").value;
		alert(sum);
		alert(sum * 10000);
		var borrower_limit = <%=borrower.getBorrower_limit()%>;
		alert(borrower_limit);
		
		for (i = 0; i < sum.length; i++)
		{
			ch = sum.substring(i, i+1);
			if (!(ch >= "0" && ch <= "9")) // �Է¹��ڰ� �������� �˻� // if()���� ������ isNaN(str)�� �ϰ� for�� ������ �����Ƶ� ���� ȿ��!
			{
				alert("Ư�����ڰ� ����, �ٽ� �Է�!");
				return false;
			}
		}
		
		if(sum * 10000 > borrower_limit)
		{
			alert("�ѵ� �ݾ��� �ʰ��ϼ̽��ϴ�. \n"+borrower_limit+"�������Ϸ� �����ּ���.");
			return false;
		}
			
		return true;
	}
</script>

<section class = "container">
	<div class = "row text-center">		
	    <div class="container" align="center">
			<div class="jumbotron">
				<h3>������ �ſ������� Ȯ�����ּ���</h3><br/><br/>  
				<h6>�����/�ѵ� Ȯ��-><strong>��ſ�����Ȯ��</strong>->��������Է�->��ݸ�Ȯ�� �� ��û</h6>    
			</div>     
		</div>
		
		<div class="col-md-6 col-md-offset-3">
			<br/><br/>
			<div class="panel panel-default ">
	  			<div class="panel-heading"><h4>�ſ� ��� ��ȸ ��� Ȯ��</h4></div>
	  			<div class="panel-body">
	  				<font size = "3">
	    				<b>�ſ��� : </b><%=borrower.getBorrower_credit() %>��� <br/><br/>
						<b>�����ѵ��ݾ� : </b><%=borrower.getBorrower_limit() %>��<br/>
					</font>
	  			</div>
			</div>
			<br/><br/>
		</div>
		
		<!-- �߰����� �Է� �ޱ�  -->
		<form class = "form-horizontal" name = "inputbasic" id = "inputbasic" method = "post"
			onsubmit = "return check();" action = "loanDetail.do">
			<!-- hidden ������  -->
			<input type = "hidden" name = "borrower_jobbiz" value = "<%=borrower.getBorrower_jobbiz() %>">
			<input type = "hidden" name = "borrower_totalincome" value = "<%=borrower.getBorrower_totalincome() %>">
			<input type = "hidden" name = "borrower_credit" value = "<%=borrower.getBorrower_credit() %>">
			<input type = "hidden" name = "borrower_limit" value = "<%=borrower.getBorrower_limit() %>">
			<input type = "hidden" name = "goodsVO.goods_object" value = "<%=borrower.getGoodsVO().getGoods_object() %>">
			
			<fieldset class="col-md-6 col-md-offset-3">
				<legend>�� ���� �Է�</legend>
				<div class = "form-group">
					<label for = "borrower_id" class = "col-lg-2 control-label">���̵�</label>
					<div class = "col-lg-10">
						<input type = "text" class = "form-control" id = "borrower_id" name = "borrower_id"
							value = "<%=id %>">
					</div>
				</div>
					
				<div class = "form-group">
					<label for = "goodsVO.goods_sum" class = "col-lg-2 control-label">����ݾ�</label>
					<div class = "col-lg-10">
						<input type = "text" class = "form-control" id = "goodsVO.goods_sum" name = "goodsVO.goods_sum" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="borrower_loanperiod" class="col-lg-2 control-label" >���� �Ⱓ</label>
					<div class="col-lg-10">
						<select class="form-control" id="borrower_loanperiod" name="borrower_loanperiod">
							<option value="12">12����</option>
							<option value="24">24����</option>
							<option value="36">36����</option>
						</select>
					</div>
		    	</div>
		    	
		    	<div class="form-group">
					<label for="borrower_jobname" class="col-lg-2 control-label">������: </label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="borrower_jobname" placeholder="������" name="borrower_jobname" required="required">
					</div>
	    		</div>
	    		
	    		<div class="form-group">
					<label for="borrower_jobperiod" class="col-lg-2 control-label">�����Ⱓ: </label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="borrower_jobperiod" placeholder="3��2����" name="borrower_jobperiod" required="required">
					</div>
	    		</div>	
			    	
	    		<div class="form-group">
					<label class="col-lg-2 control-label">���� ������</label>
					<div class="col-lg-10">
						<div class="radio">
							<label>
								<input type="radio" name="borrower_repay_date" id="optionsRadios1" value="5" checked="">
									�ſ� 5��
							</label>
						</div>
					
						<div class="radio">
							<label>
								<input type="radio" name="borrower_repay_date" id="optionsRadios2" value="15">
									�ſ� 15��
							</label>
						</div>
					
						<div class="radio">
							<label>
								<input type="radio" name="borrower_repay_date" id="optionsRadios3" value="25">
									�ſ� 25��
							</label>
						</div>
					</div>
	    		</div>
	    		
	    		<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button type="reset" class="btn btn-default">���</button>
						<button type="submit" class="btn btn-primary">���� Ȯ���ϱ�</button>
					</div>
	    		</div>
	    		<br/><br/>
			</fieldset>
		</form>
	</div>
</section>