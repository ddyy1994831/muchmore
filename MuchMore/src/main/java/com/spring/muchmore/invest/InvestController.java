package com.spring.muchmore.invest;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.muchmore.borrower.BorrowerDAOService;
import com.spring.muchmore.borrower.BorrowerVO;
import com.spring.muchmore.member.MemberDAOService;
import com.spring.muchmore.member.MemberVO;
import com.spring.muchmore.invest.InvestVO;

@Controller
public class InvestController {
	
	@Autowired
	private InvestDAOService investDAOService;
	@Autowired
	private BorrowerDAOService borrowerDAOService;
	@Autowired
	private MemberDAOService memberDAOService;
	
	// 2017-07-29 성현 : 투자하기 페이지 이동
	@RequestMapping("invest.do")
	public ModelAndView invest(HttpSession session, MemberVO member){
		ModelAndView result = new ModelAndView();
		
		String id = (String)session.getAttribute("id");
		
		if (session.getAttribute("id") != null) {// 로그인 한 상태라면 한 상품에 중복 투자 불가 처리
			//현재 로그인한 회원이 투자한 상품 리스트 가져오기
			List<InvestVO> id_invest_list = investDAOService.getInvestById(id);
			result.addObject("id_invest_list", id_invest_list);
		}
		
		BorrowerVO borrower = new BorrowerVO();
		borrower.setBorrower_id(id);
		// 상품 리스트 불러오기
		List<BorrowerVO> invest_list = borrowerDAOService.getBorrowerList(borrower);
		result.addObject("invest_list", invest_list);
		result.setViewName("invest");
		return result;
	}
	
	//2017-07-31 성현 : 투자하기-상품상세보기 이동
	@RequestMapping("invest_detail.do")
	public ModelAndView invest_detail(BorrowerVO borrower, HttpServletResponse response, HttpSession session)
			throws IOException {

		ModelAndView result = new ModelAndView();
		String id = (String) session.getAttribute("id");			

		// 대출자와 상품 정보 가져오기 : 파라미터 대출자 아이디
		BorrowerVO get_borrowerVO = borrowerDAOService.getBorrower(borrower);
		// 모집률 계산을 위해 총 투자금액 가져오기 : 파라미터 대출 상품 아이디
		int total_invest = investDAOService.getTotalInvestSum(get_borrowerVO.getGoodsVO().getGoods_num());
		// 대출자에 대한 정보 : 파라미터 대출자 아이디
		MemberVO vo = new MemberVO();
		vo.setMember_id(borrower.getBorrower_id());
		MemberVO member = memberDAOService.getMember(vo);
		// 20170710 성현 - 대출횟수 가져오기
		int borrowerCount = borrowerDAOService.getBorrowerCountById(get_borrowerVO.getBorrower_id());
		// 20170710 성현 - 투자횟수 가져오기
		int investCount = investDAOService.getInvestCountById(get_borrowerVO.getBorrower_id());

		if (session.getAttribute("id") != null) {
			//한 상품에 중복 투자 불가 처리
			//현재 로그인한 회원이 투자한 상품 리스트 가져오기
			List<InvestVO> id_invest_list = investDAOService.getInvestById(id);
			result.addObject("id_invest_list", id_invest_list);
			//본인 상품에 투자 불가하도록 설정
			if (id.equals(borrower.getBorrower_id())) {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('본인의 대출상품에는 투자가 불가합니다.');");
				out.println("location.href='invest.do'");
				out.println("</script>");
				out.close();
			}
		}	
		
		// 대출 횟수
		result.addObject("borrowerCount", borrowerCount);
		// 투자횟수
		result.addObject("investCount", investCount);
		// 대출자 정보
		result.addObject("borrower_info", member);
		// 한 상품에 대한 총 투자금액
		result.addObject("total_invest", total_invest);
		// 상품 정보와 대출자 정보
		result.addObject("borrowergoods", get_borrowerVO);

		result.setViewName("invest_detail");
		return result;
	}
	
	//2017-07-31 성현 : 투자하기 금액 결제 폼으로 이동
	@RequestMapping("invest_investform.do")
	public ModelAndView invest_investform(BorrowerVO borrower, HttpServletResponse response, HttpSession session)
			throws IOException {
		System.out.println("investcontroller_investform");
		ModelAndView result = new ModelAndView();
		String id = (String) session.getAttribute("id");
		BorrowerVO getborrower = borrowerDAOService.getBorrower(borrower);

		if (id.equals(borrower.getBorrower_id())) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('본인의 대출상품에는 투자가 불가합니다.');");
			out.println("location.href='invest.do'");
			out.println("</script>");
			out.close();
		}

		//로그인 사용자의 계좌 잔액 가져오기
		int balance = memberDAOService.getMemberAccountById(id).getAccount().getAccount_balance();		
		result.addObject("borrower", getborrower);
		result.addObject("balance", balance);
		result.setViewName("invest_investform");

		return result;
	}
	
	//2017-07-31 성현 : 투자하기 버튼 클릭
	@RequestMapping("invest_investResult.do")
	public String invest_investAction(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			InvestVO invest, BorrowerVO borrower) throws IOException {
		/* ModelAndView result = new ModelAndView(); */

		//잔액
		int balance = Integer.parseInt(request.getParameter("balance"));
		//대출금액
		int goods_sum = Integer.parseInt(request.getParameter("goodsVO.goods_sum"));
		//총 투자금액
		int goods_invest = Integer.parseInt(request.getParameter("goodsVO.goods_invest"));

		PrintWriter out = response.getWriter();
		if ((invest.getInvest_sum() > balance) || (balance == 0)) {
			out.println("<script>");
			out.println("alert('잔액이 부족합니다. 잔액 충전이 필요합니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			if((invest.getInvest_sum()) > (goods_sum - goods_invest)) {
				out.println("<script>");
				out.println("alert('투자 가능금액보다 많은 금액을 투자할 수 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			}
		}		
		else {
			BorrowerVO getborrower = borrowerDAOService.getBorrower(borrower);

			int period = getborrower.getBorrower_loanperiod();
			// 총 투자 수익금 계산
			// 월 상환액 계산
			// goodsVO.goods_sum(원금), borrower_rate(이자율,float)
			// borrower_loanperiod(상환 개월수)
			int A = invest.getInvest_sum(); // 총 빌린 금액
			double B = (Math.round((getborrower.getGoodsVO().getGoods_rate() / period) * 10000)) * 0.000001;	// 이자율
			double denominator; // 분자
			double numerator; // 분모

			denominator = A * B * Math.pow((1 + B), period);
			numerator = Math.pow((1 + B), period) - 1;
			invest.setInvest_return((int) (Math.floor(denominator / numerator)) * period);

			investDAOService.insertInvest(invest);
		}
		return "invest_investResult";
	}

}
