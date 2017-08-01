package com.spring.muchmore.borrower;

import java.util.List;

public interface BorrowerDAO {
	
	/*2017-07-29 ���� : �ſ��� ���ϱ�*/
	public String creditCheck(BorrowerVO borrower);
	
	/*2017-07-30 ���� : ����ݸ� Ȯ���ϱ�*/
	public double checkBorrowRate(BorrowerVO borrower);
	
	/*2017-07-30 ���� : �����û�ϱ� borrower table�� ������ �ֱ�*/
	public void insertBorrower(BorrowerVO borrower);
	
	/*2017-07-30 ���� : �����û�ϱ� goods table�� ������ �ֱ�*/
	public void insertGoods(BorrowerVO borrower);
	
	/*2017-07-30 ���� : mypage_myloan ���⳻������ �ش� ȸ���� ���� ���� ��ü ��������*/
	public List<BorrowerVO> getBorrowerList();
	
	/*2017-07-30 ���� : ������ id�� ��ǰ ��ȣ�� ��ȸ�Ͽ� �ش� �����ڿ� ��ǰ�� ���� ���� ��������*/
	public BorrowerVO getBorrower(BorrowerVO borrower);
	
	/*2017-07-30 ���� : �����ڰ� ������ ���ε�*/ 
	public void uploadFile(BorrowerVO borrower);
	
	/*2017-07-30 ���� : mypage_myloan ���⳻������ �ش� ȸ���� ���� ���� ��ü ��������*/
	public List<BorrowerVO> getBorrowerListById(BorrowerVO borrower);

	/*2017-07-31 ���� : ������� ����Ƚ�� ��������*/
	public int getBorrowerCountById(String borrower_id);

	/*2017-08-01 �ٿ� : ���� ��ȯ�� �� ������ �ܾ� ����(borrower_balance ����)*/
	public void updateBorrowerBalance(BorrowerVO borrower);
	
	/*2017-08-01 �ٿ� : ����� ��ȯ��, borrower_status ����*/
	public void updateBorrowerStatus(String borrower_id);
	
	/*2017-08-01 �ٿ� : ���� ��ȯ��, ����ȯ�ݾװ� �Էµ� �����Աݾ� Ȯ��*/
	public int getMonthlyDeposit(String borrower_id);
	
	/*2017-08-01 �ٿ� : ���� ��ȯ��, �����Աݾ�(borrower_monthlypay)��ŭ Ȥ�� �� �̻� �Ա��ؾ��ϴµ� ��ȯ�ؾ��� ��(�ܰ�(borrower_balance))�� �����Աݾ׺��� ���� �� �Աݰ���*/
	public int lessMonthlypay(String borrower_id);
	
	/*2017-08-01 ���� : �������� ��ȯ�Ϸ� ���� ���� ����Ƚ�� ���ϱ� */ 
	public int getBorrowerCountByIdNotComplete(String borrower_id);
	
	/*2017-08-01 ���� : ������� ���� ������ ������ ���� �ٲٱ� */
	public void updateBorrowerPayBack(BorrowerVO borrower);
}
