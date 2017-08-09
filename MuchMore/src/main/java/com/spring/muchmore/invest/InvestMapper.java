package com.spring.muchmore.invest;

import java.util.List;

import com.spring.muchmore.invest.InvestVO;

public interface InvestMapper {
	
	/*���� : ���� ����  ���� ��������(ListŸ��)*/
	public List<InvestVO> getInvestById(String id);
	
	/*���� : �ش� ��ǰ�� ���� �� ���ڱݾ�*/
	public int getTotalInvestSum(int goods_num);
	
	/*���� : ������� ����Ƚ�� ���ϱ�*/
	public int getInvestCountById(String id);
	
	/*���� : ������� ����Ƚ�� �� ���ڱ� ������ �Ϸ�� Ƚ��*/
	public int getInvestCountByIdComplete(String id);
	
	/*���� : �������̺� ������ �߰�*/
	public void insertInvest(InvestVO invest);
	
	/*���� : �ϳ��� ��ǰ�� ������ ȸ���� ����Ʈ*/
	public List<InvestVO> getInvestListByGoodsNum(int goods_num);
	
	/*���� : ���ڱ� ��ȯ ���� ������Ʈ*/
	public void updateInvest(InvestVO invest);
	
	/*���� : �ش� ȸ���� �ش� ��ǰ�� ������ ���� ��������*/
	public InvestVO getInvestByIdGoodsNum(InvestVO invest);
}
