package model.member;

public class MemberVO {
	private int pk;
	private String userName;
	private String userID;
	private String userPW;
	public int getPk() {
		return pk;
	}
	public void setPk(int pk) {
		this.pk = pk;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	@Override
	public String toString() {
		return "MemberVO [pk=" + pk + ", userName=" + userName + ", userID=" + userID + ", userPW=" + userPW + "]";
	}
}
