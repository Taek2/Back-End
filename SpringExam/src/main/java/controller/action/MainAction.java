package controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;
import model.board.BoardVO;

public class MainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		System.out.println(request.getParameter("pageNum"));
		BoardVO bVO = new BoardVO();
		BoardDAO bDAO = new BoardDAO();
		ArrayList<BoardVO> datas = bDAO.getBoardList();
		
		int boardCount = datas.size();
		int maxPage = 0; // �ִ� ������ ��ȣ
		int viewPage = 10; // �� ������ �� ���̴� ���� ����
		int pageNum = 1;
		
		if(boardCount % 10 == 0) { // 10, 20, 30...
			maxPage = boardCount / viewPage;
		}
		else {
			maxPage = boardCount / viewPage + 1;
		}
		List<BoardVO> sliceData = new ArrayList<BoardVO>();
		
		// data �������� �°� �ڸ���
		// �������� ������ 10���� ������ data �״�� ��� 
		if(boardCount <= viewPage) {
			sliceData = datas;
		}
		else {
			// pageNum�� ���� �� , 1 ������(0~10) ���
			if(request.getParameter("pageNum") == null) {
				sliceData = datas.subList(0, viewPage);
			}
			// pageNum�� �ش��ϴ� ������ 10�� ���
			else {
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
				if(boardCount <= (viewPage*pageNum)) {
					sliceData = datas.subList((viewPage*(pageNum-1)), boardCount);
				}
				else {
					sliceData = datas.subList((viewPage*(pageNum-1)), (viewPage*pageNum));
				}
			}
		}

		request.setAttribute("datas", sliceData);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("pageNum", pageNum);
		forward.setRedirect(false);
		forward.setPath("main.jsp");
		return forward;
	}

}
