package chap21_stream;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

public class _10_flatMap {

	public static void main(String[] args) {
		
		//{{1, 2}, {3, 4}, {5, 6}}
		//Stream<int[]>
		//Stream<Stream> .flatMap => Stream<Integer>
		int[][] intArr = {{1, 2}, {3, 4}, {5, 6}};
		
		Arrays.stream(intArr)
//			  .flatMapToInt(arr -> Arrays.steram(arr))
			  .flatMapToInt(Arrays::stream)
//			  .map(num -> num)
			  .forEach(num -> System.out.println(num));
	}
	
}
