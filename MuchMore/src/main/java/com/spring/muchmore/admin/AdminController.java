package com.spring.muchmore.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.muchmore.borrower.BorrowerDAOService;
import com.spring.muchmore.borrower.BorrowerVO;
import com.spring.muchmore.invest.InvestDAOService;
import com.spring.muchmore.invest.InvestVO;
import com.spring.muchmore.member.MemberDAOService;
import com.spring.muchmore.member.MemberVO;
import com.spring.muchmore.moneyinout.MoneyinoutDAO;
import com.spring.muchmore.moneyinout.MoneyinoutDAOService;
import com.spring.muchmore.moneyinout.MoneyinoutVO;

@Controller
public class AdminController {
	
	@Autowired
	public MemberDAOService memberDAOService;
	@Autowired
	public BorrowerDAOService borrowerDAOService;
	@Autowired
	public InvestDAOService investDAOService;
	@Autowired
	public MoneyinoutDAOService moneyinoutDAOService;
	@Autowired
	public MoneyinoutDAO moneyinoutDAO;
	
	/*2017-08-01 ���� : admin - ȸ������ ������ �̵� */
	@RequestMapping("admin_member.do")
	public String adminmember(Model model) {
		List<MemberVO> member = memberDAOService.getMemberList();
		model.addAttribute("member", member);
		return "admin_member";
	}
	
	/*2017-08-01 ���� : admin - ȸ������ �󼼺��� ������ �̵�*/
	@RequestMapping("admin_memberdetail.do")
	public ModelAndView adminmemberdetail(HttpServletRequest request) {
		ModelAndView result = new ModelAndView();
		String id = request.getParameter("member_id");
		
		//������� �� ����Ƚ���� ���⳻�� �� '��ȯ�Ϸ�'�� ����Ƚ�� ���ϱ�(Ż�𰡴ɿ��� �� ����)
		int borrower_id_total = borrowerDAOService.getBorrowerCountById(id);
//		int borrower_id_complete = borrowerDAOService.getBorrowerCountByIdComplete(id);
		//������� �� ����Ƚ���� ���ڳ��� �� '���޿Ϸ�'�� ����Ƚ�� ���ϱ�(Ż�𰡴ɿ��� �� ����) 
		int invest_id_total = investDAOService.getInvestCountById(id);
		int invest_id_complete = investDAOService.getInvestCountByIdComplete(id);

		//������� ���⳻�� ��������
		BorrowerVO borrower = new BorrowerVO();
		borrower.setBorrower_id(id);
		List<BorrowerVO> borrower_list = (List<BorrowerVO>)borrowerDAOService.getBorrowerListById(borrower);
		//������� ���ڳ��� ��������
		List<InvestVO> invest_list = (List<InvestVO>) investDAOService.getInvestById(id);

		result.addObject("borrower_id_total", borrower_id_total);
//		result.addObject("borrower_id_complete", borrower_id_complete);
		result.addObject("invest_id_total", invest_id_total);
		result.addObject("invest_id_complete", invest_id_complete);
		result.addObject("borrower_list", borrower_list);
		result.addObject("invest_list", invest_list);
		result.addObject("member_id", id);
		
		result.setViewName("admin_memberdetail");
		return result;
	}

	
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
	
	/*2017-08-01 �ٿ� : ������������ -����ݳ���*/
	@RequestMapping("/adminAccount.do")
	public ModelAndView AccountList(HttpServletRequest request, MoneyinoutVO moneyinout) {
		ModelAndView result = new ModelAndView();
		
		List<MoneyinoutVO> moneyinout_list = moneyinoutDAOService.getAdimList();
		
		result.addObject("moneyinout_list", moneyinout_list);
		result.setViewName("admin_account");

		return result;
	}
	
}