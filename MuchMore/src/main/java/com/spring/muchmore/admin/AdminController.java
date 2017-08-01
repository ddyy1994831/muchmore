package com.spring.muchmore.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.muchmore.borrower.BorrowerDAOService;
import com.spring.muchmore.borrower.BorrowerVO;
import com.spring.muchmore.member.MemberDAOService;
import com.spring.muchmore.member.MemberVO;

@Controller
public class AdminController {
	
	@Autowired
	BorrowerDAOService borrowerDAOService;
	
	@Autowired
	MemberDAOService memberDAOService;
	
	/* 2017-08-01 ���� : ����� ���� �������� �̵�*/
	@RequestMapping("adminLoanList.do")
	public ModelAndView loanList() {
		ModelAndView result = new ModelAndView();
		
		//��ü ���� ����Ʈ ��������
		List<BorrowerVO> borrower_list = borrowerDAOService.getBorrowerList();
		
		result.addObject("borrower_list", borrower_list);
		result.setViewName("admin_loan_list");
		return result;
	}
	
	/*2017-08-01 ���� : ����� ���� ���ο� â ����*/
	@RequestMapping("adminLoanSend.do")
	public ModelAndView loanSend(HttpServletRequest request, BorrowerVO borrower) {
		ModelAndView result = new ModelAndView();
		
		//������ ���̵� �޾ƿ���
		System.out.println("����� ���� : ������ ���̵� : "+borrower.getBorrower_id());
		//�ش� �������� ��ǰ ��ȣ �޾ƿ���
		System.out.println("����� ���� : ���� ��ǰ ��ȣ : "+borrower.getGoodsVO().getGoods_num());
		
		MemberVO member = memberDAOService.getMember(borrower.getBorrower_id());
		
		result.setViewName("admin_loan_send");
		return result;
	}
}
