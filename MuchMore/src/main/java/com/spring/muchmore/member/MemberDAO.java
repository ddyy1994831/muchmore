package com.spring.muchmore.member;

import java.util.HashMap;

public interface MemberDAO {
	
	//2017-07-29 ���� : ȸ������
	public void insertMember(MemberVO member);
		
	//2017-07-29 ���� : ȸ������ �� ȸ�� �ߺ� üũ
	public int checkId(String id);

	/*2017-07-29 ���� : ȸ�� ���� ��ü ��������.*/
	public MemberVO getMember(MemberVO member);

	/*2017-07-29 ���� : ���̵� ã�� : �̸��� �̸����� �Է��ϸ� ���̵� return*/
	public String findId(MemberVO member);
	
	/*2017-07-29 ���� : ��й�ȣ ã�� : ���̵�, �̸�, �̸����� �Է��ϸ� ��й�ȣ return*/
	public String findPw(MemberVO member);
	
	//2017-07-29 ���� : ȸ������ ����
	public void updateMember(MemberVO member);

}
 