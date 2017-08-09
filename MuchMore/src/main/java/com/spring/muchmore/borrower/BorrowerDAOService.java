package com.spring.muchmore.borrower;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BorrowerDAOService implements BorrowerDAO { 
	@Autowired
	private SqlSession sqlSession;

	/*���� : �ſ��� ���ϱ�*/
	@Override
	public String creditCheck(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		
		String credit = borrowerMapper.creditCheck(borrower);
		System.out.println("daoservie : " +borrower.getBorrower_jobbiz());
		System.out.println("daoservie : " +borrower.getBorrower_totalincome());
		
		return credit;
	}

	/*���� : ����ݸ� Ȯ���ϱ�*/
	@Override
	public double checkBorrowRate(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		double rate = borrowerMapper.checkBorrowRate(borrower);
		return rate;
	}

	/*���� : �����û�ϱ� borrower table�� ������ �ֱ�*/
	@Override
	public void insertBorrower(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		borrowerMapper.insertBorrower(borrower);
	}

	/*���� : �����û�ϱ� goods table�� ������ �ֱ�*/
	@Override
	public void insertGoods(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		borrowerMapper.insertGoods(borrower);
	}
	
	/*���� : mypage_myloan ���⳻������ �ش� ȸ���� ���� ���� ��ü ��������*/
	@Override
	public List<BorrowerVO> getBorrowerList() {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		List<BorrowerVO> borrower_list = borrowerMapper.getBorrowerList();
		return borrower_list;
	}

	/*���� : ������ id�� ��ǰ ��ȣ�� ��ȸ�Ͽ� �ش� �����ڿ� ��ǰ�� ���� ���� ��������*/
	@Override
	public BorrowerVO getBorrower(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		BorrowerVO result = borrowerMapper.getBorrower(borrower);
		return result;
	}

	/*���� : �����ڰ� ������ ���ε�*/ 
	@Override
	public void uploadFile(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		borrowerMapper.uploadFile(borrower);
	}
	
	/*���� : mypage_myloan ���⳻������ �ش� ȸ���� ���� ���� ��ü ��������*/
	@Override
	public List<BorrowerVO> getBorrowerListById(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		List<BorrowerVO> result = borrowerMapper.getBorrowerListById(borrower);
		return result;
	}

	/*���� : ������� ����Ƚ�� ���ϱ�*/
	@Override
	public int getBorrowerCountById(String borrower_id) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		int cnt = borrowerMapper.getBorrowerCountById(borrower_id);
		return cnt;
	}
	
	/*�ٿ� : ���� ��ȯ�� �� ������ �ܾ� ����(borrower_balance ����)*/
	@Override
	public void updateBorrowerBalance(BorrowerVO borrower) {
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		borrowerMapper.updateBorrowerBalance(borrower);
	}
	
	/*�ٿ� : ����� ��ȯ��, borrower_status ����*/
	@Override
	public void updateBorrowerStatus(String borrower_id) {
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		borrowerMapper.updateBorrowerStatus(borrower_id);
	}
	
	/*�ٿ� : ���� ��ȯ��, ����ȯ�ݾװ� �Էµ� �����Աݾ� Ȯ��*/
	@Override
	public int getMonthlyDeposit(BorrowerVO borrower) {
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		
		int monthly_pay = borrowerMapper.getMonthlyDeposit(borrower);
		
		return monthly_pay;
	}
	
	/*�ٿ� : ���� ��ȯ��, �����Աݾ�(borrower_monthlypay)��ŭ Ȥ�� �� �̻� �Ա��ؾ��ϴµ� ��ȯ�ؾ��� ��(�ܰ�(borrower_balance))�� �����Աݾ׺��� ���� �� �Աݰ���*/
	@Override
	public int lessMonthlypay(BorrowerVO borrower) {
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		
		int pay = borrowerMapper.lessMonthlypay(borrower);
		
		return pay;
	}
	
	/*���� : �������� ��ȯ�Ϸ� ���� ���� ����Ƚ�� ���ϱ� */ 
	@Override
	public int getBorrowerCountByIdNotComplete(String borrower_id) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		int cnt = borrowerMapper.getBorrowerCountByIdNotComplete(borrower_id);
		return cnt;
	}

	/*���� : ������� ���� ������ ������ ���� �ٲٱ� */
	@Override
	public void updateBorrowerPayBack(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		borrowerMapper.updateBorrowerPayBack(borrower);
	}

	/*���� : ���� ���� ����*/
	@Override
	public void updateBorrowerStatusByAdmin(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		borrowerMapper.updateBorrowerStatusByAdmin(borrower);
	}

	/*���� : ������� ���� ���� �� borrower_status�� '��ȯ�Ϸ�'�� Ƚ��*/
	@Override
	public int getBorrowerCountByIdComplete(String id) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		int cnt = borrowerMapper.getBorrowerCountByIdComplete(id);
		return cnt;
	}

}
