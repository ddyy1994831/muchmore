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

		int page = 1; // 초기 페이지
		int limit = 10; // 한 화면에 출력될 글의 개수

		// 최초로 호출하면 getPamete("page") == null
		if (request.getParameter("page") != null) {
			// 특정 페이지 번호를 클릭했을 때 동작
			page = Integer.parseInt(request.getParameter("page"));
		}

		int listcount = boardDAOService.getListCount(); // 총 리스트 수를 받아옴 : 총 글의 개수														// 개수
		boardlist = boardDAOService.getBoardList(page, limit); // 리스트를 받아옴 : 총 글의 내용 1~10

		//"페이지 수 계산 과정"
		//총 페이지 수 : 0.95를 더해서 올림
		int maxpage = (int) ((double) listcount / limit + 0.95); 
		// 현재 페이지에 보여줄 시작 페이지 수 : 1, 11, 21...등
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수 : 10, 20, 30...등
		int endpage = startpage + 10 - 1;

		// maxpage는 실제 가장 큰 페이지
		if (endpage > maxpage) {
			endpage = maxpage;
		}

		// 지금까지 구한 모든 값을 request객체에 저장
		result.addObject("page", page);				// 현재 페이지 수
		result.addObject("maxpage", maxpage);		// 최대 페이지 수
		result.addObject("startpage", startpage);	// 현재 페이지에 표시할 첫 페이지 수
		result.addObject("endpage", endpage);		// 현재 페이지에 표시할 끝 페이지 수
		result.addObject("listcount", listcount);	// 전체 글의 갯수
		result.addObject("boardlist", boardlist);
		
		// 리스트로 이동
		result.setViewName("qna_board_list");

		return result;
	}
	
	//qna_board_list에서 글쓰기 버튼을 눌렀을 때 : 글쓰기 폼으로 이동
	@RequestMapping("/BoardWriteForm.do")
	public ModelAndView insert_form(HttpSession session) {
		System.out.println("BoardController-/BoardWriteForm.do");
		
		ModelAndView result = new ModelAndView();
		
		//글쓰기 폼에 로그인된 사람의 id를 가져오기 위함
		String id = (String)session.getAttribute("id");
		
		result.addObject("writer", id);
		
		result.setViewName("qna_board_write");
		
		return result;
	}
	
	//qna_board_writer에서 글쓰기 버튼을 눌렀을 때 : 글쓰기 insert
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
	
	//qna_board_view_check로 이동
	@RequestMapping("/BoardViewCheck.do")
	public String view_checkForm() {
		System.out.println("BoardController-/BoardViewCheck.do");
		
		return "qna_board_view_check";
	}
	
	//qna_board_view_check : 입력받은 비밀번호와 데이터베이스에 있는 비밀번호 비교 후 게시글 상세보기
	@RequestMapping("/BoardViewAction.do")
	public String viewCheck(BoardVO boardVO, HttpServletResponse response) throws Exception {
		System.out.println("BoardController-/BoardViewAction.do");
		
		BoardVO getBoard = boardDAOService.getDetail(boardVO);
		
		//입력받은 비밀번호
		String password = boardVO.getBoard_password();
		//비밀번호가 맞으면
		if(getBoard.getBoard_password().equals(password)) {
			return "redirect:/BoardDetail.do?board_num=" + getBoard.getBoard_num();
		}
		else {
			System.out.println("비밀번호가 틀린 경우 상세보기 실패");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();
			
			return "redirect:/BoardList.do";
		}
	}
	
	//게시글 상세보기
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
	
	//qna_board_delete로 이동
	@RequestMapping("/BoardDeleteForm.do")
	public String delete_form() {
		System.out.println("BoardController-/BoardDeleteForm.do");
		
		return "qna_board_delete";
	}
	
	//qna_board_delete : 입력받은 비밀번호와 데이터베이스에 있는 비밀번호 비교 후 삭제 처리
	@RequestMapping("/BoardDeleteAction.do")
	public String delete(BoardVO boardVO, HttpServletResponse response) throws Exception {
		System.out.println("BoardController-/BoardDeleteAction.do");
		
		BoardVO getBoard = boardDAOService.getDetail(boardVO);
		
		//입력받은 비밀번호
		String password = boardVO.getBoard_password();
		//비밀번호가 맞으면
		if(getBoard.getBoard_password().equals(password)) {
			boardDAOService.boardDelete(getBoard);
		}
		else {
			System.out.println("비밀번호가 틀린 경우 삭제 실패!");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 실패');");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();
			
			return "redirect:/BoardList.do?BOARD_NUM=" + getBoard.getBoard_num();
		}
		
		return "redirect:/BoardList.do";
	}
	
	//qna_board_reply로 이동
	@RequestMapping("/BoardReplyForm.do")
	public ModelAndView reply_form(BoardVO boardVO) {
		System.out.println("BoardController-/BoardReplyForm.do");
		ModelAndView result = new ModelAndView();
		
		BoardVO getBoard = boardDAOService.getDetail(boardVO);
		
		result.setViewName("qna_board_reply");
		result.addObject("getBoard", getBoard);
		
		return result;
	}

	//qna_board_reply : 입력받은 데이터처리
	@RequestMapping("/BoardReplyAction.do")
	public ModelAndView reply(BoardVO boardVO) {
		System.out.println("BoardController-/BoardReplyAction.do");
		ModelAndView result = new ModelAndView();
		
		BoardVO getBoard = boardDAOService.boardReply(boardVO);
		
		result.setViewName("redirect:/BoardList.do");
		result.addObject("getBoard", getBoard);
		
		return result;
	}
	
	//qna_board_modify로 이동
	@RequestMapping("/BoardModifyForm.do")
	public ModelAndView modify_form(BoardVO boardVO) {
		System.out.println("BoardController-/BoardModifyForm.do");
		ModelAndView result = new ModelAndView();
		
		BoardVO getBoard = boardDAOService.getDetail(boardVO);
		
		result.setViewName("qna_board_modify");
		result.addObject("getBoard", getBoard);
		
		return result;
	}
	
	//qna_board_modify : 입력받은 데이터처리
	@RequestMapping("/BoardModifyAction.do")
	public ModelAndView modify(BoardVO boardVO, HttpServletResponse response) throws Exception {
		System.out.println("BoardController-/BoardModifyAction.do");
		ModelAndView result = new ModelAndView();
		
		//수정되기전 데이터
		BoardVO getBoard = boardDAOService.getDetail(boardVO);
		
		//입력받은 비밀번호
		String password = boardVO.getBoard_password();
		//비밀번호가 맞으면 수정하기
		if(getBoard.getBoard_password().equals(password)) {
			//수정된 데이터
			boardDAOService.boardModify(boardVO);
			//수정한 후 수정된 내용을 상세보기로 보여주기
			result.setViewName("redirect:/BoardDetail.do?board_num=" + boardVO.getBoard_num());
			//수정된 데이터를 상세보기로 보내기
			result.addObject("boardVO", boardVO);
		}
		else {
			//수정되지 않은 내용을 상세보기로 보기
			System.out.println("게시글 수정 실패");
			result.setViewName("redirect:/BoardDetail.do?board_num=" + boardVO.getBoard_num());
			result.addObject("boardVO", boardVO);
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 실패');");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();
		}
		
		return result;
	}
}