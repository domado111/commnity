package jsoup;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class MovieInfo {
	
	// jsoup을 사용 해 포스터 이미지를 가져오기 위한 메소드입니다.
	public String poster(String movieNm) {
		Document search;
		Elements result;
		String poster="";
		String url="";
		
		try {
			// 네이버 영화 정보 사이트를 통해 영화이름을 검색해 주소를 연결합니다.
			search = Jsoup.connect("http://movie.naver.com/movie/search/result.nhn?query="+movieNm+"=all&ie=utf8").get();
			// select 메소드를 이용해 img 태그를 검색합니다.
			result=search.select("#old_content > ul:nth-child(4) > li:nth-child(1) > p > a > img");
			// 이미지의 주소를 가져옵니다.
			url=result.attr("src");			
			// 이미지 url 부분에서 ? 뒤에는 사이즈를 표시하기 때문에 이부분은 자르고 가져옵니다.
			poster = url.substring(0, url.indexOf("?"));			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (StringIndexOutOfBoundsException e) {
			System.out.println(movieNm+" 포스터가 없습니다.");
			return null;
		}
		
		return poster;
	}
	
	// jsoup을 사용 해 줄거리를 가져오기 위한 메소드입니다.
	public String story(String movieNm) {
		Document search;
		Elements result;
		Document info;
		String story="";
		
		try {
			// 네이버 영화 정보 사이트를 통해 영화이름을 검색해 주소를 연결합니다.
			search = Jsoup.connect("http://movie.naver.com/movie/search/result.nhn?query="+movieNm+"=all&ie=utf8").get();
			// select 메소드를 이용해 a 태그를 검색합니다.
			result=search.select("#old_content > ul:nth-child(4) > li > p > a");
			// 영화 정보가 있는 사이트 주소는 인코딩이 되어있기 때문에 href 속성을 가져옵니다.
			String searchurl=result.attr("href");			
			// 영화 정보 url 뒤에 붙입니다.
			String infourl="http://movie.naver.com"+searchurl;
			
			// 영화 정보 주소를 연결합니다.
			info=Jsoup.connect(infourl).get();
			// select 메소드를 이용해 p 태그를 검색합니다.
			result=info.select("#content > div.article > div.section_group.section_group_frst > div:nth-child(1) > div > div.story_area > p");
			// p 태그의 텍스트를 긁어옵니다.
			story=result.text();
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (StringIndexOutOfBoundsException e) {
			System.out.println(movieNm+" 스토리가 없습니다.");
			return null;
		}
		
		return story;
	}
}
