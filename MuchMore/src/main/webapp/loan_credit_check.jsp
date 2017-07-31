<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	int sum = 0;
%>
<!-- üũ�ڽ� ���� üũ�ߴ��� Ȯ�� �� ���� ���� �Է� Ȯ�� -->
<script type="text/javascript">
	function credit_check() {
		var x = document.getElementById("myCheck1").checked;
		var y = document.getElementById("myCheck2").checked;
		var totalincome = writeform.borrower_totalincome.value;
		
		if(totalincome == "")
		{
			alert("���ҵ� �Է¶��� ������ϴ�. �������� ��� 0���� �Է����ּ���.");
			return false;
		}
			    
		if(x == false || y == false)
	    {
	    	alert("����� ��� �����ϼž� �մϴ�");
		    return false;
	    }
			
		return true;
}
	
function gNumCheck() {
	if(event.keyCode >= 48 && event.keyCode <= 57) {
		return true;
	}
	else {
		event.returnValue = false;
	}
}
</script>

	
<section class="container">
	<div class = "row">
	    <div class="container" align="center">
			<div class="jumbotron">
				<h3>����/�ѵ� Ȯ��</h3><br/><br/>     
				<h6><strong>�����/�ѵ� Ȯ��</strong>->��ſ�����Ȯ��->����� ���� �Է�->��� ���� �Է�</h6> 
			</div>     
		</div>
	</div>
	
	<br/><br/>
	
	<div class = "row" style = "padding-left:200px;padding-right:200px;">
	    <!-- ���� ���� �Է� ������ -->
	    <div class = "panel panel-primary">
	    	<div class = "panel-heading">
	    		<h4 class = "panel-title">�⺻ ���� �Է�</h4>
	    	</div>
	    	<div class = "panel-body">
			    <form id="borrowerinfo" name="borrowerinfo" class="form-horizontal" action="loanCreditCheckAction.do" method="post" onsubmit="return credit_check()">
					<fieldset style = "padding-left: 100px;">
						<!-- <legend>�⺻ ���� �Է�</legend> -->
						<div class="form-group">
							<label for="textArea" class="col-sm-2 control-label"><b>ȸ�����̵�</b></label>
							<div class="col-sm-10">
								<span class="help-block"><%=id %></span>
							</div>
						</div>
						<div class="form-group">
							<label for="borrower_jobbiz" class="col-sm-2 control-label" ><b>���� ����</b></label>
							<div class="col-sm-4">
								<select class="form-control" id="borrower_jobbiz" name="borrower_jobbiz">
									<option value="�ٷμҵ���">�ٷ� �ҵ���</option>
									<option value="����ҵ���(����)">��� �ҵ���(����)</option>
									<option value="����ҵ���(����)">��� �ҵ���(����)</option>
									<option value="��Ÿ�ҵ���">��Ÿ �ҵ���</option>
								</select>
								<br>
							</div>
						</div>
						
						<div class="form-group">
							<label for="borrower_totalincome" class="col-sm-2 control-label"><b>���ҵ�</b></label>
							<div class="col-sm-4">
								<input type="text" onkeypress = "gNumCheck()" class="form-control" 
								id="borrower_totalincome" name="borrower_totalincome" placeholder = "�������� �Է�">
							</div>
						</div>
				    
						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label"><b>�������ݾ�</b></label>
							<div class="col-sm-4">
								<input type="text" onkeypress = "gNumCheck()" class="form-control" id="borrower_amount"
								placeholder = "�������� �Է�">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label"><b>���� �뵵</b></label>
							<div class="col-sm-10" style = "padding-left:60px">
								<div class="radio">
									<input type="radio" name="goodsVO.goods_object" id="optionsRadios1" value="��Ȱ��" checked="">
										�޿� �� ��Ȱ��
								</div>
							
								<div class="radio">
									<input type="radio" name="goodsVO.goods_object" id="optionsRadios2" value="����/����">
										���� �� ����
								</div>
								<div class="radio">
									<input type="radio" name="goodsVO.goods_object" id="optionsRadios3" value="���">
										����� �ŷ�
								</div>
								<div class="radio">
									<input type="radio" name="goodsVO.goods_object" id="optionsRadios4" value="����">
										����
								</div>
								<div class="radio">
									<input type="radio" name="goodsVO.goods_object" id="optionsRadios4" value="���ڱ�">
										���ڱ�
								</div>
								<div class="radio">
									<input type="radio" name="goodsVO.goods_object" id="optionsRadios4" value="��Ÿ">
										��Ÿ
								</div>
							</div>
						</div>
				    	<br/>
						<div class="form-group" style = "padding-left:100px; padding-right:100px;">
							<div class="checkbox">
								<input type="checkbox" value="" class="check" id="checkAll">&nbsp;�Ʒ� �׸� ���Ͽ� Ȯ���Ͽ����� ��ü �����մϴ�
							</div>
							<div class="checkbox">
								<label><input type="checkbox" value="" class="check" id="myCheck1">����(�ſ�) ���� �������̿� ����(�ʼ�)</label>
								<button type="button" class="btn btn-link" id="myBtn">�ڼ��� ����</button>
							</div> 
					    	<div class="checkbox">
								<label><input type="checkbox" value="" class="check" id="myCheck2">����(�ſ�) ���� ���� ����(�ʼ�)</label>
								<button type="button" class="btn btn-link" id="myBtn2">�ڼ��� ����</button>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="myModal" role="dialog">
								<div class="modal-dialog">
									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Modal with Dark Overlay</h4>
										</div>
										<div class="modal-body">
											<p>This modal has a dark overlay.</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
		
							<!-- Modal -->
							<div class="modal fade" id="myModal2" role="dialog">
								<div class="modal-dialog">
						    	<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">��</button>
											<h4 class="modal-title">Modal without Overlay</h4>
										</div>
										<div class="modal-body">
											<p>This modal has no overlay.</p>
											<p><strong>Note:</strong> You cannot click outside of this modal to close it.</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										</div>
									</div>
						      	</div>
							</div>
						</div>
						
						<br/><br/> 
						<div class="form-group">
							<div class="text-center">
								<button type="reset" class="btn btn-default">���</button>
								<button type="submit" id = "creditSearch" class="btn btn-primary">���� ��ȸ�ϱ�</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<br/>
    <!-- �ڼ������� ��ư-->
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
		
		<!-- üũ�ڽ� ��μ��� -->
	<script>
		$("#checkAll").click(function () {
	    	$(".check").prop('checked', $(this).prop('checked'));
		});
	</script>
</section>

