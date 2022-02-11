package model.postInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("postInfoService")
public class PostInfoServiceImpl implements PostInfoService{

	@Autowired
	private PostInfoDAO postInfoDAO;
	
	@Override
	public List<PostInfoVO> getPostList() {
		return postInfoDAO.getPostList();
	}

	@Override
	public boolean insertPost(PostInfoVO vo) {
		return postInfoDAO.insertPost(vo);
	}

	@Override
	public boolean updatePost(PostInfoVO vo) {
		return postInfoDAO.updatePost(vo);
	}

	@Override 
	public boolean deletePost(PostInfoVO vo) {
		return postInfoDAO.deletePost(vo);
	}

	@Override
	public PostInfoVO getPost(PostInfoVO vo) {	
		return postInfoDAO.getPost(vo);
	}

	@Override
	public List<PostInfoVO> getRecentList() {	
		return postInfoDAO.getRecentList();
	}

}
