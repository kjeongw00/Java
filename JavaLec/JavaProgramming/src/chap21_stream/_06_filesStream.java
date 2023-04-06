package chap21_stream;

import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Stream;

public class _06_filesStream {

	public static void main(String[] args) {
		
		//hyundaicar.txt의 경로(Path) 객체 얻기
		try {
//			Path path = Paths.get(_06_filesStream.class.getResource("hyundaicar.txt").toURI());
			Path path = Paths.get("C:/data/hyundaicar.txt"); // 파일 경로 설정
			Stream<String> fileStream = Files.lines(path, Charset.defaultCharset()); 
			//Files.lines() => 텍스트 파일을 행으로 분리해서
			//				   행들의 스트림을 만들어준다
//			Stream<String> fileStream = Files.lines(path, Charset.defaultCharset());
	
			fileStream.forEach(l -> System.out.println(l));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
