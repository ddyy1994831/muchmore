package com.spring.muchmore.moneyinout;

import java.util.List;

public interface MoneyinoutMapper {
	
	/*2017-07-30 ���� : ȸ�� ����� ���� ��ȸ*/
	public List<MoneyinoutVO> selectMoneyinoutById(String id);
	
	/*2017-08-01 �ٿ� : ������������ - muchmore ����ݳ��� ���*/
	public List<MoneyinoutVO> getAdimList();
}
