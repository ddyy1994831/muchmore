package com.spring.muchmore.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.muchmore.account.AccountDAOService;
import com.spring.muchmore.borrower.BorrowerDAOService;
import com.spring.muchmore.borrower.BorrowerVO;
import com.spring.muchmore.invest.InvestDAOService;
import com.spring.muchmore.invest.InvestVO;
import com.spring.muchmore.member.MemberDAOService;
import com.spring.muchmore.member.MemberVO;

@Controller
public class AdminController {
	
	@Autowired
	private MemberDAOService memberDAOService;
	
	@Autowired
	private BorrowerDAOService borrowerDAOService;
	
	@Autowired
	private InvestDAOService investDAOService;
	
	@Autowired
	private AccountDAOService accountDAOService;
	
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
		int borrower_id_complete = borrowerDAOService.getBorrowerCountByIdComplete(id);
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
		result.addObject("borrower_id_complete", borrower_id_complete);
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
	public ModelAndView loanSend(BorrowerVO borrower) {
		ModelAndView result = new ModelAndView();
		
		//������ ���̵� �޾ƿ���
		System.out.println("����� ���� : ������ ���̵� : "+borrower.getBorrower_id());
		//�ش� �������� ��ǰ ��ȣ �޾ƿ���
		System.out.println("����� ���� : ���� ��ǰ ��ȣ : "+borrower.getGoodsVO().getGoods_num());
		
		//������ �������� ��������
		MemberVO member = memberDAOService.getMemberAccountById(borrower.getBorrower_id());
		//�������� ��ǰ ��������
		member.setBorrower(borrowerDAOService.getBorrower(borrower));
		
		result.addObject("borrower", member);
		result.setViewName("admin_loan_send");
		return result;
	}
	

	/* 2017-08-01 ���� : ����� ���� Action */
	@RequestMapping("adminLoanSendAction.do")
	public String loanSendAction(BorrowerVO borrower) {
		
		System.out.println("����� ���� : " +borrower.getBorrower_id());
		System.out.println("����� ���� : " +borrower.getGoodsVO().getGoods_num());
		
		
		//������ ���� ��������
		MemberVO member = memberDAOService.getMemberAccountById(borrower.getBorrower_id());
		member.setBorrower(borrowerDAOService.getBorrower(borrower));

		//������ ���� ��������
		MemberVO admin = memberDAOService.getMemberAccountById("muchmore");
		
		//���޾�
		int amount = member.getBorrower().getGoodsVO().getGoods_sum();
		
		//������ ���¿� �Ա��ϱ�
		member.getAccount().setAccount_case(5);
		member.getAccount().setAccount_balance(member.getAccount().getAccount_balance() + amount);
		accountDAOService.updateAccount(member.getAccount());
		
		//������ ���¿��� ����ϱ�
		admin.getAccount().setAccount_case(7);
		admin.getAccount().setAccount_balance(admin.getAccount().getAccount_balance() + amount);
		accountDAOService.updateAccountAdmin(admin.getAccount());
		
		//������ ���� �ٲٱ�
		//borrower_startdate : sysdate, borrower_enddate = sysdate + loanperiod
		//borrower_payok : ���޿Ϸ�, borrower_status : ��ȯ��
		member.getBorrower().setBorrower_status("��ȯ��");
		member.getBorrower().setBorrower_payok("���޿Ϸ�");
		borrowerDAOService.updateBorrowerPayBack(member.getBorrower());
		return "redirect:/adminLoanList.do";
	}

	/* ���� admin page : ȸ������ ������ - Ż�� open url */
	@RequestMapping("admin_memberdropout.do")
	public ModelAndView adminmemberdropout(MemberVO member, Model model) {
		ModelAndView result = new ModelAndView();
		String id = member.getMember_id();

		//������� �� ����Ƚ���� ���⳻�� �� '��ȯ�Ϸ�'�� ����Ƚ�� ���ϱ�(Ż�𰡴ɿ��� �� ����)
		int borrower_id_total = borrowerDAOService.getBorrowerCountById(id);
		int borrower_id_complete = borrowerDAOService.getBorrowerCountByIdComplete(id);
		//������� �� ����Ƚ���� ���ڳ��� �� '���޿Ϸ�'�� ����Ƚ�� ���ϱ�(Ż�𰡴ɿ��� �� ����) 
		int invest_id_total = investDAOService.getInvestCountById(id);
		int invest_id_complete = investDAOService.getInvestCountByIdComplete(id);

		String member_id = member.getMember_id();

		result.addObject("member_id", member_id);
		result.addObject("borrower_id_total", borrower_id_total);
		result.addObject("borrower_id_complete", borrower_id_complete);
		result.addObject("invest_id_total", invest_id_total);
		result.addObject("invest_id_complete", invest_id_complete);
		
		result.setViewName("admin_memberdropout");

		return result;
	}

	/* ���� admin page : Ż�� ��ư Ŭ�� �� Ż�� �۵� */
	@RequestMapping("admin_member_dropoutAction.do")
	public String adminmemberdropoutaction(HttpServletRequest request, Model model) {

		String id = request.getParameter("member_id");

		memberDAOService.deleteMember(id);

		return "redirect:/admin_member.do";

	}
}
