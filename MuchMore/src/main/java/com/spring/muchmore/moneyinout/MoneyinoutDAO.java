package com.spring.muchmore.moneyinout;

import java.util.List;

public interface MoneyinoutDAO {
	
	/*���� : ȸ�� ����� ���� ��ȸ*/
	public List<MoneyinoutVO> selectMoneyinoutById(String id);

	/*�ٿ� : ������������ - muchmore ����ݳ��� ���*/
	public List<MoneyinoutVO> getAdimList(int page, int limit);

	/*�ٿ� : ������������ - moneyinout ����*/
	public int getAdminListCount();
}
