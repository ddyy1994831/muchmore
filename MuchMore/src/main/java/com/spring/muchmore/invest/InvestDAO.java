package com.spring.muchmore.invest;

import java.util.List;

public interface InvestDAO {
	
	/* 2017-07-30 ���� : ���� ����  ���� ��������(ListŸ��) */
	public List<InvestVO> getInvestById(String id);
	
	/*2017-07-31 ���� : �ش� ��ǰ�� ���� �� ���ڱݾ�*/
	public int getTotalInvestSum(int goods_num);
	
	/*2017-07-31 ���� : ������� ����Ƚ�� ���ϱ�*/
	public int getInvestCountById(String member_id);
	
	/*2017-07-31 ���� : �������̺� ������ �߰�*/
	public void insertInvest(InvestVO invest);

}
