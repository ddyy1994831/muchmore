package com.spring.muchmore.board;

import java.util.List;

public interface BoardDAO {
	/* �ٿ� : Board���̺� �ִ� ������ ����Ʈ ���� ���*/
	public int getListCount();
	
	/* �ٿ� : Board���̺� �ִ� ������ ����Ʈ ���*/
	public List<BoardVO> getBoardList(int page, int limit);
	
	/* �ٿ� : board_num�� �Ѱܹ޾� �ش� �Խñ� �󼼺���*/
	public BoardVO getDetail(BoardVO boardVO);
	
	/* �ٿ� : �Խñ� ����*/
	public void boardInsert(BoardVO boardVO);
	
	/* �ٿ� : �Խñ� ��۴ޱ�*/
	public BoardVO boardReply(BoardVO boardVO);
	
	/* �ٿ� : �Խñ� ����*/
	public void boardModify(BoardVO boardVO);
	
	/* �ٿ� : board_num�� �Ѱܹ޾� �Խñ� ����*/
	public void boardDelete(BoardVO boardVO);
	
	/* �ٿ� : ��ȸ�� ����*/
	public void setReadCountUpdate(BoardVO boardVO);
	
	/* �ٿ� : �Խñ� insert�� ���ο� board_num���*/
	public int getMaxBoardnum();
}