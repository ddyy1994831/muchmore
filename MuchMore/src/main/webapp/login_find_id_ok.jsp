<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//loginFindIdAction.to에서 찾아온 id
	String foundid = (String)request.getAttribute("foundid");
%>

<script>
	function windowclose() {
		self.close();
	}
</script>

<section class = "container">
   	<div class = "row">
   		<div class = "col-sm col-md-4">
			<form>
				<fieldset>
					<legend>아이디 찾기</legend>
					<div class = "form-group">
						<div class="col-lg-10">
							<%
							if(foundid == null) {
							%>
							<font size = "2"><b>존재하지 않는 회원입니다.</b></font>
							<%
							}
									
							else {
							%>
								<font size = "2"><b>아이디  : </b><%=foundid %></font>
							<%
							}
							%>
						</div>
					</div>
						
					<div class = "form-group">
						<hr/><br/>
						<input type = "button" value = "닫기" class = "btn btn-primary" onclick = "windowclose()"/>
					</div>
				</fieldset>
			</form>    			
    	</div>
    </div>
</section>