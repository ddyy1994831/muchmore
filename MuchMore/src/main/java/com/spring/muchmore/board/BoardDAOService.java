package com.spring.muchmore.board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOService implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//아무거나해해해해해주세요
}
