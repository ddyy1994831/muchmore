package com.spring.muchmore.invest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InvestDAOService implements InvestDAO {
	@Autowired
	private SqlSession sqlSession;
}
