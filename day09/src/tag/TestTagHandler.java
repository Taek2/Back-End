package tag;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class TestTagHandler extends SimpleTagSupport {

	// �±׸� �ҷ��� �� ����Ǵ� �Լ� -> doTag()
	// ���� �±��� ����� �����ϴ� �޼���
	// ���� �±׸� ������ ȣ���
	public void doTag() throws IOException {
		// JSP�κ��� ������ �޾ƿ� �� �ְ� �ϴ� �޼��� -> getJspContext()
		// getOut() : out ��ü�� ������ �� ���
		JspWriter out = getJspContext().getOut();
		out.println("�±� �ڵ鷯 Ŭ���� ��� �ǽ���!");
	}
}
