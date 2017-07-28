package com.spring.muchmore.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("join.do")
	public String join(){
		return "join";
	}

}
