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

}
