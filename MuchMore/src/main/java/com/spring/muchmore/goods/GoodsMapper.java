package com.spring.muchmore.goods;

public interface GoodsMapper {
	
	/*2017-08-02 혜림 : 상품 가져오기*/
	public GoodsVO getGoods(GoodsVO goods);

	/*2017-08-02 혜림 : 상품 상태 업데이트*/
	public void updateGoodsStatus(GoodsVO goods);

}
