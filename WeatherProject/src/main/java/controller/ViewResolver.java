package controller;

public class ViewResolver {
	// ./main.do
	// prefix: ./
	// suffix: .do
	// Resolver 류는 보통 set으로 데이터를 셋팅한다
	
	public String prefix;
	public String suffix;
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}
	// 접두어+경로+접미어
	public String getView(String view) {
		return prefix+view+suffix;
	}

	
}
