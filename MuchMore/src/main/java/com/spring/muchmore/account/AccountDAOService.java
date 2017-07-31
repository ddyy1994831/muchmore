package com.spring.muchmore.account;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDAOService implements AccountDAO {
	@Autowired
	private SqlSession sqlSession;

	/*2017-07-31 Çý¸² : °¡»ó°èÁÂ¿¡ ÀÔ±ÝÇÏ±â*/
	@Override
	public void updateAccountDeposit(AccountVO account) {
		// TODO Auto-generated method stub
		AccountMapper accountMapper = sqlSession.getMapper(AccountMapper.class);
		accountMapper.updateAccountDeposit(account);
	}
	
	/*2017-07-31 Çý¸² : ½Ç°èÁÂ µî·Ï*/
	@Override
	public void updateAccountRegister(AccountVO account) {
		// TODO Auto-generated method stub
		AccountMapper accountMapper = sqlSession.getMapper(AccountMapper.class);
		accountMapper.updateAccountRegister(account);
	}

}
