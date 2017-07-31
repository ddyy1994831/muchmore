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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.muchmore.borrower.BorrowerDAOService;
import com.spring.muchmore.borrower.BorrowerVO;
import com.spring.muchmore.goods.GoodsVO;
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
	private MoneyinoutDAOService moneyinoutDAOService;
	
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
		member.setMember_id(id);
		String password = request.getParameter("member_pw1");
		

		MemberVO vo = memberDAOService.getMember(member);
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
		System.out.println("받아오노라 : " +request.getParameter("goods_num"));
		System.out.println("1212aaa" +request.getParameter("borrower_registerdate"));
		
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
	
	/*2017-07-30 혜림 : mypage_myaccount로 이동*/
	@RequestMapping("mypage_myaccount.do")
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

}
