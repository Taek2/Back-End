package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberVO;
import model.message.MessageDAO;
import model.message.MessageVO;

public class MainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		String mcntt=request.getParameter("mcnt");
		int mcnt=1;
		if(mcntt!=null){
			mcnt=Integer.parseInt(mcntt);
		}
				
		String selUser=request.getParameter("selUser");
		
		MessageDAO mDAO=new MessageDAO();
		MemberDAO uDAO = new MemberDAO();
		ArrayList<MessageVO> datas = mDAO.getDBList(selUser, mcnt);
		ArrayList<MemberVO> newUsers=uDAO.getNewList();
		request.setAttribute("datas", datas);
		request.setAttribute("newUsers", newUsers);
		request.setAttribute("selUser", selUser);
		request.setAttribute("mcnt", mcnt);
		
		forward.setRedirect(false);
		forward.setPath("main.jsp");
		return forward;
	}

}
