<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//loginFindIdAction.to���� ã�ƿ� id
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
					<legend>���̵� ã��</legend>
					<div class = "form-group">
						<div class="col-lg-10">
							<%
							if(foundid == null) {
							%>
							<font size = "2"><b>�������� �ʴ� ȸ���Դϴ�.</b></font>
							<%
							}
									
							else {
							%>
								<font size = "2"><b>���̵�  : </b><%=foundid %></font>
							<%
							}
							%>
						</div>
					</div>
						
					<div class = "form-group">
						<hr/><br/>
						<input type = "button" value = "�ݱ�" class = "btn btn-primary" onclick = "windowclose()"/>
					</div>
				</fieldset>
			</form>    			
    	</div>
    </div>
</section>