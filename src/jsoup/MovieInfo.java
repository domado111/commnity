package jsoup;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class MovieInfo {
	
	// jsoup�� ��� �� ������ �̹����� �������� ���� �޼ҵ��Դϴ�.
	public String poster(String movieNm) {
		Document search;
		Elements result;
		String poster="";
		String url="";
		
		try {
			// ���̹� ��ȭ ���� ����Ʈ�� ���� ��ȭ�̸��� �˻��� �ּҸ� �����մϴ�.
			search = Jsoup.connect("http://movie.naver.com/movie/search/result.nhn?query="+movieNm+"=all&ie=utf8").get();
			// select �޼ҵ带 �̿��� img �±׸� �˻��մϴ�.
			result=search.select("#old_content > ul:nth-child(4) > li:nth-child(1) > p > a > img");
			// �̹����� �ּҸ� �����ɴϴ�.
			url=result.attr("src");			
			// �̹��� url �κп��� ? �ڿ��� ����� ǥ���ϱ� ������ �̺κ��� �ڸ��� �����ɴϴ�.
			poster = url.substring(0, url.indexOf("?"));			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (StringIndexOutOfBoundsException e) {
			System.out.println(movieNm+" �����Ͱ� �����ϴ�.");
			return null;
		}
		
		return poster;
	}
	
	// jsoup�� ��� �� �ٰŸ��� �������� ���� �޼ҵ��Դϴ�.
	public String story(String movieNm) {
		Document search;
		Elements result;
		Document info;
		String story="";
		
		try {
			// ���̹� ��ȭ ���� ����Ʈ�� ���� ��ȭ�̸��� �˻��� �ּҸ� �����մϴ�.
			search = Jsoup.connect("http://movie.naver.com/movie/search/result.nhn?query="+movieNm+"=all&ie=utf8").get();
			// select �޼ҵ带 �̿��� a �±׸� �˻��մϴ�.
			result=search.select("#old_content > ul:nth-child(4) > li > p > a");
			// ��ȭ ������ �ִ� ����Ʈ �ּҴ� ���ڵ��� �Ǿ��ֱ� ������ href �Ӽ��� �����ɴϴ�.
			String searchurl=result.attr("href");			
			// ��ȭ ���� url �ڿ� ���Դϴ�.
			String infourl="http://movie.naver.com"+searchurl;
			
			// ��ȭ ���� �ּҸ� �����մϴ�.
			info=Jsoup.connect(infourl).get();
			// select �޼ҵ带 �̿��� p �±׸� �˻��մϴ�.
			result=info.select("#content > div.article > div.section_group.section_group_frst > div:nth-child(1) > div > div.story_area > p");
			// p �±��� �ؽ�Ʈ�� �ܾ�ɴϴ�.
			story=result.text();
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (StringIndexOutOfBoundsException e) {
			System.out.println(movieNm+" ���丮�� �����ϴ�.");
			return null;
		}
		
		return story;
	}
}
