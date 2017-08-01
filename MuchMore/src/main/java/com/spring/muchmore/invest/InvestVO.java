package com.spring.muchmore.invest;

import java.sql.Date;

import com.spring.muchmore.goods.GoodsVO;


public class InvestVO {
	private String member_id;
	private int goods_num;
	private Date invest_date;
	private int invest_sum;
	private String invest_payok;
	private int invest_return;
	
	//상품정보
	private GoodsVO goodsVO;
	
	public GoodsVO getGoodsVO() {
		return goodsVO;
	}
	public void setGoodsVO(GoodsVO goodsVO) {
		this.goodsVO = goodsVO;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(int goods_num) {
		this.goods_num = goods_num;
	}
	public Date getInvest_date() {
		return invest_date;
	}
	public void setInvest_date(Date invest_date) {
		this.invest_date = invest_date;
	}
	public int getInvest_sum() {
		return invest_sum;
	}
	public void setInvest_sum(int invest_sum) {
		this.invest_sum = invest_sum;
	}
	public String getInvest_payok() {
		return invest_payok;
	}
	public void setInvest_payok(String invest_payok) {
		this.invest_payok = invest_payok;
	}
	public int getInvest_return() {
		return invest_return;
	}
	public void setInvest_return(int invest_return) {
		this.invest_return = invest_return;
	}
	
}
