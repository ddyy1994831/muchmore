package com.spring.muchmore.goods;

public interface GoodsMapper {
	
	/*2017-08-02 ���� : ��ǰ ��������*/
	public GoodsVO getGoods(GoodsVO goods);

	/*2017-08-02 ���� : ��ǰ ���� ������Ʈ*/
	public void updateGoodsStatus(GoodsVO goods);

}
