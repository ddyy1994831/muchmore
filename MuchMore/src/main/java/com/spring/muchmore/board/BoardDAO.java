package com.spring.muchmore.board;

import java.util.List;

public interface BoardDAO {
	public int getListCount();
	public List<BoardVO> getBoardList(int page, int limit);
	public BoardVO getDetail(BoardVO boardVO);
	public void boardInsert(BoardVO boardVO);
	public BoardVO boardReply(BoardVO boardVO);
	public void boardModify(BoardVO boardVO);
	public void boardDelete(BoardVO boardVO);
	public void setReadCountUpdate(BoardVO boardVO);
	public int getMaxBoardnum();						//insert시, 새로운 board_num 계산
}