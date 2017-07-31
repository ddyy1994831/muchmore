package com.spring.muchmore.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOService implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		System.out.println("BoardDAOService-getListCount()");
		
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int cnt = boardMapper.getListCount();
		
		return cnt;
	}

	@Override
	public List<BoardVO> getBoardList(int page, int limit) {
		// TODO Auto-generated method stub
		System.out.println("BoardDAOService-getBoardList(int page, int limit)");
		
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		
		//rownum �� ������ �� ������ �������� ���
		int startrow = (page-1) * 10 + 1;
		int endrow = startrow + limit - 1;
		
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		param.put("startrow", startrow);
		param.put("endrow", endrow);
		boardList = boardMapper.getBoardList(param);
				
		return boardList;
	}

	@Override
	public BoardVO getDetail(BoardVO boardVO) {
		// TODO Auto-generated method stub
		System.out.println("BoardDAOService-getDetail(BoardVO boardVO)");
				
		// BoardVO�� board_num�� �޾���
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO boardVO_result = new BoardVO();
		boardVO_result = boardMapper.getDetail(boardVO);		//�޾ƿ� board_num�� �̿��ؼ� db���� ������
		
		return boardVO_result;
	}

	@Override
	public void boardInsert(BoardVO boardVO) {
		// TODO Auto-generated method stub
		System.out.println("BoardDAOService-boardInsert(BoardVO boardVO)");
		
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int maxBoardnum = 1;
		
		//�� ���� board_num ���ϱ� : ���� �۹�ȣ + 1
		//�����Ͱ� ���� ���
		if(boardMapper.getListCount() != 0) {
			maxBoardnum = boardMapper.getMaxBoardnum();
			maxBoardnum = maxBoardnum + 1;
		}
		
		//�� �۹�ȣ ����
		boardVO.setBoard_num(maxBoardnum);
		//insert
		boardMapper.boardInsert(boardVO);
		
		System.out.println("�۾��� ����!");
	}

	@Override
	public BoardVO boardReply(BoardVO boardVO) {
		// TODO Auto-generated method stub
		System.out.println("BoardDAOService-boardReply(BoardVO boardVO)");
		
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		
		//���� �ۿ� ���� �����͸� ���
		int re_ref = boardVO.getBoard_re_ref();	
		int re_seq = boardVO.getBoard_re_seq();
		int re_lev = boardVO.getBoard_re_lev();
		
		//�̹� �ۼ��� �亯�� ���� ó��
		boardMapper.boardReplyUpdate(boardVO);
		
		re_seq = re_seq + 1;
		re_lev = re_lev + 1;
		
		int maxBoardnum = boardMapper.getMaxBoardnum();
		
		//�� �� ��ȣ ����
		maxBoardnum = maxBoardnum + 1;
		boardVO.setBoard_num(maxBoardnum);
		boardVO.setBoard_re_ref(re_ref);
		boardVO.setBoard_re_seq(re_seq);
		boardVO.setBoard_re_lev(re_lev);
		
		boardMapper.boardReply(boardVO);
		
		System.out.println("�亯 ����!");
		
		return boardVO;
	}

	@Override
	public void boardModify(BoardVO boardVO) {
		// TODO Auto-generated method stub
		System.out.println("BoardDAOService-boardModify(BoardVO boardVO)");
		
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.boardModify(boardVO);
		
		System.out.println("���� �Ϸ�!");
	}

	@Override
	public void boardDelete(BoardVO boardVO) {
		// TODO Auto-generated method stub
		System.out.println("BoardDAOService-boardDelete(BoardVO boardVO) ");
		
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.boardDelete(boardVO);
		
		System.out.println("���� �Ϸ�!");
	}

	@Override
	public void setReadCountUpdate(BoardVO boardVO) {
		// TODO Auto-generated method stub
		System.out.println("BoardDAOService-setReadCountUpdate(int board_num)");
		
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.setReadCountUpdate(boardVO);
		
		System.out.println("��ȸ�� ���� �Ϸ�!");
	}

	@Override
	public int getMaxBoardnum() {
		// TODO Auto-generated method stub
		System.out.println("BoardDAOService-getMaxBoardnum()");
		
		int maxBoardnum;
		
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		maxBoardnum = boardMapper.getMaxBoardnum();
		
		return  maxBoardnum;
	}
	
}