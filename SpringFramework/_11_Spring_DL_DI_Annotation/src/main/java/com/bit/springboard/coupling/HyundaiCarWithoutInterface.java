package com.bit.springboard.coupling;

public class HyundaiCarWithoutInterface implements Car {
	//의존관계 생성
	//HyundaiCar가 CarAudio에 의존함
	//CarAudio의 내용이 변경되면 HyundaiCar의 결과가 바뀌기 때문에 의존관계가 형성된다.
	//카오디오를 변경하고 싶을때마다 소스코드를 모두 수정해야한다.
	SonyCarAudio sonyCarAudio;
	AppleCarAudio appleCarAudio;
	
	String model;
	
	public HyundaiCarWithoutInterface() {
		System.out.println("HyundaiCar 기본생성자 호출");
	}
	
	public HyundaiCarWithoutInterface(SonyCarAudio sonyCarAudio) {
		this.sonyCarAudio = sonyCarAudio;
		System.out.println("HyundaiCar CarAudio 파라미터 생성자 호출");
	}
	
	public HyundaiCarWithoutInterface(SonyCarAudio sonyCarAudio/*id가 carAuido인 new CarAudio();*/
			, String model) {
		//root-context에서 bean으로 생성한 객체를 의존성으로 주입
		this.sonyCarAudio = sonyCarAudio;
		//현대카 객체가 생성되면서 현대카안의 carAudio 변수는 초기화(객체가 주입, 의존성이 주입)
		//가 된 상태
		this.model = model;
		System.out.println("HyundaiCar CarAudio, Model 파라미터 생성자 호출");
	}
	
	//bean init-mehtod에서 사용할 메소드 선언
	public void initMethod() {
		this.model = "아반떼";
		System.out.println("HyundaiCar 객체 생성");
	}
	public void destroyMethod() {
		this.model = "";
		System.out.println("HyundaiCar 객체 삭제 전 동작");
	}
	@Override
	public void engineOn() {
		System.out.println("HyundaiCar 시동을 건다");
	}
	@Override
	public void engineOff() {
		System.out.println("HyundaiCar 시동을 끈다.");
	}
	@Override
	public void speedUp() {
		System.out.println("HyundaiCar 속도를 올린다.");
	}
	@Override
	public void speedDown() {
		System.out.println("HyundaiCar 속도를 낮춘다.");
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	
	//이 방식은 메소드가 호출될 때마다 CarAudio객체가 생성되므로 
	//CarAudio객체도 스프링 컨테이너에 생성하고 공유해서 쓸 수 있도록 하는 방식으로 변경이 이뤄져야한다.
	public void volumeUp() {
		//의존성 주입
		//carAudio = new CarAudio();
		//bean 객체의 메소드 사용
		this.sonyCarAudio.volumeUp();
	}
	
	public void volumeDown() {
		//의존성 주입
		//carAudio = new CarAudio();
		//bean 객체의 메소드 사용
		this.sonyCarAudio.volumeDown();
	}
}
