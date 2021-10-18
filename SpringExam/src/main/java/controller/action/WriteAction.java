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
		
		// 1. uVO�� ������ִ� ���ڵ��� get()
		// 2. �α��� ����,���п��� �Ǵ�
		// 3. ����: ���Ǽ��� / ����: ��ũ��Ʈ ���
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
			// ���ܸ� �߻����� ������������ �̵�
			try {
				throw new Exception("DB ���� ���� �߻�!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return forward;
	}

}
