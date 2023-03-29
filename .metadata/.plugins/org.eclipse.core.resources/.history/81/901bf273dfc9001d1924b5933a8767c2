package chap98_homework.nc230323.student;

public class PrintStRank {
	public void makeMajorArr(Student[] stArr) {
		int mathCnt = 0;
		int engCnt = 0;
		int comCnt = 0;
		
		for(int i = 0; i < stArr.length; i++) {
			if(stArr[i] != null) {
				if(stArr[i].getClass().getSimpleName().equals("MathStudent")) {
					mathCnt++;
				} else if(stArr[i].getClass().getSimpleName().equals("EngStudent")) {
					engCnt++;
				} else if(stArr[i].getClass().getSimpleName().equals("ComStudent")) {
					comCnt++;
				}
			}
		}
		
		MathStudent[] mstArr = {};
		EngStudent[] engArr = {};
		ComStudent[] comArr = {};
		
		if(mathCnt != 0) {
			mstArr = new MathStudent[mathCnt];
			
			int index = 0;
			
			for(int i = 0; i < stArr.length; i++) {
				if(stArr[i] != null) {
					if(stArr[i].getClass().getSimpleName().equals("MathStudent")) {
						mstArr[index] = new MathStudent(stArr[i].getSno(),
								stArr[i].getName());
						mstArr[index].subject = stArr[i].getSubject();
						mstArr[index++].finalExam = stArr[i].getScore();
					}
				}
			}
		}
		
		if(engCnt != 0) {
			engArr = new EngStudent[engCnt];
			
			int index = 0;
			
			for(int i = 0; i < stArr.length; i++) {
				if(stArr[i] != null) {
					if(stArr[i].getClass().getSimpleName().equals("EngStudent")) {
						engArr[index] = new EngStudent(stArr[i].getSno(),
								stArr[i].getName());
						engArr[index].subject = stArr[i].getSubject();
						engArr[index++].finalExam = stArr[i].getScore();
					}
				}
			}
		}
		
		if(comCnt != 0) {
			comArr = new ComStudent[comCnt];
			
			int index = 0;
			
			for(int i = 0; i < stArr.length; i++) {
				if(stArr[i] != null) {
					if(stArr[i].getClass().getSimpleName().equals("ComStudent")) {
						comArr[index] = new ComStudent(stArr[i].getSno(),
								stArr[i].getName());
						comArr[index].subject = stArr[i].getSubject();
						comArr[index++].finalExam = stArr[i].getScore();
					}
				}
			}
		}
		
		printRank(mstArr, engArr, comArr);
	}
	
	public void printRank(MathStudent[] mstArr, EngStudent[] engArr, ComStudent[] comArr) {
		if(mstArr.length != 0) {
			for(int i = 0; i < mstArr.length; i++) {
				for(int j = 0; j < i; j++) {
					if(i > 0 && mstArr[i].getAvg() > mstArr[j].getAvg()) {
						MathStudent temp = mstArr[i];
						mstArr[i] = mstArr[j];
						mstArr[j] = temp;
					}
				}
			}
			
			for(int k = 0; k < mstArr.length; k++) {
				System.out.println("순위 : " + (k + 1));
				mstArr[k].printInfo();
			}
		}
		
		if(engArr.length != 0) {
			for(int i = 0; i < engArr.length; i++) {
				for(int j = 0; j < i; j++) {
					if(i > 0 && engArr[i].getAvg() > engArr[j].getAvg()) {
						EngStudent temp = engArr[i];
						engArr[i] = engArr[j];
						engArr[j] = temp;
					}
				}
			}
			
			for(int k = 0; k < engArr.length; k++) {
				System.out.println("순위 : " + (k + 1));
				engArr[k].printInfo();
			}
		}
		
		if(comArr.length != 0) {
			for(int i = 0; i < comArr.length; i++) {
				for(int j = 0; j < i; j++) {
					if(i > 0 && comArr[i].getAvg() > comArr[j].getAvg()) {
						ComStudent temp = comArr[i];
						comArr[i] = comArr[j];
						comArr[j] = temp;
					}
				}
			}
			
			for(int k = 0; k < comArr.length; k++) {
				System.out.println("순위 : " + (k + 1));
				comArr[k].printInfo();
			}
		}
	}
}
