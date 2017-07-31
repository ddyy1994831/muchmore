package com.spring.muchmore.invest;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.muchmore.invest.InvestMapper;
import com.spring.muchmore.invest.InvestVO;

@Repository
public class InvestDAOService implements InvestDAO {
	@Autowired
	private SqlSession sqlSession;

	/* 2017-07-30 ���� : ���� ����  ���� ��������(ListŸ��) */
	@Override
	public List<InvestVO> getInvestById(String id) {
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		List<InvestVO> invest = investMapper.getInvestById(id);
		return invest;
	}

	/*2017-07-31 ���� : �ش� ��ǰ�� ���� �� ���ڱݾ�*/
	@Override
	public int getTotalInvestSum(int goods_num) {
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		int cnt = investMapper.getTotalInvestSum(goods_num);
		return cnt;
	}

	/*2017-07-31 ���� : ������� ����Ƚ�� ���ϱ�*/
	@Override
	public int getInvestCountById(String member_id) {
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		int cnt = investMapper.getInvestCountById(member_id);
		return cnt;
	}
	
	/*2017-07-31 ���� : �������̺� ������ �߰�*/
	@Override
	public void insertInvest(InvestVO invest){
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		investMapper.insertInvest(invest);
	}	
}
