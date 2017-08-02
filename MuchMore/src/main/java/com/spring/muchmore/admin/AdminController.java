package com.spring.muchmore.admin;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.spring.muchmore.moneyinout.MoneyinoutDAOService;
import com.spring.muchmore.moneyinout.MoneyinoutVO;

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
	
	@Autowired
	private MoneyinoutDAOService moneyinoutDAOService;
	
	/*2017-08-01 성현 : admin - 회원관리 페이지 이동 */
	@RequestMapping("admin_member.do")
	public String adminmember(Model model) {
		List<MemberVO> member = memberDAOService.getMemberList(); 
		model.addAttribute("member", member);
		return "admin_member";
	}
	
	/*2017-08-01 성현 : admin - 회원관리 상세보기 페이지 이동*/
	@RequestMapping("admin_memberdetail.do")
	public ModelAndView adminmemberdetail(HttpServletRequest request) {
		ModelAndView result = new ModelAndView();
		String id = request.getParameter("member_id");
		
		//사용자의 총 대출횟수와 대출내역 중 '상환완료'인 대출횟수 구하기(탈퇴가능여부 비교 위해)
		int borrower_id_total = borrowerDAOService.getBorrowerCountById(id);
		int borrower_id_complete = borrowerDAOService.getBorrowerCountByIdComplete(id);
		//사용자의 총 투자횟수와 투자내역 중 '지급완료'인 투자횟수 구하기(탈퇴가능여부 비교 위해) 
		int invest_id_total = investDAOService.getInvestCountById(id);
		int invest_id_complete = investDAOService.getInvestCountByIdComplete(id);

		//사용자의 대출내역 가져오기
		BorrowerVO borrower = new BorrowerVO();
		borrower.setBorrower_id(id);
		List<BorrowerVO> borrower_list = (List<BorrowerVO>)borrowerDAOService.getBorrowerListById(borrower);
		//사용자의 투자내역 가져오기
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

	
	/* 2017-08-01 혜림 : 대출금 지급 페이지로 이동*/
	@RequestMapping("adminLoanList.do")
	public ModelAndView loanList() {
		ModelAndView result = new ModelAndView();
		
		//전체 대출 리스트 가져오기
		List<BorrowerVO> borrower_list = borrowerDAOService.getBorrowerList();
		
		result.addObject("borrower_list", borrower_list);
		result.setViewName("admin_loan_list");
		return result;
	}
	
	/*2017-08-01 혜림 : 대출금 지급 새로운 창 띄우기*/
	@RequestMapping("adminLoanSend.do")
	public ModelAndView loanSend(BorrowerVO borrower) {
		ModelAndView result = new ModelAndView();
		
		//대출자 아이디 받아오기
		System.out.println("대출금 지급 : 대출자 아이디 : "+borrower.getBorrower_id());
		//해당 대출자의 상품 번호 받아오기
		System.out.println("대출금 지급 : 대출 상품 번호 : "+borrower.getGoodsVO().getGoods_num());
		
		//대출자 계좌정보 가져오기
		MemberVO member = memberDAOService.getMemberAccountById(borrower.getBorrower_id());
		//대출중인 상품 가져오기
		member.setBorrower(borrowerDAOService.getBorrower(borrower));
		
		result.addObject("borrower", member);
		result.setViewName("admin_loan_send");
		return result;
	}
	

	/* 2017-08-01 혜림 : 대출금 지급 Action */
	@RequestMapping("adminLoanSendAction.do")
	public String loanSendAction(BorrowerVO borrower) {
		
		System.out.println("대출금 지급 : " +borrower.getBorrower_id());
		System.out.println("대출금 지급 : " +borrower.getGoodsVO().getGoods_num());
		
		
		//대출자 정보 가져오기
		MemberVO member = memberDAOService.getMemberAccountById(borrower.getBorrower_id());
		member.setBorrower(borrowerDAOService.getBorrower(borrower));

		//관리자 정보 가져오기
		MemberVO admin = memberDAOService.getMemberAccountById("muchmore");
		
		//지급액
		int amount = member.getBorrower().getGoodsVO().getGoods_sum();
		
		//대출자 계좌에 입금하기
		member.getAccount().setAccount_case(5);
		member.getAccount().setAccount_balance(member.getAccount().getAccount_balance() + amount);
		accountDAOService.updateAccount(member.getAccount());
		
		//관리자 계좌에서 출금하기
		admin.getAccount().setAccount_case(7);
		admin.getAccount().setAccount_balance(admin.getAccount().getAccount_balance() - amount);
		accountDAOService.updateAccountAdmin(admin.getAccount());
		
		//대출자 상태 바꾸기
		//borrower_startdate : sysdate, borrower_enddate = sysdate + loanperiod
		//borrower_payok : 지급완료, borrower_status : 상환중
		member.getBorrower().setBorrower_status("상환중");
		member.getBorrower().setBorrower_payok("지급완료");
		borrowerDAOService.updateBorrowerPayBack(member.getBorrower());
		return "redirect:/adminLoanList.do";
	}

	/* 성현 admin page : 회원관리 페이지 - 탈퇴 open url */
	@RequestMapping("admin_memberdropout.do")
	public ModelAndView adminmemberdropout(MemberVO member, Model model) {
		ModelAndView result = new ModelAndView();
		String id = member.getMember_id();

		//사용자의 총 대출횟수와 대출내역 중 '상환완료'인 대출횟수 구하기(탈퇴가능여부 비교 위해)
		int borrower_id_total = borrowerDAOService.getBorrowerCountById(id);
		int borrower_id_complete = borrowerDAOService.getBorrowerCountByIdComplete(id);
		//사용자의 총 투자횟수와 투자내역 중 '지급완료'인 투자횟수 구하기(탈퇴가능여부 비교 위해) 
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

	/* 성현 admin page : 탈퇴 버튼 클릭 후 탈퇴 작동 */
	@RequestMapping("admin_member_dropoutAction.do")
	public String adminmemberdropoutaction(HttpServletRequest request, Model model) {

		String id = request.getParameter("member_id");

		memberDAOService.deleteMember(id);

		return "redirect:/admin_member.do";

	}
	
	/* 2017-08-01 혜림 : 대출금 지급페이지 회원아이디 클릭 : 자세히 보기 */
	@RequestMapping("adminLoanDetail.do")
	public ModelAndView loanDetail(BorrowerVO borrower) {
		ModelAndView result = new ModelAndView();
		
		System.out.println("ddd:" +borrower.getBorrower_id());
		
		MemberVO member = memberDAOService.getMemberAccountById(borrower.getBorrower_id());
		member.setBorrower(borrowerDAOService.getBorrower(borrower));
		
		result.addObject("borrower", member);
		result.setViewName("admin_loan_detail");
		return result;
	}
	
	/* 2017-08-01 혜림 : 제출 서류 다운로드 */
	@RequestMapping("loanFileDownload.do")
	public void loanFileDownloadAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("EUC-KR");

		String of = request.getParameter("of"); // 서버에 업로드되면서 바뀐 파일 이름
		String of2 = request.getParameter("of2"); // 실제 업로드할 때 사용했던 파일 이름
		// System.out.println("/fileDownload?of=" + of);
		// System.out.println(of);

		// 웹사이트 루트디렉토리의 실제 디스크상의 경로 알아내기.
		// String uploadPath =
		// request.getSession().getServletContext().getRealPath("/upload");
		// String fullPath = uploadPath + "/" + of;
		String uploadPath = "C:\\hk0327\\upload\\";
		String fullPath = uploadPath + of;

		// System.out.println("path : " + uploadPath);
		// System.out.println("fullPath :" + fullPath);
		File downloadFile = new File(fullPath);

		// 파일 다운로드를 위해 컨텐츠 타입을 application/download 설정
		response.setContentType("application/download; charset=UTF-8");

		// 파일 사이즈 지정
		response.setContentLength((int) downloadFile.length());

		// 다운로드 창을 띄우기 위한 헤더 조작
		response.setHeader("Content-Disposition", "attachment;filename=" + new String(of2.getBytes(), "ISO8859-1"));

		response.setHeader("Content-Transfer-Encoding", "binary");

		// Content-dispostion 속성
		// 1) "Content-disposition: attachment" 브라우저 인식 파일 확장자를 포함해 모든 확장자의 파일들에
		// 대해 다운로드 시 무조건 "파일 다운로드" 대화상자가 뜨도록 하는 헤더 속성.
		// 2) "Content-disposition: inline" 브라우저 인식 파일확장자를 가진 파일들에 대해서는 웹 브라우저
		// 상에서 바로 파일을 열고 그 외의 파일들에 대해서는 "파일 다운로드" 대화상자가 뜨도록 하는 헤더 속성.

		FileInputStream fin = new FileInputStream(downloadFile);
		ServletOutputStream sout = response.getOutputStream();

		byte[] buf = new byte[1024];
		int size = -1;

		while ((size = fin.read(buf, 0, buf.length)) != -1) {
			sout.write(buf, 0, size);
		}
		fin.close();
		sout.close();
	}
	
	/*2017-08-01 혜림 : 대출 서류 심사 승인하기 */
	@RequestMapping("loanApproval.do")
	public String loanApprovalAction(BorrowerVO borrower) {
		
		BorrowerVO getborrower = borrowerDAOService.getBorrower(borrower);
		getborrower.setBorrower_status("대출신청");
		borrowerDAOService.updateBorrowerStatusByAdmin(getborrower);
		
		return "redirect:/adminLoanList.do";
	}
	
	/*2017-08-01 다예 : 관리자페이지 -입출금내역*/
	@RequestMapping("/adminAccount.do")
	public ModelAndView AccountList(HttpServletRequest request, MoneyinoutVO moneyinout) {
		ModelAndView result = new ModelAndView();
		
		List<MoneyinoutVO> moneyinout_list = moneyinoutDAOService.getAdimList();
		
		result.addObject("moneyinout_list", moneyinout_list);
		result.setViewName("admin_account");

		return result;
	}
}
