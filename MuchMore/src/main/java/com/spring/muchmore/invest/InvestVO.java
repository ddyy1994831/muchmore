package com.spring.muchmore.invest;

import java.sql.Date;


public class InvestVO {
	private String member_id;
	private int goods_num;
	private Date invest_date;
	private int invest_sum;
	private String invest_pay_ok;
	private int invest_return;
	
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
	public String getInvest_pay_ok() {
		return invest_pay_ok;
	}
	public void setInvest_pay_ok(String invest_pay_ok) {
		this.invest_pay_ok = invest_pay_ok;
	}
	public int getInvest_return() {
		return invest_return;
	}
	public void setInvest_return(int invest_return) {
		this.invest_return = invest_return;
	}
	
}
