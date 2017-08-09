package com.spring.muchmore.board;

import java.util.HashMap;
import java.util.List;

public interface BoardMapper {
	/* �ٿ� : Board���̺� �ִ� ������ ����Ʈ ���� ���*/
	public int getListCount();
	
	/* �ٿ� : Board���̺� �ִ� ������ ����Ʈ ���*/
	public List<BoardVO> getBoardList(HashMap<String, Integer> param);
	
	/* �ٿ� : board_num�� �Ѱܹ޾� �ش� �Խñ� �󼼺���*/
	public BoardVO getDetail(BoardVO boardVO);
	
	/* �ٿ� : �Խñ� ����*/
	public void boardInsert(BoardVO boardVO);
	
	/* �ٿ� : �Խñ� ��۴ޱ�*/
	public void boardReply(BoardVO boardVO);
	
	/* �ٿ� : �Խñ� ����*/
	public void boardModify(BoardVO boardVO);
	
	/* �ٿ� : board_num�� �Ѱܹ޾� �Խñ� ����*/
	public void boardDelete(BoardVO boardVO);
	
	/* �ٿ� : ��ȸ�� ����*/
	public void setReadCountUpdate(BoardVO boardVO);
	
	/* �ٿ� : �Խñ� insert�� ���ο� board_num���*/
	public int getMaxBoardnum();	
	
	/* �ٿ� : �亯 ����ó�� ���*/
	public void boardReplyUpdate(BoardVO boardVO);
}