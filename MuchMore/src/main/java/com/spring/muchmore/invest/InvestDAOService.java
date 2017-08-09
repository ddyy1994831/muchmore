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

	/*성현 : 개인 투자  내역 가져오기(List타입)*/
	@Override
	public List<InvestVO> getInvestById(String id) {
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		List<InvestVO> invest = investMapper.getInvestById(id);
		return invest;
	}

	/*성현 : 해당 상품에 대한 총 투자금액*/
	@Override
	public int getTotalInvestSum(int goods_num) {
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		int cnt = investMapper.getTotalInvestSum(goods_num);
		return cnt;
	}

	/*성현 : 사용자의 투자횟수 구하기*/
	@Override
	public int getInvestCountById(String id) {
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		int cnt = investMapper.getInvestCountById(id);
		return cnt;
	}
	
	/*성현 : 사용자의 투자횟수 중 투자금 지급이 완료된 횟수*/
	@Override
	public int getInvestCountByIdComplete(String id) {
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		int cnt = investMapper.getInvestCountByIdComplete(id);
		return cnt;
	}
	
	/*성현 : 투자테이블에 데이터 추가*/
	@Override
	public void insertInvest(InvestVO invest){
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		investMapper.insertInvest(invest);
	}

	/*혜림 : 하나의 상품에 투자한 회원들 리스트*/
	@Override
	public List<InvestVO> getInvestListByGoodsNum(int goods_num) {
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		List<InvestVO> result = investMapper.getInvestListByGoodsNum(goods_num);
		return result;
	}

	/*혜림 : 투자금 반환 상태 업데이트*/
	@Override
	public void updateInvest(InvestVO invest) {
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		investMapper.updateInvest(invest);
	}

	/*혜림 : 해당 회원이 해당 상품에 투자한 정보 가져오기*/
	@Override
	public InvestVO getInvestByIdGoodsNum(InvestVO invest) {
		// TODO Auto-generated method stub
		InvestMapper investMapper = sqlSession.getMapper(InvestMapper.class);
		InvestVO result = investMapper.getInvestByIdGoodsNum(invest);
		return result;
	}

		
}
