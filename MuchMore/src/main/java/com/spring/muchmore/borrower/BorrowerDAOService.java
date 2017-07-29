package com.spring.muchmore.borrower;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BorrowerDAOService implements BorrowerDAO {
	@Autowired
	private SqlSession sqlSession;

	
	/*2017-07-29 혜림 : 신용등급 구하기*/
	@Override
	public String creditCheck(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		
		String credit = borrowerMapper.creditCheck(borrower);
		System.out.println("daoservie : " +borrower.getBorrower_jobbiz());
		System.out.println("daoservie : " +borrower.getBorrower_totalincome());
		
		return credit;
	}

	/*2017-07-30 혜림 : 대출금리 확인하기*/
	@Override
	public double checkBorrowRate(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		double rate = borrowerMapper.checkBorrowRate(borrower);
		return rate;
	}

	/*2017-07-30 혜림 : 대출신청하기 borrower table에 데이터 넣기*/
	@Override
	public void insertBorrower(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		borrowerMapper.insertBorrower(borrower);
	}

	/*2017-07-30 혜림 : 대출신청하기 goods table에 데이터 넣기*/
	@Override
	public void insertGoods(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		borrowerMapper.insertGoods(borrower);
	}

	
	
	
}
