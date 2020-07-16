package common;

import java.io.IOException;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class GetDocument {
	public Document getDoc(String str) {
		Document doc = null;
		Connection conn = null;
		
		try {
			// URL 선언
			String connUrl = "https://finance.naver.com/item/main.nhn?code="+str;
			
			// HTML 가져오기
			conn = Jsoup.connect(connUrl);
			doc = conn.get();

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return doc;
	}
}
