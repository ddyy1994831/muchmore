package com.spring.muchmore.member;

import java.util.HashMap;

public interface MemberMapper {
	
	//2017-07-29 ���� : ȸ������
	public void insertMember(MemberVO member);
	
	//2017-07-29 ���� : ȸ�� ���Խ� ������� ���� 
	public void createVirtualAccount(HashMap<String, String> account);
	
	//2017-07-29 ���� : ȸ������ �� ȸ�� �ߺ� üũ
	public int checkId(String id);

}
