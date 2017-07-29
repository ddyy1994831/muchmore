package com.spring.muchmore.member;

public interface MemberMapper {
	
	/*2017-07-29 혜림 : 회원 정보 전체 가져오기.*/
	public MemberVO getMember(MemberVO member);

	/*2017-07-29 혜림 : 아이디 찾기 : 이름과 이메일을 입력하면 아이디 return*/
	public String findId(MemberVO member);
	
	/*2017-07-29 혜림 : 비밀번호 찾기 : 아이디, 이름, 이메일을 입력하면 비밀번호 return*/
	public String findPw(MemberVO member);
	
}
 