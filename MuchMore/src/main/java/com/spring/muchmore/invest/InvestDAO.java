package com.spring.muchmore.invest;

import java.util.List;

public interface InvestDAO {
	
	/* 2017-07-30 ���� : ���� ����  ���� ��������(ListŸ��) */
	public List<InvestVO> getInvestById(String id);

}
