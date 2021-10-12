package model.board;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

// �����ϴ� �ΰ��� ���
// 1. extends ��ӹ޾Ƽ� ���� 
// 2. JdbcTemplate�� <bean> ���, ������ ���� �޾� ���
class BoardRowMapper implements RowMapper<BoardVO>{

	@Override
	public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		BoardVO data = new BoardVO();
		data.setId(rs.getInt("id"));
		data.setTitle(rs.getString("title"));
		data.setWriter(rs.getString("writer"));
		data.setContent(rs.getString("content"));
		data.setWdate(rs.getDate("wdate"));
		return data;
	}
}
@Repository("boardDAO")
public class BoardDAO{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String insertSQL="INSERT INTO board (id, title, writer, content) values((SELECT NVL(MAX(id),0)+1 FROM board), ?, ?, ?)";
	private final String updateSQL="UPDATE board SET title=?, writer=?, content=?, wdate=sysdate WHERE id=? ";
	private final String deleteSQL="DELETE FROM board WHERE id=?";
	private final String getBoardSQL="SELECT * FROM board WHERE id=?";
	private final String getBoardListSQL="SELECT * FROM board WHERE title LIKE ?";
	
	public List<BoardVO> getBoardList(String text) {
		System.out.println("JdbcTemplate���� getboardList");
		text = "%"+text+"%";
		Object[] args= {text};
		return jdbcTemplate.query(getBoardListSQL,args, new BoardRowMapper());
	}
	
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("JdbcTemplate���� getboard");
		Object[] args= {vo.getId()};
		return jdbcTemplate.queryForObject(getBoardSQL, args, new BoardRowMapper());
	}
	public void insertBoard(BoardVO vo) {
		System.out.println("JdbcTemplate���� INSERT");
		jdbcTemplate.update(insertSQL, vo.getTitle(), vo.getWriter(), vo.getContent());
	}
	
	public void updateBoard(BoardVO vo) {
		System.out.println("JdbcTemplate���� UPDATE");
		jdbcTemplate.update(updateSQL, vo.getTitle(), vo.getWriter(), vo.getContent());
	}
	
	public void deleteBoard(BoardVO vo) {
		System.out.println("JdbcTemplate���� DELETE");
		jdbcTemplate.update(deleteSQL, vo.getId());
	}
}
