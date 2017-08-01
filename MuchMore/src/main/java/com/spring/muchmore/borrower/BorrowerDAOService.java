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
	public List<BorrowerVO> getBorrowerList() {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		List<BorrowerVO> borrower_list = borrowerMapper.getBorrowerList();
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
	public int getBorrowerCountById(String borrower_id) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		int cnt = borrowerMapper.getBorrowerCountById(borrower_id);
		return cnt;
	}
	
	/*2017-08-01 다예 : 대출 상환이 될 때마다 잔액 변경(borrower_balance 변경)*/
	@Override
	public void updateBorrowerBalance(BorrowerVO borrower) {
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		borrowerMapper.updateBorrowerBalance(borrower);
	}
	
	/*2017-08-01 다예 : 대출금 상환시, borrower_status 변경*/
	@Override
	public void updateBorrowerStatus(String borrower_id) {
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		borrowerMapper.updateBorrowerStatus(borrower_id);
	}
	
	/*2017-08-01 다예 : 대출 상환시, 월상환금액과 입력된 월납입금액 확인*/
	@Override
	public int getMonthlyDeposit(BorrowerVO borrower) {
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		
		int monthly_pay = borrowerMapper.getMonthlyDeposit(borrower);
		
		return monthly_pay;
	}
	
	/*2017-08-01 다예 : 대출 상환시, 월납입금액(borrower_monthlypay)만큼 혹은 그 이상 입금해야하는데 상환해야할 돈(잔고(borrower_balance))이 월납입금액보다 작을 시 입금가능*/
	@Override
	public int lessMonthlypay(BorrowerVO borrower) {
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		
		int pay = borrowerMapper.lessMonthlypay(borrower);
		
		return pay;
	}
	
	/*2017-08-01 혜림 : 대출자의 상환완료 되지 않은 대출횟수 구하기 */ 
	@Override
	public int getBorrowerCountByIdNotComplete(String borrower_id) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		int cnt = borrowerMapper.getBorrowerCountByIdNotComplete(borrower_id);
		return cnt;
	}

	/*2017-08-01 혜림 : 대출금을 지급 받으면 대출자 상태 바꾸기 */
	@Override
	public void updateBorrowerPayBack(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		borrowerMapper.updateBorrowerPayBack(borrower);
	}

	/*2017-08-01 혜림 : 대출 상태 변경*/
	@Override
	public void updateBorrowerStatusByAdmin(BorrowerVO borrower) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		borrowerMapper.updateBorrowerStatusByAdmin(borrower);
	}

	/*2017-08-01 성현 : 사용자의 대출 내역 중 borrower_status가 '상환완료'인 횟수*/
	@Override
	public int getBorrowerCountByIdComplete(String id) {
		// TODO Auto-generated method stub
		BorrowerMapper borrowerMapper = sqlSession.getMapper(BorrowerMapper.class);
		int cnt = borrowerMapper.getBorrowerCountByIdComplete(id);
		return cnt;
	}

}
