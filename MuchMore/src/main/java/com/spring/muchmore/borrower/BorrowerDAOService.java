package com.spring.muchmore.borrower;


import java.util.List;

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
	
	/*2017-07-30 혜림 : mypage_myloan 대출내역에서 해당 회원의 대출 내역 전체 가져오기*/
	@Override
	public List<BorrowerVO> getBorrowerList(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		List<BorrowerVO> borrower_list = borrowerMapper.getBorrowerList(borrower);
		return borrower_list;
	}

	/*2017-07-30 혜림 : 대출자 id와 상품 번호로 조회하여 해당 대출자와 상품에 대한 정보 가져오기*/
	@Override
	public BorrowerVO getBorrower(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		BorrowerVO result = borrowerMapper.getBorrower(borrower);
		return result;
	}

	/*2017-07-30 혜림 : 대출자가 서류를 업로드*/ 
	@Override
	public void uploadFile(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		borrowerMapper.uploadFile(borrower);
	}
	
	/*2017-07-30 혜림 : mypage_myloan 대출내역에서 해당 회원의 대출 내역 전체 가져오기*/
	@Override
	public List<BorrowerVO> getBorrowerListById(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		List<BorrowerVO> result = borrowerMapper.getBorrowerListById(borrower);
		return result;
	}

	/*2017-07-31 성현 : 사용자의 대출횟수 구하기*/
	@Override
	public int getBorrowerCountById(String id) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		int cnt = borrowerMapper.getBorrowerCountById(id);
		return cnt;
	}

	/*2017-08-01 성현 : 사용자의 대출 내역 중 borrower_status가 '상환완료'인 횟수*/
	@Override
	public int getBorrowerCountByIdComplete(String id) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		int cnt = borrowerMapper.getBorrowerCountByIdComplete(id);
		return 0;
	}	
}
