package com.spring.muchmore.borrower;


public interface BorrowerMapper {
	
	/*2017-07-29 혜림 : 신용등급 구하기*/
	public String creditCheck(BorrowerVO borrower);

	/*2017-07-30 혜림 : 대출금리 확인하기*/
	public double checkBorrowRate(BorrowerVO borrower);
}
