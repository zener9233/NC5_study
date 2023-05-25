package chap99_etc;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int cnt = 0;
		System.out.println(test(10000, cnt));
	}
	
	/*
	  정수 X에 사용할 수 있는 연산은 다음과 같이 세 가지 이다.
	  X가 3으로 나누어 떨어지면, 3으로 나눈다.
	  X가 2로 나누어 떨어지면, 2로 나눈다.
	  1을 뺀다.
	  정수 N이 주어졌을 때, 위와 같은 연산 세 개를 적절히 사용해서 1을 만들려고 한다. 연산을 사용하는 횟수의 최솟값을 출력하시오.
	*/
	public static int test(int x, int cnt) {
		if(x > 1000000) {
			return 0;
		} else {
			
			if(x == 1) {
				return cnt;
			} else {
				cnt++;
				if(x % 3 == 0) {
					return test(x / 3, cnt);
				} else {
					if(x == 10 || x == 1000 || x == 100000) {
						cnt++;
						return test(x - 1, cnt);
					} else {
						if(x % 2 == 0) {
							return test(x / 2, cnt);
						} else {
							return test(x - 1, cnt);
						}
					}
				}
			}
		}
	}
}
