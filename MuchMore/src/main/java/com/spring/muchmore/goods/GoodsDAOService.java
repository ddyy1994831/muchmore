package com.spring.muchmore.goods;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GoodsDAOService implements GoodsDAO {
	@Autowired
	private SqlSession sqlSession;
}
