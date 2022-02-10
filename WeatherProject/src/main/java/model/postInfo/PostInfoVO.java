package model.postInfo;

public class PostInfoVO {
	private int pnum;
	private String content;
	private String writer;
	private int plike;
	private String pdate;
	private String p_user;
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getPlike() {
		return plike;
	}
	public void setPlike(int plike) {
		this.plike = plike;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getP_user() {
		return p_user;
	}
	public void setP_user(String p_user) {
		this.p_user = p_user;
	}
	@Override
	public String toString() {
		return "PostInfoVO [pnum=" + pnum + ", content=" + content + ", writer=" + writer + ", plike=" + plike
				+ ", pdate=" + pdate + ", p_user=" + p_user + "]";
	}
}
