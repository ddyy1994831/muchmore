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
	
	//2017-07-29 성현 : 메인화면 이동
	@RequestMapping("mypage_main.do")
	public String mypage_main(){
		return "mypage_main";
	}
	
	//2017-07-29 성현 : 회원정보수정 비밀번호입력 화면 이동
	@RequestMapping("mypage_memberupdate.do")
	public String mypage_memberupdate(){
		return "mypage_memberupdate";
	}
	
	//2017-07-29 성현 : 회원정보수정 비밀번호입력 후 입력폼으로 이동
	@RequestMapping("mypage_memberupdateform.do")
	public ModelAndView memberUpdate(HttpSession session, MemberVO member, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		
		String id = (String)session.getAttribute("id");
		//getMember함수쓰기 위해 member에 session값 저장.
		String password = request.getParameter("member_pw1");
		

		MemberVO vo = memberDAOService.getMember(id);
		if (!(password.equals(vo.getMember_pw1()))) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}

		ModelAndView result = new ModelAndView();

		result.addObject("member", vo);
		result.setViewName("mypage_memberupdateform");

		return result;
	}
	
	//2017-07-29 성현 : 회원정보 수정하기 버튼 클릭
	@RequestMapping("mypage_memberupdatesuccess.do")
	public String memberUpdateSuccess(MemberVO member) {
		memberDAOService.updateMember(member);
		return "mypage_memberupdatesuccess";
	}
	
	//2017-07-03 혜림 : 대출 내역 화면으로 이동
	@RequestMapping("mypage_myloan.do")
	public ModelAndView mypage_myloan(HttpSession session) {
		
		ModelAndView result = new ModelAndView();
		//현재 로그인한 회원의 대출내역 가져오기
		//쿼리에 객체를 파라미터로 전달하기 위해 객체 생성
		BorrowerVO borrower = new BorrowerVO();
		//생서한 borrower 객체에 id 저장
		borrower.setBorrower_id((String)session.getAttribute("id"));
		//현재 로그인한 회원의 대출내역 가져오기
		List<BorrowerVO> borrower_list = borrowerDAOService.getBorrowerListById(borrower);
		
		result.addObject("borrower_list", borrower_list);
		result.setViewName("mypage_myloan");
		return result;
	}
	
	/*2017-07-03 혜림 : 대출 내역 화면에서 서류제출 페이지로 이동*/
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
	
	/*2017-07-03 혜림 : 서류 upload Action*/
	@RequestMapping("mypage_myloan_fileUploadAction.do")
	public String myloanFileUploadAction(MultipartHttpServletRequest request) throws Exception {
		
		//borrower에 받아온 데이터 다 넣기
		int goods_num = Integer.parseInt(request.getParameter("goods_num"));
		BorrowerVO borrower = new BorrowerVO();
		borrower.setBorrower_id((String)request.getParameter("borrower_id"));
		GoodsVO goods = new GoodsVO();
		goods.setGoods_num(goods_num);
		borrower.setGoodsVO(goods);
		
		borrower = borrowerDAOService.getBorrower(borrower);
		
		MultipartFile mf = request.getFile("borrower_file");
		
		//첨부파일이 없는 경우
		if(mf.getSize() == 0) {
			borrower.setBorrower_file("첨부파일없음");
			borrower.setBorrower_stored("첨부파일없음");
		}
		
		else {
			borrower.setBorrower_file(mf.getOriginalFilename());
			
			//업로드한 파일이 저장되는 파일
			String uploadPath = "C:\\hk0327\\upload\\";
			
			//파일 이름이 중복되지 않도록 처리
			String originalFileExtension = mf.getOriginalFilename()
					.substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;

			mf.transferTo(new File(uploadPath + storedFileName));
			
			borrower.setBorrower_file(mf.getOriginalFilename());
			borrower.setBorrower_stored(storedFileName);
			borrower.setBorrower_status("심사중");
			
			borrowerDAOService.uploadFile(borrower);
		}
		return "redirect:/mypage_myloan.do";
	}
	
	/*2017-07-29 성현 : 마이페이지 투자내역 으로 이동*/
	@RequestMapping("mypage_myinvest.do")
	public ModelAndView mypage_investinfo(Model model, HttpSession session) {
		ModelAndView result = new ModelAndView();
		
		String id = (String) session.getAttribute("id");

		List<InvestVO> invest = investDAOService.getInvestById(id);
		
		result.addObject("invest_list", invest);
		result.setViewName("mypage_myinvest");
		return result;
	}
	
	/*2017-07-30 혜림 : mypage_myaccount로 이동*/
	@RequestMapping("mypageMyaccount.do")
	public ModelAndView mypageMyaccount(HttpSession session) {
		ModelAndView result = new ModelAndView();
		
		String member_id = (String)session.getAttribute("id");
		System.out.println("id = " +member_id);
		//계좌 정보 불러오기
		MemberVO getmember = memberDAOService.getMemberAccountById(member_id);
		System.out.println("id = " +getmember.getAccount().getAccount_virtual());
		//입출금 내역 불러오기
		List<MoneyinoutVO> moneyinoutlist = moneyinoutDAOService.selectMoneyinoutById(member_id);
		
		result.addObject("getmember", getmember);
		result.addObject("moneyinoutlist", moneyinoutlist);
		result.setViewName("mypage_myaccount");
		return result;
	}
	
	/*2017-07-31 혜림 : mypage에서 myacccount탭에서 가상계좌로 입금하기 : 금액 입력 페이지로 이동*/
	@RequestMapping("mypageMyaccountDeposit.do")
	public String Depoist() {
		
		return "mypage_myaccount_deposit_input";
	}
	
	/*2017-07-31 혜림 : 입금하기 기능*/
	@RequestMapping("mypageMyaccountDepositAction.do")
	public String DepositAction(HttpServletRequest request, HttpSession session) {
		
		//입금할 금액
		int amount = Integer.parseInt(request.getParameter("amount"));
		System.out.println(amount);
		//해당 회원(로그인한 회원)
		String member_id = (String)session.getAttribute("id");
		MemberVO getmember = memberDAOService.getMemberAccountById(member_id);
		
		//입금하기 계좌 테이블에 넣기
		AccountVO account= getmember.getAccount();
		amount = account.getAccount_balance() + amount;
		account.setAccount_balance(amount);
		account.setAccount_case(1);
		
		accountDAOService.updateAccount(account);
		//입출금 내역에 넣기
		
		
		return "redirect:/mypageMyaccount.do";
	}
	
	/*2017-07-31 혜림 : 가상계좌 등록하기 새 창*/
	@RequestMapping("mypageRegisterAccount.do")
	public String registerAccount() {
		return "mypage_myaccount_register_account";
	}
	
	/*2017-07-31 혜림 : 실계좌 등록하기 기능*/
	@RequestMapping("mypageRegisterAccountAction.do")
	public String registerAccountAction(HttpSession session, HttpServletRequest request) throws Exception {
		String bank = (String)request.getParameter("bank");
		String real_account = (String)request.getParameter("real_account");
		
		//은행 구분
		if(bank.equals("KB")) {
			bank = "국민은행";
		}
		else if(bank.equals("IBK")) {
			bank = "기업은행";
		}
		else if(bank.equals("ShinHan")) {
			bank = "신한은행";
		}
		else if(bank.equals("Woori")) {
			bank = "우리은행";
		}
		else if(bank.equals("Hana")) {
			bank = "하나은행";
		}
		
		//로그인한 회원의 정보와 계좌 정보 가져오기
		String member_id = (String)session.getAttribute("id");
		MemberVO getmember = memberDAOService.getMemberAccountById(member_id);
		
		//실계좌 설정
		
		getmember.getAccount().setAccount_real(bank+real_account);
		//실계좌 등록하기
		accountDAOService.updateAccountRegister(getmember.getAccount());
		
		return "redirect:/mypageMyaccount.do";
	}
	
	/*2017-07-31 혜림 : 출금하기 금액 입력 새 창 페이지 이동*/
	@RequestMapping("mypageMyaccountWithdraw.do")
	public String Withdraw() {
		return "mypage_myaccount_withdraw_input";
	}

	/*2017-07-31 혜림 : 출금하기 기능*/
	@RequestMapping("mypageMyaccountWithdrawAction.do")
	public String WithdrawAction(HttpSession session, HttpServletRequest request) {
		
		//출금할 금액
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		String member_id = (String)session.getAttribute("id");
		
		MemberVO getmember = memberDAOService.getMemberAccountById(member_id);
		
		//입금하기 계좌 테이블에 넣기
		AccountVO account= getmember.getAccount();
		amount = account.getAccount_balance() - amount;
		account.setAccount_balance(amount);
		account.setAccount_case(2);
		
		accountDAOService.updateAccount(account);
		
		return "redirect:/mypageMyaccount.do";
	}
	
	/* 2017-08-01 다예 : mypage_myloan에서 대출금 상환 */
	@RequestMapping("/mypageMyloanDeposit.do")
	public ModelAndView myloanDeposit(BorrowerVO borrower, HttpSession session) {
		ModelAndView result = new ModelAndView();
		
		//현재 로그인한 사람이 대출자
		String borrower_id = (String)session.getAttribute("id");
		//월납입금액
		int monthly_pay = borrowerDAOService.getMonthlyDeposit(borrower);
		System.out.println("월 납입금액 컨트롤러 : " + monthly_pay);
		//잔액 : 앞으로 남은 대출금액(borrower_balance)
		int balance = borrowerDAOService.lessMonthlypay(borrower);
		//나의 가상계좌 잔액
		int account_virtual_balance = accountDAOService.getAccountBalance(borrower_id);
		
		BorrowerVO getBorrower = borrowerDAOService.getBorrower(borrower);
		
		result.addObject("monthly_pay", monthly_pay);
		result.addObject("balance", balance);
		result.addObject("account_virtual_balance", account_virtual_balance);
		result.addObject("borrower", getBorrower);
		
		result.setViewName("mypage_myloan_deposit");
		
		return result;
	}
	
	/*2017-08-01 성현 : 대출금 상환 action*/
	@RequestMapping("/mypageMyloanDepositAction.do")
	public String mypage_loan_income_result(HttpSession session, HttpServletRequest request, BorrowerVO borrower) {
		
		ModelAndView result = new ModelAndView();
		
		BorrowerVO getborrower = borrowerDAOService.getBorrower(borrower);

		// 입금 금액
		int amount = Integer.parseInt(request.getParameter("deposit_amount"));
		// 입금 금액 삽입 후 계좌 테이블 수정(사용자)
		MemberVO getmember = memberDAOService.getMemberAccountById((String)session.getAttribute("id"));		
		AccountVO account= getmember.getAccount();
		amount = account.getAccount_balance() - amount;
		account.setAccount_balance(amount);
		account.setAccount_case(4);		
		accountDAOService.updateAccount(account);
		// 입금 금액 삽입 후 계좌 테이블 수정(관리자)
		MemberVO muchmore = memberDAOService.getMemberAccountById("muchmore");
		AccountVO muchmore_account= muchmore.getAccount();
		amount = muchmore_account.getAccount_balance() + amount;
		muchmore_account.setAccount_balance(amount);
		muchmore_account.setAccount_case(7);
		accountDAOService.updateAccount(muchmore_account);
		
		//잔액, 상태 수정
		borrowerDAOService.updateBorrowerBalance(getborrower);
		borrowerDAOService.updateBorrowerStatus(borrower.getBorrower_id());

		return "redirect:/mypage_myloan.do";
	}

}

