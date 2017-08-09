package com.spring.muchmore.mypage;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.muchmore.account.AccountDAOService;
import com.spring.muchmore.account.AccountVO;
import com.spring.muchmore.borrower.BorrowerDAOService;
import com.spring.muchmore.borrower.BorrowerVO;
import com.spring.muchmore.goods.GoodsVO;
import com.spring.muchmore.invest.InvestDAOService;
import com.spring.muchmore.invest.InvestVO;
import com.spring.muchmore.member.MemberDAOService;
import com.spring.muchmore.member.MemberVO;
import com.spring.muchmore.moneyinout.MoneyinoutDAOService;
import com.spring.muchmore.moneyinout.MoneyinoutVO;

@Controller
public class MypageController {
	
	@Autowired
	private MemberDAOService memberDAOService;
	
	@Autowired
	private BorrowerDAOService borrowerDAOService;
	
	@Autowired
	private InvestDAOService investDAOService;
	
	@Autowired
	private MoneyinoutDAOService moneyinoutDAOService;
	
	@Autowired
	private AccountDAOService accountDAOService;
	
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
		String password = request.getParameter("member_pw1");
		

		MemberVO vo = memberDAOService.getMember(id);
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
	
	//2017-07-03 ���� : ���� ���� ȭ������ �̵�
	@RequestMapping("mypage_myloan.do")
	public ModelAndView mypage_myloan(HttpSession session) {
		
		ModelAndView result = new ModelAndView();
		//���� �α����� ȸ���� ���⳻�� ��������
		//������ ��ü�� �Ķ���ͷ� �����ϱ� ���� ��ü ����
		BorrowerVO borrower = new BorrowerVO();
		//������ borrower ��ü�� id ����
		borrower.setBorrower_id((String)session.getAttribute("id"));
		//���� �α����� ȸ���� ���⳻�� ��������
		List<BorrowerVO> borrower_list = borrowerDAOService.getBorrowerListById(borrower);
		
		result.addObject("borrower_list", borrower_list);
		result.setViewName("mypage_myloan");
		return result;
	}
	
	/*2017-07-03 ���� : ���� ���� ȭ�鿡�� �������� �������� �̵�*/
	@RequestMapping("mypage_myloan_fileUpload.do")
	public ModelAndView myloanFileUpload(BorrowerVO borrower) {
		ModelAndView result = new ModelAndView();
		
		BorrowerVO getborrower = borrowerDAOService.getBorrower(borrower);
		System.out.println(getborrower.getBorrower_jobperiod());
		System.out.println(getborrower.getBorrower_registerdate());
		System.out.println(getborrower.getGoodsVO().getGoods_num());
		
		result.addObject("borrower", getborrower);
		result.setViewName("mypage_myloan_fileupload");
		return result;
	}
	
	/*2017-07-03 ���� : ���� upload Action*/
	@RequestMapping("mypage_myloan_fileUploadAction.do")
	public String myloanFileUploadAction(MultipartHttpServletRequest request) throws Exception {
		
		//borrower�� �޾ƿ� ������ �� �ֱ�
		int goods_num = Integer.parseInt(request.getParameter("goods_num"));
		BorrowerVO borrower = new BorrowerVO();
		borrower.setBorrower_id((String)request.getParameter("borrower_id"));
		GoodsVO goods = new GoodsVO();
		goods.setGoods_num(goods_num);
		borrower.setGoodsVO(goods);
		
		borrower = borrowerDAOService.getBorrower(borrower);
		
		MultipartFile mf = request.getFile("borrower_file");
		
		//÷�������� ���� ���
		if(mf.getSize() == 0) {
			borrower.setBorrower_file("÷�����Ͼ���");
			borrower.setBorrower_stored("÷�����Ͼ���");
		}
		
		else {
			borrower.setBorrower_file(mf.getOriginalFilename());
			
			//���ε��� ������ ����Ǵ� ����
			String uploadPath = "C:\\hk0327\\upload\\";
			
			//���� �̸��� �ߺ����� �ʵ��� ó��
			String originalFileExtension = mf.getOriginalFilename()
					.substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;

			mf.transferTo(new File(uploadPath + storedFileName));
			
			borrower.setBorrower_file(mf.getOriginalFilename());
			borrower.setBorrower_stored(storedFileName);
			borrower.setBorrower_status("�ɻ���");
			
			borrowerDAOService.uploadFile(borrower);
		}
		return "redirect:/mypage_myloan.do";
	}
	
