package com.spring.muchmore.borrower;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BorrowerDAOService implements BorrowerDAO {
	@Autowired
	private SqlSession sqlSession;

	
	/*2017-07-29 ���� : �ſ��� ���ϱ�*/
	@Override
	public String creditCheck(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		
		String credit = borrowerMapper.creditCheck(borrower);
		System.out.println("daoservie : " +borrower.getBorrower_jobbiz());
		System.out.println("daoservie : " +borrower.getBorrower_totalincome());
		
		return credit;
	}

	/*2017-07-30 ���� : ����ݸ� Ȯ���ϱ�*/
	@Override
	public double checkBorrowRate(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		double rate = borrowerMapper.checkBorrowRate(borrower);
		return rate;
	}

	/*2017-07-30 ���� : �����û�ϱ� borrower table�� ������ �ֱ�*/
	@Override
	public void insertBorrower(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		borrowerMapper.insertBorrower(borrower);
	}

	/*2017-07-30 ���� : �����û�ϱ� goods table�� ������ �ֱ�*/
	@Override
	public void insertGoods(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		borrowerMapper.insertGoods(borrower);
	}
	
	/*2017-07-30 ���� : mypage_myloan ���⳻������ �ش� ȸ���� ���� ���� ��ü ��������*/
	@Override
	public List<BorrowerVO> getBorrowerList(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		List<BorrowerVO> borrower_list = borrowerMapper.getBorrowerList(borrower);
		return borrower_list;
	}

	/*2017-07-30 ���� : ������ id�� ��ǰ ��ȣ�� ��ȸ�Ͽ� �ش� �����ڿ� ��ǰ�� ���� ���� ��������*/
	@Override
	public BorrowerVO getBorrower(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		BorrowerVO result = borrowerMapper.getBorrower(borrower);
		return result;
	}

	/*2017-07-30 ���� : �����ڰ� ������ ���ε�*/ 
	@Override
	public void uploadFile(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		borrowerMapper.uploadFile(borrower);
	}
	
	/*2017-07-30 ���� : mypage_myloan ���⳻������ �ش� ȸ���� ���� ���� ��ü ��������*/
	@Override
	public List<BorrowerVO> getBorrowerListById(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		List<BorrowerVO> result = borrowerMapper.getBorrowerListById(borrower);
		return result;
	}

	/*2017-07-31 ���� : ������� ����Ƚ�� ���ϱ�*/
	@Override
	public int getBorrowerCountById(String id) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		int cnt = borrowerMapper.getBorrowerCountById(id);
		return cnt;
	}

	/*2017-08-01 ���� : ������� ���� ���� �� borrower_status�� '��ȯ�Ϸ�'�� Ƚ��*/
	@Override
	public int getBorrowerCountByIdComplete(String id) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		int cnt = borrowerMapper.getBorrowerCountByIdComplete(id);
		return 0;
	}	
}
