<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("utf-8");

	//�α��λ������� üũ
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
%>
<!-- ���θ� �ּ� ã�� -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
   
   	//�Է°� ����ó��
    	function check(){
    		var id = joinform.member_id.value;
    		var password1 = joinform.member_pw1.value;
    		var password2 = joinform.member_pw2.value;
    		var email = joinform.member_email.value;
    		var exptext =  /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    		var phone = joinform.member_phone.value;
    		var	name = joinform.member_name.value;
    		var jumin1 = document.getElementById("member_jumin1");
    		var jumin2 = document.getElementById("member_jumin2");
    		var zipcode = document.getElementById("member_zipcode");
    		var addr1 = document.getElementById("member_addr1");
    		var addr2 = document.getElementById("member_addr2");
    		var agreement = joinform.member_agreement.value;
    	
    		var forms = document.getElementById("joinform");
    	
    	//���̵� üũ
    		if(id.length < 8 || id.length > 12){
	    		alert("���̵� ����� �Է����ּ���. (����, ���� ���� 8~12�ڸ�)");
    			joinform.member_id.focus();
    			return false;
    		}    		
    		else{
    			for(i=0; i<id.length; i++)
    			{
    				ch = id.substring(i, i+1);
    				if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z")))
    				{
    					alert("Ư�����ڰ� ����, �ٽ� �Է�!!!");
    					joinform.member_id.focus();
    					return false;
    				}
    			}	
    		}
    	//���̵� �ߺ�Ȯ�� üũ
    		if(joinform.idDuplication.value != "idCheck"){
    			alert("���̵� �ߺ�üũ�� ���ּ���.");
    			return false;
    		}
    		
    	//��й�ȣ üũ
    		if(password1.length < 6 || password1.length > 10){
    			alert("��й�ȣ�� ����� �Է��ϼ���. (����, ���� ���� 6~10�ڸ�)");
    			joinform.member_pw1.focus();
    			return false;    			
    		}    		
    		else
			{
				for(i=0; i<password1.length; i++)
				{
					ch = password1.substring(i, i+1);
					if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z")))
					{
						alert("Ư�����ڰ� ����, �ٽ� �Է�!!!");
						joinform.member_pw1.focus();
						return false;
					}
				}
			}
    	
    	//��й�ȣ Ȯ�� üũ
    		if(password1 != password2){
    			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
    			password2="";
    			joinform.member_pw1.focus();
    			return false;
    		}
    	
    	//�̸� üũ
    		if(name.length<=1){
    			alert("�̸��� ����� �Է��� �ּ���.");
    			joinform.member_name.focus();
    			return false;
    		}  	   
    	//�޴��� ��ȣ üũ
    		if( phone.length == 0 || phone.length > 13) {
    			alert("�޴��� ��ȣ�� ����� �Է��ϼ���.('-' ���� 13�ڸ�)");
    			joinform.member_phone.focus();
    			return false;
    		}
    	
    	//�̸��� üũ
    		if(exptext.test(email) == false){
    			//�̸��� ������ ���ĺ�+����@���ĺ�+����.���ĺ�+���� ������ �ƴҰ��
    			alert("�̸����� ����� �Է��ϼ���.('@' ���� �ּҸ� ��� �Է����ּ���)");
    			joinform.member_email.focus();
    			return false;
    		}
    	
    	//�ֹι�ȣ üũ
     		if (jumin1.value == "") // ����� üũ
    		{
    			alert("�ֹι�ȣ(���ڸ�)�� �Է��ϼ���!!")
    			jumin1.focus();
    			return false;
    		}
    		
    		else if (jumin2.value == "") // ����� üũ
        	{
    			alert("�ֹι�ȣ(���ڸ�)�� �Է��ϼ���!!")
    			jumin2.focus();
    			return false;
    		}
    		
    		else // ������� �ƴҶ�
    		{
    			var str1 = jumin1.value;
    			var str2 = jumin2.value;
    			if (str1.length != 6) // �Է� ���� üũ
    			{
    				alert("�ֹι�ȣ Ȯ��(������� 6�ڸ�)!!!")
    				jumin1.focus();
    				return false;
    			}
    			
    			else if (str2.length != 7) // �Է� ���� üũ
    			{
    				alert("�ֹι�ȣ Ȯ��(7�ڸ�)!!!")
    				jumin2.focus();
    				return false;
    			}
    			
    			else // �Է°� ���̿� ������ ���� ��
    			{
    				str = str1 + str2;
    				var w = 2, hap = 0, chk;
    				for (i = 0; i < str.length; i++)
    				{
    					ch = str.substring(i, i+1);
    					if (!(ch >= "0" && ch <= "9")) // �Է¹��ڰ� �������� �˻� // if()���� ������ isNaN(str)�� �ϰ� for�� ������ �����Ƶ� ���� ȿ��!
    					{
    						alert("Ư�����ڰ� ����, �ٽ� �Է�!");
    						document.joinform.jumin1.focus();
    						return false;
    					}
    					
    					else
    					{
    						if( i == (str.length-1)) // �������� üũ����Ʈ �̹Ƿ� �հ� ��꿡�� ���ܽ�Ŵ.
    							continue;
    						hap += parseInt(ch) * w; // ����ġ(w)�� ���ؼ� �հ踦 ����
    						w++;
    						if (w == 10) // ����ġ�� 10�̸� 2�� ����
    						w = 2;
    					}
    				}
    				
    				chk = 11 - (hap % 11); // üũ����Ʈ ����
    				if (chk == 10)
    					chk = 0;
    				else if (chk == 11)
    					chk = 1;
    		
    				if (chk != parseInt(str.substring(str.length-1, str.length)))
    				{
    					alert("�ֹι�ȣ ����, �ٽ� �Է�!!!");
    					document.joinform.jumin1.focus();
    					return false;
    				}
    			}
    		}
    		
    	//�����ȣ ���� üũ
    		if (zipcode.value == ""){
    			alert("�����ȣ �˻��� �ǽ��ϼ���.");
    			zipcode.focus();
    			return false;
    		}
    	//�⺻�ּ� ���� üũ
    		if (addr1.value == ""){
    			alert("�����ȣ �˻��� �ǽ��ϼ���.");
    			zipcode.focus();
    			return false;
    		}
    	//���ּ� ���� üũ
    		if (addr2.value == ""){
    			alert("���ּҸ� �Է��ϼ���.");
    			addr2.focus();
    			return false;
    		}
    	
    	//����������� ���� üũ
    		if(agreement == "0"){
    			alert("������������� �������� �����ø� ȸ�������� �Ͻ� �� �����ϴ�.");
    			joinform.member_email.focus();
    			return false;
    		}
    		else
    			{
    			return true;
    			}
    	
    		return false;
    	}
    
    //���̵� �ߺ�üũ
    function check_Id(){
    		var joinform = document.getElementById("joinform");
    		var id = joinform.member_id.value;
    		var url = "joinCheckId.do?member_id=" + id;
    	
    		if(id.length == 0){
    			alert("���̵� �Է��ϼ���.");
    			joinform.member_id.focus();
    			return false;
    		}
    		open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no," + 
    			"scrollbars=no, resizable=no, width=400, height=200");
    }
    
    //���̵� �Է�â�� �� �Է½� hidden�� idUncheck�� �����Ѵ�. �̷��� �ϴ� ������ �ߺ�üũ �� ���̵� �Է¶��� ���ο� ���̵� �Է����� �� �ٽ� �ߺ�üũ�� �ϵ��� �Ѵ�.
    function inputIdChk(){
    	document.joinform.idDuplication.value="idUncheck";
    }
    
	//�����ȣ �˻� ���
	function sample6_execDaumPostcode() {
		new daum.Postcode({
	    	oncomplete: function(data) {
	        	// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
	        	// �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
		    	// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
				var fullAddr = ''; // ���� �ּ� ����
				var extraAddr = ''; // ������ �ּ� ����
	
	        	// ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
	        	if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
			        fullAddr = data.roadAddress;
		    	}
	        
	        	else { // ����ڰ� ���� �ּҸ� �������� ���(J)
	        		fullAddr = data.jibunAddress;
	        	}
	
				// ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
	        	if(data.userSelectedType === 'R'){
	        		//���������� ���� ��� �߰��Ѵ�.
	            	if(data.bname !== ''){
	            		extraAddr += data.bname;
	            	}
	            
	        		// �ǹ����� ���� ��� �߰��Ѵ�.
	            	if(data.buildingName !== ''){
	            		extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            	}
					// �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
					fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				}
	
				// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
				document.getElementById("member_zipcode").value = data.zonecode; //5�ڸ� �������ȣ ���
				document.getElementById("member_addr1").value = fullAddr;
	
				// Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
				document.getElementById("member_addr2").focus();
			}
		}).open();
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
	<div class = "row text-center" >		
	    <div class="container" align="center">
			<div class="jumbotron">
				<h3>ȸ������</h3><br/><br/>  
			</div>     
		</div>
	</div>	
	<div class="row">
		<div class = "col-md-8 col-md-offset-2">
			<div class = "panel panel-primary">
				<div class = "panel-heading">
					<h4 class = "panel-title">ȸ������</h4>    
				</div>
			
				<div class = "panel-body">
					<form id="joinform" name="joinform" class="form-horizontal"
						action="joinAction.do" method="post" onsubmit="return check()">
						<fieldset>
							<div class="form-group">
								<label for="member_id" class="col-sm-3 control-label">���̵�</label>
								<div class="col-sm-4">     
									<input id="member_id" type="text"
										placeholder="����, ���� ���� 8~12�ڸ� �Է�" name="member_id"
										class="form-control" onkeydown="inputIdChk()">
								</div>
								<div class="col-sm-3">
									<input type="button" id="checkId" name="checkId"
										class="btn btn-primary" value="���̵� �ߺ�üũ" onclick="check_Id();" />
									<input type="hidden" name="idDuplication" value="idUncheck" />
								</div>
							</div>
	
							<div class="form-group">
								<label for="member_pw1" class="col-sm-3 control-label">��й�ȣ</label>
								<div class="col-sm-4">
									<input type="password" class="form-control" id="member_pw1" maxlength = "15"
										name="member_pw1" placeholder="����, ���� ���� 6~10�ڸ� �Է�">
								</div>
							</div>
		
							<div class="form-group">
								<label for="member_pw2" class="col-sm-3 control-label">��й�ȣ
									Ȯ��</label>
								<div class="col-sm-4">
									<input type="password" class="form-control" id="member_pw2" maxlength = "15"
										name="member_pw2" placeholder="">
								</div>
							</div>
		
							<div class="form-group">
								<label for="member_name" class="col-sm-3 control-label">�̸�</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="member_name"
										name="member_name" placeholder="�̸�">
								</div>
							</div>
		
							<div class="form-group">
								<label for="input_jumin1" class="col-sm-3 control-label">�ֹι�ȣ</label>
								<div class = "form-inline">
									<div class="col-sm-8">
										<input type="text" class="form-control" id="member_jumin1" maxlength="6" onkeypress = "gNumCheck()"
											name="member_jumin1" placeholder="">-
										<input type="password" class="form-control" id="member_jumin2" maxlength="7" onkeypress = "gNumCheck()"
											name="member_jumin2" placeholder="">
									</div>
								</div>
								<!-- <div class="col-lg-1">-</div>
								<div class="col-sm-4">
									<input type="password" class="form-control" id="member_jumin2" maxlength="7" onkeypress = "gNumCheck()"
										name="member_jumin2" placeholder="">
								</div> -->
							</div>
			
		
							<div class="form-group">
								<label for="member_phone" class="col-sm-3 control-label">�޴�����ȣ</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="member_phone" maxlength = "11" 
										maxlength="13" name="member_phone" onkeypress = "gNumCheck()"
										placeholder="�޴��� ��ȣ�� ����� �Է��ϼ���.('-' ���� 11�ڸ�)">
								</div>
							</div>
		
							<div class="form-group">
								<label for="member_email" class="col-sm-3 control-label">�̸���</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="member_email"
										name="member_email"
										placeholder="@���� �ּҸ� ��� �Է����ּ���.(��) abc@naver.com)">
								</div>
							</div>
		
							<div class="form-group">
								<label for="input_addr1" class="col-sm-3 control-label">�ּ�</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="member_zipcode"
										name="member_zipcode" placeholder="">
								</div>
								<div class="col-sm-4"> 
									<input type="button" class="btn btn-primary btn-sm" value="�����ȣ �˻�"
										onclick="sample6_execDaumPostcode()">
								</div>
							</div>
							
							<div class = "form-group">
								<label for = "member_addr1" class = "col-sm-3 control-label">�⺻�ּ�</label>
								<div class = "col-sm-6">
									<input type="text" class="form-control" id="member_addr1"
										name="member_addr1" placeholder="">
								</div>
							</div>
		
							<div class="form-group">
								<label for="input_addr2" class="col-sm-3 control-label">���ּ�</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="member_addr2"
										name="member_addr2" placeholder="">
								</div>
							</div>
		
							<div class="form-group">
								<label class="col-sm-3 control-label">���� ��� ����</label>
								<div class="col-sm-5">
									<button type="button" class="btn btn-default" id="myBtn1">�ڼ��� ����</button>  
									<div class="radio">
										<label> <input type="radio" name="member_agreement"
											id="optionsRadios1" value="1" checked> �����մϴ�.
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="member_agreement"
											id="optionsRadios2" value="0"> �������� �ʽ��ϴ�.
										</label>
									</div>
								</div>
							</div>				
						
						
							<div class="form-group">
								<div class="text-center">
									<button type="reset" class="btn btn-default">���</button>
									<button type="submit" class="btn btn-primary">����</button>
								</div>
							</div>
						</fieldset>
					</form>
			</div>
		</div>
	</div>
	</div>
	
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">�������� ���� ����</h4>
					<p>�ͻ�� ���� ������ (����)�ŷ��� �����Ͽ� �ͻ簡 ������ ���������� ��3�ڿ��� �����ϰ��� �ϴ� ���, �ͻ�� ������Ÿ� �̿����� �� ������ȣ � ���� ���� �� �������� ��ȣ�� � ���� ������ ���Ǹ� ���� �մϴ�. �̿� ������ �ͻ簡 �Ʒ��� ����� ���� ������ ���������� ��3�ڿ��� �����ϴµ� �����մϴ�.</p>
				</div>
				<div class="modal-body">
					<h4>[���������� ��3�� ������ ���� ����]</h4>
					<hr/>
					<ol>
						<li>
							<p>���������� �����޴� ��</p>
							<p>��ġ���</p>
						</li>
						<li>
							<p>�������� �̿� ����</p>
							<p>��ġ���(�̶� ��ȸ��"�� ��)�� �Ʒ��� ���� ��Ź�ڿ��� ��Ź�� ������ �����ϱ� ���� �̿����� ���������� (��)�������� �����մϴ�.</p>
						</li>
						<li>
							<p>�����ϴ� �������� �׸�</p>
							<p>����, �������, ����ڹ�ȣ, �޴���ȭ ��ȣ, �����, ���¹�ȣ, �����ָ� ��</p>
						</li>
						<li>
							<p>���������� �������� ���� �������� ���� �� �̿� �Ⱓ</p>
							<p>�����ž�ü���� �̿��ڰ� ���� ��û�� �� ������ ��� ���ڰ� ����Ǵ� �������� �Ⱓ ���� �̿����� ���������� ��ȸ��"�� �����մϴ�.</p>
						</li>
					</ol>
				</div>
				<div class="modal-footer">
					<hr/>
					<ul class = "text-left" style = "list-style-type : square">
						<li>
							<p>��� ������ �����Ǵ� ��� ��� Ȩ������(www.muchmore.com) �Խ� ���� ���� �� ������ �ȳ� �帮�ڽ��ϴ�.</p>
						</li>
						<li>
							<p>���ϴ� ���Ǹ� �ź��� �Ǹ��� ������, �� ���׿� ���� ���ǰ� ���� ��� ����ä�ǿ� ���� ���ڰ� �Ұ����� �� �ֽ��ϴ�.</p>
						</li>
					</ul>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	 <!-- �ڼ������� ��ư-->
    <script>
	$(document).ready(function(){
	    $("#myBtn1").click(function(){
	        $("#myModal").modal({backdrop: true});
	    });
	});
	</script>
		
</section>

