package com.spring.muchmore.goods;

public interface GoodsMapper {
	
	/*���� : ��ǰ ��������*/
	public GoodsVO getGoods(GoodsVO goods);

	/*���� : ��ǰ ���� ������Ʈ*/
	public void updateGoodsStatus(GoodsVO goods);

}
