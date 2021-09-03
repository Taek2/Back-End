package tag;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class TestTagHandler extends SimpleTagSupport {

	// 태그를 불렀을 때 실행되는 함수 -> doTag()
	// 실제 태그의 기능을 정의하는 메서드
	// 시작 태그를 만나면 호출됨
	public void doTag() throws IOException {
		// JSP로부터 정보를 받아올 수 있게 하는 메서드 -> getJspContext()
		// getOut() : out 객체를 참조할 때 사용
		JspWriter out = getJspContext().getOut();
		out.println("태그 핸들러 클래스 기반 실습중!");
	}
}
