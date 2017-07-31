package com.spring.muchmore.invest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.muchmore.borrower.BorrowerDAOService;
import com.spring.muchmore.borrower.BorrowerVO;
import com.spring.muchmore.member.MemberVO;


@Controller
public class InvestController {
	
	@Autowired
	private InvestDAOService investDAOService;
	@Autowired
	private BorrowerDAOService borrowerDAOService;
	
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

}
