package com.spring.muchmore.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOService implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	/*2017-07-29 ���� : ȸ�� ���� ��ü ��������.*/
	@Override
	public MemberVO getMember(MemberVO member) {
		// TODO Auto-generated method stub
		
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO result = memberMapper.getMember(member);
		return result;
	}

	/*2017-07-29 ���� : ���̵� ã�� : �̸��� �̸����� �Է��ϸ� ���̵� return*/
	@Override
	public String findId(MemberVO member) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		//�����ͺ��̽����� ã�ƿ� id
		String foundid = memberMapper.findId(member);
		return foundid;
	}

	/*2017-07-29 ���� : ��й�ȣ ã�� : ���̵�, �̸�, �̸����� �Է��ϸ� ��й�ȣ return*/
	@Override
	public String findPw(MemberVO member) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		//�����ͺ��̽����� ã�ƿ� pw
		String foundpw = memberMapper.findPw(member);
		return foundpw;
	} 
}
