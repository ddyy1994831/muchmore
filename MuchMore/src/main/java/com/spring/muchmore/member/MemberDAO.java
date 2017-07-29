package com.spring.muchmore.member;

import java.util.HashMap;

public interface MemberDAO {
	
	//2017-07-29 성현 : 회원가입
	public void insertMember(MemberVO member);
	
	//2017-07-29 성현 : 회원가입 시 회원 중복 체크
	public int checkId(String id);

}
