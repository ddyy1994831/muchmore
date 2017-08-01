<%@page import="com.spring.muchmore.member.MemberVO"%>
<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	MemberVO borrower = (MemberVO)request.getAttribute("borrower");
%>

<script>
function windowclose(send_form) {
	var borrower_id = send_form.borrower_id.value;
	var goods_num = send_form.goods_num.value;
	opener.location.href = "adminLoanSendAction.do?borrower_id="+borrower_id+"&goodsVO.goods_num="+goods_num;
	self.close();
}
</script>


<form method = "post" action = "admin_loan_sendAction.do" name = "send_form" id = "send_form" >
	<input type = "hidden" name = "borrower_id" value = <%=borrower.getMember_id() %>>
	<input type = "hidden" name = "goods_num" value = "<%=borrower.getBorrower().getGoodsVO().getGoods_num()%>">
	<fieldset>
		<legend>����� ����</legend>
		<table class = "table">
			<tr>
				<th colspan = "2">���¹�ȣ</th>
				<td colspan = "2"><%=borrower.getAccount().getAccount_virtual() %></td>
			</tr>
			<tr>
				<th>ȸ�� �̸�</th>
				<td><%=borrower.getMember_name() %></td>
				<th>���̵�</th>
				<td><%=borrower.getMember_id() %></td>
			</tr>
			<tr>
				<th colspan = "2">���� �ݾ�</th>
				<td colspan = "2">
					<fmt:formatNumber value="<%=borrower.getBorrower().getGoodsVO().getGoods_sum() %>" type="currency" currencySymbol="��" />��
				</td>
			</tr>
	
			<tr class = "text-center" style = "padding-top:10px">
				<td colspan = "4">
					<input type = "button" value = "�����ϱ�" class = "btn btn-primary" onclick = "windowclose(this.form)"/>
					<input type = "button" value = "�ݱ�" class = "btn btn-primary" onclick = "windowclose()"/>
				</td>
			</tr>
		</table>
	</fieldset>
</form>    			
