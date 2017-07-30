package com.spring.muchmore.invest;

import java.util.List;

public interface InvestDAO {
	
	/* 2017-07-30 성현 : 개인 투자  내역 가져오기(List타입) */
	public List<InvestVO> getInvestById(String id);

}
