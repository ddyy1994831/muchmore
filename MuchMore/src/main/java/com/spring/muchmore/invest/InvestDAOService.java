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

	/*���� : ���� ����  ���� ��������(ListŸ��)*/
	@Override
	public List<InvestVO> getInvestById(String id) {
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		List<InvestVO> invest = investMapper.getInvestById(id);
		return invest;
	}

	/*���� : �ش� ��ǰ�� ���� �� ���ڱݾ�*/
	@Override
	public int getTotalInvestSum(int goods_num) {
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		int cnt = investMapper.getTotalInvestSum(goods_num);
		return cnt;
	}

	/*���� : ������� ����Ƚ�� ���ϱ�*/
	@Override
	public int getInvestCountById(String id) {
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		int cnt = investMapper.getInvestCountById(id);
		return cnt;
	}
	
	/*���� : ������� ����Ƚ�� �� ���ڱ� ������ �Ϸ�� Ƚ��*/
	@Override
	public int getInvestCountByIdComplete(String id) {
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		int cnt = investMapper.getInvestCountByIdComplete(id);
		return cnt;
	}
	
	/*���� : �������̺� ������ �߰�*/
	@Override
	public void insertInvest(InvestVO invest){
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		investMapper.insertInvest(invest);
	}

	/*���� : �ϳ��� ��ǰ�� ������ ȸ���� ����Ʈ*/
	@Override
	public List<InvestVO> getInvestListByGoodsNum(int goods_num) {
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		List<InvestVO> result = investMapper.getInvestListByGoodsNum(goods_num);
		return result;
	}

	/*���� : ���ڱ� ��ȯ ���� ������Ʈ*/
	@Override
	public void updateInvest(InvestVO invest) {
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		investMapper.updateInvest(invest);
	}

	/*���� : �ش� ȸ���� �ش� ��ǰ�� ������ ���� ��������*/
	@Override
	public InvestVO getInvestByIdGoodsNum(InvestVO invest) {
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		InvestVO result = investMapper.getInvestByIdGoodsNum(invest);
		return result;
	}

		
}
