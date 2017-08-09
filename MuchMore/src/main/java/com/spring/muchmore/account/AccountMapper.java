package com.spring.muchmore.account;

public interface AccountMapper {

	/*혜림 : 가상계좌에 입금하기*/
	public void updateAccount(AccountVO account);
	
	/*혜림 : 실계좌 등록*/
	public void updateAccountRegister(AccountVO account);
	
	/*다예 : 가상계좌 잔액 출력*/
	public int getAccountBalance(String member_id);
	
	/*혜림 : 관리자 계좌 입출금 */
	public void updateAccountAdmin(AccountVO account);
}
