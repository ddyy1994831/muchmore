package com.spring.muchmore.moneyinout;

import java.sql.Timestamp;

public class MoneyinoutVO {
	private String moneyinout_holder_id;
	private String moneyinout_other_id;
	private Timestamp moneyinout_date;
	private String moneyinout_money;
	private String moneyinout_state;
	
	public String getMoneyinout_holder_id() {
		return moneyinout_holder_id;
	}
	public void setMoneyinout_holder_id(String moneyinout_holder_id) {
		this.moneyinout_holder_id = moneyinout_holder_id;
	}
	public String getMoneyinout_payer_id() {
		return moneyinout_other_id;
	}
	public void setMoneyinout_payer_id(String moneyinout_other_id) {
		this.moneyinout_other_id = moneyinout_other_id;
	}
	public Timestamp getMoneyinout_date() {
		return moneyinout_date;
	}
	public void setMoneyinout_date(Timestamp moneyinout_date) {
		this.moneyinout_date = moneyinout_date;
	}
	public String getMoneyinout_money() {
		return moneyinout_money;
	}
	public void setMoneyinout_money(String moneyinout_money) {
		this.moneyinout_money = moneyinout_money;
	}
	public String getMoneyinout_state() {
		return moneyinout_state;
	}
	public void setMoneyinout_state(String moneyinout_state) {
		this.moneyinout_state = moneyinout_state;
	}
	
}
