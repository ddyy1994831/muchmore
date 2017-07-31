package com.spring.muchmore.board;

import java.util.List;

public interface BoardDAO {
	/*2017-07-30 �ٿ� : Board���̺� �ִ� ������ ����Ʈ ���� ���*/
	public int getListCount();
	
	/*2017-07-30 �ٿ� : Board���̺� �ִ� ������ ����Ʈ ���*/
	public List<BoardVO> getBoardList(int page, int limit);
	
	/*2017-07-30 �ٿ� : board_num�� �Ѱܹ޾� �ش� �Խñ� �󼼺���*/
	public BoardVO getDetail(BoardVO boardVO);
	
	/*2017-07-30 �ٿ� : �Խñ� ����*/
	public void boardInsert(BoardVO boardVO);
	
	/*2017-07-30 �ٿ� : �Խñ� ��۴ޱ�*/
	public BoardVO boardReply(BoardVO boardVO);
	
	/*2017-07-30 �ٿ� : �Խñ� ����*/
	public void boardModify(BoardVO boardVO);
	
	/*2017-07-30 �ٿ� : board_num�� �Ѱܹ޾� �Խñ� ����*/
	public void boardDelete(BoardVO boardVO);
	
	/*2017-07-30 �ٿ� : ��ȸ�� ����*/
	public void setReadCountUpdate(BoardVO boardVO);
	
	/*2017-07-30 �ٿ� : �Խñ� insert�� ���ο� board_num���*/
	public int getMaxBoardnum();
}