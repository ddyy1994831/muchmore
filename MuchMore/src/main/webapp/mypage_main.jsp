<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	System.out.println("mypage_main.jsp");

	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}	
	else {
		out.println("<script>");
		out.println("alet('�α����ϼ���')");
		out.println("</script>");
	}
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
    		
    		<div class = "col-sm-9" id="Context">
				���������� �Դϴ�.
			</div>
			<!-- ./col-sm-9 -->
    	</div>
    </section>
<!-- ./page ���� -->