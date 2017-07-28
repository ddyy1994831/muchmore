package com.spring.muchmore.accout;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDAOService implements AccountDAO {
	@Autowired
	private SqlSession sqlSession;

}
