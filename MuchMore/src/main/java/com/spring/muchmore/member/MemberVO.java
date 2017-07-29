package com.spring.muchmore.member;

import com.spring.muchmore.accout.AccountVO;
import com.spring.muchmore.borrower.BorrowerVO;

public class MemberVO {
	private String member_id;
	private String member_pw1;
	private String member_pw2;
	private String member_name;
	private String member_phone;
	private String member_jumin1;
	private String member_jumin2;
	private String member_email;
	private String member_zipcode;
	private String member_addr1;
	private String member_addr2;
	private int member_agreement;
	private String member_gender;
	private String member_age;
	 
	//대출자
	private BorrowerVO borrower;
	
	//계좌정보
	private AccountVO account;

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw1() {
		return member_pw1;
	}

	public void setMember_pw1(String member_pw1) {
		this.member_pw1 = member_pw1;
	}

	public String getMember_pw2() {
		return member_pw2;
	}

	public void setMember_pw2(String member_pw2) {
		this.member_pw2 = member_pw2;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_jumin1() {
		return member_jumin1;
	}

	public void setMember_jumin1(String member_jumin1) {
		this.member_jumin1 = member_jumin1;
	}

	public String getMember_jumin2() {
		return member_jumin2;
	}

	public void setMember_jumin2(String member_jumin2) {
		this.member_jumin2 = member_jumin2;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_zipcode() {
		return member_zipcode;
	}

	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}

	public String getMember_addr1() {
		return member_addr1;
	}

	public void setMember_addr1(String member_addr1) {
		this.member_addr1 = member_addr1;
	}

	public String getMember_addr2() {
		return member_addr2;
	}

	public void setMember_addr2(String member_addr2) {
		this.member_addr2 = member_addr2;
	}

	public int getMember_agreement() {
		return member_agreement;
	}

	public void setMember_agreement(int member_agreement) {
		this.member_agreement = member_agreement;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_age() {
		return member_age;
	}

	public void setMember_age(String member_age) {
		this.member_age = member_age;
	}

	public BorrowerVO getBorrower() {
		return borrower;
	}

	public void setBorrower(BorrowerVO borrower) {
		this.borrower = borrower;
	}

	public AccountVO getAccount() {
		return account;
	}

	public void setAccount(AccountVO account) {
		this.account = account;
	}
	
}
