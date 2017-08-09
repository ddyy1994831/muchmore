package com.spring.muchmore.board;

import java.util.HashMap;
import java.util.List;

public interface BoardMapper {
	/* 다예 : Board테이블에 있는 데이터 리스트 개수 출력*/
	public int getListCount();
	
	/* 다예 : Board테이블에 있는 데이터 리스트 출력*/
	public List<BoardVO> getBoardList(HashMap<String, Integer> param);
	
	/* 다예 : board_num을 넘겨받아 해당 게시글 상세보기*/
	public BoardVO getDetail(BoardVO boardVO);
	
	/* 다예 : 게시글 쓰기*/
	public void boardInsert(BoardVO boardVO);
	
	/* 다예 : 게시글 답글달기*/
	public void boardReply(BoardVO boardVO);
	
	/* 다예 : 게시글 수정*/
	public void boardModify(BoardVO boardVO);
	
	/* 다예 : board_num을 넘겨받아 게시글 삭제*/
	public void boardDelete(BoardVO boardVO);
	
	/* 다예 : 조회수 증가*/
	public void setReadCountUpdate(BoardVO boardVO);
	
	/* 다예 : 게시글 insert시 새로운 board_num계산*/
	public int getMaxBoardnum();	
	
	/* 다예 : 답변 순위처리 계산*/
	public void boardReplyUpdate(BoardVO boardVO);
}