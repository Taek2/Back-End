package model.member;

public class MemberVO {
	private int memnum;
	private String mid;
	private String mpw;
	public int getMemnum() {
		return memnum;
	}
	public void setMemnum(int mnum) {
		this.memnum = mnum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	@Override
	public String toString() {
		return "MemberVO [memnum=" + memnum + ", mid=" + mid + ", mpw=" + mpw + "]";
	}
	

}
