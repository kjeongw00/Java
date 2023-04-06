package chap21_stream;

import java.nio.file.DirectoryStream.Filter;
import java.util.Arrays;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class _05_arrayToStream {

	public static void main(String[] args) {
		
		int[] intArr = new int[10];
		
		for(int i = 0; i < 10; i++) {
			intArr[i] = (int)(Math.random() * 10) + 1;
		}
							//IntStream.of(intArr);
		IntStream stream = Arrays.stream(intArr);
		
		//5이상인 값들만 스트림으로 만들기
		
//		IntStream stream = Arrays.stream(intArr).filter(i -> i >= 5);
		
		stream.filter(i -> i >= 5).map(i -> i * 4).forEach(i -> System.out.println(i));
		
		IntStream fourStream =
				stream.map(num -> {
					int result = 0;
					result = num * 4;
					return result;
				});
				
		
		stream.forEach(System.out::println);
		
		//* 4 새로운 스트림 만들기
		
		
}
}