package controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.message.MessageDAO;
import model.message.MessageVO;

public class MessageWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward forward = new ActionForward();


		String realFolder = "";
		String filename1 = "";
		// ���� ũ�� 15MB�� ����
		int maxSize = 1024*1024*15;
		String encType = "utf-8";
		String savefile = "img";

		// ������ ����� ������ ���
		ServletContext scontext = request.getSession().getServletContext();
		realFolder = scontext.getRealPath(savefile);
		MessageDAO mDAO = new MessageDAO();
		MessageVO mVO = new MessageVO();
		
		try{
			// ���� ���ε�
			MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			Enumeration<?> files = multi.getFileNames(); 
			String file1 = (String)files.nextElement();
			filename1 = multi.getFilesystemName(file1);
			mVO.setWriter(multi.getParameter("writer"));
			mVO.setTitle(multi.getParameter("title"));
			mVO.setContent(multi.getParameter("content"));
			mVO.setMember(Integer.parseInt(multi.getParameter("member")));

		} catch(Exception e) {
			e.printStackTrace();
		}
		realFolder = "img";
		String fullpath = realFolder + "/" + filename1;
		mVO.setPath(fullpath);
		

		if(mDAO.insertDB(mVO)){
			// ���� �������� �ٸ� ������ �̵��� ���� �ַ� redirect ����� �̿��� -> spring���� �ڼ���
			forward.setRedirect(true);
			forward.setPath("main.do");	
			return forward;
		}
		else{
			// ���ܸ� �߻����� ������������ �̵�
			try {
				throw new Exception("DB ���� ���� �߻�!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		forward.setRedirect(true);
		forward.setPath("login.jsp");	
		return forward;
	}


}
