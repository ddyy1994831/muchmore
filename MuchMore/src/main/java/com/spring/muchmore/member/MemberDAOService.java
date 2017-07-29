package com.spring.muchmore.member;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.muchmore.member.MemberMapper;

@Repository
public class MemberDAOService implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	//2017-07-29 성현 : 회원가입
	@Override
	public void insertMember(MemberVO member) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		//회원등록
		memberMapper.insertMember(member); 
			
		//가상계좌 생성 14자리
		long generatedLong = 10000000000000L + (long) (Math.random() * (99999999999999L - 10000000000000L));
		HashMap<String, String> param = new HashMap<String, String>();
			
		param.put("member_id", member.getMember_id());
		param.put("account_virtual", Long.toString(generatedLong));
		//가상계좌 등록
		memberMapper.createVirtualAccount(param);
	}

	//2017-07-29 성현 : 회원가입 시 회원 중복 체크
	@Override
	public int checkId(String id) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int checkId = memberMapper.checkId(id);
		return checkId;
	}
	
	
	@Override
	public MemberVO getMember(MemberVO member) {
		// TODO Auto-generated method stub
		
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		System.out.println("1111 :" +member.getMember_id());
		MemberVO result = memberMapper.getMember(member);
		return result;
	} 

	
}
