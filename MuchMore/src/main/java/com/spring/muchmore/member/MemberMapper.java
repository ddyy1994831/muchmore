package com.spring.muchmore.member;

public interface MemberMapper {
	
	/*2017-07-29 ���� : ȸ�� ���� ��ü ��������.*/
	public MemberVO getMember(MemberVO member);

	/*2017-07-29 ���� : ���̵� ã�� : �̸��� �̸����� �Է��ϸ� ���̵� return*/
	public String findId(MemberVO member);
	
	/*2017-07-29 ���� : ��й�ȣ ã�� : ���̵�, �̸�, �̸����� �Է��ϸ� ��й�ȣ return*/
	public String findPw(MemberVO member);
	
}
 