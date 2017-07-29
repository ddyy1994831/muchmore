package com.spring.muchmore.borrower;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.muchmore.goods.GoodsVO;

@Controller
public class BorrowerController {
	@Autowired
	private BorrowerDAOService borrowerDAOService;
	
	/*2017-07-29 혜림 : 대출하기 메인페이지 이동*/
	@RequestMapping("loan.do")
	public String loan() {
		return "loan_main";
	}
	
	/*2017-07-29 혜림 : 대출하기 신용 정보 페이이지로 이동*/
	@RequestMapping("loanCreditCheck.do")
	public String creditCheck() {
		return "loan_credit_check";
	}
	
	/*2017-07-29 혜림 : 대출하기 신용 정보 조회하고 결과 확인 & 정보 입력*/
	@RequestMapping("loanCreditCheckAction.do")
	public ModelAndView creditCheckAction(BorrowerVO borrower) {
		ModelAndView result = new ModelAndView();
		System.out.println("신용등급 조회 : 총소득 : " +borrower.getBorrower_totalincome());
		System.out.println("신용등급 조회 : 직업구분 : " +borrower.getBorrower_jobbiz());

		// "원" 단위로 맞추기
		borrower.setBorrower_totalincome(borrower.getBorrower_totalincome() * 10000);
		//신용등급 구하기
		//신용등급 결과
		String creditResult = borrowerDAOService.creditCheck(borrower);
		//신용등급이 잘 나왔는지 확인 
		System.out.println("신용등급 조회 결과 : " +creditResult);
		
		int borrower_limit = 0;
		
		//직업 구분별로 총 대출 한도금액 계산이 다름.
		if(borrower.getBorrower_jobbiz().equals("근로소득자")) {
			borrower_limit = (int)(borrower.getBorrower_totalincome() * 1.3);
		}
		
		else if(borrower.getBorrower_jobbiz().equals("사업소득자(개인)")) {
			borrower_limit = borrower.getBorrower_totalincome();
		}
		
		else if(borrower.getBorrower_jobbiz().equals("사업소득자(법인)")) {
			borrower_limit = (int)(borrower.getBorrower_totalincome() * 1.2);
		}
		
		else {
			borrower_limit = (int)(borrower.getBorrower_totalincome() * 0.9);
		}
		
		//대출가능 금액은 5000만원 까지 
		//대출 한도 금액 계산이 5000만원이 넘으면 5000만원으로 바꾸주기
		if(borrower_limit > 50000000) {
			borrower_limit = 50000000;
		}
		
		//대출한도금액 확인
		System.out.println("대출한도금액 확인 : " +borrower_limit);
		
		borrower.setBorrower_credit(creditResult);
		borrower.setBorrower_limit(borrower_limit);
		
		result.addObject("borrower", borrower);
		result.setViewName("loan_detail");
		return result;
	}
	
	/*2017-07-29 혜림 : 대출하기 정보입력하고 대출금리 확인 페이지로 이동하기*/
	@RequestMapping("loanDetail.do")
	public ModelAndView loanBasic(BorrowerVO borrower) {
		ModelAndView result = new ModelAndView();
		
		//"원" 단위 맞추기
		GoodsVO setGoods = borrower.getGoodsVO();
		setGoods.setGoods_sum(borrower.getGoodsVO().getGoods_sum() * 10000);
		borrower.setGoodsVO(setGoods);
		
		//대출 금리 계산하기
		double rate = borrowerDAOService.checkBorrowRate(borrower);
		System.out.println("대출금리 계산 결과 : " +rate);
		
		borrower.setBorrower_rate(rate);
		
		//월 상환액 계산
		int A = borrower.getGoodsVO().getGoods_sum();
		double B = (Math.round((borrower.getBorrower_rate() / borrower.getBorrower_loanperiod()) * 10000)) * 0.000001;
		double denominator;
		double numerator;

		denominator = A * B * Math.pow((1 + B), borrower.getBorrower_loanperiod());
		numerator = Math.pow((1 + B), borrower.getBorrower_loanperiod()) - 1;
		
		//월 상환액
		borrower.setBorrower_monthlypay((int) (Math.floor(denominator / numerator)));
		//총 상환액
		borrower.setBorrower_amount(borrower.getBorrower_monthlypay() * borrower.getBorrower_loanperiod());
		
		result.addObject("borrower", borrower);
		result.setViewName("loan_register");
	
		return result;
	}
	
	/*2017-07-29 혜림 : 대출 신청 정보 확인하고 대출신청하기 : 테이블에 데이터 삽입*/
	@RequestMapping("loanRegisterAction.do")
	public ModelAndView loanRegister(BorrowerVO borrower) {
		ModelAndView result = new ModelAndView();
		
		//borrowe table에 데이터 넣기
		
		result.setViewName("loan_complete");
		return result;
	}
	
		
}
