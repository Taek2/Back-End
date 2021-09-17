package model.reply;

import java.sql.Date;

public class RReplyVO {
	private int rrpk; // ������ �ѹ�
	private int rrnum; // ����� �ѹ�
	private Date rrdate;
	private String rrcontent;
	private String rrwriter;
	private int rrmember; // ��۾� ��� �ѹ�
	private int rrmnum; // �޽��� �ѹ�
	
	public int getRrnum() {
		return rrnum;
	}
	public void setRrnum(int rrnum) {
		this.rrnum = rrnum;
	}
	public Date getRrdate() {
		return rrdate;
	}
	public void setRrdate(Date rrdate) {
		this.rrdate = rrdate;
	}
	public String getRrcontent() {
		return rrcontent;
	}
	public void setRrcontent(String rrcontent) {
		this.rrcontent = rrcontent;
	}
	public String getRrwriter() {
		return rrwriter;
	}
	public void setRrwriter(String rrwriter) {
		this.rrwriter = rrwriter;
	}
	
	public int getRrpk() {
		return rrpk;
	}
	public void setRrpk(int rrpk) {
		this.rrpk = rrpk;
	}
	public int getRrmember() {
		return rrmember;
	}
	public void setRrmember(int rrmember) {
		this.rrmember = rrmember;
	}
	
	public int getRrmnum() {
		return rrmnum;
	}
	public void setRrmnum(int rrmnum) {
		this.rrmnum = rrmnum;
	}
	@Override
	public String toString() {
		return "RReplyVO [rrnum=" + rrnum + ", rrdate=" + rrdate + ", rrcontent=" + rrcontent + ", rrwriter=" + rrwriter
				+ "]";
	}
	
	
	
}
