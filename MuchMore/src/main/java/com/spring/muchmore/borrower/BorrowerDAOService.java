package com.spring.muchmore.borrower;


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

}
