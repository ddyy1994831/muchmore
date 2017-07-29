<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}

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
</script>

	
<section class="container">
	<div class = "row" style = "height: 100%;">
	    <div class="container" align="center">
			<div class="jumbotron">
				<h3>����/�ѵ� Ȯ��</h3><br/><br/>     
				<h6><strong>�����/�ѵ� Ȯ��</strong>->��ſ�����Ȯ��->����� ���� �Է�->��� ���� �Է�</h6> 
			</div>     
		</div>
		
	    <!-- ���� ���� �Է� ������ -->
		<form id="borrowerinfo" name="borrowerinfo" class="form-horizontal" action="loanCreditCheckAction.do" method="post" onsubmit="return credit_check()">
			<fieldset class="col-md-6 col-md-offset-3">
				<legend>�⺻ ���� �Է�</legend>
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">ȸ�����̵�</label>
					<div class="col-lg-10">
						<span class="help-block"><%=id %></span>
					</div>
				</div>
				<div class="form-group">
					<label for="borrower_jobbiz" class="col-lg-2 control-label" >���� ����</label>
					<div class="col-lg-10">
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
					<label for="borrower_totalincome" class="col-lg-2 control-label">���ҵ�</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="borrower_totalincome" name="borrower_totalincome">
						<!-- <span class="help-block"></span> -->
					</div>
				</div>
		    
				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">�������ݾ�</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="borrower_amount">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-2 control-label">���� �뵵</label>
					<div class="col-lg-10">
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
		    
				<div class="container">
					<div class="checkbox">
						<input type="checkbox" value="" class="check" id="checkAll">&nbsp;�Ʒ� �׸� ���Ͽ� Ȯ���Ͽ����� ��ü �����մϴ�
					</div>
					<div class="checkbox">
						<input type="checkbox" value="" class="check" id="myCheck1"> ����(�ſ�) ���� �������̿� ����(�ʼ�)
						<button type="button" class="btn btn-link" id="myBtn">�ڼ��� ����</button>
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
				  
					<div class="checkbox">
						<label><input type="checkbox" value="" class="check" id="myCheck2"> ����(�ſ�) ���� ���� ����(�ʼ�)</label>
						<button type="button" class="btn btn-link" id="myBtn2">�ڼ��� ����</button>
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
					<div class="col-lg-10 col-lg-offset-2">
						<button type="reset" class="btn btn-default">���</button>
						<button type="submit" id = "creditSearch" class="btn btn-primary">���� ��ȸ�ϱ�</button>
					</div>
				</div>
				<br/><br/><br/><br/><br/>
			</fieldset>
		</form>
	</div>
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

