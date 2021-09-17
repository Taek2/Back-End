package model.reply;

import java.util.ArrayList;

public class ReplySet {
	private ReplyVO r;
	private ArrayList<RReplyVO> rrlist = new ArrayList<RReplyVO>();
	public ReplyVO getR() {
		return r;
	}
	@Override
	public String toString() {
		return "ReplySet [r=" + r + ", rrlist=" + rrlist + "]";
	}
	public void setR(ReplyVO r) {
		this.r = r;
	}
	public ArrayList<RReplyVO> getRrlist() {
		return rrlist;
	}
	public void setRrlist(ArrayList<RReplyVO> rrlist) {
		this.rrlist = rrlist;
	}
	
	
}
