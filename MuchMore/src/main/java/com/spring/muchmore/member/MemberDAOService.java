package com.spring.muchmore.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOService implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	/*2017-07-29 혜림 : 회원 정보 전체 가져오기.*/
	@Override
	public MemberVO getMember(MemberVO member) {
		// TODO Auto-generated method stub
		
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO result = memberMapper.getMember(member);
		return result;
	}

	/*2017-07-29 혜림 : 아이디 찾기 : 이름과 이메일을 입력하면 아이디 return*/
	@Override
	public String findId(MemberVO member) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		//데이터베이스에서 찾아온 id
		String foundid = memberMapper.findId(member);
		return foundid;
	}

	/*2017-07-29 혜림 : 비밀번호 찾기 : 아이디, 이름, 이메일을 입력하면 비밀번호 return*/
	@Override
	public String findPw(MemberVO member) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		//데이터베이스에서 찾아온 pw
		String foundpw = memberMapper.findPw(member);
		return foundpw;
	} 
}
