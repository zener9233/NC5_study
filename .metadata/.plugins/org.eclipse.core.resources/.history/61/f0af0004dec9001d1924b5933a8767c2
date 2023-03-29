package chap98_homework.nc230323.student;

import java.util.Scanner;

public class InputSubject {	
	public void inputSubjectInfo(Scanner sc, Student[] stArr) {
		System.out.print("과목과 학점을 입력할 학생의 학번을 입력하세요.");
		int sno = sc.nextInt();
		
		if(stArr[sno - 1] == null) {
			System.out.println("기본정보가 없는 학생입니다.");
		} else {
			System.out.print("학생이 수강한 강의의 개수를 입력하세요.");
			int cnt = sc.nextInt();
			sc.nextLine();
			
			stArr[sno - 1].initSubScore(cnt);
			
			for(int i = 0; i < cnt; i++) {
				System.out.print("과목을 입력하세요.");
				String subject = sc.nextLine();
				System.out.print("기말고사 점수를 입력하세요.");
				int score = sc.nextInt();
				sc.nextLine();
				stArr[sno - 1].saveInfo(i, subject, score);
			}
		}
	}
}
