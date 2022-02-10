package model.postInfo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import model.postInfo.PostInfoVO;

class PostInfoRowMapper implements RowMapper<PostInfoVO> {

	@Override
	public PostInfoVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		PostInfoVO data=new PostInfoVO();
		data.setPnum(rs.getInt("pnum"));
		data.setContent(rs.getString("content"));
		data.setWriter(rs.getString("writer"));
		data.setPlike(rs.getInt("plike"));
		data.setPdate(rs.getString("pdate"));
		data.setP_user(rs.getString("p_user"));
		return data;
	}
	
}
@Repository
public class PostInfoDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final String getPostListSQL="SELECT * FROM postInfo ORDER BY pdate DESC";
	private final String getPostSQL="SELECT * FROM postInfo WHERE pnum=?";
	private final String insertPostSQL="INSERT INTO postInfo (pnum, content, writer, p_user) VALUES ((SELECT NVL(MAX(pnum),0) + 1 FROM postInfo), ?, ?, ?)";
	private final String updatePostSQL="UPDATE postInfo SET content=?, pdate=sysdate WHERE pnum=?";
	private final String deletePostSQL="DELETE FROM postInfo WHERE pnum=?";
	
	private final String getRecentListSQL="SELECT * FROM (SELECT * FROM postInfo ORDER BY pdate DESC) WHERE ROWNUM <= 4";
	// "SELECT * FROM (SELECT * FROM post ORDER BY views DESC) WHERE ROWNUM <= 10"
	public List<PostInfoVO> getPostList() {
		return jdbcTemplate.query(getPostListSQL, new PostInfoRowMapper());
	}
	public PostInfoVO getPost(PostInfoVO vo) {
		Object[] args= {vo.getPnum()};
		return jdbcTemplate.queryForObject(getPostSQL, args, new PostInfoRowMapper());
	}
	public boolean insertPost(PostInfoVO vo) {
		Object[] args= {vo.getContent(), vo.getWriter(), vo.getP_user()};
		try {
			jdbcTemplate.update(insertPostSQL, args);
			return true;
		} catch(Exception e) {
			return false;
		}
	}
	public boolean updatePost(PostInfoVO vo) {
		Object[] args= {vo.getContent(), vo.getPnum()};
		try {
			jdbcTemplate.update(updatePostSQL, args);
			return true;
		} catch(Exception e) {
			return false;
		}
	}
	public boolean deletePost(PostInfoVO vo) {
		Object[] args= {vo.getPnum()};
		try {
			jdbcTemplate.update(deletePostSQL, args);
			return true;
		} catch(Exception e) {
			return false;
		}
	}
	
	public List<PostInfoVO> getRecentList() {
		return jdbcTemplate.query(getRecentListSQL, new PostInfoRowMapper());
	}
}
