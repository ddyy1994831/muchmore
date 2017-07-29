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
	

	//성현 2017-07-28 : 회원가입 페이지 이동
	@RequestMapping("join.do")
	public String join(){
		return "join";
	}
	
	//성현 2017-07-29 : 회원가입 데이터 입력
	@RequestMapping("joinAction.do")
	public String joinAction(Model model, MemberVO member){
		memberDAOService.insertMember(member);
		return "join_result";
	}
		
	//성현 2017-07-29 : 회원가입 아이디 중복체크
	@RequestMapping("joinCheckId.do")
	public String joinCheckId(Model model, HttpServletRequest request) {

		String id = request.getParameter("member_id");

		int checkId = memberDAOService.checkId(id);

		model.addAttribute("checkId", checkId);
		model.addAttribute("id", id);
		return "join_chkId";

	}


	// 2017-07-29 혜림 : 로그인 페이지로 이동
	@RequestMapping("login.do")
	public String login() {
		System.out.println("MemberController-loginform()");
		return "login";
	}

	
	// 2017-07-29 혜림 : 로그인 Action
	@RequestMapping("loginAction.do")
	public ModelAndView loginAction(MemberVO member, HttpSession session, HttpServletResponse response) throws IOException {
		ModelAndView result = new ModelAndView();
		
		//MemberVO member로 login.jsp에서 입력받은 내용 받아옴
		//받은 내용 확인
		System.out.println("login.jsp로 부터 입력받은 id : " +member.getMember_id());
		System.out.println("login.jsp로 부터 입력받은 pw : " +member.getMember_pw1());
		
		//데이터베이스에서 조회하기
		MemberVO getmember = memberDAOService.getMember(member);
		
		//아이디나 비밀번호를 잘못 입력한 경우 처리
		
		String msg = null;	//아이디나 비밀번호를 잘못 입력한 경우 경고 메세지 전달
		
		//getMember 한 결과 비밀번호가 null(=비밀번호를 받아오지 못한 경우) : 아이디를 잘못입려한경우 데이터베이스에서 조회 불가
		if(getmember == null) {
			msg = "아이디나 비밀번호를 잘못 입력하셨습니다.";
			result.addObject("msg", msg);
			result.setViewName("login");
		}
		
		//비밀번호 확인
		//입력한 비밀번호와 데이터베이스에 저장된 비밀번호가 다른 경우
		else {
			System.out.println("loginAction.do : getMember로 받아온 id : " +getmember.getMember_id());
			System.out.println("loginAction.do : getMember로 받아온 pw : " +getmember.getMember_pw1());
			//비밀번호를 정상적으로 입력한 경우
			if(member.getMember_pw1().equals(getmember.getMember_pw1())) {
				session.setAttribute("id", getmember.getMember_id());
				result.addObject("id", getmember.getMember_id());
				result.setViewName("home");
			}
			
			//비밀번호를 잘못 입력한 경우
			else {
				msg = "아이디나 비밀번호를 잘못 입력하셨습니다.";
				result.addObject("msg", msg);
				result.setViewName("login");
			}
		}
		
		return result; 
	}
	
	
	@RequestMapping("loginFindId.do")
	public String findId() {
		return "login_find_id";
	}
	
	@RequestMapping("loginFindIdAction.do")
	public ModelAndView findIdAction(MemberVO member) {
		ModelAndView result = new ModelAndView();
		
		//데이터베이스에서 찾아온 id
		String foundid = memberDAOService.findId(member);
		System.out.println("member_name : "+member.getMember_name());
		System.out.println(foundid);
		
		result.addObject("foundid", foundid);
		result.setViewName("login_find_id_ok");
		return result;
	}
	
	@RequestMapping("loginFindPw.do")
	public String findPw() {
		return "login_find_pw";
	}
	
	@RequestMapping("loginFindPwAction.do")
	public ModelAndView findPwAction(MemberVO member) {
		ModelAndView result = new ModelAndView();		

		/*
		// 존재하는 id이면
		if (cnt == 1) {
			// 로그인 form에서 입력받은 아이디로 데이터베이스 검색 후 회원 정보 받아오기
			MemberVO getmember = memberDAOService.getMember(member.getMember_id());
			// 받아온 회원정보의 pw와 로그인 form에서 입력받은 pw비교하기

			// 비밀번호가 맞으면
			if (getmember.getMember_pw1().equals(member.getMember_pw1())) {
				result.addObject("id", member.getMember_id());
				session.setAttribute("id", member.getMember_id());
				result.setViewName("home");
			}

			else {
				result.addObject("msg", "아이디 또는 비밀번호를 잘못 입력하셨습니다.");
				result.setViewName("loginform");
			}
		}

		if (cnt == 0) {
			result.addObject("msg", "아이디 또는 비밀번호를 잘못 입력하셨습니다.");
			result.setViewName("loginform");
		}
		*/


		//데이터베이스에 찾아온 비밀번호
		String foundpw = memberDAOService.findPw(member);
		
		result.addObject("foundpw", foundpw);
		result.setViewName("login_find_pw_ok");
		return result;
	}

	
}
