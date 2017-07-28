package com.spring.muchmore.borrower;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BorrowerDAOService implements BorrowerDAO {
	@Autowired
	private SqlSession sqlSession;

	public void ppp() {
		System.out.println("hello commit");
	}
}
