package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.postInfo.CalcDateDiff;
import model.postInfo.PostInfoService;
import model.postInfo.PostInfoVO;

@Controller
public class PostInfoController {

	@Autowired
	private PostInfoService postInfoService;
	@Autowired
	private CalcDateDiff calcDateDiff;
	
	@RequestMapping("/index.do")
	public String showMain(Model model) {
		ArrayList<PostInfoVO> recentData = new ArrayList<PostInfoVO>();
		// CalcDateDiff calcDateDiff = new CalcDateDiff();
		recentData = (ArrayList<PostInfoVO>) postInfoService.getRecentList();
		
		for(PostInfoVO v : recentData) {
			v.setPdate(calcDateDiff.Calc(v.getPdate()));
		}
		model.addAttribute("recentData", recentData);
		
		return "index.jsp";
	}
	
	@RequestMapping("/insertPost.do")
	public String insertPost(PostInfoVO vo) {
		if(postInfoService.insertPost(vo)) {
			return "redirect:comments.do";
		}
		
		return "redirect:comments.do";
	}
	
	@RequestMapping("/comments.do")
	public String showPostList(Model model, HttpServletRequest request) {
		ArrayList<PostInfoVO> pData = new ArrayList<PostInfoVO>();
		// CalcDateDiff calcDateDiff = new CalcDateDiff();
		pData = (ArrayList<PostInfoVO>) postInfoService.getPostList();
		int boardCount = pData.size();
		int maxPage = 0; // �ִ� ������ ��ȣ
		int viewPage = 9; // �� ������ �� ���̴� ���� ����
		int pageNum = 1;

		if(boardCount % viewPage == 0) { // 10, 20, 30...
			maxPage = boardCount / viewPage;
		}
		else {
			maxPage = boardCount / viewPage + 1;
		}
		List<PostInfoVO> sliceData = new ArrayList<PostInfoVO>();

		// data �������� �°� �ڸ���
		// �������� ������ 10���� ������ data �״�� ��� 
		if(boardCount <= viewPage) {
			sliceData = pData;
		}
		else {
			// pageNum�� ���� �� , 1 ������(0~10) ���
			if(request.getParameter("pageNum") == null) {
				sliceData = pData.subList(0, viewPage);
			}
			// pageNum�� �ش��ϴ� ������ 10�� ���
			else {
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
				if(boardCount <= (viewPage*pageNum)) {
					sliceData = pData.subList((viewPage*(pageNum-1)), boardCount);
				}
				else {
					sliceData = pData.subList((viewPage*(pageNum-1)), (viewPage*pageNum));
				}
			}
		}
		
		
		for(PostInfoVO v : sliceData) {
			v.setPdate(calcDateDiff.Calc(v.getPdate()));
		}
		model.addAttribute("pData", sliceData);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("pageNum", pageNum);
		return "comments.jsp";
	}
	
	@RequestMapping("/updatePost.do")
	public void updatePost(PostInfoVO vo, HttpServletResponse response) {
		
		response.setContentType("text/html; charset=UTF-8"); 
		if(postInfoService.updatePost(vo)) {
			PostInfoVO newData = postInfoService.getPost(vo);
			try {
				PrintWriter out = response.getWriter();
				String content = newData.getContent().replace("\n"," ");
				String pdate = calcDateDiff.Calc(newData.getPdate());
				// json ������ ���� ����� �ֱ�
				String result = "[{\"content\":\"" + content+"\",\"pdate\":\"" + pdate + "\"}]";
				out.print(result);
			} catch (IOException e) {	
				e.printStackTrace();
			}
		}
		else {
			System.out.println("������Ʈ ����!");
		}
	}
	
	@RequestMapping("/deletePost.do")
	public void deletePost(PostInfoVO vo, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		if(postInfoService.deletePost(vo)) {
			try {
				PrintWriter out = response.getWriter();
				out.print("true");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			System.out.println("�� ���� ����!");
		}
	}
	
}
