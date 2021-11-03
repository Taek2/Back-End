package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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
	public String showPostList(Model model) {
		ArrayList<PostInfoVO> pData = new ArrayList<PostInfoVO>();
		// CalcDateDiff calcDateDiff = new CalcDateDiff();
		pData = (ArrayList<PostInfoVO>) postInfoService.getPostList();
		
		for(PostInfoVO v : pData) {
			v.setPdate(calcDateDiff.Calc(v.getPdate()));
		}
		
		model.addAttribute("pData", pData);
		return "comments.jsp";
	}
	
	@RequestMapping("/updatePost.do")
	public void updatePost(PostInfoVO vo, HttpServletResponse response) {
		// CalcDateDiff calcDateDiff = new CalcDateDiff();
		
		response.setContentType("text/html; charset=UTF-8"); 
		if(postInfoService.updatePost(vo)) {
			PostInfoVO newData = postInfoService.getPost(vo);
			try {
				PrintWriter out = response.getWriter();
				String content = newData.getContent().replace("\n"," ");
				
				System.out.println("현재 시각: " + newData.getPdate());
				String pdate = calcDateDiff.Calc(newData.getPdate());
				String result = "[{\"content\":\"" + content+"\",\"pdate\":\"" + pdate + "\"}]";
				out.print(result);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			System.out.println("업데이트 오류!");
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
			System.out.println("글 삭제 오류!");
		}
	}
	
}
