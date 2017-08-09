package com.spring.muchmore.account;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDAOService implements AccountDAO {
	@Autowired
	private SqlSession sqlSession;

	/*혜림 : 가상계좌에 입금하기*/
	@Override
	public void updateAccount(AccountVO account) {
		// TODO Auto-generated method stub
		AccountMapper accountMapper = sqlSession.getMapper(AccountMapper.class);
		accountMapper.updateAccount(account);
	}
	
	/*혜림 : 실계좌 등록*/
	@Override
	public void updateAccountRegister(AccountVO account) {
		// TODO Auto-generated method stub
		AccountMapper accountMapper = sqlSession.getMapper(AccountMapper.class);
		accountMapper.updateAccountRegister(account);
	}

	@Override
	/*다예 : 가상계좌 잔액 출력*/
	public int getAccountBalance(String member_id){
		// TODO Auto-generated method stub
		AccountMapper accountMapper = sqlSession.getMapper(AccountMapper.class);
		int balance = accountMapper.getAccountBalance(member_id);
		
		return balance;
	}

	/*혜림 : 관리자 계좌 입출금 */
	@Override
	public void updateAccountAdmin(AccountVO account) {
		// TODO Auto-generated method stub
		AccountMapper accountMapper = sqlSession.getMapper(AccountMapper.class);
		accountMapper.updateAccountAdmin(account);
	}
}
