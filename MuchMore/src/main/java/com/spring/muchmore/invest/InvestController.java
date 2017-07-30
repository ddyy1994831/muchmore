package com.spring.muchmore.invest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InvestController {
	
	@Autowired
	private InvestDAOService investDAOService;
	
	
	/*2017-07-29 성현 : 마이페이지 투자내역 으로 이동*/
	@RequestMapping("mypage_myinvest.do")
	public ModelAndView mypage_investinfo(Model model, HttpSession session) {
		ModelAndView result = new ModelAndView();
		
		String id = (String) session.getAttribute("id");

		List<InvestVO> invest = investDAOService.getInvestById(id);
		
		result.addObject("invest_list", invest);
		result.setViewName("mypage_myinvest");
		return result;
	}
	
	
	@RequestMapping("invest.do")
	public String invest(){
		return "invest";
	}

}
