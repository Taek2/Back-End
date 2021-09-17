package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.message.MessageDAO;
import model.message.MessageVO;
import model.message.MsgSet;

public class MessageUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward=null;

		MessageDAO mDAO = new MessageDAO();
		MessageVO mVO = new MessageVO();
		mVO.setMnum(Integer.parseInt(request.getParameter("mnum")));
		mVO.setMember(Integer.parseInt(request.getParameter("member")));
		mVO.setWriter(request.getParameter("writer"));
		mVO.setTitle(request.getParameter("title"));
		mVO.setContent(request.getParameter("content"));
		mVO.setPath(request.getParameter("path"));
	
		if(mDAO.updateDB(mVO)) {
			forward=new ActionForward();
			forward.setRedirect(true);
			forward.setPath("main.do");
		}
		else {
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
