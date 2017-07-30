package com.spring.muchmore.board;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	@Autowired
	private BoardDAOService boardDAOService;
	
	@RequestMapping("/BoardList.do")
	public ModelAndView main(Model model, HttpServletRequest request) {
		System.out.println("BoardController-/BoardList.do");
		
		List<BoardVO> boardlist = null;
		ModelAndView result = new ModelAndView();

		int page = 1; // �ʱ� ������
		int limit = 10; // �� ȭ�鿡 ��µ� ���� ����

		// ���ʷ� ȣ���ϸ� getPamete("page") == null
		if (request.getParameter("page") != null) {
			// Ư�� ������ ��ȣ�� Ŭ������ �� ����
			page = Integer.parseInt(request.getParameter("page"));
		}

		int listcount = boardDAOService.getListCount(); // �� ����Ʈ ���� �޾ƿ� : �� ���� ����														// ����
		boardlist = boardDAOService.getBoardList(page, limit); // ����Ʈ�� �޾ƿ� : �� ���� ���� 1~10

		//"������ �� ��� ����"
		//�� ������ �� : 0.95�� ���ؼ� �ø�
		int maxpage = (int) ((double) listcount / limit + 0.95); 
		// ���� �������� ������ ���� ������ �� : 1, 11, 21...��
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// ���� �������� ������ ������ ������ �� : 10, 20, 30...��
		int endpage = startpage + 10 - 1;

		// maxpage�� ���� ���� ū ������
		if (endpage > maxpage) {
			endpage = maxpage;
		}

		// ���ݱ��� ���� ��� ���� request��ü�� ����
		result.addObject("page", page);				// ���� ������ ��
		result.addObject("maxpage", maxpage);		// �ִ� ������ ��
		result.addObject("startpage", startpage);	// ���� �������� ǥ���� ù ������ ��
		result.addObject("endpage", endpage);		// ���� �������� ǥ���� �� ������ ��
		result.addObject("listcount", listcount);	// ��ü ���� ����
		result.addObject("boardlist", boardlist);
		
		// ����Ʈ�� �̵�
		result.setViewName("qna_board_list");

		return result;
	}
	
	//qna_board_list���� �۾��� ��ư�� ������ �� : �۾��� ������ �̵�
	@RequestMapping("/BoardWriteForm.do")
	public ModelAndView insert_form(HttpSession session) {
		System.out.println("BoardController-/BoardWriteForm.do");
		
		ModelAndView result = new ModelAndView();
		
		//�۾��� ���� �α��ε� ����� id�� �������� ����
		String id = (String)session.getAttribute("id");
		
		result.addObject("writer", id);
		
		result.setViewName("qna_board_write");
		
		return result;
	}
	
	//qna_board_writer���� �۾��� ��ư�� ������ �� : �۾��� insert
	@RequestMapping("/BoardWriteAction.do")
	public String insert(HttpServletRequest request) {
		System.out.println("BoardController-/BoardWriteAction.do");
		
		BoardVO boardVO = new BoardVO();
		
		boardVO.setMember_id(request.getParameter("member_id"));
		boardVO.setBoard_title(request.getParameter("boare_title"));
		boardVO.setBoard_password(request.getParameter("board_password"));
		boardVO.setBoard_content(request.getParameter("board_content"));
		boardVO.setBoard_pw_check((Integer.parseInt(request.getParameter("board_pw_check"))));
		
		boardDAOService.boardInsert(boardVO);
		
		return "redirect:/BoardList.do";
	}
	
	//qna_board_view_check�� �̵�
	@RequestMapping("/BoardViewCheck.do")
	public String view_checkForm() {
		System.out.println("BoardController-/BoardViewCheck.do");
		
		return "qna_board_view_check";
	}
	
	//qna_board_view_check : �Է¹��� ��й�ȣ�� �����ͺ��̽��� �ִ� ��й�ȣ �� �� �Խñ� �󼼺���
	@RequestMapping("/BoardViewAction.do")
	public String viewCheck(BoardVO boardVO, HttpServletResponse response) throws Exception {
		System.out.println("BoardController-/BoardViewAction.do");
		
		BoardVO getBoard = boardDAOService.getDetail(boardVO);
		
		//�Է¹��� ��й�ȣ
		String password = boardVO.getBoard_password();
		//��й�ȣ�� ������
		if(getBoard.getBoard_password().equals(password)) {
			return "redirect:/BoardDetail.do?board_num=" + getBoard.getBoard_num();
		}
		else {
			System.out.println("��й�ȣ�� Ʋ�� ��� �󼼺��� ����");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.');");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();
			
			return "redirect:/BoardList.do";
		}
	}
	
	//�Խñ� �󼼺���
	@RequestMapping("/BoardDetail.do")
	public ModelAndView detail(BoardVO boardVO) {
		System.out.println("BoardController-/BoardDetail.do");
		ModelAndView result = new ModelAndView();
		
		BoardVO getBoard = boardDAOService.getDetail(boardVO);
		boardDAOService.setReadCountUpdate(getBoard);
		
		String writer = getBoard.getMember_id();
		
		result.addObject("writer", writer);
		
		result.setViewName("qna_board_view");
		result.addObject("getBoard", getBoard);
		
		return result;
	}
	
	//qna_board_delete�� �̵�
	@RequestMapping("/BoardDeleteForm.do")
	public String delete_form() {
		System.out.println("BoardController-/BoardDeleteForm.do");
		
		return "qna_board_delete";
	}
	
	//qna_board_delete : �Է¹��� ��й�ȣ�� �����ͺ��̽��� �ִ� ��й�ȣ �� �� ���� ó��
	@RequestMapping("/BoardDeleteAction.do")
	public String delete(BoardVO boardVO, HttpServletResponse response) throws Exception {
		System.out.println("BoardController-/BoardDeleteAction.do");
		
		BoardVO getBoard = boardDAOService.getDetail(boardVO);
		
		//�Է¹��� ��й�ȣ
		String password = boardVO.getBoard_password();
		//��й�ȣ�� ������
		if(getBoard.getBoard_password().equals(password)) {
			boardDAOService.boardDelete(getBoard);
		}
		else {
			System.out.println("��й�ȣ�� Ʋ�� ��� ���� ����!");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('���� ����');");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();
			
			return "redirect:/BoardList.do?BOARD_NUM=" + getBoard.getBoard_num();
		}
		
		return "redirect:/BoardList.do";
	}
	
	//qna_board_reply�� �̵�
	@RequestMapping("/BoardReplyForm.do")
	public ModelAndView reply_form(BoardVO boardVO) {
		System.out.println("BoardController-/BoardReplyForm.do");
		ModelAndView result = new ModelAndView();
		
		BoardVO getBoard = boardDAOService.getDetail(boardVO);
		
		result.setViewName("qna_board_reply");
		result.addObject("getBoard", getBoard);
		
		return result;
	}

	//qna_board_reply : �Է¹��� ������ó��
	@RequestMapping("/BoardReplyAction.do")
	public ModelAndView reply(BoardVO boardVO) {
		System.out.println("BoardController-/BoardReplyAction.do");
		ModelAndView result = new ModelAndView();
		
		BoardVO getBoard = boardDAOService.boardReply(boardVO);
		
		result.setViewName("redirect:/BoardList.do");
		result.addObject("getBoard", getBoard);
		
		return result;
	}
	
	//qna_board_modify�� �̵�
	@RequestMapping("/BoardModifyForm.do")
	public ModelAndView modify_form(BoardVO boardVO) {
		System.out.println("BoardController-/BoardModifyForm.do");
		ModelAndView result = new ModelAndView();
		
		BoardVO getBoard = boardDAOService.getDetail(boardVO);
		
		result.setViewName("qna_board_modify");
		result.addObject("getBoard", getBoard);
		
		return result;
	}
	
	//qna_board_modify : �Է¹��� ������ó��
	@RequestMapping("/BoardModifyAction.do")
	public ModelAndView modify(BoardVO boardVO, HttpServletResponse response) throws Exception {
		System.out.println("BoardController-/BoardModifyAction.do");
		ModelAndView result = new ModelAndView();
		
		//�����Ǳ��� ������
		BoardVO getBoard = boardDAOService.getDetail(boardVO);
		
		//�Է¹��� ��й�ȣ
		String password = boardVO.getBoard_password();
		//��й�ȣ�� ������ �����ϱ�
		if(getBoard.getBoard_password().equals(password)) {
			//������ ������
			boardDAOService.boardModify(boardVO);
			//������ �� ������ ������ �󼼺���� �����ֱ�
			result.setViewName("redirect:/BoardDetail.do?board_num=" + boardVO.getBoard_num());
			//������ �����͸� �󼼺���� ������
			result.addObject("boardVO", boardVO);
		}
		else {
			//�������� ���� ������ �󼼺���� ����
			System.out.println("�Խñ� ���� ����");
			result.setViewName("redirect:/BoardDetail.do?board_num=" + boardVO.getBoard_num());
			result.addObject("boardVO", boardVO);
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('���� ����');");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();
		}
		
		return result;
	}
}