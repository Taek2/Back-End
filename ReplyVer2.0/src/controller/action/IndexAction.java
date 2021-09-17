package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberVO;

public class IndexAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		MemberDAO uDAO = new MemberDAO();
		ArrayList<MemberVO> memberList = uDAO.getDBList();
		request.setAttribute("datas", memberList);
		
		forward.setRedirect(false);
		forward.setPath("login.jsp");	
		return forward;
	}

}
