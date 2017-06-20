package kr.co.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {

	private static Map<String, MediaType> mediaMap;
	
	//static 초기화 하는 것임
	static{
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
		//위 세개에 해당하는 파일들만 이미지 파일로 봄
	}
	
	public static MediaType getMediaType(String type){
		return mediaMap.get(type.toUpperCase());
	}

}
