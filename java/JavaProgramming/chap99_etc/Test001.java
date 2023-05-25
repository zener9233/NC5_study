package chap99_etc;

import java.util.Arrays;

public class Test001 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String str = " aaa bbb ccc";
		
		String[] straa = str.split("");
		
		Arrays.stream(straa).filter(st -> !st.equals(" "))
							.map(null);
	}

}
