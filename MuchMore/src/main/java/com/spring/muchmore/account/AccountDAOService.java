package com.spring.muchmore.account;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDAOService implements AccountDAO {
	@Autowired
	private SqlSession sqlSession;

	/*2017-07-31 ���� : ������¿� �Ա��ϱ�*/
	@Override
	public void updateAccountDeposit(AccountVO account) {
		// TODO Auto-generated method stub
		AccountMapper accountMapper = sqlSession.getMapper(AccountMapper.class);
		accountMapper.updateAccountDeposit(account);
	}
	
	/*2017-07-31 ���� : �ǰ��� ���*/
	@Override
	public void updateAccountRegister(AccountVO account) {
		// TODO Auto-generated method stub
		AccountMapper accountMapper = sqlSession.getMapper(AccountMapper.class);
		accountMapper.updateAccountRegister(account);
	}

	/*2017-08-01 �ٿ� : ������� ���� ���*/
	@Override
	/*2017-08-01 �ٿ� : ������� �ܾ� ���*/
	public int getAccountBalance(String member_id){
		// TODO Auto-generated method stub
		AccountMapper accountMapper = sqlSession.getMapper(AccountMapper.class);
		
		int balance = accountMapper.getAccountBalance(member_id);
		
		return balance;
	}
}
