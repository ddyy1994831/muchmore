package com.spring.muchmore.borrower;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BorrowerController {
	@Autowired
	private BorrowerDAOService borrowerDAOService;
	
	@RequestMapping("loan.do")
	public String loan() {
		return "loan_main";
	}
}
