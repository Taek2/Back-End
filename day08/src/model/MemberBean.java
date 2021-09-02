package model;

public class MemberBean {
	private String id = "garen";
	private String pw = "0000";
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	
	public boolean login(String id, String pw) {
		if(this.id.equals(id) && this.pw.equals(pw)) {
			return true;
		}
		else {
			return false;
		}
	}
}
