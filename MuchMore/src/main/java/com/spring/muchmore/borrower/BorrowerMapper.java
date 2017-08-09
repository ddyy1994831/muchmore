package com.spring.muchmore.borrower;

import java.util.List;

public interface BorrowerMapper {
	
	/*���� : �ſ��� ���ϱ�*/
	public String creditCheck(BorrowerVO borrower);

	/*���� : ����ݸ� Ȯ���ϱ�*/
	public double checkBorrowRate(BorrowerVO borrower);
	
	/*���� : �����û�ϱ� borrower table�� ������ �ֱ�*/
	public void insertBorrower(BorrowerVO borrower);
	
	/*���� : �����û�ϱ� goods table�� ������ �ֱ�*/
	public void insertGoods(BorrowerVO borrower);
	
	/*���� : mypage_myloan ���⳻������ �ش� ȸ���� ���� ���� ��ü ��������*/
	public List<BorrowerVO> getBorrowerList();
	
	/*���� : ������ id�� ��ǰ ��ȣ�� ��ȸ�Ͽ� �ش� �����ڿ� ��ǰ�� ���� ���� ��������*/
	public BorrowerVO getBorrower(BorrowerVO borrower);
	
	/*���� : �����ڰ� ������ ���ε�*/ 
	public void uploadFile(BorrowerVO borrower);
	
	/*���� : mypage_myloan ���⳻������ �ش� ȸ���� ���� ���� ��ü ��������*/
	public List<BorrowerVO> getBorrowerListById(BorrowerVO borrower);
	 
	/*���� : ������� ����Ƚ�� ��������*/
	public int getBorrowerCountById(String borrower_id);

	/*�ٿ� : ���� ��ȯ�� �� ������ �ܾ� ����(borrower_balance ����)*/
	public void updateBorrowerBalance(BorrowerVO borrower);
	
	/*�ٿ� : ����� ��ȯ��, borrower_status ����*/
	public void updateBorrowerStatus(String borrower_id);
	
	/*�ٿ� : ���� ��ȯ��, ����ȯ�ݾװ� �Էµ� �����Աݾ� Ȯ��*/
	public int getMonthlyDeposit(BorrowerVO borrower);
	
	/*�ٿ� : ���� ��ȯ��, �����Աݾ�(borrower_monthlypay)��ŭ Ȥ�� �� �̻� �Ա��ؾ��ϴµ� ��ȯ�ؾ��� ��(�ܰ�(borrower_balance))�� �����Աݾ׺��� ���� �� �Աݰ���*/
	public int lessMonthlypay(BorrowerVO borrower);
	
	/*���� : �������� ��ȯ�Ϸ� ���� ���� ����Ƚ�� ���ϱ� */ 
	public int getBorrowerCountByIdNotComplete(String borrower_id);
	
	/*���� : ������� ���� ������ ������ ���� �ٲٱ� */
	public void updateBorrowerPayBack(BorrowerVO borrower);

	/*���� : ������� ���� ���� �� borrower_status�� '��ȯ�Ϸ�'�� Ƚ��*/
	public int getBorrowerCountByIdComplete(String id);

	/*���� : ���� ���� ����*/
	public void updateBorrowerStatusByAdmin(BorrowerVO borrower);
	
}
