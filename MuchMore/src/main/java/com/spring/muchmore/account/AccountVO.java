package com.spring.muchmore.account;

public class AccountVO {
	
	private String member_id;
	private String account_virtual;
	private String account_real;
	private int account_balance;
	private int account_case;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getAccount_virtual() {
		return account_virtual;
	}
	public void setAccount_virtual(String account_virtual) {
		this.account_virtual = account_virtual;
	}
	public String getAccount_real() {
		return account_real;
	}
	public void setAccount_real(String account_real) {
		this.account_real = account_real;
	}
	public int getAccount_balance() {
		return account_balance;
	}
	public void setAccount_balance(int account_balance) {
		this.account_balance = account_balance;
	}
	public int getAccount_case() {
		return account_case;
	}
	public void setAccount_case(int account_case) {
		this.account_case = account_case;
	}
	
}
