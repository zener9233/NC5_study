package chap98_homework.nc230323.student;

import java.util.Scanner;

public class MainPage {
	public void printMenu(Scanner sc, Student[] stArr) {
		System.out.println("------학적관리------");
		System.out.println("1. 학생정보 입력");
		System.out.println("2. 학생정보 검색");
		System.out.println("3. 학생정보 전체출력");
		System.out.println("4. 학과별 성적 순위");
		System.out.println("5. 종료");
		
		selectMenu(sc, stArr);
	}
	
	public void selectMenu(Scanner sc, Student[] stArr) {
		InputStudentInfo ipStInfo = new InputStudentInfo();
		PrintStInfo prStInfo = new PrintStInfo();
		PrintStRank pStRank = new PrintStRank();
		
		while(true) {
			System.out.print("메뉴를 고르세요.");
			
			int selMenu = sc.nextInt();
			boolean isCorrect = false;
			
			switch(selMenu) {
				case 1:
					ipStInfo.printInpuMode(sc, stArr);
					isCorrect = true;
					break;
				case 2:
					System.out.print("검색할 학생의 학번을 입력하세요.");
					int sno = sc.nextInt();
					prStInfo.searchSt(sno, stArr);
					isCorrect = true;
					break;
				case 3:
					System.out.println("전체 학생의 정보를 출력합니다.");
					prStInfo.printAllStInfo(stArr);
					isCorrect = true;
					break;
				case 4:
					pStRank.makeMajorArr(stArr);
					isCorrect = true;
					break;
				case 5: 
					System.out.println("프로그램을 종료합니다.");
					System.exit(0);
				default:
					System.out.println("잘못 입력하셨습니다.");
					continue;
			}
			
			if(isCorrect) {
				break;
			}
		}
	}
}
