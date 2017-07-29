package com.spring.muchmore.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOService implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVO getMember(MemberVO member) {
		// TODO Auto-generated method stub
		
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		System.out.println("1111 :" +member.getMember_id());
		MemberVO result = memberMapper.getMember(member);
		return result;
	}
}
