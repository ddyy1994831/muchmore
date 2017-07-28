package com.spring.muchmore.goods;

import java.sql.Date;

public class GoodsVO {
	private int goods_num;
	private int goods_sum;
	private double goods_rate;
	private String goods_object;
	private String goods_status;
	private String borrower_id;
	private int goods_invest;
	private Date goods_date;
	
	
	public int getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(int goods_num) {
		this.goods_num = goods_num;
	}
	public int getGoods_sum() {
		return goods_sum;
	}
	public void setGoods_sum(int goods_sum) {
		this.goods_sum = goods_sum;
	}
	public double getGoods_rate() {
		return goods_rate;
	}
	public void setGoods_rate(double goods_rate) {
		this.goods_rate = goods_rate;
	}
	public String getGoods_object() {
		return goods_object;
	}
	public void setGoods_object(String goods_object) {
		this.goods_object = goods_object;
	}
	public String getGoods_status() {
		return goods_status;
	}
	public void setGoods_status(String goods_status) {
		this.goods_status = goods_status;
	}
	public String getBorrower_id() {
		return borrower_id;
	}
	public void setBorrower_id(String borrower_id) {
		this.borrower_id = borrower_id;
	}
	public int getGoods_invest() {
		return goods_invest;
	}
	public void setGoods_invest(int goods_invest) {
		this.goods_invest = goods_invest;
	}
	public Date getGoods_date() {
		return goods_date;
	}
	public void setGoods_date(Date goods_date) {
		this.goods_date = goods_date;
	}
	
	
}	
