package com.spring.muchmore.invest;

import java.util.List;

public interface InvestDAO {
	
	/* 2017-07-30 ���� : ���� ����  ���� ��������(ListŸ��) */
	public List<InvestVO> getInvestById(String id);
	
	/*2017-07-31 ���� : �ش� ��ǰ�� ���� �� ���ڱݾ�*/
	public int getTotalInvestSum(int goods_num);
	
	/*2017-07-31 ���� : ������� ����Ƚ�� ���ϱ�*/
	public int getInvestCountById(String id);
	
	/*2017-08-01 ���� : ������� ����Ƚ�� �� ���ڱ� ������ �Ϸ�� Ƚ��*/
	public int getInvestCountByIdComplete(String id);
	
	/*2017-07-31 ���� : �������̺� ������ �߰�*/
	public void insertInvest(InvestVO invest);
	
	/*2017-08-02 ���� : �ϳ��� ��ǰ�� ������ ȸ���� ����Ʈ*/
	public List<InvestVO> getInvestListByGoodsNum(int goods_num);
}
