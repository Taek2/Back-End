package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;
import model.board.BoardVO;


public class WriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = null;
		
		// 1. uVO를 만들수있는 인자들을 get()
		// 2. 로그인 성공,실패여부 판단
		// 3. 성공: 세션세팅 / 실패: 스크립트 출력
		BoardVO bVO= new BoardVO();
		BoardDAO bDAO = new BoardDAO();
		
		bVO.setWriter(request.getParameter("writer"));
		bVO.setContent(request.getParameter("content"));
		bVO.setTitle(request.getParameter("title"));
		
		if(bDAO.insertBoard(bVO)) {
			forward=new ActionForward();
			forward.setRedirect(false);
			request.setAttribute("pageNum", request.getParameter("pageNum"));
			forward.setPath("main.do");
		}
		else {
			// 예외를 발생시켜 에러페이지로 이동
			try {
				throw new Exception("DB 변경 오류 발생!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return forward;
	}

}
