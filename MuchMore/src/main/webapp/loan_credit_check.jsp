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
		var totalincome = borrowerinfo.borrower_totalincome.value;
		var amount = borrowerinfo.borrower_amount.value;
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
		
		if(amount > 5000) {
			alert("�ִ� ���� ���� �ݾ��� 5000�����Դϴ�.\n5000 ���Ϸ� �Է��� �ּ���.");
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

<script type="text/javascript">
//[] <--���� ���� [^] <--���� [0-9] <-- ����  
//[0-9] => \d , [^0-9] => \D
var rgx1 = /\D/g;  // /[^0-9]/g �� ���� ǥ��
var rgx2 = /(\d+)(\d{3})/; 

//�� �ҵ� "," ���
function getNumber1(obj){
	
   var num01;
   var num02;
   num01 = obj.value;
   num02 = num01.replace(rgx1,"");
   num01 = setComma(num02);
   document.borrowerinfo.check_totalincome.value = "��" +num01+"����";

}

//��������ݾ� "," ���
function getNumber2(obj){
	
   var num01;
   var num02;
   num01 = obj.value;
   num02 = num01.replace(rgx1,"");
   num01 = setComma(num02);
   document.borrowerinfo.check_amount.value = "��" +num01+"����";

}

function setComma(inNum){
   
   var outNum;
   outNum = inNum;
   outNum = outNum;
   while (rgx2.test(outNum)) {
        outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
    }
   return outNum;

}

</script>

	
<section class="container">
	<div class = "row">
	    <div class="container" align="center">
			<div class="jumbotron">
				<h3>����/�ѵ� Ȯ��</h3><br/><br/>     
				<h5><strong>�����/�ѵ� Ȯ��</strong>�� ��ſ�����Ȯ��/����� ���� �Է¢���� ���� �Է¢��뼭������</h5>
			</div>     
		</div>
	</div>
	
	<br/><br/>
	<!-- padding-left:200px;padding-right:200px; -->
	<div class = "row">    
	    <!-- ���� ���� �Է� ������ -->  
	    <div class = "col-md-8 col-md-offset-2">
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
							<div class="col-sm-3">
								<input type="text" onchange = "getNumber1(this);" onkeyup = "getNumber1(this);" class="form-control" maxlength = "7" 
								id="borrower_totalincome" name="borrower_totalincome" onkeypress = "gNumCheck()" placeholder = "�������� �Է�" required style="text-align:right;">
							</div>
							<div class="col-sm-3">
								<input type = "text" class="form-control" name="check_totalincome" id="check_totalincome" onfocus="javascript:blur();"
								style="cursor: default;text-align:right;" placeholder = "�ݾ� Ȯ��" readonly>
							</div>
						</div>
						
				    
						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label"><b>�������ݾ�</b></label>
							<div class="col-sm-3">
								<input type="text" onchange = "getNumber2(this);" onkeyup = "getNumber2(this);" onkeypress = "gNumCheck()" class="form-control" id="borrower_amount"
								name = "borrower_amount" maxlength = "4" placeholder = "�������� �Է�" required style="text-align:right;">
							</div>
							<div class="col-sm-3">
								<input type="text"  class="form-control" id="check_amount" name = "check_amount" onfocus="javascript:blur();" style="cursor: default;"
									placeholder = "�ݾ� Ȯ��"style="text-align:right;" readonly>
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
											<h4 class="modal-title">����(�ſ�)���� �������̿� ���Ǽ�</h4>
											<p>
											��ġ���(���� ���ͻ硱�� ��)�� ���� ������ (����)�ŷ��� �����Ͽ� �ͻ簡 ������ ����(�ſ�)������ ���� �� �̿��ϰ��� �ϴ� ���,
											 �ͻ�� ������Ÿ� �̿����� �� ������ȣ � ���� ���� �� �������� ��ȣ��, �ſ������� �̿� �� ��ȣ�� ���� ���� � ���� ������ ���Ǹ� ���� �մϴ�. 
											 �̿� ������ �ͻ簡 �Ʒ��� ����� ���� ������ ����(�ſ�)������ ���� �� �̿��ϴµ� �����մϴ�.
											</p>
											
										</div>
										<div class="modal-body">
											<h4>[����(�ſ�)������ ���� �� �̿� ����]</h4>
											<hr/>    
											<ul style = "list-style-type : square">
												<li>
													<p>
													�ͻ�� �̿��� �� ��α���ȸ�� ������ (����)�ŷ� �߰��� �����Ͽ�, 
													��α�������� ����(�ſ�)�������� �� �����߰������� ���� �� ����߰� ���� ���� ���� ������ ���� �������� �̿����� ����(�ſ�)������ ���� �̿��մϴ�.
													</p>
												</li>
											</ul>
											
											<br/>
											
											<h4>[����(�ſ�)������ ���� �� �̿� �׸�]</h4>
											<hr/>
											<ul style = "list-style-type : square">
												<li>
													<p>���νĺ����� : ����, �������, ����, ���ڿ���, ��������, �޴���ȭ��ȣ �� ����ó</p>
												</li>
												<li>
													<p>�����Ͻ�, IP�ּ�, �̿� ��ȭ��ȣ �� ���ڱ����ŷ����� ���� ��������(���ڱ����ŷ� ����)</p>
												</li>
											</ul>
											
											<br/>
											
											<h4>[����(�ſ�)������ ���� �� �̿� �Ⱓ]</h4>
											
											<hr/>
											<ul style = "list-style-type : square">
												<li>
													<p>
													�ͻ�� �̿��ڰ� ������ ���κ���, �ͻ簡 �߰��� ��α���ȸ�翡�� �̿����� ����(�ſ�)������ ������ �� 2���� �̳������� �Ⱓ ���� �̿����� ����(�ſ�)������ ���� �� �̿��մϴ�. 
													��, �ͻ�� �̿��ڰ� ����(�ſ�)������ ���� �� �̿뿡 ���� ���Ǹ� öȸ�ϴ� ��� �ش� ����(�ſ�)������ ��ü���� �ı��մϴ�.
													�ͻ�� ���� ������ ������ ���Ͽ� ���� ������ ��õǾ� �ִ� ��� ������ɿ��� ���� ������ �Ⱓ ���� ���������� �����մϴ�.
													</p>
												</li>
											</ul>
										</div>
										<hr/>
										<div class="modal-footer">
											<ul class = "text-left" style = "list-style-type : square">
												<li>
													<p>��� ������ �����Ǵ� ��� ��ġ��� Ȩ������(www.muchmore.com) �Խ� ���� ���� �� ������ �ȳ� �帮�ڽ��ϴ�.</p>
												</li>
												<li>
													<p>���ϴ� ����(�ſ�)���� �������Ǹ� �ź��� �Ǹ��� ������, �� ������ ���� ������ �ʼ������� �ʿ��� �����̹Ƿ�, ���Ǹ� �ź��Ͻ� ��� �ŷ��� ���� �Ǵ� ������ �Ұ����� �� ������ �˷��帳�ϴ�.</p>
												</li>												
											</ul>
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
											<h4 class="modal-title">����(�ſ�)���� ���� ���Ǽ�</h4>
											<p>
												��ġ���(���� ���ͻ硱�� ��)�� ���� ������ (����)�ŷ� �߰��� �����Ͽ� �ͻ簡 ������ ����(�ſ�)������ ��3�ڿ��� �����ϰ��� �ϴ� ���, 
												�ͻ�� ������Ÿ� �̿����� �� ������ȣ � ���� ���� �� �������� ��ȣ�� � ���� ������ ���Ǹ� ���� �մϴ�. 
												�̿� ������ �ͻ簡 �Ʒ��� ����� ���� ������ ����(�ſ�)������ ��3�ڿ��� �����ϴµ� �����մϴ�.
											</p>
											<hr/>
										</div>
										<div class="modal-body">
											<h4>[���������� ��3�� ������ ���� ����]	</h4>
											<hr/>
											<ul>
												<li>
													<p>���������� �����޴� �� : ��ġ���</p>
												</li>
											</ul>
											<br/>
											
											<h4>[�������� �̿� ����]</h4>
											<ul>
												<li>
													<p>��ġ��ƴ� ������ ���� �̿� �������� �ͻ�κ��� �̿����� ���������� �����޽��ϴ�.</p>
												</li>
												<li>
													<p>��ġ��� : �̿��ڸ� ���� �¶��� �������� �߰�(�̿��ڿ� ��ġ��� ������ �����࿡ ���� ����ä�ǰ� �����Ͽ�, �����ڿ� ��ġ��� �� ����ä���� �����ݼ���� ����� �ŷ��� ���� �߰� �� ����)</p>
												</li>
												<li>
													<p>��ġ��� : �̿��ڿ��� ����(����)�ŷ������� �������� �Ǵ� �� ���� �� ü�� �� ���� �� ���� �� ����(���, ���� ���� �� ����) �� �߷����Ҽȴ�� �� ��ġ��ƿ� �̿��� ������ (����)�ŷ��� �����Ͽ� �ͻ簡 �����Ͽ��� �ϴ� ���� ���� ����</p>
												</li>
											</ul>
											<br/>
											<h4>[�����ϴ� �������� �׸�]</h4>
											<hr/>
											<ul>
												<li>
													<p>���νĺ�����: ����, �������, ����, ���ڿ���, ��������, �޴���ȭ��ȣ �� ����ó</p>
												</li>
											</ul>
											<br/>
											<h4>[���������� �����޴� ���� �������� ���� �� �̿� �Ⱓ]</h4>
											<hr/>
											<ul>
												<li>
													<p>�ͻ�� �̿��ڰ� ������ ���κ��� �����޼��ñ��� �̿����� ����(�ſ�)������ �����մϴ�.</p>
												</li>
											</ul>
										</div>
										<hr/>
										<div class="modal-footer">
											<ul class = "text-left" style = "list-style-type : square" >
												<li>
													<p>��� ������ �����Ǵ� ��� ��ġ��� Ȩ������(www.muchmore.com) �Խ� ���� ���� �� ������ �ȳ� �帮�ڽ��ϴ�.</p>
												</li>
												<li>
													<p>���ϴ� ���Ǹ� �ź��� �Ǹ��� ������, �� ���׿� ���� ���ǰ� ���� ��� �ŷ��� ���� �Ǵ� ������ �Ұ����� �� �ֽ��ϴ�.</p>
												</li>
											</ul>							
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

