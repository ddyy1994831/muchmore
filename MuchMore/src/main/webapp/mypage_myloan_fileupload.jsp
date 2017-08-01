<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	System.out.println("mypage_main.jsp");

	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}	
	
	BorrowerVO borrower = (BorrowerVO)request.getAttribute("borrower");
%>

<!-- jQuery �ε� 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function ajaxTest(url){
    $.ajax({
      type : "GET",
      url : url,
      dataType : "text",
      error : function() {
        //alert('��Ž���!!');
    	$('#Context').html(data);
      },
      success : function(data) {
        $('#Context').html(data);
      }
    });
}
</script>-->

<section class = "container">
   	<div class = "row" style="height:100%">
   		<div class = "col-sm-3" id="menu">
			<ul class="nav nav-pills nav-stacked">
				<li class=""><a href="mypageMyaccount.do" id="MyAccount" >My Account</a></li>
				<li class=""><a href="mypage_myinvest.do" id="MyInvest">���ڳ���</a></li>
				<li class=""><a href="mypage_myloan.do" id="MyLoan">���⳻��</a></li>
				<li class=""><a href="mypage_memberupdate.do" id="MyUpdate" >ȸ����������</a></li>
			</ul>
		</div>
		<!-- ./col-sm-3 -->
    		
   		<div class = "col-sm-9" id="Context" style = "padding-left:50px;padding-right:50px;padding-top:10px">
			<form name = "fileupload" id = "fileupload" method = "post" 
				enctype = "multipart/form-data" action = "mypage_myloan_fileUploadAction.do">
				<input type = "hidden" id = "borrower_id" name = "borrower_id" value = "<%=id %>">
				<input type = "hidden" id = "goods_num" name = "goods_num" 
						value = "<%=borrower.getGoodsVO().getGoods_num() %>">
				<input type = "hidden" id = "borrower_registerdate" name = "borrower_registerdate" 
						value = "<%=borrower.getBorrower_registerdate() %>">
				<table class="table table-striped table-condensed">
				    <tr>
   						<td><b>��������</b></td>
   						<td><%=borrower.getBorrower_jobbiz() %></td>
  					</tr>
				    <tr class = "text-center">
				   		<td colspan = "2"><b>���� ����</b></td>
				    </tr>
				    
				    <tr>
				    	<td rowspan = "2"><b>���뼭��</b></td>
				    	<td> 1. �ź���(�ֹε���� �Ǵ� ����������) ��, �޸�</td>
				    </tr>
				    <tr>
				    	<td> 2. ����� ���� ���� ���� �纻</td>
				    </tr>
				    <tr>
				    	<td rowspan = "2">�ٷμҵ���</td>
				    	<td> 1. �ǰ����� �ڰݵ�� Ȯ�μ�</td>
				    </tr>
				    <tr>
				    	<td> 2. �ǰ������ ����Ȯ�μ�
				    </tr>
				    <tr>
				    	<td rowspan = "3">�����(����/����)</td>
				    	<td> 1. �ֹε�� �ʺ�</td>
				    </tr>
				    <tr>
				    	<td> 2. ����� �����</td>
				    </tr>
				    <tr>
				    	<td> 3. �ΰ���ġ�� ����ǥ�� �����(���� 1��)
				    </tr>
				    <tr>
				    	<td rowspan = "3">��Ÿ �ҵ���</td>
				    	<td> 1.�ֹε�� �ʺ�</td>			    	
				    </tr>
				    <tr>
				    	<td> 2. ����(����)���� �Ǵ� �ٷΰ�༭</td>
				    </tr>
				    <tr>
				    	<td> 3. �޿����� ����纻(�ѵ� ��ȸ�� ���� �ֱ� 6������)</td>
				    </tr>
				    <tr>
				    	<td rowspan = "2">���ǻ���</td>
				    	<td>
				    		<font class = "text-danger"> 1. �������п� ���� �ʿ��� ������ �ϳ��� zip���Ϸ� �����ؼ� �������ּ���.</font>
				    	</td>
				    </tr>
				    <tr>
				    	<td>
				    		<font class = "text-danger"> 2. ���ϸ��� �̸�_���̵�.zip���� �������ּ���</font> 
				    	</td>
				    </tr>
				     <tr>
				    	<td>���� ���� </td>
				      	<td>
				      		<input type = "file" id = "borrower_file" name = "borrower_file" required>
				      	</td>
				    </tr>
				    <tr class = "text-center">
				    	<td colspan = "2">
				    		<input type = "submit" class = "btn btn-primary btn-md" value = "���������ϱ�">
				    		<a href = "mypage_myloan.do" class = "btn btn-default btn-md">�ڷ�</a>
				    	</td>
				    </tr>
				</table>
			</form>
		</div>
		<!-- ./col-sm-9 -->
   	</div>
</section>
