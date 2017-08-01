package com.spring.muchmore.invest;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.muchmore.borrower.BorrowerDAOService;
import com.spring.muchmore.borrower.BorrowerVO;
import com.spring.muchmore.member.MemberDAOService;
import com.spring.muchmore.member.MemberVO;
import com.spring.muchmore.invest.InvestVO;

@Controller
public class InvestController {
	
	@Autowired
	private InvestDAOService investDAOService;
	@Autowired
	private BorrowerDAOService borrowerDAOService;
	@Autowired
	private MemberDAOService memberDAOService;
	
	// 2017-07-29 ���� : �����ϱ� ������ �̵�
	@RequestMapping("invest.do")
	public ModelAndView invest(HttpSession session, MemberVO member){
		ModelAndView result = new ModelAndView();
		
		String id = (String)session.getAttribute("id");
		
		if (session.getAttribute("id") != null) {// �α��� �� ���¶�� �� ��ǰ�� �ߺ� ���� �Ұ� ó��
			//���� �α����� ȸ���� ������ ��ǰ ����Ʈ ��������
			List<InvestVO> id_invest_list = investDAOService.getInvestById(id);
			result.addObject("id_invest_list", id_invest_list);
		}
		
		BorrowerVO borrower = new BorrowerVO();
		borrower.setBorrower_id(id);
		// ��ǰ ����Ʈ �ҷ�����
		List<BorrowerVO> invest_list = borrowerDAOService.getBorrowerList(borrower);
		result.addObject("invest_list", invest_list);
		result.setViewName("invest");
		return result;
	}
	
	//2017-07-31 ���� : �����ϱ�-��ǰ�󼼺��� �̵�
	@RequestMapping("invest_detail.do")
	public ModelAndView invest_detail(BorrowerVO borrower, HttpServletResponse response, HttpSession session)
			throws IOException {

		ModelAndView result = new ModelAndView();
		String id = (String) session.getAttribute("id");			

		// �����ڿ� ��ǰ ���� �������� : �Ķ���� ������ ���̵�
		BorrowerVO get_borrowerVO = borrowerDAOService.getBorrower(borrower);
		// ������ ����� ���� �� ���ڱݾ� �������� : �Ķ���� ���� ��ǰ ���̵�
		int total_invest = investDAOService.getTotalInvestSum(get_borrowerVO.getGoodsVO().getGoods_num());
		// �����ڿ� ���� ���� : �Ķ���� ������ ���̵�
		MemberVO vo = new MemberVO();
		vo.setMember_id(borrower.getBorrower_id());
		MemberVO member = memberDAOService.getMember(vo);
		// 20170710 ���� - ����Ƚ�� ��������
		int borrowerCount = borrowerDAOService.getBorrowerCountById(get_borrowerVO.getBorrower_id());
		// 20170710 ���� - ����Ƚ�� ��������
		int investCount = investDAOService.getInvestCountById(get_borrowerVO.getBorrower_id());

		if (session.getAttribute("id") != null) {
			//�� ��ǰ�� �ߺ� ���� �Ұ� ó��
			//���� �α����� ȸ���� ������ ��ǰ ����Ʈ ��������
			List<InvestVO> id_invest_list = investDAOService.getInvestById(id);
			result.addObject("id_invest_list", id_invest_list);
			//���� ��ǰ�� ���� �Ұ��ϵ��� ����
			if (id.equals(borrower.getBorrower_id())) {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('������ �����ǰ���� ���ڰ� �Ұ��մϴ�.');");
				out.println("location.href='invest.do'");
				out.println("</script>");
				out.close();
			}
		}	
		
		// ���� Ƚ��
		result.addObject("borrowerCount", borrowerCount);
		// ����Ƚ��
		result.addObject("investCount", investCount);
		// ������ ����
		result.addObject("borrower_info", member);
		// �� ��ǰ�� ���� �� ���ڱݾ�
		result.addObject("total_invest", total_invest);
		// ��ǰ ������ ������ ����
		result.addObject("borrowergoods", get_borrowerVO);

		result.setViewName("invest_detail");
		return result;
	}
	
	//2017-07-31 ���� : �����ϱ� �ݾ� ���� ������ �̵�
	@RequestMapping("invest_investform.do")
	public ModelAndView invest_investform(BorrowerVO borrower, HttpServletResponse response, HttpSession session)
			throws IOException {
		System.out.println("investcontroller_investform");
		ModelAndView result = new ModelAndView();
		String id = (String) session.getAttribute("id");
		BorrowerVO getborrower = borrowerDAOService.getBorrower(borrower);

		if (id.equals(borrower.getBorrower_id())) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('������ �����ǰ���� ���ڰ� �Ұ��մϴ�.');");
			out.println("location.href='invest.do'");
			out.println("</script>");
			out.close();
		}

		//�α��� ������� ���� �ܾ� ��������
		int balance = memberDAOService.getMemberAccountById(id).getAccount().getAccount_balance();		
		result.addObject("borrower", getborrower);
		result.addObject("balance", balance);
		result.setViewName("invest_investform");

		return result;
	}
	
	//2017-07-31 ���� : �����ϱ� ��ư Ŭ��
	@RequestMapping("invest_investResult.do")
	public String invest_investAction(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			InvestVO invest, BorrowerVO borrower) throws IOException {
		/* ModelAndView result = new ModelAndView(); */

		//�ܾ�
		int balance = Integer.parseInt(request.getParameter("balance"));
		//����ݾ�
		int goods_sum = Integer.parseInt(request.getParameter("goodsVO.goods_sum"));
		//�� ���ڱݾ�
		int goods_invest = Integer.parseInt(request.getParameter("goodsVO.goods_invest"));

		PrintWriter out = response.getWriter();
		if ((invest.getInvest_sum() > balance) || (balance == 0)) {
			out.println("<script>");
			out.println("alert('�ܾ��� �����մϴ�. �ܾ� ������ �ʿ��մϴ�.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			if((invest.getInvest_sum()) > (goods_sum - goods_invest)) {
				out.println("<script>");
				out.println("alert('���� ���ɱݾ׺��� ���� �ݾ��� ������ �� �����ϴ�.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			}
		}		
		else {
			BorrowerVO getborrower = borrowerDAOService.getBorrower(borrower);

			int period = getborrower.getBorrower_loanperiod();
			// �� ���� ���ͱ� ���
			// �� ��ȯ�� ���
			// goodsVO.goods_sum(����), borrower_rate(������,float)
			// borrower_loanperiod(��ȯ ������)
			int A = invest.getInvest_sum(); // �� ���� �ݾ�
			double B = (Math.round((getborrower.getGoodsVO().getGoods_rate() / period) * 10000)) * 0.000001;	// ������
			double denominator; // ����
			double numerator; // �и�

			denominator = A * B * Math.pow((1 + B), period);
			numerator = Math.pow((1 + B), period) - 1;
			invest.setInvest_return((int) (Math.floor(denominator / numerator)) * period);

			investDAOService.insertInvest(invest);
		}
		return "invest_investResult";
	}

}
