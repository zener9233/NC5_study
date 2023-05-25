package chap98_homework.nc230316;

import java.util.Scanner;

public class _03_basic03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		int[] nums = new int[10];
		
		for(int i = 0; i < nums.length; i++) {
			System.out.print("정수를 입력하세요.");
			nums[i] = sc.nextInt();
		}
		
		for(int num : nums) {
			if(num % 2 == 1) {
				System.out.println(num);
			}
		}
		
		sc.close();
	}

}
