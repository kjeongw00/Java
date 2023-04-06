package chap20_lambda;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import chap20_lambda.clazz.UserCharString;

public class _11_lambdaEx2 {

	public static void main(String[] args) {
		
		
		
		Scanner sc = new Scanner(System.in);
		
		List<UserCharString> list = 
				new ArrayList<UserCharString>();
		
		
		for(int i = 0; i < 10; i++) {
			System.out.println("문자열 입력");
			String findch = sc.next();
			
			list.add(new UserCharString(findch));
		}
			System.out.println("사용자 입력");
			String ch = sc.next();
			
		if(list.contains(ch)) {
			
		} else {
			
		}
			
			System.out.println(list.toString());
	}
	
}
