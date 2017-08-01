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

<!-- jQuery 로드 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function ajaxTest(url){
    $.ajax({
      type : "GET",
      url : url,
      dataType : "text",
      error : function() {
        //alert('통신실패!!');
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
				<li class=""><a href="mypage_myinvest.do" id="MyInvest">투자내역</a></li>
				<li class=""><a href="mypage_myloan.do" id="MyLoan">대출내역</a></li>
				<li class=""><a href="mypage_memberupdate.do" id="MyUpdate" >회원정보수정</a></li>
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
   						<td><b>직업구분</b></td>
   						<td><%=borrower.getBorrower_jobbiz() %></td>
  					</tr>
				    <tr class = "text-center">
				   		<td colspan = "2"><b>제출 서류</b></td>
				    </tr>
				    
				    <tr>
				    	<td rowspan = "2"><b>공통서류</b></td>
				    	<td> 1. 신분증(주민등록증 또는 운전면허증) 앞, 뒷면</td>
				    </tr>
				    <tr>
				    	<td> 2. 대출금 지급 받을 통장 사본</td>
				    </tr>
				    <tr>
				    	<td rowspan = "2">근로소득자</td>
				    	<td> 1. 건강보험 자격득실 확인서</td>
				    </tr>
				    <tr>
				    	<td> 2. 건강보험려 납부확인서
				    </tr>
				    <tr>
				    	<td rowspan = "3">사업자(개인/법인)</td>
				    	<td> 1. 주민등록 초본</td>
				    </tr>
				    <tr>
				    	<td> 2. 사업자 등록증</td>
				    </tr>
				    <tr>
				    	<td> 3. 부가가치세 과세표준 증면원(직전 1년)
				    </tr>
				    <tr>
				    	<td rowspan = "3">기타 소득자</td>
				    	<td> 1.주민등록 초본</td>			    	
				    </tr>
				    <tr>
				    	<td> 2. 재직(위촉)증명서 또는 근로계약서</td>
				    </tr>
				    <tr>
				    	<td> 3. 급여내역 통장사본(한도 조회일 기준 최근 6개월분)</td>
				    </tr>
				    <tr>
				    	<td rowspan = "2">유의사항</td>
				    	<td>
				    		<font class = "text-danger"> 1. 직업구분에 따라 필요한 서류를 하나의 zip파일로 압축해서 제출해주세요.</font>
				    	</td>
				    </tr>
				    <tr>
				    	<td>
				    		<font class = "text-danger"> 2. 파일명은 이름_아이디.zip으로 제출해주세요</font> 
				    	</td>
				    </tr>
				     <tr>
				    	<td>파일 선택 </td>
				      	<td>
				      		<input type = "file" id = "borrower_file" name = "borrower_file" required>
				      	</td>
				    </tr>
				    <tr class = "text-center">
				    	<td colspan = "2">
				    		<input type = "submit" class = "btn btn-primary btn-md" value = "서류제출하기">
				    		<a href = "mypage_myloan.do" class = "btn btn-default btn-md">뒤로</a>
				    	</td>
				    </tr>
				</table>
			</form>
		</div>
		<!-- ./col-sm-9 -->
   	</div>
</section>