	/*2017-07-29 ���� : ���������� ���ڳ��� ���� �̵�*/
	@RequestMapping("mypage_myinvest.do")
	public ModelAndView mypage_investinfo(Model model, HttpSession session) {
		ModelAndView result = new ModelAndView();
		
		String id = (String) session.getAttribute("id");

		List<InvestVO> invest = investDAOService.getInvestById(id);
		
		result.addObject("invest_list", invest);
		result.setViewName("mypage_myinvest");
		return result;
	}
	
	/*2017-07-30 ���� : mypage_myaccount�� �̵�*/
	@RequestMapping("mypageMyaccount.do")
	public ModelAndView mypageMyaccount(HttpSession session) {
		ModelAndView result = new ModelAndView();
		
		String member_id = (String)session.getAttribute("id");
		System.out.println("id = " +member_id);
		//���� ���� �ҷ�����
		MemberVO getmember = memberDAOService.getMemberAccountById(member_id);
		System.out.println("id = " +getmember.getAccount().getAccount_virtual());
		//����� ���� �ҷ�����
		List<MoneyinoutVO> moneyinoutlist = moneyinoutDAOService.selectMoneyinoutById(member_id);
		
		result.addObject("getmember", getmember);
		result.addObject("moneyinoutlist", moneyinoutlist);
		result.setViewName("mypage_myaccount");
		return result;
	}
	
	/*2017-07-31 ���� : mypage���� myacccount�ǿ��� ������·� �Ա��ϱ� : �ݾ� �Է� �������� �̵�*/
	@RequestMapping("mypageMyaccountDeposit.do")
	public String Depoist() {
		
		return "mypage_myaccount_deposit_input";
	}
	
	/*2017-07-31 ���� : �Ա��ϱ� ���*/
	@RequestMapping("mypageMyaccountDepositAction.do")
	public String DepositAction(HttpServletRequest request, HttpSession session) {
		
		//�Ա��� �ݾ�
		int amount = Integer.parseInt(request.getParameter("amount"));
		System.out.println(amount);
		//�ش� ȸ��(�α����� ȸ��)
		String member_id = (String)session.getAttribute("id");
		MemberVO getmember = memberDAOService.getMemberAccountById(member_id);
		
		//�Ա��ϱ� ���� ���̺� �ֱ�
		AccountVO account= getmember.getAccount();
		amount = account.getAccount_balance() + amount;
		account.setAccount_balance(amount);
		account.setAccount_case(1);
		
		accountDAOService.updateAccount(account);
		//����� ������ �ֱ�
		
		
		return "redirect:/mypageMyaccount.do";
	}
	
	/*2017-07-31 ���� : ������� ����ϱ� �� â*/
	@RequestMapping("mypageRegisterAccount.do")
	public String registerAccount() {
		return "mypage_myaccount_register_account";
	}
	
	/*2017-07-31 ���� : �ǰ��� ����ϱ� ���*/
	@RequestMapping("mypageRegisterAccountAction.do")
	public String registerAccountAction(HttpSession session, HttpServletRequest request) throws Exception {
		String bank = (String)request.getParameter("bank");
		String real_account = (String)request.getParameter("real_account");
		
		//���� ����
		if(bank.equals("KB")) {
			bank = "��������";
		}
		else if(bank.equals("IBK")) {
			bank = "�������";
		}
		else if(bank.equals("ShinHan")) {
			bank = "��������";
		}
		else if(bank.equals("Woori")) {
			bank = "�츮����";
		}
		else if(bank.equals("Hana")) {
			bank = "�ϳ�����";
		}
		
		//�α����� ȸ���� ������ ���� ���� ��������
		String member_id = (String)session.getAttribute("id");
		MemberVO getmember = memberDAOService.getMemberAccountById(member_id);
		
		//�ǰ��� ����
		
		getmember.getAccount().setAccount_real(bank+real_account);
		//�ǰ��� ����ϱ�
		accountDAOService.updateAccountRegister(getmember.getAccount());
		
		return "redirect:/mypageMyaccount.do";
	}
	
