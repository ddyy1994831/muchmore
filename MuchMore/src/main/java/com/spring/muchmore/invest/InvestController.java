package com.spring.muchmore.invest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class InvestController {
	
	@Autowired
	private InvestDAOService investDAOService;
	
	@RequestMapping("invest.do")
	public String invest(){
		return "invest";
	}

}
