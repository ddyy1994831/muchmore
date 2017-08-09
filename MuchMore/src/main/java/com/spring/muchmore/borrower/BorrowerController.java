package com.spring.muchmore.borrower;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class BorrowerController {
	@Autowired
	private BorrowerDAOService borrowerDAOService;
	
	/*���� : �����ϱ� ���������� �̵�*/
	@RequestMapping("loan.do")
	public ModelAndView loan(HttpSession session) {
		ModelAndView result = new ModelAndView();
		
		int borrower_cnt = 0;	//��ȯ�Ϸ���� ���� ���� Ƚ��
		String msg = null;
		//���� �������� ȸ��(��ȯ �Ϸ����� ���� ȸ��)�� �����û�������� �̵� �Ұ�
		//��ȯ �Ϸ���� ���� ���� ���� ���ϱ�
		if(session.getAttribute("id") != null) {
			borrower_cnt = borrowerDAOService.getBorrowerCountByIdNotComplete((String)session.getAttribute("id"));
			
			if(borrower_cnt != 0) {
				msg = "���� ���� ���񽺸� �̿����� ȸ���̹Ƿ� ���� ��û ���񽺸� �̿��Ͻ� �� �����ϴ�.";
			}
		}
		
		result.addObject("msg", msg);
		result.addObject("borrower_cnt", borrower_cnt);
		result.setViewName("loan_main");
		return result ;
	}
	
	/*���� : �����ϱ� �ſ� ���� ���������� �̵�*/
	@RequestMapping("loanCreditCheck.do")
	public String creditCheck() {
		return "loan_credit_check";
	}
	
	/*���� : �����ϱ� �ſ� ���� ��ȸ�ϰ� ��� Ȯ�� & ���� �Է�*/
	@RequestMapping("loanCreditCheckAction.do")
	public ModelAndView creditCheckAction(BorrowerVO borrower) {
		ModelAndView result = new ModelAndView();
		System.out.println("�ſ��� ��ȸ : �Ѽҵ� : " +borrower.getBorrower_totalincome());
		System.out.println("�ſ��� ��ȸ : �������� : " +borrower.getBorrower_jobbiz());

		// "��" ������ ���߱�
		borrower.setBorrower_totalincome(borrower.getBorrower_totalincome() * 10000);
		//�ſ��� ���ϱ�
		//�ſ��� ���
		String creditResult = borrowerDAOService.creditCheck(borrower);
		//�ſ����� �� ���Դ��� Ȯ�� 
		System.out.println("�ſ��� ��ȸ ��� : " +creditResult);
		
		int borrower_limit = 0;
		
		//���� ���к��� �� ���� �ѵ��ݾ� ����� �ٸ�.
		if(borrower.getBorrower_jobbiz().equals("�ٷμҵ���")) {
			borrower_limit = (int)(borrower.getBorrower_totalincome() * 1.3);
		}
		
		else if(borrower.getBorrower_jobbiz().equals("����ҵ���(����)")) {
			borrower_limit = borrower.getBorrower_totalincome();
		}
		
		else if(borrower.getBorrower_jobbiz().equals("����ҵ���(����)")) {
			borrower_limit = (int)(borrower.getBorrower_totalincome() * 1.2);
		}
		
		else {
			borrower_limit = (int)(borrower.getBorrower_totalincome() * 0.9);
		}
		
		//���Ⱑ�� �ݾ��� 5000���� ���� 
		//���� �ѵ� �ݾ� ����� 5000������ ������ 5000�������� �ٲ��ֱ�
		if(borrower_limit > 50000000) {
			borrower_limit = 50000000;
		}
		
		//�����ѵ��ݾ� Ȯ��
		System.out.println("�����ѵ��ݾ� Ȯ�� : " +borrower_limit);
		
		borrower.setBorrower_credit(creditResult);
		borrower.setBorrower_limit(borrower_limit);
		
		result.addObject("borrower", borrower);
		result.setViewName("loan_detail");
		return result;
	}
	
	/*���� : �����ϱ� �����Է��ϰ� ����ݸ� Ȯ�� �������� �̵��ϱ�*/
	@RequestMapping("loanDetail.do")
	public ModelAndView loanBasic(BorrowerVO borrower) {
		ModelAndView result = new ModelAndView();
		
		//"��" ���� ���߱�
		borrower.getGoodsVO().setGoods_sum(borrower.getGoodsVO().getGoods_sum() * 10000);
		//���� �ݸ� ����ϱ�
		double rate = borrowerDAOService.checkBorrowRate(borrower);
		System.out.println("����ݸ� ��� ��� : " +rate);
		
		borrower.setBorrower_rate(rate);
		
		//�� ��ȯ�� ���
		int A = borrower.getGoodsVO().getGoods_sum();
		double B = (Math.round((borrower.getBorrower_rate() / borrower.getBorrower_loanperiod()) * 10000)) * 0.000001;
		double denominator;
		double numerator;

		denominator = A * B * Math.pow((1 + B), borrower.getBorrower_loanperiod());
		numerator = Math.pow((1 + B), borrower.getBorrower_loanperiod()) - 1;
		
		System.out.println((int)(Math.floor(denominator / numerator)));
		//�� ��ȯ��
		borrower.setBorrower_monthlypay((int)(Math.floor(denominator / numerator)));
		//�� ��ȯ��
		borrower.setBorrower_amount(borrower.getBorrower_monthlypay() * borrower.getBorrower_loanperiod());
		
		result.addObject("borrower", borrower);
		result.setViewName("loan_register");
	
		return result;
	}
	
	/*���� : ���� ��û ���� Ȯ���ϰ� �����û�ϱ� : ���̺� ������ ����*/
	@RequestMapping("loanRegisterAction.do")
	public ModelAndView loanRegister(BorrowerVO borrower) {
		ModelAndView result = new ModelAndView();
		
		//borrowe table�� ������ �ֱ�
		borrowerDAOService.insertBorrower(borrower);
		borrower.getGoodsVO().setGoods_rate(borrower.getBorrower_rate() * 0.8);
		borrowerDAOService.insertGoods(borrower);
		
		result.addObject("borrower", borrower);
		result.setViewName("loan_complete");
		return result;
	}
		
}

