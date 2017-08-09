package com.spring.muchmore.account;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDAOService implements AccountDAO {
	@Autowired
	private SqlSession sqlSession;

	/*���� : ������¿� �Ա��ϱ�*/
	@Override
	public void updateAccount(AccountVO account) {
		// TODO Auto-generated method stub
		AccountMapper accountMapper = sqlSession.getMapper(AccountMapper.class);
		accountMapper.updateAccount(account);
	}
	
	/*���� : �ǰ��� ���*/
	@Override
	public void updateAccountRegister(AccountVO account) {
		// TODO Auto-generated method stub
		AccountMapper accountMapper = sqlSession.getMapper(AccountMapper.class);
		accountMapper.updateAccountRegister(account);
	}

	@Override
	/*�ٿ� : ������� �ܾ� ���*/
	public int getAccountBalance(String member_id){
		// TODO Auto-generated method stub
		AccountMapper accountMapper = sqlSession.getMapper(AccountMapper.class);
		int balance = accountMapper.getAccountBalance(member_id);
		
		return balance;
	}

	/*���� : ������ ���� ����� */
	@Override
	public void updateAccountAdmin(AccountVO account) {
		// TODO Auto-generated method stub
		AccountMapper accountMapper = sqlSession.getMapper(AccountMapper.class);
		accountMapper.updateAccountAdmin(account);
	}
}
