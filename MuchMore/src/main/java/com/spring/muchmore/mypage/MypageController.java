package com.spring.muchmore.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.muchmore.member.MemberDAOService;
import com.spring.muchmore.member.MemberVO;

@Controller
public class MypageController {
	
	@Autowired
	public MemberDAOService memberDAOService;
	
	//2017-07-29 ���� : ����ȭ�� �̵�
	@RequestMapping("mypage_main.do")
	public String mypage_main(){
		return "mypage_main";
	}
	
	//2017-07-29 ���� : ȸ���������� ��й�ȣ�Է� ȭ�� �̵�
	@RequestMapping("mypage_memberupdate.do")
	public String mypage_memberupdate(){
		return "mypage_memberupdate";
	}
	
	//2017-07-29 ���� : ȸ���������� ��й�ȣ�Է� �� �Է������� �̵�
	@RequestMapping("mypage_memberupdateform.do")
	public ModelAndView memberUpdate(HttpSession session, MemberVO member, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		
		String id = (String)session.getAttribute("id");
		//getMember�Լ����� ���� member�� session�� ����.
		member.setMember_id(id);
		String password = request.getParameter("member_pw1");
		

		MemberVO vo = memberDAOService.getMember(member);
		if (!(password.equals(vo.getMember_pw1()))) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}

		ModelAndView result = new ModelAndView();

		result.addObject("member", vo);
		result.setViewName("mypage_memberupdateform");

		return result;
	}
	
	//2017-07-29 ���� : ȸ������ �����ϱ� ��ư Ŭ��
	@RequestMapping("mypage_memberupdatesuccess.do")
	public String memberUpdateSuccess(MemberVO member) {
		memberDAOService.updateMember(member);
		return "mypage_memberupdatesuccess";
	}

}
