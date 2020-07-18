package com.semi.dao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.semi.dto.MemberDto;

public class KakaoAPI {
	// access_token을 받아옴
	public String getAccessToken(String authorizeCode) {
		String accessToken = "";
		String refreshToken = "";
		String requestURL = "https://kauth.kakao.com/oauth/token";
		
		URL url;
		try {
			url = new URL(requestURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=5d72007ee138ddab5fe6236180b87978");
			sb.append("&redirect_uri=http://localhost:8787/Semiproject/kakaoLogin.jsp");
			sb.append("&code=" + authorizeCode);
			
			bw.write(sb.toString());
			bw.flush();
			
			int responseCode = con.getResponseCode();
			System.out.println("response code : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String line = "";
			String result = "";
			
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			accessToken = element.getAsJsonObject().get("access_token").getAsString();
			refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();
			
			System.out.println("access_token : " + accessToken);
			System.out.println("refresh_token : " + refreshToken);
			
			br.close();
			bw.close();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return accessToken;
	}
	
	// 카카오에서 프로필 을 가져옴
	public MemberDto getUserInfo(String accessToken) {
		MemberDto dto = new MemberDto();
		String requestURL = "https://kapi.kakao.com/v2/user/me";
		
		try {
			URL url = new URL(requestURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "Bearer " + accessToken);
			
			int responseCode = con.getResponseCode();
			System.out.println("response code : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			
			String line = "";
			String result = "";
			
			while ((line = br.readLine()) != null) {
				result += line;
			}
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			String name = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakaoAccount.getAsJsonObject().get("email").getAsString();
			
			dto.setName(name);
			dto.setEmail(email);

			System.out.println("name : " + name);
			System.out.println("email : " + email);
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
//	public HashMap<String, Object> getUserInfo (String accessToken) {
//		HashMap<String, Object> userInfo = new HashMap<String, Object>();
//		String requestURL = "https://kapi.kakao.com/v2/user/me";
//		
//		try {
//			URL url = new URL(requestURL);
//			HttpURLConnection con = (HttpURLConnection) url.openConnection();
//			
//			con.setRequestMethod("POST");
//			con.setRequestProperty("Authorization", "Bearer " + accessToken);
//			
//			int responseCode = con.getResponseCode();
//			System.out.println("response code : " + responseCode);
//			
//			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
//			String line = "";
//			String result = "";
//			
//			while ((line = br.readLine()) != null) {
//				result += line;
//			}
//			
//			JsonParser parser = new JsonParser();
//			JsonElement element = parser.parse(result);
//			
//			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
//			JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
//			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
//			String email = properties.getAsJsonObject().get("email").getAsString();
//			
//			userInfo.put("nickname", nickname);
//			userInfo.put("email", email);
//		} catch (MalformedURLException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		return userInfo;
//	}
}
