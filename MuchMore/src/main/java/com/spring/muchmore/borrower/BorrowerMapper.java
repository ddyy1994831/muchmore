package com.spring.muchmore.borrower;


public interface BorrowerMapper {
	
	/*2017-07-29 ���� : �ſ��� ���ϱ�*/
	public String creditCheck(BorrowerVO borrower);

	/*2017-07-30 ���� : ����ݸ� Ȯ���ϱ�*/
	public double checkBorrowRate(BorrowerVO borrower);
}
