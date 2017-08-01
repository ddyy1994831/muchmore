package com.spring.muchmore.member;

import java.util.HashMap;
import java.util.List;

public interface MemberDAO {
	
	//2017-07-29 ���� : ȸ������
	public void insertMember(MemberVO member);
		
	//2017-07-29 ���� : ȸ������ �� ȸ�� �ߺ� üũ
	public int checkId(String id);

	/*2017-07-29 ���� : ȸ�� ���� ��ü ��������.*/
	public MemberVO getMember(String member_id);

	/*2017-07-29 ���� : ���̵� ã�� : �̸��� �̸����� �Է��ϸ� ���̵� return*/
	public String findId(MemberVO member);
	
	/*2017-07-29 ���� : ��й�ȣ ã�� : ���̵�, �̸�, �̸����� �Է��ϸ� ��й�ȣ return*/
	public String findPw(MemberVO member);
	
	//2017-07-29 ���� : ȸ������ ����
	public void updateMember(MemberVO member);

	/*2017-07-30 ���� : ȸ�������� �������� ��������*/ 
	public MemberVO getMemberAccountById(String member_id);
	
	/*2017-08-01 ���� : ȸ����� ��������(ListŸ��)*/
	public List<MemberVO> getMemberList();
	
	/*2017-08-01 ���� : ȸ������*/
	public void deleteMember(String id);
}
 