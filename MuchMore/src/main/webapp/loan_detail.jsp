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
	<div class = "row text-center" >		
	    <div class="container" align="center">
			<div class="jumbotron">
				<h3>������ �ſ������� Ȯ�����ּ���</h3><br/><br/>  
				<h6>�����/�ѵ� Ȯ��-><strong>��ſ�����Ȯ��</strong>->��������Է�->��ݸ�Ȯ�� �� ��û</h6>    
			</div>     
		</div>
		
		<div class="row" style = "padding-left:300px;padding-right:300px;">
			<br/><br/>
			<div class="panel panel-warning">
	  			<div class="panel-heading"><h4 class = "panel-title"><b>�ſ� ��� ��ȸ ��� Ȯ��</b></h4></div>
	  			<div class="panel-body" style = "padding-left:100px;padding-right:100px">
	  				<table class="table table-striped" >
	  					<tr>
	  						<td>�ſ���</td>
							<td><%=borrower.getBorrower_credit() %> ���</td>
	  					</tr>
						<tr>
							<td>�����ѵ��ݾ�</td>
							<td><%=borrower.getBorrower_limit() %>��</td>
						</tr>
					</table>
	  			</div>
			</div>
			<br/><br/>
		</div>
		
		<!-- �߰����� �Է� �ޱ�  -->
		<div class = "row" style = "padding-left:200px;padding-right:200px">
			<div class = "panel panel-primary">
				<div class ="panel-heading">
					<h4 class = "panel-title">�� ���� �Է�</h4>
				</div>
				
				<div class = "panel-body">
					<form class = "form-horizontal" name = "inputbasic" id = "inputbasic" method = "post"
						onsubmit = "return check();" action = "loanDetail.do">
						<input type = "hidden" name = "borrower_totalincome" value = "<%=borrower.getBorrower_totalincome() %>">
						<input type = "hidden" name = "borrower_credit" value = "<%=borrower.getBorrower_credit() %>">
						<input type = "hidden" name = "borrower_limit" value = "<%=borrower.getBorrower_limit() %>">
						<input type = "hidden" name = "goodsVO.goods_object" value = "<%=borrower.getGoodsVO().getGoods_object() %>">
						<input type = "hidden" name = "borrower_jobbiz" value = "<%=borrower.getBorrower_jobbiz() %>">
						<input type = "hidden" name = "borrower_jobperiod" value = "<%=borrower.getBorrower_jobperiod() %>">
						<fieldset style = "padding-left: 100px">
							<!-- <legend>�� ���� �Է�</legend> -->
							<div class = "form-group">
								<label for = "borrower_id" class = "col-sm-2 control-label"><b>���̵�</b></label>
								<div class = "col-sm-4">
									<input type = "text" class = "form-control" id = "borrower_id" name = "borrower_id"
										value = "<%=id %>">
								</div>
							</div>
								
							<div class = "form-group">
								<label for = "goodsVO.goods_sum" class = "col-sm-2 control-label"><b>����ݾ�</b></label>
								<div class = "col-sm-4">
									<input type = "text" class = "form-control" id = "goodsVO.goods_sum" name = "goodsVO.goods_sum" required>
								</div>
							</div>
							
							<div class="form-group">
								<label for="borrower_loanperiod" class="col-sm-2 control-label" ><b>���� �Ⱓ</b></label>
								<div class="col-sm-4">
									<select class="form-control" id="borrower_loanperiod" name="borrower_loanperiod">
										<option value="12">12����</option>
										<option value="24">24����</option>
										<option value="36">36����</option>
									</select>
								</div>
					    	</div>
					    	
					    	<div class="form-group">
								<label for="borrower_jobname" class="col-sm-2 control-label"><b>������</b></label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="borrower_jobname" placeholder="������" name="borrower_jobname" required="required">
								</div>
				    		</div>
				    		
				    		<div class="form-group">
								<label for="borrower_jobperiod" class="col-sm-2 control-label"><b>�����Ⱓ</b></label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="borrower_jobperiod" placeholder="3��2����" name="borrower_jobperiod" required="required">
								</div>
				    		</div>	
						    	
				    		<div class="form-group">
								<label class="col-sm-2 control-label"><b>���� ������</b></label>
								<div class="col-sm-4">
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
				    		<br/>
				    		<div class="form-group">
								<div class="text-center">
									<button type="reset" class="btn btn-default">���</button>
									<button type="submit" class="btn btn-primary">���� Ȯ���ϱ�</button>
								</div>
				    		</div>
				    		<br/>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br/>
</section>