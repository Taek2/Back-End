package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.message.MessageDAO;
import model.message.MessageVO;

public class MessageDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = null;
		
		// 1. uVO를 만들수있는 인자들을 get()
		// 2. 로그인 성공,실패여부 판단
		// 3. 성공: 세션세팅 / 실패: 스크립트 출력
		MessageDAO mDAO=new MessageDAO();
		MessageVO mVO=new MessageVO();
		mVO.setMnum(Integer.parseInt(request.getParameter("mnum")));
		
		
		
		if(mDAO.deleteDB(mVO)) {
			forward=new ActionForward();
			forward.setRedirect(true);
			forward.setPath("main.do");
		}
		else {
			PrintWriter out=response.getWriter();
			try {
				throw new Exception("DB 삭제 오류 발생!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return forward;
	}

}
