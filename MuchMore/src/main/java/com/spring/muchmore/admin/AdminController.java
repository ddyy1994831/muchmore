package com.spring.muchmore.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.muchmore.borrower.BorrowerDAOService;
import com.spring.muchmore.borrower.BorrowerVO;
import com.spring.muchmore.invest.InvestDAOService;
import com.spring.muchmore.invest.InvestVO;
import com.spring.muchmore.member.MemberDAOService;
import com.spring.muchmore.member.MemberVO;
import com.spring.muchmore.moneyinout.MoneyinoutDAO;
import com.spring.muchmore.moneyinout.MoneyinoutDAOService;
import com.spring.muchmore.moneyinout.MoneyinoutVO;

@Controller
public class AdminController {
	
	@Autowired
	public MemberDAOService memberDAOService;
	@Autowired
	public BorrowerDAOService borrowerDAOService;
	@Autowired
	public InvestDAOService investDAOService;
	@Autowired
	public MoneyinoutDAOService moneyinoutDAOService;
	@Autowired
	public MoneyinoutDAO moneyinoutDAO;
	
	/*2017-08-01 성현 : admin - 회원관리 페이지 이동 */
	@RequestMapping("admin_member.do")
	public String adminmember(Model model) {
		List<MemberVO> member = memberDAOService.getMemberList();
		model.addAttribute("member", member);
		return "admin_member";
	}
	
	/*2017-08-01 성현 : admin - 회원관리 상세보기 페이지 이동*/
	@RequestMapping("admin_memberdetail.do")
	public ModelAndView adminmemberdetail(HttpServletRequest request) {
		ModelAndView result = new ModelAndView();
		String id = request.getParameter("member_id");
		
		//사용자의 총 대출횟수와 대출내역 중 '상환완료'인 대출횟수 구하기(탈퇴가능여부 비교 위해)
		int borrower_id_total = borrowerDAOService.getBorrowerCountById(id);
//		int borrower_id_complete = borrowerDAOService.getBorrowerCountByIdComplete(id);
		//사용자의 총 투자횟수와 투자내역 중 '지급완료'인 투자횟수 구하기(탈퇴가능여부 비교 위해) 
		int invest_id_total = investDAOService.getInvestCountById(id);
		int invest_id_complete = investDAOService.getInvestCountByIdComplete(id);

		//사용자의 대출내역 가져오기
		BorrowerVO borrower = new BorrowerVO();
		borrower.setBorrower_id(id);
		List<BorrowerVO> borrower_list = (List<BorrowerVO>)borrowerDAOService.getBorrowerListById(borrower);
		//사용자의 투자내역 가져오기
		List<InvestVO> invest_list = (List<InvestVO>) investDAOService.getInvestById(id);

		result.addObject("borrower_id_total", borrower_id_total);
//		result.addObject("borrower_id_complete", borrower_id_complete);
		result.addObject("invest_id_total", invest_id_total);
		result.addObject("invest_id_complete", invest_id_complete);
		result.addObject("borrower_list", borrower_list);
		result.addObject("invest_list", invest_list);
		result.addObject("member_id", id);
		
		result.setViewName("admin_memberdetail");
		return result;
	}

	
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
	
	/*2017-08-01 다예 : 관리자페이지 -입출금내역*/
	@RequestMapping("/adminAccount.do")
	public ModelAndView AccountList(HttpServletRequest request, MoneyinoutVO moneyinout) {
		ModelAndView result = new ModelAndView();
		
		List<MoneyinoutVO> moneyinout_list = moneyinoutDAOService.getAdimList();
		
		result.addObject("moneyinout_list", moneyinout_list);
		result.setViewName("admin_account");

		return result;
	}
	
}