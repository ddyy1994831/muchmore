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
        alert('통신실패!!');
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
		<li class="active"><a href="#loan" data-toggle="tab">대출</a></li>
		<li><a href="#invest" data-toggle="tab">투자</a></li>
		<li><a href="#frequency" data-toggle="tab">자주하는질문</a></li>
	</ul>
	<br/>
		<div id="Context" class="tab-content">
			<div class="tab-pane fade active in" id="loan">
				<div class="panel-group">
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#loan1">MuchMore는 일반 금융사와 어떻게 다른가요?</a>
        					</h6>
      					</div>
     					<div id="loan1" class="panel-collapse collapse">
        					<div class="panel-body">
        						<b>MuchMore는 P2P(Peer to peer, 개인 간 거래)방식으로 대출과 투자를 연결</b>해주는 회사입니다.<br/>
        						개인이 온라인으로 파일을 주고 받는 것처럼 MuchMore를 통해 다른 사람에게 자금을 빌리고, 빌려줄 수 있습니다.
        					</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#loan2">MuchMore는 왜 이자율이 낮은가요?</a>
        					</h6> 
      					</div>
     					<div id="loan2" class="panel-collapse collapse">
        					<div class="panel-body">
        						<b>MuchMore는 모든 서비스를 온라인으로 제공</b>하여, 오프라인 지점이 있는 기존 금융사들보다 효율적으로 운영합니다.<br/>
        						그리고 <b>그에 따른 비용 절감을 통해 대출 고객님들께 합리적인 금리를 제공</b>하고 있습니다.
        					</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#loan3">누구나 대출 받을 수 있나요?</a>
        					</h6> 
      					</div>
     					<div id="loan3" class="panel-collapse collapse">
        					<div class="panel-body">
        						MuchMore 자체 신용평가시스템에 의해 <b>일정 수준 이상의 신용등급과 상환능력이 입증된 분만</b> 대출을 받을 수 있습니다.<br/>
        					</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#loan4">대출 진행 과정이 어떻게 되나요?</a>
        					</h6> 
      					</div>
     					<div id="loan4" class="panel-collapse collapse">
        					<div class="panel-body">
        						MuchMore는 ‘금리/한도 조회 → 대출 신청 → 서류 제출 → 대출금 지급’의 순서로 진행됩니다.<br>
        					</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#loan5">신용정보 조회 시 신용등급이 내려가나요?</a>
        					</h6> 
      					</div>
     					<div id="loan5" class="panel-collapse collapse">
        					<div class="panel-body">
        						MuchMore의 신용정보조회는 <b>신용등급에 아무런 영향을 미치지 않으니</b> 안심하셔도 됩니다.
        					</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#loan6">대출 시 신용등급이 내려가나요?</a>
        					</h6> 
      					</div>
     					<div id="loan6" class="panel-collapse collapse">
        					<div class="panel-body">
        						MuchMore 대출은 <b>신용등급에 영향을 미치지 않습니다.</b><br><br>
        						미국/영국에서 이미 활성화된 P2P대출은 국내에서 아직 법제화 되지 않아 대부업으로 등록하고 영업하도록 되어 있습니다. 하지만  MuchMore를 통한 대출은 기존의 대부업 대출과 같은 평가를 받고 있지는 않습니다.<br/><br/>
        						첫째, MuchMore에서 받으신 대출은 P2P대출업체를 제외한 타 금융기관에 공유되지 않습니다.<br>
								둘째, MuchMore에서 대출을 받으셔도 신용등급/신용점수가 변경되지 않습니다.<br>
								이는 신용평가기관(NICE, KCB)에서 현재 P2P대출에 대한 평가데이터를 쌓는 중이기 때문입니다. 이로 인해 지금까지 렌딧으로 다른 대출을 대환한 고객 중 60%는 신용등급이 향상 되었습니다. 또한 향상된 신용등급을 통해 1금융권 대출로 다시 돌아가는 부가적인 혜택도 누리고 있습니다.<br>
								 다만, 연체 시에는 대부업 연체 이력으로 기록되어 신용등급이 하락할 수 있으니 유의하셔야 합니다.<br><br>
								 <a href="loan.do">대출하기</a>
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
          						<a data-toggle="collapse" href="#invest1">MuchMore 투자는 어떻게 다른가요?</a>
        					</h6>
      					</div>
     					<div id="invest1" class="panel-collapse collapse">
        					<div class="panel-body">
								MuchMore 포트폴리오 투자는 10% 내외의 연평균 수익률을 제공하고 있으며, 다수의 채권에 투자금을 분산시켜 손실 위험을 낮추고 있습니다.<br>
								더불어 고객님의 성향에 맞게 수익률을 높이거나 안전성을 강화할 수 있는 옵션을 제공합니다.
							</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#invest2">왜 포트폴리오 방식으로 투자를 진행하나요?</a>
        					</h6>
      					</div>
     					<div id="invest2" class="panel-collapse collapse">
        					<div class="panel-body">
								포트폴리오 방식으로 투자하는 경우 다건의 대출 채권에 분산 투자하게 됩니다.<br>
								1건의 대출채권에만 투자할 경우, 부실 채권 발생 시 투자금은 전액 손실되므로 분산투자를 통해 투자금 손실을 최소화합니다.
							</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#invest3">원금이 보장되나요?투자 위험이 얼마나 되나요?</a>
        					</h6>
      					</div>
     					<div id="invest3" class="panel-collapse collapse">
        					<div class="panel-body">
								구매하신 채권 중 다수의 채권에서 부실이 발생한 경우 원금 손실이 발생할 수 도 있습니다.<br>
								MuchMore에서는 투자 위험을 낮추기 위해 최대한 분산 투자를 할 수 있는 포트폴리오 방식을 추천해드립니다.<br>
								MuchMore 포트폴리오는  NICE신용평가를 비롯한 신용정보회사가 제공하는 등급별 불량룰과 당사의 신용등급모델을 토대로 불량률이 1%미만을 유지할 수 있도록 구성하고 있으며,<br>
								이는 향후 시장금리 변동에 따른 점을 고려해도 최대 5%미만일 것으로 예상하고 있습니다.
							</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#invest4">MuchMore가 파산하면 어떻게 되나요?</a>
        					</h6>
      					</div>
     					<div id="invest4" class="panel-collapse collapse">
        					<div class="panel-body">
								MuchMore의 업무가 종료되더라도 대출 채권 계약은 소명되지 않습니다.<br>
								또한 회사의 부도가 발생하더라도 신한은행의 신탁 관리를 받아 고객님의 자산은 안전하게 보호됩니다.
							</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#invest5">최소 투자금액은 어떻게 되나요?</a>
        					</h6>
      					</div>
     					<div id="invest5" class="panel-collapse collapse">
        					<div class="panel-body">
								개별 채권에 대한 투자금액은 최소 0.5만원부터 가능합니다. 그러므로 100개의 채권에 분산하여 포트폴리오를 구성하는 경우에는 최소 50만원 이상의 투자금이 필요합니다.<br>
								 한 채권당 최대 투자금액은 대출금액의 10%로 제한합니다.
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
          						<a data-toggle="collapse" href="#frequency1">회원가입은 어떻게 진행되나요?</a>
        					</h6>
      					</div>
     					<div id="frequency1" class="panel-collapse collapse">
        					<div class="panel-body">
        						홈페이지 상단 '회원가입'버튼을 눌러 회원가입 페이지에서 가입하실 수 있습니다.
        					</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#frequency2">계정정보는 어떻게 변경할 수 있나요?</a>
        					</h6>
      					</div>
     					<div id="frequency2" class="panel-collapse collapse">
        					<div class="panel-body">
        						로그인하신 뒤 상단 마이페이지 > 회원정보수정 메뉴로 들어가시면 원하시는 정보를 변경하실 수 있습니다.
        					</div>
      					</div>
    				</div>
    				<div class="panel">
     					<div class="panel-heading">
        					<h6 class="panel-title">
          						<a data-toggle="collapse" href="#frequency3">비밀번호를 분실하였을 경우 어떻게 하나요?</a>
        					</h6>
      					</div>
     					<div id="frequency3" class="panel-collapse collapse">
        					<div class="panel-body">
        						로그인 화면 하단의 비밀번호 찾기를 누르신 뒤 등록하신 아이디, 이메일, 이름을 입력하시고 '비밀번호 찾기'버튼을 누르세요.
        					</div>
      					</div>
    				</div>
 				 </div>
			</div>
		</div>
	</div>
</section>