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
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	@Autowired
	private BoardDAOService boardDAOService;
	
	/*2017-07-30 ´Ù¿¹ : Board Å×ÀÌºí¿¡ ÀÖ´Â µ¥ÀÌÅÍ ¸®½ºÆ® ­‹·Â*/
	@RequestMapping("/BoardList.do")
	public ModelAndView main(Model model, HttpServletRequest request) {
		System.out.println("BoardController-/BoardList.do");

		List<BoardVO> boardlist = null;
		ModelAndView result = new ModelAndView();

		int page = 1;		 // ÃÊ±â ÆäÀÌÁö
		int limit = 10; 	 // ÇÑ È­¸é¿¡ Ãâ·ÂµÉ ±ÛÀÇ °³¼ö

		// ÃÖÃÊ·Î È£ÃâÇÏ¸é getPamete("page") == null
		if (request.getParameter("page") != null) {
			// Æ¯Á¤ ÆäÀÌÁö ¹øÈ£¸¦ Å¬¸¯ÇßÀ» ¶§ µ¿ÀÛ
			page = Integer.parseInt(request.getParameter("page"));
		}

		int listcount = boardDAOService.getListCount(); // ÃÑ ¸®½ºÆ® ¼ö¸¦ ¹Ş¾Æ¿È : ÃÑ ±ÛÀÇ °³¼ö														// °³¼ö
		boardlist = boardDAOService.getBoardList(page, limit); // ¸®½ºÆ®¸¦ ¹Ş¾Æ¿È : ÃÑ ±ÛÀÇ ³»¿ë 1~10

		//"ÆäÀÌÁö ¼ö °è»ê °úÁ¤"
		//ÃÑ ÆäÀÌÁö ¼ö : 0.95¸¦ ´õÇØ¼­ ¿Ã¸²
		int maxpage = (int) ((double) listcount / limit + 0.95); 
		// ÇöÀç ÆäÀÌÁö¿¡ º¸¿©ÁÙ ½ÃÀÛ ÆäÀÌÁö ¼ö : 1, 11, 21...µî
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// ÇöÀç ÆäÀÌÁö¿¡ º¸¿©ÁÙ ¸¶Áö¸· ÆäÀÌÁö ¼ö : 10, 20, 30...µî
		int endpage = startpage + 10 - 1;

		// maxpage´Â ½ÇÁ¦ °¡Àå Å« ÆäÀÌÁö
		if (endpage > maxpage) {
			endpage = maxpage;
		}

		// Áö±İ±îÁö ±¸ÇÑ ¸ğµç °ªÀ» request°´Ã¼¿¡ ÀúÀå
		result.addObject("page", page);				// ÇöÀç ÆäÀÌÁö ¼ö
		result.addObject("maxpage", maxpage);		// ÃÖ´ë ÆäÀÌÁö ¼ö
		result.addObject("startpage", startpage);	// ÇöÀç ÆäÀÌÁö¿¡ Ç¥½ÃÇÒ Ã¹ ÆäÀÌÁö ¼ö
		result.addObject("endpage", endpage);		// ÇöÀç ÆäÀÌÁö¿¡ Ç¥½ÃÇÒ ³¡ ÆäÀÌÁö ¼ö
		result.addObject("listcount", listcount);	// ÀüÃ¼ ±ÛÀÇ °¹¼ö
		result.addObject("boardlist", boardlist);
		
		// ¸®½ºÆ®·Î ÀÌµ¿
		result.setViewName("qna_board_list");

		return result;
	}
	
	/*2017-07-30 ´Ù¿¹ : qna_board_list¿¡¼­ ±Û¾²±â ¹öÆ°À» ´­·¶À» ¶§ - ±Û¾²±â ÆûÀ¸·Î ÀÌµ¿*/
	@RequestMapping("/BoardWriteForm.do")
	public ModelAndView insert_form(HttpSession session) {
		System.out.println("BoardController-/BoardWriteForm.do");
		
		ModelAndView result = new ModelAndView();
		
		//±Û¾²±â Æû¿¡ ·Î±×ÀÎµÈ »ç¶÷ÀÇ id¸¦ °¡Á®¿À±â À§ÇÔ
		String id = (String)session.getAttribute("id");
		
		result.addObject("writer", id);
		
		result.setViewName("qna_board_write");
		
		return result;
	}
	
	/*2017-07-30 ´Ù¿¹ : qna_board_writer¿¡¼­ ±Û¾²±â ¹öÆ°À» ´­·¶À» ¶§ - ±Û¾²±â insert*/
	@RequestMapping("/BoardWriteAction.do")
	public String insert(HttpServletRequest request) {
		System.out.println("BoardController-/BoardWriteAction.do");
		
		BoardVO boardVO = new BoardVO();
		
		boardVO.setMember_id(request.getParameter("member_id"));
		boardVO.setBoard_title(request.getParameter("board_title"));
		boardVO.setBoard_password(request.getParameter("board_password"));
		boardVO.setBoard_content(request.getParameter("board_content"));
		if(request.getParameter("board_pw_check") == null) {
			boardVO.setBoard_pw_check(0);
		}
		else {
			boardVO.setBoard_pw_check((Integer.parseInt(request.getParameter("board_pw_check"))));
		}

		boardDAOService.boardInsert(boardVO);
		
		return "redirect:/BoardList.do";
	}
	
	/*2017-07-30 ´Ù¿¹ : qna_board_view_check·Î ÀÌµ¿*/
	@RequestMapping("/BoardViewCheck.do")
	public String view_checkForm(BoardVO boardVO) {
		System.out.println("BoardController-/BoardViewCheck.do");
		
		BoardVO getBoard = boardDAOService.getDetail(boardVO);
		
		int pw_check = getBoard.getBoard_pw_check();
		System.out.println("board_check = " + pw_check);
		
		if(pw_check == 0) {
			return "redirect:/BoardDetail.do?board_num=" + boardVO.getBoard_num();
		}
		else {
			return "qna_board_view_check";	
		}
	}
	
	/*2017-07-30 ´Ù¿¹ : qna_board_view_check - ÀÔ·Â¹ŞÀº ºñ¹Ğ¹øÈ£¿Í µ¥ÀÌÅÍº£ÀÌ½º¿¡ ÀÖ´Â ºñ¹Ğ¹øÈ£ ºñ±³ ÈÄ °Ô½Ã±Û »ó¼¼º¸±â*/
	@RequestMapping("/BoardViewAction.do")
	public String viewCheck(BoardVO boardVO, HttpServletResponse response) throws Exception {
		System.out.println("BoardController-/BoardViewAction.do");
		
		BoardVO getBoard = boardDAOService.getDetail(boardVO);
		
		//ÀÔ·Â¹ŞÀº ºñ¹Ğ¹øÈ£
		String password = boardVO.getBoard_password();
		//ºñ¹Ğ¹øÈ£°¡ ¸ÂÀ¸¸é
		if(getBoard.getBoard_password().equals(password)) {
			return "redirect:/BoardDetail.do?board_num=" + getBoard.getBoard_num();
		}
		else {
			System.out.println("ºñ¹Ğ¹øÈ£°¡ Æ²¸° °æ¿ì »ó¼¼º¸±â ½ÇÆĞ");
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("EUC-KR");
			out.println("<script>");
			out.println("alert('ºñ¹Ğ¹øÈ£°¡ ÀÏÄ¡ÇÏÁö ¾Ê½À´Ï´Ù.');");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();
			
			return "redirect:/BoardList.do";
		}
	}
	
	/*2017-07-30 ´Ù¿¹ : °Ô½Ã±Û »ó¼¼º¸±â*/
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
	
	/*2017-07-30 ´Ù¿¹ : qna_board_delete·Î ÀÌµ¿*/
	@RequestMapping("/BoardDeleteForm.do")
	public String delete_form() {
		System.out.println("BoardController-/BoardDeleteForm.do");
		
		return "qna_board_delete";
	}
	
	/*2017-07-30 ´Ù¿¹ : qna_board_delete - ÀÔ·Â¹ŞÀº ºñ¹Ğ¹øÈ£¿Í µ¥ÀÌÅÍº£ÀÌ½º¿¡ ÀÖ´Â ºñ¹Ğ¹øÈ£ ºñ±³ ÈÄ »èÁ¦ Ã³¸®*/
	@RequestMapping("/BoardDeleteAction.do")
	public String delete(BoardVO boardVO, HttpServletResponse response) throws Exception {
		System.out.println("BoardController-/BoardDeleteAction.do");
		
		BoardVO getBoard = boardDAOService.getDetail(boardVO);
		
		//ÀÔ·Â¹ŞÀº ºñ¹Ğ¹øÈ£
		String password = boardVO.getBoard_password();
		//ºñ¹Ğ¹øÈ£°¡ ¸ÂÀ¸¸é
		if(getBoard.getBoard_password().equals(password)) {
			boardDAOService.boardDelete(getBoard);
		}
		else {
			System.out.println("ºñ¹Ğ¹øÈ£°¡ Æ²¸° °æ¿ì »èÁ¦ ½ÇÆĞ");
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("EUC-KR");
			out.println("<script>");
			out.println("alert('ºñ¹Ğ¹øÈ£°¡ ÀÏÄ¡ÇÏÁö ¾Ê½À´Ï´Ù.');");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();
			
			return "redirect:/BoardList.do?BOARD_NUM=" + getBoard.getBoard_num();
		}
		
		return "redirect:/BoardList.do";
	}
	
	/*2017-07-30 ´Ù¿¹ : qna_board_reply·Î ÀÌµ¿*/
	@RequestMapping("/BoardReplyForm.do")
	public ModelAndView reply_form(BoardVO boardVO) {
		System.out.println("BoardController-/BoardReplyForm.do");
		ModelAndView result = new ModelAndView();
		
		BoardVO getBoard = boardDAOService.getDetail(boardVO);
		
		result.setViewName("qna_board_reply");
		result.addObject("getBoard", getBoard);
		
		return result;
	}

	/*2017-07-30 ´Ù¿¹ : qna_board_reply - ÀÔ·Â¹ŞÀº µ¥ÀÌÅÍÃ³¸®*/
	@RequestMapping("/BoardReplyAction.do")
	public ModelAndView reply(BoardVO boardVO) {
		System.out.println("BoardController-/BoardReplyAction.do");
		ModelAndView result = new ModelAndView();
		
		BoardVO getBoard = boardDAOService.boardReply(boardVO);
		
		result.setViewName("redirect:/BoardList.do");
		result.addObject("getBoard", getBoard);
		
		return result;
	}
	
	/*2017-07-30 ´Ù¿¹ : qna_board_modify·Î ÀÌµ¿*/
	@RequestMapping("/BoardModifyForm.do")
	public ModelAndView modify_form(BoardVO boardVO) {
		System.out.println("BoardController-/BoardModifyForm.do");
		ModelAndView result = new ModelAndView();
		
		BoardVO getBoard = boardDAOService.getDetail(boardVO);
		
		result.addObject("getBoard", getBoard);
		result.setViewName("qna_board_modify");
		
		return result;
	}
	
	/*2017-07-30 ´Ù¿¹ : qna_board_modify - ÀÔ·Â¹ŞÀº µ¥ÀÌÅÍÃ³¸®*/
	@RequestMapping("/BoardModifyAction.do")
	public ModelAndView modify(BoardVO boardVO, HttpServletResponse response) throws Exception {
		System.out.println("BoardController-/BoardModifyAction.do");
		ModelAndView result = new ModelAndView();
		
		//¼öÁ¤µÇ±âÀü µ¥ÀÌÅÍ
		BoardVO getBoard = boardDAOService.getDetail(boardVO);
		
		//ÀÔ·Â¹ŞÀº ºñ¹Ğ¹øÈ£
		String password = boardVO.getBoard_password();
		//ºñ¹Ğ¹øÈ£°¡ ¸ÂÀ¸¸é ¼öÁ¤ÇÏ±â
		if(getBoard.getBoard_password().equals(password)) {
			//¼öÁ¤µÈ µ¥ÀÌÅÍ
			boardDAOService.boardModify(boardVO);
			//¼öÁ¤ÇÑ ÈÄ ¼öÁ¤µÈ ³»¿ëÀ» »ó¼¼º¸±â·Î º¸¿©ÁÖ±â
			result.setViewName("redirect:/BoardDetail.do?board_num=" + boardVO.getBoard_num());
			//¼öÁ¤µÈ µ¥ÀÌÅÍ¸¦ »ó¼¼º¸±â·Î º¸³»±â
			result.addObject("boardVO", boardVO);
		}
		else {
			//¼öÁ¤µÇÁö ¾ÊÀº ³»¿ëÀ» »ó¼¼º¸±â·Î º¸±â
			System.out.println("°Ô½Ã±Û ¼öÁ¤ ½ÇÆĞ");
			result.setViewName("redirect:/BoardDetail.do?board_num=" + boardVO.getBoard_num());
			result.addObject("boardVO", boardVO);

			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("EUC-KR");
			out.println("<script>");
			out.println("alert('ºñ¹Ğ¹øÈ£°¡ ÀÏÄ¡ÇÏÁö ¾Ê½À´Ï´Ù.');");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();
		}
		
		return result;
	}
	
	/*2017-07-31 ´Ù¿¹ : faq ÀÌµ¿- ÀÔ·Â¹ŞÀº µ¥ÀÌÅÍÃ³¸®*/
	@RequestMapping("FAQ.do")
	public String faq() {
		return "faq";
	}
}