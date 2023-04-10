package chap21_stream;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class _12_peek {

	public static void main(String[] args) {

		List<Integer> intList = new ArrayList<Integer>();

		for (int i = 1; i <= 5; i++) {
			intList.add(i);
		}
		
		//1. peek 최종 처리 없이 잘못 작성
		//	 최종 처리가 없어서 peek이 동작하지 않음
		intList.stream()
				.filter(num -> num % 3 == 0)
				.peek(num -> System.out.println(num));
		
		//2. peek 최종 처리가 있을 때
		intList.stream()
				.filter(num -> num % 3 == 0)
				.peek(num -> 
						System.out.println(num))
				.mapToInt(num -> num)
				.sum();
		
		//3. peek은 stream을 리턴
		Stream<Integer> newIntStream = 
				intList.stream()
						.peek(num -> Stream.of(num * 2));
		
		newIntStream.forEach(num ->\
				System.out.println(num));
		
						
		
	}
	
	
}
