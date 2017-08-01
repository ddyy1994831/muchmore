package com.spring.muchmore.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.muchmore.borrower.BorrowerDAOService;
import com.spring.muchmore.borrower.BorrowerVO;
import com.spring.muchmore.member.MemberDAOService;
import com.spring.muchmore.member.MemberVO;

@Controller
public class AdminController {
	
	@Autowired
	BorrowerDAOService borrowerDAOService;
	
	@Autowired
	MemberDAOService memberDAOService;
	
	/* 2017-08-01 혜림 : 대출금 지급 페이지로 이동*/
	@RequestMapping("adminLoanList.do")
	public ModelAndView loanList() {
		ModelAndView result = new ModelAndView();
		
		//전체 대출 리스트 가져오기
		List<BorrowerVO> borrower_list = borrowerDAOService.getBorrowerList();
		
		result.addObject("borrower_list", borrower_list);
		result.setViewName("admin_loan_list");
		return result;
	}
	
	/*2017-08-01 혜림 : 대출금 지급 새로운 창 띄우기*/
	@RequestMapping("adminLoanSend.do")
	public ModelAndView loanSend(HttpServletRequest request, BorrowerVO borrower) {
		ModelAndView result = new ModelAndView();
		
		//대출자 아이디 받아오기
		System.out.println("대출금 지급 : 대출자 아이디 : "+borrower.getBorrower_id());
		//해당 대출자의 상품 번호 받아오기
		System.out.println("대출금 지급 : 대출 상품 번호 : "+borrower.getGoodsVO().getGoods_num());
		
		MemberVO member = memberDAOService.getMember(borrower.getBorrower_id());
		
		result.setViewName("admin_loan_send");
		return result;
	}
}
