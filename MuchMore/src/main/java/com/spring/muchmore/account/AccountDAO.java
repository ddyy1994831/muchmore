package com.spring.muchmore.account;

public interface AccountDAO {

	/*2017-07-31 ���� : ������¿� �Ա��ϱ�*/
	public void updateAccountDeposit(AccountVO account);
	
	/*2017-07-31 ���� : �ǰ��� ���*/
	public void updateAccountRegister(AccountVO account);
	
	/*2017-08-01 �ٿ� : ������� �ܾ� ���*/
	public int getAccountBalance(String member_id);
}
