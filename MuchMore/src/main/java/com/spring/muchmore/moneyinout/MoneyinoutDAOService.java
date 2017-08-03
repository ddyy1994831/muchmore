package com.spring.muchmore.moneyinout;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MoneyinoutDAOService implements MoneyinoutDAO {
	@Autowired
	private SqlSession sqlSession;

	/*2017-07-30 혜림 : 회원 입출금 내역 조회*/
	@Override
	public List<MoneyinoutVO> selectMoneyinoutById(String id) {
		// TODO Auto-generated method stub
		MoneyinoutMapper moneyinoutMapper = sqlSession.getMapper(MoneyinoutMapper.class);
		List<MoneyinoutVO> result = moneyinoutMapper.selectMoneyinoutById(id);
		return result;
	}
	
	/*2017-08-01 다예 : 관리자페이지 - muchmore 입출금내역 출력*/
	@Override
	public List<MoneyinoutVO> getAdimList() {
		// TODO Auto-generated method stub
		MoneyinoutMapper moneyinoutMapper = sqlSession.getMapper(MoneyinoutMapper.class);
		List<MoneyinoutVO> result = moneyinoutMapper.getAdimList();
		System.out.println("MoneyinoutService getAdminList = " + result);
		
		return result;
	}
}