<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	System.out.println("mypage_main.jsp");

	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}	
	
	BorrowerVO borrower = (BorrowerVO)request.getAttribute("borrower");
	System.out.println("borrower.getGoodsVO().getGoods_num() : " + borrower.getGoodsVO().getGoods_num() );
	System.out.println("borrower.getGoodsVO().getGoods_num() : " + borrower.getBorrower_registerdate() );
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
				<li class=""><a href="mypage_myaccount.do" id="MyAccount" >My Account</a></li>
				<li class=""><a href="mypage_myinvest.do" id="MyInvest">���ڳ���</a></li>
				<li class=""><a href="mypage_myloan.do" id="MyLoan">���⳻��</a></li>
				<li class=""><a href="mypage_memberupdate.do" id="MyUpdate" >ȸ����������</a></li>
			</ul>
		</div>
		<!-- ./col-sm-3 -->
    		
   		<div class = "col-sm-9" id="Context">
			<form name = "fileupload" id = "fileupload" method = "post" 
				enctype = "multipart/form-data" action = "mypage_myloan_fileUploadAction.do">
				<input type = "hidden" id = "borrower_id" name = "borrower_id" value = "<%=id %>">
				<input type = "hidden" id = "goods_num" name = "goods_num" 
						value = "<%=borrower.getGoodsVO().getGoods_num() %>">
				<input type = "hidden" id = "borrower_registerdate" name = "borrower_registerdate" 
						value = "<%=borrower.getBorrower_registerdate() %>">
				<table class="table table-striped text-center">
				    <tr>
   						<td><b>��������</b></td>
   						<td><%=borrower.getBorrower_jobbiz() %></td>
  					</tr>
				    <tr>
				    	<td>���� ���� </td>
				      	<td>
				      		<input type = "file" id = "borrower_file" name = "borrower_file" required>
				      	</td>
				    </tr>
				    <tr>
				    	<td colspan = "2">
				    		<input type = "submit" class = "btn btn-default btn-md" value = "���������ϱ�">
				    		<a href = "mypage_myloan.do" class = "btn btn-default btn-md">�ڷ�</a>
				    	</td>
				    </tr>
				</table>
			</form>
		</div>
		<!-- ./col-sm-9 -->
   	</div>
</section>
