package model.member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

class MemberRowMapper implements RowMapper<MemberVO>{
	@Override
	public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		MemberVO data = new MemberVO();
		data.setId(rs.getString("id"));
		data.setPassword(rs.getString("password"));
		data.setName(rs.getString("name"));
		data.setRole(rs.getString("role"));
		return data;
	}
}

@Repository
public class MemberDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String insertSQL="INSERT INTO member2 (id, password, name, role) values(?, ?, ?, ?)";
	private final String updateSQL="UPDATE member2 SET password=?, name=?, role=? WHERE id=? ";
	private final String deleteSQL="DELETE FROM member2 WHERE id=?";
	private final String getMemberSQL="SELECT * FROM member2 WHERE id=? and password=?";
	private final String getMemberListSQL="SELECT * FROM member2";
	
	public List<MemberVO> getMemberList() {
		System.out.println("JdbcTemplate���� getMemberList");
		return jdbcTemplate.query(getMemberListSQL, new MemberRowMapper());
	}
	
	public MemberVO getMember(MemberVO vo) {
		System.out.println("JdbcTemplate���� getMember");
		Object[] args= {vo.getId(), vo.getPassword()};
		MemberVO data = new MemberVO();
		try {
			data = jdbcTemplate.queryForObject(getMemberSQL, args, new MemberRowMapper());
			System.out.println("�α��� ����!");
		} catch(Exception e){
			data = null;
			System.out.println("�α��� ����!");
		}
		return data;
		
	}
	public void insertMember(MemberVO vo) {
		System.out.println("JdbcTemplate���� INSERT");
		jdbcTemplate.update(insertSQL, vo.getId(), vo.getPassword(), vo.getName(), vo.getRole());
	}
	
	public void updateMember(MemberVO vo) {
		System.out.println("JdbcTemplate���� UPDATE");
		jdbcTemplate.update(updateSQL, vo.getPassword(), vo.getName(), vo.getRole(), vo.getId());
	}
	
	public void deleteMember(MemberVO vo) {
		System.out.println("JdbcTemplate���� DELETE");
		jdbcTemplate.update(deleteSQL, vo.getId());
	}
}
