package com.spring.muchmore.member;

import java.util.HashMap;

public interface MemberDAO {
	
	//2017-07-29 ���� : ȸ������
	public void insertMember(MemberVO member);
	
	//2017-07-29 ���� : ȸ������ �� ȸ�� �ߺ� üũ
	public int checkId(String id);

}
