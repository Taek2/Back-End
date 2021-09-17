package controller.action;

// 1. 페이지 전달방식
// 2. 경로
public class ActionForward {
	private boolean redirect;
	private String path;
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
