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


	//2017-07-29 ���� : ȸ������
	@Override
	public void insertMember(MemberVO member) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		//ȸ�����
		memberMapper.insertMember(member); 
			
		//������� ���� 14�ڸ�
		long generatedLong = 10000000000000L + (long) (Math.random() * (99999999999999L - 10000000000000L));
		HashMap<String, String> param = new HashMap<String, String>();
			
		param.put("member_id", member.getMember_id());
		param.put("account_virtual", Long.toString(generatedLong));
		//������� ���
		memberMapper.createVirtualAccount(param);
	}

	//2017-07-29 ���� : ȸ������ �� ȸ�� �ߺ� üũ
	@Override
	public int checkId(String id) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int checkId = memberMapper.checkId(id);
		return checkId;
	}
	

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
