package com.spring.muchmore.board;

import java.util.List;

public interface BoardDAO {
	/*2017-07-30 다예 : Board테이블에 있는 데이터 리스트 개수 출력*/
	public int getListCount();
	
	/*2017-07-30 다예 : Board테이블에 있는 데이터 리스트 출력*/
	public List<BoardVO> getBoardList(int page, int limit);
	
	/*2017-07-30 다예 : board_num을 넘겨받아 해당 게시글 상세보기*/
	public BoardVO getDetail(BoardVO boardVO);
	
	/*2017-07-30 다예 : 게시글 쓰기*/
	public void boardInsert(BoardVO boardVO);
	
	/*2017-07-30 다예 : 게시글 답글달기*/
	public BoardVO boardReply(BoardVO boardVO);
	
	/*2017-07-30 다예 : 게시글 수정*/
	public void boardModify(BoardVO boardVO);
	
	/*2017-07-30 다예 : board_num을 넘겨받아 게시글 삭제*/
	public void boardDelete(BoardVO boardVO);
	
	/*2017-07-30 다예 : 조회수 증가*/
	public void setReadCountUpdate(BoardVO boardVO);
	
	/*2017-07-30 다예 : 게시글 insert시 새로운 board_num계산*/
	public int getMaxBoardnum();
}