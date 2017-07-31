package com.spring.muchmore.moneyinout;

import java.util.List;

public interface MoneyinoutMapper {
	
	/*2017-07-30 혜림 : 회원 입출금 내역 조회*/
	public List<MoneyinoutVO> selectMoneyinoutById(String id);
}
