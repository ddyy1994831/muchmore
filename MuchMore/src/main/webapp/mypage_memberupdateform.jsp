<%@ page import="com.spring.muchmore.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	} else {
		out.println("<script>");
		out.println("alert('�α����ϼ���');");
		out.println("history.back(-1);");
		out.println("</script>");
		out.close();
	}

	MemberVO member = (MemberVO) request.getAttribute("member");
	System.out.println("ȸ����������_�α����� id : " + member.getMember_id());
%>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
    function update_check() {
    	
    	var password = updateform.member_pw_origin.value;    
    	var password1 = updateform.member_pw1.value;    	
    	var password2 = updateform.member_pw2.value;
    	var email = updateform.member_email.value;    	
		var exptext =  /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var memberPw = '<%=member.getMember_pw1()%>';
		
		//���� ��й�ȣ üũ
		if(password != memberPw) {
			alert("���� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			updateform.member_pw_origin.focus();
			return false;
		}
	
    	//�� ��й�ȣ ���� üũ
    	if(password1.length < 6 || password1.length > 10 || password1 == "")
    	{
			alert("��й�ȣ�� ����� �Է��ϼ���. (����, ���� ���� 6~10�ڸ�)");
			updateform.member_pw1.focus();
			return false;
		}
    	//�� ��й�ȣ�� ���� ��й�ȣ �ٸ� ���� üũ
    	if(password == password1){
    		alert("���� ��й�ȣ�� �ٸ� ��ȣ�� �������ּ���.");
    		updateform.member_pw1.focus();
    		return false;
    	}
		//�� ��й�ȣ�� ��й�ȣ Ȯ�� ��ġ üũ
		if(password1 != password2) {
			alert("�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			updateform.member_pw2.focus();
			return false;
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
		//�̸��� üũ
    	if(exptext.test(email) == false){
    		//�̸��� ������ ���ĺ�+����@���ĺ�+����.���ĺ�+���� ������ �ƴҰ��
    		alert("�̸����� ����� �Է��ϼ���.('@' ���� �ּҸ� ��� �Է����ּ���)");
    		updateform.member_email.focus();
    		return false;
   	 	}
	return true;
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
    </script>

<!-- page ���� -->
<section class="container">
	<div class="row" style="height:100%">
		<div class="col-sm-3" id="menu">
			<ul class="nav nav-pills nav-stacked">
				<li class=""><a href="mypageMyaccount.do" id="MyAccount">MyAccount</a></li>
				<li class=""><a href="mypage_myinvest.do" id="MyInvest">���ڳ���</a></li>
				<li class=""><a href="mypage_myloan.do" id="MyLoan">���⳻��</a></li>
				<li class=""><a href="mypage_memberupdate.do" id="MyUpdate">ȸ����������</a></li>
			</ul>
		</div>
		<!-- ./col-sm-3 -->
		<%-- <center> --%>
		<div class="col-md-9">
			<div class="col-md-9 col-md-offset-1">
				<form id="updateform" name="updateform" class="form-horizontal"
					action="mypage_memberupdatesuccess.do" method="post"
					onsubmit="return update_check();">
					<fieldset>
						<legend>ȸ������ ����</legend>
						<div class="form-group">
							<label for="member_id" class="col-lg-3 control-label">���̵�</label>
							<div class="col-lg-6">
								<input id="member_id" type="text"
									placeholder="����, ���� ���� 8~12�ڸ� �Է�" name="member_id"
									class="form-control" value="<%=member.getMember_id()%>"
									readOnly>
							</div>
						</div>

						<div class="form-group">
							<label for="member_pw_origin" class="col-lg-3 control-label">���� ��й�ȣ</label>
							<div class="col-lg-6">
								<input type="password" class="form-control"
									id="member_pw_origin" name="member_pw_origin" placeholder="">
							</div>
						</div>

						<div class="form-group">
							<label for="member_pw1" class="col-lg-3 control-label">�� ��й�ȣ</label>
							<div class="col-lg-6">
								<input type="password" class="form-control" id="member_pw1"
									name="member_pw1" placeholder="����, ���� ���� 6~10�ڸ� �Է�">
							</div>
						</div>

						<div class="form-group">
							<label for="member_pw2" class="col-lg-3 control-label">��й�ȣ Ȯ��</label>
							<div class="col-lg-6">
								<input type="password" class="form-control" id="member_pw2"
									name="member_pw2" placeholder="">
							</div>
						</div>

						<div class="form-group">
							<label for="member_name" class="col-lg-3 control-label">�̸�</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="member_name"
									name="member_name" placeholder="�̸�"
									value="<%=member.getMember_name()%>" readOnly>
							</div>
						</div>
						
						<div class="form-group">
							<label for="member_phone" class="col-lg-3 control-label">�޴�����ȣ</label>
							<div class="col-lg-6">
								<input type="tel" class="form-control" id="member_phone"
									maxlength="13" name="member_phone" placeholder=""
									value="<%=member.getMember_phone()%>" readOnly>
							</div>
						</div>
						
						<div class="form-group">
							<label for="input_addr1" class="col-lg-3 control-label">�ּ�</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="member_zipcode"	name="member_zipcode" value="<%=member.getMember_zipcode()%>"> 
								<input type="button" class="btn btn-primary btn-sm" value="�����ȣ �˻�" onclick="sample6_execDaumPostcode()"><br /><br /> 
								<input type="text" class="form-control" id="member_addr1" name="member_addr1" placeholder="" value="<%=member.getMember_addr1()%>">
							</div>
						</div>

						<div class="form-group">
							<label for="input_addr2" class="col-lg-3 control-label">���ּ�</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="member_addr2" name="member_addr2" placeholder="" value="<%=member.getMember_addr2()%>">
							</div>
						</div>						

						<div class="form-group">
							<label for="member_email" class="col-lg-3 control-label">�̸���</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="member_email" name="member_email"
									placeholder="@���� �ּҸ� ��� �Է����ּ���.(��) abc@naver.com)"
									value="<%=member.getMember_email()%>">
							</div>
						</div>


						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="reset" class="btn btn-default">���</button>
								<button type="submit" class="btn btn-primary">ȸ������ ����</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<%-- </center> --%>
		<!-- ./col-sm-9 -->
	</div>
</section>
<!-- ./page ���� -->

