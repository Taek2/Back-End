package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import model.common.JDBC;

// @Repository("memberDAO")
public class MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private final String insertSQL="INSERT INTO member2 (id, password, name, role) values(?, ?, ?, ?)";
	private final String updateSQL="UPDATE member2 SET password=?, name=?, role=? WHERE id=? ";
	private final String deleteSQL="DELETE FROM member2 WHERE id=?";
	private final String getMemberSQL="SELECT * FROM member2 WHERE id=? and password=?";
	private final String getMemberListSQL="SELECT * FROM member2";
	
	public ArrayList<MemberVO> getMemberList() {
		System.out.println("DAO�� getboardList");
		conn = JDBC.getConnection();
		ArrayList<MemberVO> datas = new ArrayList();
		try {
			pstmt = conn.prepareStatement(getMemberListSQL);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO data = new MemberVO();
				data.setId(rs.getString("id"));
				data.setPassword(rs.getString("password"));
				data.setName(rs.getString("name"));
				data.setRole(rs.getString("role"));
				datas.add(data);
			}
			rs.close();
		}
		catch(Exception e) {
			System.out.println("getDBList()���� ���");
			e.printStackTrace();
		}
		finally {
			JDBC.disconnect(pstmt, conn);
		}
		return datas;
	}
	
	public MemberVO getMember(MemberVO vo) {
		System.out.println("DAO�� getboard");
		conn=JDBC.getConnection();
		MemberVO data=null;
		try{
			pstmt=conn.prepareStatement(getMemberSQL);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPassword());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				data=new MemberVO();
				data.setId(rs.getString("id"));
				data.setPassword(rs.getString("password"));
				data.setName(rs.getString("name"));
				data.setRole(rs.getString("role"));
			}			
			rs.close();
		}
		catch(Exception e){
			System.out.println("getDBData()���� ���");
			e.printStackTrace();
		}
		finally {
			JDBC.disconnect(pstmt,conn);
		}
		return data;
		
	}
	public boolean insertMember(MemberVO vo) {
		System.out.println("DAO�� INSERT");
		conn=JDBC.getConnection();
		boolean res = false;
		try{
			pstmt=conn.prepareStatement(insertSQL);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getRole());
			pstmt.executeUpdate();
			res=true;
		}
		catch(Exception e){
			System.out.println("insertDB()���� ���");
			e.printStackTrace();
			//res=false;
		}
		finally {
			JDBC.disconnect(pstmt,conn);
		}
		return res;
	}
	
	public boolean updateMember(MemberVO vo) {
		System.out.println("DAO�� UPDATE");
		conn=JDBC.getConnection();
		boolean res=false;
		try{
			pstmt=conn.prepareStatement(updateSQL);
			pstmt.setString(1, vo.getPassword());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getRole());
			pstmt.setString(4, vo.getId());
			pstmt.executeUpdate();
			res=true;
		}
		catch(Exception e){
			System.out.println("updateDB()���� ���");
			e.printStackTrace();
			//res=false;
		}
		finally {
			JDBC.disconnect(pstmt,conn);
		}
		return res;
	}
	
	public boolean deleteMember(MemberVO vo) {
		System.out.println("DAO�� DELETE");
		conn=JDBC.getConnection();
		boolean res=false;
		try{
			pstmt=conn.prepareStatement(deleteSQL);
			pstmt.setString(1, vo.getId());
			pstmt.executeUpdate();
			res=true;
		}
		catch(Exception e){
			System.out.println("deleteDB()���� ���");
			e.printStackTrace();
			//res=false;
		}
		finally {
			JDBC.disconnect(pstmt,conn);
		}
		return res;
	}

}
