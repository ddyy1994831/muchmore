package com.spring.muchmore.borrower;

import java.util.HashMap;
import java.util.List;

public interface BorrowerDAO {
	
	/*2017-07-29 혜림 : 신용등급 구하기*/
	public String creditCheck(BorrowerVO borrower);
	
	/*2017-07-30 혜림 : 대출금리 확인하기*/
	public double checkBorrowRate(BorrowerVO borrower);
	
	/*2017-07-30 혜림 : 대출신청하기 borrower table에 데이터 넣기*/
	public void insertBorrower(BorrowerVO borrower);
	
	/*2017-07-30 혜림 : 대출신청하기 goods table에 데이터 넣기*/
	public void insertGoods(BorrowerVO borrower);
	
	/*2017-07-30 혜림 : mypage_myloan 대출내역에서 해당 회원의 대출 내역 전체 가져오기*/
	public List<BorrowerVO> getBorrowerList(BorrowerVO borrower);
	
	/*2017-07-30 혜림 : 대출자 id와 상품 번호로 조회하여 해당 대출자와 상품에 대한 정보 가져오기*/
	public BorrowerVO getBorrower(BorrowerVO borrower);
	
	/*2017-07-30 혜림 : 대출자가 서류를 업로드*/ 
	public void uploadFile(BorrowerVO borrower);
	
	/*2017-07-30 혜림 : mypage_myloan 대출내역에서 해당 회원의 대출 내역 전체 가져오기*/
	public List<BorrowerVO> getBorrowerListById(BorrowerVO borrower);

	/*2017-07-31 성현 : 사용자의 대출횟수 가져오기*/
	public int getBorrowerCountById(String borrower_id);

}
