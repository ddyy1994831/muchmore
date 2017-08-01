package com.spring.muchmore.member;

import java.util.HashMap;
import java.util.List;

public interface MemberDAO {
	
	//2017-07-29 성현 : 회원가입
	public void insertMember(MemberVO member);
		
	//2017-07-29 성현 : 회원가입 시 회원 중복 체크
	public int checkId(String id);

	/*2017-07-29 혜림 : 회원 정보 전체 가져오기.*/
	public MemberVO getMember(String member_id);

	/*2017-07-29 혜림 : 아이디 찾기 : 이름과 이메일을 입력하면 아이디 return*/
	public String findId(MemberVO member);
	
	/*2017-07-29 혜림 : 비밀번호 찾기 : 아이디, 이름, 이메일을 입력하면 비밀번호 return*/
	public String findPw(MemberVO member);
	
	//2017-07-29 성현 : 회원정보 수정
	public void updateMember(MemberVO member);

	/*2017-07-30 혜림 : 회원정보와 계좌정보 가져오기*/ 
	public MemberVO getMemberAccountById(String member_id);
	
	/*2017-08-01 성현 : 회원목록 가져오기(List타입)*/
	public List<MemberVO> getMemberList();
	
	/*2017-08-01 성현 : 회원삭제*/
	public void deleteMember(String id);
}
 