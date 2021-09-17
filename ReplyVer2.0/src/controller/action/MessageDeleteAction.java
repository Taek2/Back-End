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
		
		// 1. uVO�� ������ִ� ���ڵ��� get()
		// 2. �α��� ����,���п��� �Ǵ�
		// 3. ����: ���Ǽ��� / ����: ��ũ��Ʈ ���
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
				throw new Exception("DB ���� ���� �߻�!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return forward;
	}

}
