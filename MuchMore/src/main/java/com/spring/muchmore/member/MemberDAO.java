package com.spring.muchmore.member;

import java.util.HashMap;
import java.util.List;

public interface MemberDAO {
	
	/*���� : ȸ������*/
	public void insertMember(MemberVO member);
		
	/*���� : ȸ������ �� ȸ�� �ߺ� üũ*/
	public int checkId(String id);

	/*���� : ȸ�� ���� ��ü ��������.*/
	public MemberVO getMember(String member_id);

	/*���� : ���̵� ã�� : �̸��� �̸����� �Է��ϸ� ���̵� return*/
	public String findId(MemberVO member);
	
	/*���� : ��й�ȣ ã�� : ���̵�, �̸�, �̸����� �Է��ϸ� ��й�ȣ return*/
	public String findPw(MemberVO member);
	
	/*���� : ȸ������ ����*/
	public void updateMember(MemberVO member);

	/*���� : ȸ�������� �������� ��������*/ 
	public MemberVO getMemberAccountById(String member_id);
	
	/*���� : ȸ����� ��������(ListŸ��)*/
	public List<MemberVO> getMemberList();
	
	/*���� : ȸ������*/
	public void deleteMember(String id);
}
 