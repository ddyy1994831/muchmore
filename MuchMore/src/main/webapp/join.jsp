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
<script type="text/javascript">
    
    	function check(){
    		var id = joinform.member_id.value;
    		var password1 = joinform.member_pw1.value;
    		var password2 = joinform.member_pw2.value;
    		var email = joinform.member_email.value;
    		var exptext =  /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    		var phone = joinform.member_phone.value;
    		var	name = joinform.member_name.value;
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
    		var url = "join_chkId.do?member_id=" + id;
    	
    		if(id.length == 0){
    			alert("���̵� �Է��ϼ���.");
    			joinform.member_id.focus();
    			return false;
    		}
    		open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no," + 
    			"scrollbars=no, resizable=no, width=400, height=200");
    	}
    
    //���̵� �Է�â�� �� �Է½� hidden�� idUncheck�� �����Ѵ�. �̷��� �ϴ� ������ �ߺ�üũ �� �ٽ� ���̵� â�� ���ο� ���̵� �Է����� �� �ٽ� �ߺ�üũ�� �ϵ��� �Ѵ�.
    function inputIdChk(){
    	document.joinform.idDuplication.value="idUncheck";
    }
    </script>

<section class="container">
	<div class="row">
		<form id="joinform" name="joinform" class="form-horizontal"
			action="joinform2.do" method="post" onsubmit="return check()">
			<fieldset>
				<legend>ȸ������</legend>
				<div class="form-group">
					<label for="member_id" class="col-lg-2 control-label">���̵�</label>
					<div class="col-lg-9">
						<input id="member_id" type="text"
							placeholder="����, ���� ���� 8~12�ڸ� �Է�" name="member_id"
							class="form-control" onkeydown="inputIdChk()">
					</div>
					<div class="col-lg-1">
						<input type="button" id="checkId" name="checkId"
							class="btn btn-primary" value="���̵� �ߺ�üũ" onclick="check_Id();" />
						<input type="hidden" name="idDuplication" value="idUncheck" />
					</div>
				</div>

				<div class="form-group">
					<label for="member_pw1" class="col-lg-2 control-label">��й�ȣ</label>
					<div class="col-lg-10">
						<input type="password" class="form-control" id="member_pw1"
							name="member_pw1" placeholder="����, ���� ���� 6~10�ڸ� �Է�">
					</div>
				</div>

				<div class="form-group">
					<label for="member_pw2" class="col-lg-2 control-label">��й�ȣ
						Ȯ��</label>
					<div class="col-lg-10">
						<input type="password" class="form-control" id="member_pw2"
							name="member_pw2" placeholder="">
					</div>
				</div>

				<div class="form-group">
					<label for="member_name" class="col-lg-2 control-label">�̸�</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="member_name"
							name="member_name" placeholder="�̸�">
					</div>
				</div>
				<div class="form-group">
					<label for="member_phone" class="col-lg-2 control-label">�޴�����ȣ</label>
					<div class="col-lg-10">
						<input type="phone" class="form-control" id="member_phone"
							maxlength="13" name="member_phone"
							placeholder="�޴��� ��ȣ�� ����� �Է��ϼ���.('-' ���� 13�ڸ�)">
					</div>
				</div>

				<div class="form-group">
					<label for="member_email" class="col-lg-2 control-label">�̸���</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="member_email"
							name="member_email"
							placeholder="@���� �ּҸ� ��� �Է����ּ���.(��) abc@naver.com)">
					</div>
				</div>

				<div class="form-group">
					<label class="col-lg-2 control-label">�������� ��� ����</label>
					<div class="col-lg-10">
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
					<div class="col-lg-10 col-lg-offset-2">
						<button type="reset" class="btn btn-default">���</button>
						<button type="submit" class="btn btn-primary">����</button>
					</div>
				</div>
			</fieldset>
		</form>

	</div>
</section>

