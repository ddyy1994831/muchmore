package com.spring.muchmore.moneyinout;

import java.util.HashMap;
import java.util.List;

public interface MoneyinoutMapper {
	
	/*���� : ȸ�� ����� ���� ��ȸ*/
	public List<MoneyinoutVO> selectMoneyinoutById(String id);
	
	/*�ٿ� : ������������ - muchmore ����ݳ��� ���*/
	public List<MoneyinoutVO> getAdimList(HashMap<String, Integer> param);

	/*�ٿ� : ������������ - moneyinout ����*/
	public int getAdminListCount();
}
