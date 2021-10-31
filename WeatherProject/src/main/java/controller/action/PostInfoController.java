package controller.action;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.postInfo.PostInfoService;
import model.postInfo.PostInfoVO;

@Controller
public class PostInfoController {

	@Autowired
	private PostInfoService postInfoService;
	
	/*
	@RequestMapping("/insertPost.do")
	public String insertPost(PostInfoVO vo) {
		if(postInfoService.insertPost(vo)) {
			return ""
		}
		
		return "";
	}
	*/
	@RequestMapping("/comments.do")
	public String showPostList(Model model) {
		ArrayList<PostInfoVO> pData = new ArrayList<PostInfoVO>();
		pData = (ArrayList<PostInfoVO>) postInfoService.getPostList();
		
		model.addAttribute("pData", pData);
		return "comments.jsp";
	}
	
}
