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
		
		//rownum 몇 번부터 몇 번까지 추출할지 계산
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
				
		// BoardVO에 board_num만 받아줌
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO boardVO_result = new BoardVO();
		boardVO_result = boardMapper.getDetail(boardVO);		//받아온 board_num을 이용해서 db에서 가져옴
		
		return boardVO_result;
	}

	@Override
	public void boardInsert(BoardVO boardVO) {
		// TODO Auto-generated method stub
		System.out.println("BoardDAOService-boardInsert(BoardVO boardVO)");
		
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int maxBoardnum = 1;
		
		//새 글의 board_num 구하기 : 기존 글번호 + 1
		//데이터가 없는 경우
		if(boardMapper.getListCount() != 0) {
			maxBoardnum = boardMapper.getMaxBoardnum();
			maxBoardnum = maxBoardnum + 1;
		}
		
		//새 글번호 저장
		boardVO.setBoard_num(maxBoardnum);
		//insert
		boardMapper.boardInsert(boardVO);
		
		System.out.println("글쓰기 성공!");
	}

	@Override
	public BoardVO boardReply(BoardVO boardVO) {
		// TODO Auto-generated method stub
		System.out.println("BoardDAOService-boardReply(BoardVO boardVO)");
		
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		
		//현재 글에 대한 데이터를 기억
		int re_ref = boardVO.getBoard_re_ref();	
		int re_seq = boardVO.getBoard_re_seq();
		int re_lev = boardVO.getBoard_re_lev();
		
		//이미 작성된 답변의 순위 처리
		boardMapper.boardReplyUpdate(boardVO);
		
		re_seq = re_seq + 1;
		re_lev = re_lev + 1;
		
		int maxBoardnum = boardMapper.getMaxBoardnum();
		
		//새 글 번호 지정
		maxBoardnum = maxBoardnum + 1;
		boardVO.setBoard_num(maxBoardnum);
		boardVO.setBoard_re_ref(re_ref);
		boardVO.setBoard_re_seq(re_seq);
		boardVO.setBoard_re_lev(re_lev);
		
		boardMapper.boardReply(boardVO);
		
		System.out.println("답변 성공!");
		
		return boardVO;
	}

	@Override
	public void boardModify(BoardVO boardVO) {
		// TODO Auto-generated method stub
		System.out.println("BoardDAOService-boardModify(BoardVO boardVO)");
		
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.boardModify(boardVO);
		
		System.out.println("수정 완료!");
	}

	@Override
	public void boardDelete(BoardVO boardVO) {
		// TODO Auto-generated method stub
		System.out.println("BoardDAOService-boardDelete(BoardVO boardVO) ");
		
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.boardDelete(boardVO);
		
		System.out.println("삭제 완료!");
	}

	@Override
	public void setReadCountUpdate(BoardVO boardVO) {
		// TODO Auto-generated method stub
		System.out.println("BoardDAOService-setReadCountUpdate(int board_num)");
		
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.setReadCountUpdate(boardVO);
		
		System.out.println("조회수 증가 완료!");
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