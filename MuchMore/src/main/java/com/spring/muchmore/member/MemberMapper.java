package com.spring.muchmore.member;

import java.util.HashMap;

public interface MemberMapper {	

	//2017-07-29 성현 : 회원가입
	public void insertMember(MemberVO member);
		
	//2017-07-29 성현 : 회원 가입시 가상계좌 생성 
	public void createVirtualAccount(HashMap<String, String> account);
		
	//2017-07-29 성현 : 회원가입 시 회원 중복 체크
	public int checkId(String id);
	
	/*2017-07-29 혜림 : 회원 정보 전체 가져오기.*/
	public MemberVO getMember(MemberVO member);

}
 