package controller;

public class ViewResolver {
	// ./main.do
	// prefix: ./
	// suffix: .do
	// Resolver ���� ���� set���� �����͸� �����Ѵ�
	
	public String prefix;
	public String suffix;
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}
	// ���ξ�+���+���̾�
	public String getView(String view) {
		return prefix+view+suffix;
	}

	
}
