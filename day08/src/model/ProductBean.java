package model;

public class ProductBean {
	private String[] names = {"�Ƹ޸�ī��", "ī���", "�ٴҶ��"};
	private int[] prices = {3000, 3500, 4000};
	public String[] getNames() {
		return names;
	}
	public int[] getPrices() {
		return prices;
	}
	
	public int func1(String name) {
		for(int i = 0; i < this.names.length; i++) {
			if(names[i].equals(name)) {
				return prices[i];
			}
		}
		return 0;
	}
	
	
}
