package com.spring.muchmore.goods;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GoodsDAOService implements GoodsDAO {
	@Autowired
	private SqlSession sqlSession;

	/*2017-08-02 혜림 : 상품 가져오기*/
	@Override
	public GoodsVO getGoods(GoodsVO goods) {
		// TODO Auto-generated method stub
		GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
		GoodsVO result = goodsMapper.getGoods(goods);
		return result;
	}

	/*2017-08-02 혜림 : 상품 상태 업데이트*/
	@Override
	public void updateGoodsStatus(GoodsVO goods) {
		// TODO Auto-generated method stub
		GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
		goodsMapper.updateGoodsStatus(goods);
	}
	
}
