package com.spring.muchmore.moneyinout;

import java.util.List;

public interface MoneyinoutMapper {
	
	/*혜림 : 회원 입출금 내역 조회*/
	public List<MoneyinoutVO> selectMoneyinoutById(String id);
	
	/*다예 : 관리자페이지 - muchmore 입출금내역 출력*/
	public List<MoneyinoutVO> getAdimList();

}
