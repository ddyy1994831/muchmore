<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	request.setCharacterEncoding("EUC-KR");

	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
%>

<script type="text/javascript">
function ajaxTest(url){
    $.ajax({
      type : "GET",
      url : url,
      dataType : "text",
      error : function() {
        alert('��Ž���!!');
      },
      success : function(data) {
        $('#Context').html(data);
      }
    });
}
</script>

<section class="container">
<div class="row" style="height: 100%;" id="FAQ">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#loan" data-toggle="tab">����</a></li>
		<li><a href="#invest" data-toggle="tab">����</a></li>
		<li><a href="#frequency" data-toggle="tab">�����ϴ�����</a></li>
	</ul>
	<br/>
		<div id="Context" class="tab-content">
			<div class="tab-pane fade active in" id="loan">
				<div class="panel-group">
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#loan1">MuchMore�� �Ϲ� ������� ��� �ٸ�����?</a>
        					</h6>
      					</div>
     					<div id="loan1" class="panel-collapse collapse">
        					<div class="panel-body">
        						<b>MuchMore�� P2P(Peer to peer, ���� �� �ŷ�)������� ����� ���ڸ� ����</b>���ִ� ȸ���Դϴ�.<br/>
        						������ �¶������� ������ �ְ� �޴� ��ó�� MuchMore�� ���� �ٸ� ������� �ڱ��� ������, ������ �� �ֽ��ϴ�.
        					</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#loan2">MuchMore�� �� �������� ��������?</a>
        					</h6> 
      					</div>
     					<div id="loan2" class="panel-collapse collapse">
        					<div class="panel-body">
        						<b>MuchMore�� ��� ���񽺸� �¶������� ����</b>�Ͽ�, �������� ������ �ִ� ���� ������麸�� ȿ�������� ��մϴ�.<br/>
        						�׸��� <b>�׿� ���� ��� ������ ���� ���� ���Ե鲲 �ո����� �ݸ��� ����</b>�ϰ� �ֽ��ϴ�.
        					</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#loan3">������ ���� ���� �� �ֳ���?</a>
        					</h6> 
      					</div>
     					<div id="loan3" class="panel-collapse collapse">
        					<div class="panel-body">
        						MuchMore ��ü �ſ��򰡽ý��ۿ� ���� <b>���� ���� �̻��� �ſ��ް� ��ȯ�ɷ��� ������ �и�</b> ������ ���� �� �ֽ��ϴ�.<br/>
        					</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#loan4">���� ���� ������ ��� �ǳ���?</a>
        					</h6> 
      					</div>
     					<div id="loan4" class="panel-collapse collapse">
        					<div class="panel-body">
        						MuchMore�� ���ݸ�/�ѵ� ��ȸ �� ���� ��û �� ���� ���� �� ����� ���ޡ��� ������ ����˴ϴ�.<br>
        					</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#loan5">�ſ����� ��ȸ �� �ſ����� ����������?</a>
        					</h6> 
      					</div>
     					<div id="loan5" class="panel-collapse collapse">
        					<div class="panel-body">
        						MuchMore�� �ſ�������ȸ�� <b>�ſ��޿� �ƹ��� ������ ��ġ�� ������</b> �Ƚ��ϼŵ� �˴ϴ�.
        					</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#loan6">���� �� �ſ����� ����������?</a>
        					</h6> 
      					</div>
     					<div id="loan6" class="panel-collapse collapse">
        					<div class="panel-body">
        						MuchMore ������ <b>�ſ��޿� ������ ��ġ�� �ʽ��ϴ�.</b><br><br>
        						�̱�/�������� �̹� Ȱ��ȭ�� P2P������ �������� ���� ����ȭ ���� �ʾ� ��ξ����� ����ϰ� �����ϵ��� �Ǿ� �ֽ��ϴ�. ������  MuchMore�� ���� ������ ������ ��ξ� ����� ���� �򰡸� �ް� ������ �ʽ��ϴ�.<br/><br/>
        						ù°, MuchMore���� ������ ������ P2P�����ü�� ������ Ÿ ��������� �������� �ʽ��ϴ�.<br>
								��°, MuchMore���� ������ �����ŵ� �ſ���/�ſ������� ������� �ʽ��ϴ�.<br>
								�̴� �ſ��򰡱��(NICE, KCB)���� ���� P2P���⿡ ���� �򰡵����͸� �״� ���̱� �����Դϴ�. �̷� ���� ���ݱ��� �������� �ٸ� ������ ��ȯ�� �� �� 60%�� �ſ����� ��� �Ǿ����ϴ�. ���� ���� �ſ����� ���� 1������ ����� �ٽ� ���ư��� �ΰ����� ���õ� ������ �ֽ��ϴ�.<br>
								 �ٸ�, ��ü �ÿ��� ��ξ� ��ü �̷����� ��ϵǾ� �ſ����� �϶��� �� ������ �����ϼž� �մϴ�.<br><br>
								 <a href="loan.do">�����ϱ�</a>
        					</div>
      					</div>
    				</div>
 				 </div>
			</div>
			
			<div class="tab-pane fade" id="invest">
				<div class="panel-group">
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#invest1">MuchMore ���ڴ� ��� �ٸ�����?</a>
        					</h6>
      					</div>
     					<div id="invest1" class="panel-collapse collapse">
        					<div class="panel-body">
								MuchMore ��Ʈ������ ���ڴ� 10% ������ ����� ���ͷ��� �����ϰ� ������, �ټ��� ä�ǿ� ���ڱ��� �л���� �ս� ������ ���߰� �ֽ��ϴ�.<br>
								���Ҿ� ������ ���⿡ �°� ���ͷ��� ���̰ų� �������� ��ȭ�� �� �ִ� �ɼ��� �����մϴ�.
							</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#invest2">�� ��Ʈ������ ������� ���ڸ� �����ϳ���?</a>
        					</h6>
      					</div>
     					<div id="invest2" class="panel-collapse collapse">
        					<div class="panel-body">
								��Ʈ������ ������� �����ϴ� ��� �ٰ��� ���� ä�ǿ� �л� �����ϰ� �˴ϴ�.<br>
								1���� ����ä�ǿ��� ������ ���, �ν� ä�� �߻� �� ���ڱ��� ���� �սǵǹǷ� �л����ڸ� ���� ���ڱ� �ս��� �ּ�ȭ�մϴ�.
							</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#invest3">������ ����ǳ���?���� ������ �󸶳� �ǳ���?</a>
        					</h6>
      					</div>
     					<div id="invest3" class="panel-collapse collapse">
        					<div class="panel-body">
								�����Ͻ� ä�� �� �ټ��� ä�ǿ��� �ν��� �߻��� ��� ���� �ս��� �߻��� �� �� �ֽ��ϴ�.<br>
								MuchMore������ ���� ������ ���߱� ���� �ִ��� �л� ���ڸ� �� �� �ִ� ��Ʈ������ ����� ��õ�ص帳�ϴ�.<br>
								MuchMore ��Ʈ��������  NICE�ſ��򰡸� ����� �ſ�����ȸ�簡 �����ϴ� ��޺� �ҷ���� ����� �ſ��޸��� ���� �ҷ����� 1%�̸��� ������ �� �ֵ��� �����ϰ� ������,<br>
								�̴� ���� ����ݸ� ������ ���� ���� ����ص� �ִ� 5%�̸��� ������ �����ϰ� �ֽ��ϴ�.
							</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#invest4">MuchMore�� �Ļ��ϸ� ��� �ǳ���?</a>
        					</h6>
      					</div>
     					<div id="invest4" class="panel-collapse collapse">
        					<div class="panel-body">
								MuchMore�� ������ ����Ǵ��� ���� ä�� ����� �Ҹ���� �ʽ��ϴ�.<br>
								���� ȸ���� �ε��� �߻��ϴ��� ���������� ��Ź ������ �޾� ������ �ڻ��� �����ϰ� ��ȣ�˴ϴ�.
							</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#invest5">�ּ� ���ڱݾ��� ��� �ǳ���?</a>
        					</h6>
      					</div>
     					<div id="invest5" class="panel-collapse collapse">
        					<div class="panel-body">
								���� ä�ǿ� ���� ���ڱݾ��� �ּ� 0.5�������� �����մϴ�. �׷��Ƿ� 100���� ä�ǿ� �л��Ͽ� ��Ʈ�������� �����ϴ� ��쿡�� �ּ� 50���� �̻��� ���ڱ��� �ʿ��մϴ�.<br>
								 �� ä�Ǵ� �ִ� ���ڱݾ��� ����ݾ��� 10%�� �����մϴ�.
							</div>
      					</div>
    				</div>
 				 </div>
			</div>
			<div class="tab-pane fade" id="frequency">
				<div class="panel-group">
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#frequency1">ȸ�������� ��� ����ǳ���?</a>
        					</h6>
      					</div>
     					<div id="frequency1" class="panel-collapse collapse">
        					<div class="panel-body">
        						Ȩ������ ��� 'ȸ������'��ư�� ���� ȸ������ ���������� �����Ͻ� �� �ֽ��ϴ�.
        					</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#frequency2">���������� ��� ������ �� �ֳ���?</a>
        					</h6>
      					</div>
     					<div id="frequency2" class="panel-collapse collapse">
        					<div class="panel-body">
        						�α����Ͻ� �� ��� ���������� > ȸ���������� �޴��� ���ø� ���Ͻô� ������ �����Ͻ� �� �ֽ��ϴ�.
        					</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#frequency3">��й�ȣ�� �н��Ͽ��� ��� ��� �ϳ���?</a>
        					</h6>
      					</div>
     					<div id="frequency3" class="panel-collapse collapse">
        					<div class="panel-body">
        						�α��� ȭ�� �ϴ��� ��й�ȣ ã�⸦ ������ �� ����Ͻ� ���̵�, �̸���, �̸��� �Է��Ͻð� '��й�ȣ ã��'��ư�� ��������.
        					</div>
      					</div>
    				</div>
 				 </div>
			</div>
		</div>
	</div>
</section>