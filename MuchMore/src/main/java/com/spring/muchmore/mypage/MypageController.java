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
		member.setMember_id(id);
		String password = request.getParameter("member_pw1");
		

		MemberVO vo = memberDAOService.getMember(member);
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
		System.out.println("�޾ƿ���� : " +request.getParameter("goods_num"));
		System.out.println("1212aaa" +request.getParameter("borrower_registerdate"));
		
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
	
	/*2017-07-30 ���� : mypage_myaccount�� �̵�*/
	@RequestMapping("mypage_myaccount.do")
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

}
