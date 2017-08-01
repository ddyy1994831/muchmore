package com.spring.muchmore.account;

public interface AccountMapper {

	/*2017-07-31 혜림 : 가상계좌에 입금하기*/
	public void updateAccountDeposit(AccountVO account);
	
	/*2017-07-31 혜림 : 실계좌 등록*/
	public void updateAccountRegister(AccountVO account);
	
	/*2017-08-01 다예 : 가상계좌 잔액 출력*/
	public int getAccountBalance(String member_id);
	
}