	/*2017-07-31 ���� : ����ϱ� �ݾ� �Է� �� â ������ �̵�*/
	@RequestMapping("mypageMyaccountWithdraw.do")
	public String Withdraw() {
		return "mypage_myaccount_withdraw_input";
	}

	/*2017-07-31 ���� : ����ϱ� ���*/
	@RequestMapping("mypageMyaccountWithdrawAction.do")
	public String WithdrawAction(HttpSession session, HttpServletRequest request) {
		
		//����� �ݾ�
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		String member_id = (String)session.getAttribute("id");
		
		MemberVO getmember = memberDAOService.getMemberAccountById(member_id);
		
		//�Ա��ϱ� ���� ���̺� �ֱ�
		AccountVO account= getmember.getAccount();
		amount = account.getAccount_balance() - amount;
		account.setAccount_balance(amount);
		account.setAccount_case(2);
		
		accountDAOService.updateAccount(account);
		
		return "redirect:/mypageMyaccount.do";
	}
	
	/* 2017-08-01 �ٿ� : mypage_myloan���� ����� ��ȯ */
	@RequestMapping("/mypageMyloanDeposit.do")
	public ModelAndView myloanDeposit(BorrowerVO borrower, HttpSession session) {
		ModelAndView result = new ModelAndView();
		
		//���� �α����� ����� ������
		String borrower_id = (String)session.getAttribute("id");
		//�����Աݾ�
		int monthly_pay = borrowerDAOService.getMonthlyDeposit(borrower);
		System.out.println("�� ���Աݾ� ��Ʈ�ѷ� : " + monthly_pay);
		//�ܾ� : ������ ���� ����ݾ�(borrower_balance)
		int balance = borrowerDAOService.lessMonthlypay(borrower);
		//���� ������� �ܾ�
		int account_virtual_balance = accountDAOService.getAccountBalance(borrower_id);
		
		BorrowerVO getBorrower = borrowerDAOService.getBorrower(borrower);
		
		result.addObject("monthly_pay", monthly_pay);
		result.addObject("balance", balance);
		result.addObject("account_virtual_balance", account_virtual_balance);
		result.addObject("borrower", getBorrower);
		
		result.setViewName("mypage_myloan_deposit");
		
		return result;
	}
	
	/*2017-08-01 ���� : ����� ��ȯ action*/
	@RequestMapping("/mypageMyloanDepositAction.do")
	public String mypage_loan_income_result(HttpSession session, HttpServletRequest request, BorrowerVO borrower) {
		
		ModelAndView result = new ModelAndView();
		
		BorrowerVO getborrower = borrowerDAOService.getBorrower(borrower);

		// �Ա� �ݾ�
		int amount = Integer.parseInt(request.getParameter("deposit_amount"));
		// �Ա� �ݾ� ���� �� ���� ���̺� ����(�����)
		MemberVO getmember = memberDAOService.getMemberAccountById((String)session.getAttribute("id"));		
		AccountVO account= getmember.getAccount();
		amount = account.getAccount_balance() - amount;
		account.setAccount_balance(amount);
		account.setAccount_case(4);		
		accountDAOService.updateAccount(account);
		// �Ա� �ݾ� ���� �� ���� ���̺� ����(������)
		MemberVO muchmore = memberDAOService.getMemberAccountById("muchmore");
		AccountVO muchmore_account= muchmore.getAccount();
		amount = muchmore_account.getAccount_balance() + amount;
		muchmore_account.setAccount_balance(amount);
		muchmore_account.setAccount_case(7);
		accountDAOService.updateAccount(muchmore_account);
		
		//�ܾ�, ���� ����
		borrowerDAOService.updateBorrowerBalance(getborrower);
		borrowerDAOService.updateBorrowerStatus(borrower.getBorrower_id());

		return "redirect:/mypage_myloan.do";
	}

}

