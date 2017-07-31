package com.spring.muchmore.invest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.muchmore.borrower.BorrowerDAOService;
import com.spring.muchmore.borrower.BorrowerVO;
import com.spring.muchmore.member.MemberVO;


@Controller
public class InvestController {
	
	@Autowired
	private InvestDAOService investDAOService;
	@Autowired
	private BorrowerDAOService borrowerDAOService;
	
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

}
