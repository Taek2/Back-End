package model.profile;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

class ProfileRowMapper implements RowMapper<ProfileVO> {

	@Override
	public ProfileVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProfileVO data=new ProfileVO();
		data.setId(rs.getString("id"));
		data.setPw(rs.getString("pw"));
		data.setName(rs.getString("name"));
		data.setImage(rs.getString("image"));
		data.setEmail(rs.getString("email"));
		data.setPhone(rs.getString("phone"));
		data.setMessage(rs.getString("message"));
		return data;
	}
	
}

@Repository
public class ProfileDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String LoginSQL="SELECT * FROM profile WHERE id=? and pw=?";
	private final String insertProfileSQL="INSERT INTO profile values (?,?,?,?,?,?,?)";
	private final String updateProfileSQL="UPDATE profile SET name=?, email=?, pw=?, phone=?, message=?, image=? WHERE id=?";
	private final String deleteProfileSQL="DELETE FROM profile WHERE id=?";
	
	public ProfileVO Login(ProfileVO vo) {
		Object[] args= { vo.getId(),vo.getPw() };
		return jdbcTemplate.queryForObject(LoginSQL, args,new ProfileRowMapper());
	}
	public boolean insertProfile(ProfileVO vo) {
		Object[] args= { vo.getId(),vo.getPw(),vo.getName(), vo.getImage(), vo.getEmail(), vo.getPhone(), vo.getMessage() };
		try {
			jdbcTemplate.update(insertProfileSQL, args);
			return true;
		} catch(Exception e) {
			return false;
		}
	}
	public void updateProfile(ProfileVO vo) {
		Object[] args= { vo.getName(),vo.getEmail(),vo.getPw(),vo.getPhone(), vo.getMessage(),vo.getImage(), vo.getId() };
		jdbcTemplate.update(updateProfileSQL, args);
	}
	public void deleteProfile(ProfileVO vo) {
		Object[] args= {vo.getId()};
		jdbcTemplate.update(deleteProfileSQL, args);
	}
}