package com.spring.muchmore.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.muchmore.member.MemberDAOService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAOService memberDAOService;
	
	//���� 2017-07-28 : ȸ������ ������ �̵�
	@RequestMapping("join.do")
	public String join(){
		return "join";
	}
	
	//���� 2017-07-29 : ȸ������ ������ �Է�
	@RequestMapping("joinAction.do")
	public String joinAction(Model model, MemberVO member){
		memberDAOService.insertMember(member);
		return "join_result";
	}
	
	//���� 2017-07-29 : ȸ������ ���̵� �ߺ�üũ
	@RequestMapping("joinCheckId.do")
	public String joinCheckId(Model model, HttpServletRequest request) {

		String id = request.getParameter("member_id");

		int checkId = memberDAOService.checkId(id);

		model.addAttribute("checkId", checkId);
		model.addAttribute("id", id);
		return "join_chkId";
	}
	
}
