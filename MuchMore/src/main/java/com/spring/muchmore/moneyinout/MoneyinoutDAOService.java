package com.spring.muchmore.moneyinout;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MoneyinoutDAOService implements MoneyinoutDAO {
	@Autowired
	private SqlSession sqlSession;

	/*혜림 : 회원 입출금 내역 조회*/
	@Override
	public List<MoneyinoutVO> selectMoneyinoutById(String id) {
		// TODO Auto-generated method stub
		MoneyinoutMapper moneyinoutMapper = sqlSession.getMapper(MoneyinoutMapper.class);
		List<MoneyinoutVO> result = moneyinoutMapper.selectMoneyinoutById(id);
		return result;
	}
	
	/*다예 : 관리자페이지 - muchmore 입출금내역 출력*/
	@Override
	public List<MoneyinoutVO> getAdimList(int page, int limit) {
		// TODO Auto-generated method stub
		MoneyinoutMapper moneyinoutMapper = sqlSession.getMapper(MoneyinoutMapper.class);
		List<MoneyinoutVO> result = new ArrayList<MoneyinoutVO>();
		
		int startrow = (page-1) * 10 + 1;
		int endrow = startrow + limit - 1;
		
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		param.put("startrow", startrow);
		param.put("endrow", endrow);

		result = moneyinoutMapper.getAdimList(param);
		
		return result;
	}
	
	/*다예 : 관리자페이지 - moneyinout 개수*/
	@Override
	public int getAdminListCount() {
		// TODO Auto-generated method stub
		System.out.println("MoneyinoutDAOService-getAdminListCount()");
		
		MoneyinoutMapper moneyinoutMapper = sqlSession.getMapper(MoneyinoutMapper.class);
		int cnt = moneyinoutMapper.getAdminListCount();
		
		return cnt;
	}
}