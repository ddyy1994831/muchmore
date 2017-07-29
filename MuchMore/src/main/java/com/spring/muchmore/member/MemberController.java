package com.spring.muchmore.member;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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


	// 2017-07-29 ���� : �α��� �������� �̵�
	@RequestMapping("login.do")
	public String login() {
		System.out.println("MemberController-loginform()");
		return "login";
	}

	
	// 2017-07-29 ���� : �α��� Action
	@RequestMapping("loginAction.do")
	public ModelAndView loginAction(MemberVO member, HttpSession session, HttpServletResponse response) throws IOException {
		ModelAndView result = new ModelAndView();
		
		//MemberVO member�� login.jsp���� �Է¹��� ���� �޾ƿ�
		//���� ���� Ȯ��
		System.out.println("login.jsp�� ���� �Է¹��� id : " +member.getMember_id());
		System.out.println("login.jsp�� ���� �Է¹��� pw : " +member.getMember_pw1());
		
		//�����ͺ��̽����� ��ȸ�ϱ�
		MemberVO getmember = memberDAOService.getMember(member);
		
		//���̵� ��й�ȣ�� �߸� �Է��� ��� ó��
		
		String msg = null;	//���̵� ��й�ȣ�� �߸� �Է��� ��� ��� �޼��� ����
		
		//getMember �� ��� ��й�ȣ�� null(=��й�ȣ�� �޾ƿ��� ���� ���) : ���̵� �߸��Է��Ѱ�� �����ͺ��̽����� ��ȸ �Ұ�
		if(getmember == null) {
			msg = "���̵� ��й�ȣ�� �߸� �Է��ϼ̽��ϴ�.";
			result.addObject("msg", msg);
			result.setViewName("login");
		}
		
		//��й�ȣ Ȯ��
		//�Է��� ��й�ȣ�� �����ͺ��̽��� ����� ��й�ȣ�� �ٸ� ���
		else {
			System.out.println("loginAction.do : getMember�� �޾ƿ� id : " +getmember.getMember_id());
			System.out.println("loginAction.do : getMember�� �޾ƿ� pw : " +getmember.getMember_pw1());
			//��й�ȣ�� ���������� �Է��� ���
			if(member.getMember_pw1().equals(getmember.getMember_pw1())) {
				session.setAttribute("id", getmember.getMember_id());
				result.addObject("id", getmember.getMember_id());
				result.setViewName("home");
			}
			
			//��й�ȣ�� �߸� �Է��� ���
			else {
				msg = "���̵� ��й�ȣ�� �߸� �Է��ϼ̽��ϴ�.";
				result.addObject("msg", msg);
				result.setViewName("login");
			}
		}
		
		return result; 
	}
	
	// 2017-07-29 ���� : ���̵� ã�� �������� �̵�
	@RequestMapping("loginFindId.do")
	public String findId() {
		return "login_find_id";
	}
	// 2017-07-29 ���� : ���̵� ã�� Action
	@RequestMapping("loginFindIdAction.do")
	public ModelAndView findIdAction(MemberVO member) {
		ModelAndView result = new ModelAndView();
		
		//�����ͺ��̽����� ã�ƿ� id
		String foundid = memberDAOService.findId(member);
		System.out.println("member_name : "+member.getMember_name());
		System.out.println(foundid);
		
		result.addObject("foundid", foundid);
		result.setViewName("login_find_id_ok");
		return result;
	}
	// 2017-07-29 ���� : ��й�ȣ ã�� �������� �̵�
	@RequestMapping("loginFindPw.do")
	public String findPw() {
		return "login_find_pw";
	}
	// 2017-07-29 ���� : ��й�ȣ ã�� Action
	@RequestMapping("loginFindPwAction.do")
	public ModelAndView findPwAction(MemberVO member) {
		ModelAndView result = new ModelAndView();		

		//�����ͺ��̽��� ã�ƿ� ��й�ȣ
		String foundpw = memberDAOService.findPw(member);
		
		result.addObject("foundpw", foundpw);
		result.setViewName("login_find_pw_ok");
		return result;
	}

	
}
