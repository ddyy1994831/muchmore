package com.spring.muchmore.borrower;

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
	public List<BorrowerVO> getBorrowerList();
	
	/*2017-07-30 혜림 : 대출자 id와 상품 번호로 조회하여 해당 대출자와 상품에 대한 정보 가져오기*/
	public BorrowerVO getBorrower(BorrowerVO borrower);
	
	/*2017-07-30 혜림 : 대출자가 서류를 업로드*/ 
	public void uploadFile(BorrowerVO borrower);
	
	/*2017-07-30 혜림 : mypage_myloan 대출내역에서 해당 회원의 대출 내역 전체 가져오기*/
	public List<BorrowerVO> getBorrowerListById(BorrowerVO borrower);

	/*2017-07-31 성현 : 사용자의 대출횟수 가져오기*/
	public int getBorrowerCountById(String borrower_id);

	/*2017-08-01 다예 : 대출 상환이 될 때마다 잔액 변경(borrower_balance 변경)*/
	public void updateBorrowerBalance(BorrowerVO borrower);
	
	/*2017-08-01 다예 : 대출금 상환시, borrower_status 변경*/
	public void updateBorrowerStatus(String borrower_id);
	
	/*2017-08-01 다예 : 대출 상환시, 월상환금액과 입력된 월납입금액 확인*/
	public int getMonthlyDeposit(String borrower_id);
	
	/*2017-08-01 다예 : 대출 상환시, 월납입금액(borrower_monthlypay)만큼 혹은 그 이상 입금해야하는데 상환해야할 돈(잔고(borrower_balance))이 월납입금액보다 작을 시 입금가능*/
	public int lessMonthlypay(String borrower_id);
	
	/*2017-08-01 혜림 : 대출자의 상환완료 되지 않은 대출횟수 구하기 */ 
	public int getBorrowerCountByIdNotComplete(String borrower_id);
	
	/*2017-08-01 혜림 : 대출금을 지급 받으면 대출자 상태 바꾸기 */
	public void updateBorrowerPayBack(BorrowerVO borrower);
}
