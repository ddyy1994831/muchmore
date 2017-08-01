package com.spring.muchmore.member;

import java.util.HashMap;
import java.util.List;

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
	

	/*2017-07-29 혜림 : 회원 정보 전체 가져오기.*/
	@Override
	public MemberVO getMember(String member_id) {
		// TODO Auto-generated method stub
		
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO result = memberMapper.getMember(member_id);
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

	//2017-07-29 성현 : 회원정보 수정
	@Override
	public void updateMember(MemberVO member) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.updateMember(member);
	}

	/*2017-07-30 혜림 : 회원정보와 계좌정보 가져오기*/ 
	@Override
	public MemberVO getMemberAccountById(String member_id) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO result = memberMapper.getMemberAccountById(member_id);
		return result;
	}

	/*2017-08-01 성현 : 회원목록 가져오기(List타입)*/
	@Override
	public List<MemberVO> getMemberList() {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		List<MemberVO> memberlist = memberMapper.getMemberList();
		return memberlist;
	}

	
}
