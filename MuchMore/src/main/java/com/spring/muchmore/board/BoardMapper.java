package com.spring.muchmore.board;

import java.util.HashMap;
import java.util.List;

public interface BoardMapper {
	public int getListCount();
	public List<BoardVO> getBoardList(HashMap<String, Integer> param);
	public BoardVO getDetail(BoardVO boardVO);
	public void boardInsert(BoardVO boardVO);
	public void boardReply(BoardVO boardVO);
	public void boardModify(BoardVO boardVO);
	public void boardDelete(BoardVO boardVO);
	public void setReadCountUpdate(BoardVO boardVO);
	public int getMaxBoardnum();						//insert��, ���ο� board_num ���
	public void boardReplyUpdate(BoardVO boardVO);
}