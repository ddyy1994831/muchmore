package com.spring.muchmore.goods;

public interface GoodsDAO {
	
	/*���� : ��ǰ ��������*/
	public GoodsVO getGoods(GoodsVO goods);

	/*���� : ��ǰ ���� ������Ʈ*/
	public void updateGoodsStatus(GoodsVO goods);

}
