package chap98_homework.nc230404.enums;

public enum COUNTRY {
	KOR("한국", "불고기"), CHI("중국", "짜장면"), JAP("일본", "초밥"),
	USA("미국", "햄버거");
	
	private String cName;
	private String food;
	
	COUNTRY(String cName, String food) {
		this.cName = cName;
		this.food = food;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}
	
	public void notifyFood(String country) {
		if(this.getcName().equals(country)) {
			System.out.println(country + "의 대표음식은 " 
					+ this.getFood() + "입니다.");
		}
	}
}
