package model.postInfo;

import java.util.List;

public interface PostInfoService {
	List<PostInfoVO> getPostList();
	PostInfoVO getPost(PostInfoVO vo);
	boolean insertPost(PostInfoVO vo);
	boolean updatePost(PostInfoVO vo);
	boolean deletePost(PostInfoVO vo);
}
