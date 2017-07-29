package com.spring.muchmore.borrower;

import java.sql.Date;

import com.spring.muchmore.goods.GoodsVO;


public class BorrowerVO {
	private String borrower_id;
	private Date borrower_registerdate;
	private double borrower_rate;
	private int borrower_repay_date;
	private int borrower_amount;
	private int borrower_monthlypay;
	private int borrower_limit;
	private String borrower_credit;
	private int borrower_totalincome;
	private String borrower_jobbiz;
	private String borrower_jobname;   
	private String borrower_jobperiod;
	private int borrower_loanperiod;
	private Date borrower_startdate;
	private Date borrower_enddate;
	private String borrower_status;
	private String borrower_payok;
	private int borrower_balance;
	
	//상품정보
	private GoodsVO goodsVO;

	public String getBorrower_id() {
		return borrower_id;
	}

	public void setBorrower_id(String borrower_id) {
		this.borrower_id = borrower_id;
	}

	public Date getBorrower_registerdate() {
		return borrower_registerdate;
	}

	public void setBorrower_registerdate(Date borrower_registerdate) {
		this.borrower_registerdate = borrower_registerdate;
	}


	public double getBorrower_rate() {
		return borrower_rate;
	}

	public void setBorrower_rate(double borrower_rate) {
		this.borrower_rate = borrower_rate;
	}

	public int getBorrower_repay_date() {
		return borrower_repay_date;
	}

	public void setBorrower_repay_date(int borrower_repay_date) {
		this.borrower_repay_date = borrower_repay_date;
	}

	public int getBorrower_amount() {
		return borrower_amount;
	}

	public void setBorrower_amount(int borrower_amount) {
		this.borrower_amount = borrower_amount;
	}

	public int getBorrower_monthlypay() {
		return borrower_monthlypay;
	}

	public void setBorrower_monthlypay(int borrower_monthlypay) {
		this.borrower_monthlypay = borrower_monthlypay;
	}

	public int getBorrower_limit() {
		return borrower_limit;
	}

	public void setBorrower_limit(int borrower_limit) {
		this.borrower_limit = borrower_limit;
	}

	public String getBorrower_credit() {
		return borrower_credit;
	}

	public void setBorrower_credit(String borrower_credit) {
		this.borrower_credit = borrower_credit;
	}

	public int getBorrower_totalincome() {
		return borrower_totalincome;
	}

	public void setBorrower_totalincome(int borrower_totalincome) {
		this.borrower_totalincome = borrower_totalincome;
	}

	public String getBorrower_jobbiz() {
		return borrower_jobbiz;
	}

	public void setBorrower_jobbiz(String borrower_jobbiz) {
		this.borrower_jobbiz = borrower_jobbiz;
	}

	public String getBorrower_jobname() {
		return borrower_jobname;
	}

	public void setBorrower_jobname(String borrower_jobname) {
		this.borrower_jobname = borrower_jobname;
	}

	public String getBorrower_jobperiod() {
		return borrower_jobperiod;
	}

	public void setBorrower_jobperiod(String borrower_jobperiod) {
		this.borrower_jobperiod = borrower_jobperiod;
	}

	public int getBorrower_loanperiod() {
		return borrower_loanperiod;
	}

	public void setBorrower_loanperiod(int borrower_loanperiod) {
		this.borrower_loanperiod = borrower_loanperiod;
	}

	public Date getBorrower_startdate() {
		return borrower_startdate;
	}

	public void setBorrower_startdate(Date borrower_startdate) {
		this.borrower_startdate = borrower_startdate;
	}

	public Date getBorrower_enddate() {
		return borrower_enddate;
	}

	public void setBorrower_enddate(Date borrower_enddate) {
		this.borrower_enddate = borrower_enddate;
	}

	public String getBorrower_status() {
		return borrower_status;
	}

	public void setBorrower_status(String borrower_status) {
		this.borrower_status = borrower_status;
	}

	public String getBorrower_payok() {
		return borrower_payok;
	}

	public void setBorrower_payok(String borrower_payok) {
		this.borrower_payok = borrower_payok;
	}

	public int getBorrower_balance() {
		return borrower_balance;
	}

	public void setBorrower_balance(int borrower_balance) {
		this.borrower_balance = borrower_balance;
	}

	public GoodsVO getGoodsVO() {
		return goodsVO;
	}

	public void setGoodsVO(GoodsVO goodsVO) {
		this.goodsVO = goodsVO;
	}
	
}
