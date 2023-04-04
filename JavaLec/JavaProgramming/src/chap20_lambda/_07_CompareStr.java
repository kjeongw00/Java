package chap20_lambda;

import chap20_lambda.clazz.CompareStr;

public class _07_CompareStr {

	public static void main(String[] args) {
		action(String :: equals);
		
		
	}
	
	public static void action(CompareStr cs) {
		
		boolean result = cs.compareTwoStr("apple", "apple"); 
		
		// 인터페이스 추상메소드에서 정해진다 반환타입 별명인터페이스의 추상메소드 호출 ( 매개변수 )
		
		
		
		System.out.println(result);
	}
}
