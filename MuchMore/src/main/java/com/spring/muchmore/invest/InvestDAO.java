package com.spring.muchmore.invest;

import java.util.List;

public interface InvestDAO {
	
	/* 2017-07-30 성현 : 개인 투자  내역 가져오기(List타입) */
	public List<InvestVO> getInvestById(String id);
	
	/*2017-07-31 성현 : 해당 상품에 대한 총 투자금액*/
	public int getTotalInvestSum(int goods_num);
	
	/*2017-07-31 성현 : 사용자의 투자횟수 구하기*/
	public int getInvestCountById(String id);
	
	/*2017-08-01 성현 : 사용자의 투자횟수 중 투자금 지급이 완료된 횟수*/
	public int getInvestCountByIdComplete(String id);
	
	/*2017-07-31 성현 : 투자테이블에 데이터 추가*/
	public void insertInvest(InvestVO invest);
	
	/*2017-08-02 혜림 : 하나의 상품에 투자한 회원들 리스트*/
	public List<InvestVO> getInvestListByGoodsNum(int goods_num);
}
