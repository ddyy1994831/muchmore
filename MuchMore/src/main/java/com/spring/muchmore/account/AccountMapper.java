package com.spring.muchmore.account;

public interface AccountMapper {

	/*���� : ������¿� �Ա��ϱ�*/
	public void updateAccount(AccountVO account);
	
	/*���� : �ǰ��� ���*/
	public void updateAccountRegister(AccountVO account);
	
	/*�ٿ� : ������� �ܾ� ���*/
	public int getAccountBalance(String member_id);
	
	/*���� : ������ ���� ����� */
	public void updateAccountAdmin(AccountVO account);
}
