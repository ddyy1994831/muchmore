package com.spring.muchmore.invest;

import java.util.List;

import com.spring.muchmore.invest.InvestVO;

public interface InvestMapper {
	
	/* 2017-07-30 ���� : ���� ����  ���� ��������(ListŸ��) */
	public List<InvestVO> getInvestById(String id);
}
