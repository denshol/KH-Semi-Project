package com.semi.kakaoapi.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.member.controller.Action;
import com.semi.kakaoapi.model.dto.KakaoProfile;
import com.semi.kakaoapi.model.vo.OAuthToken;
import com.semi.member.model.vo.Member;
/*import com.semi.kakaoapi.UsersRepository;*/
import com.semi.kakaoapi.util.Script;
import com.google.gson.Gson;

public  class KakaocallbackAction implements Action{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");

		
		///oauth/authorize?client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}&response_type=code HTTP/1.1
		//System.out.println("code :"+code);
		//Post요청, x-www-form-urlencoded
		
		String endpoint="https://kauth.kakao.com/oauth/token";
		URL url =new URL(endpoint);
		
		String bodyData="grant_type=authorization_code&";
		bodyData += "client_id=2524b0545c3c64102fa729ad66959efa&";
		bodyData += "redirect_uri=http://localhost:8888/SemiProject/oauth/kakao?cmd=callback&";//+response_type=code
		bodyData += "code="+code;
		
		//Stream 연결
		HttpsURLConnection conn=(HttpsURLConnection)url.openConnection();
		//http header 값 넣기
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		conn.setDoOutput(true);
		//request 하기
		BufferedWriter bw=new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(),"UTF-8"));
		bw.write(bodyData);
		bw.flush();
			
		BufferedReader br = new BufferedReader(
				new InputStreamReader(conn.getInputStream(), "UTF-8")
				);
		String input="";
		StringBuilder sb=new StringBuilder();
		while((input=br.readLine())!=null){
			sb.append(input);
		}
		
		System.out.println(sb.toString());
				
		//Gson으로 파싱
		Gson gson=new Gson();
		
		OAuthToken oAuthToken=gson.fromJson(sb.toString(), OAuthToken.class);
	
		//profile 받기(Resource Server)
				String endpoint2="https://kapi.kakao.com/v2/user/me";
				URL url2 =new URL(endpoint2);
				
				HttpsURLConnection conn2=(HttpsURLConnection)url2.openConnection();
				
				//header 값 넣기
				conn2.setRequestProperty("Authorization", "Bearer "+oAuthToken.getAccess_token());
				conn2.setDoOutput(true);
				
				
				
				//request 하기
				BufferedReader br2=new BufferedReader(new InputStreamReader(conn2.getInputStream(),"UTF-8"));
				String input2="";
				StringBuilder sb2=new StringBuilder();
				while((input2=br2.readLine())!=null) {
					sb2.append(input2);
				}
				
				System.out.println("sb2.toString() : "+sb2.toString());
				
				Gson gson2=new Gson();
				KakaoProfile kakaoProfile=gson2.fromJson(sb2.toString(), KakaoProfile.class);
			
				System.out.println(kakaoProfile);
				
	}

	@Override
	public Action router(String cmd) {
		// TODO Auto-generated method stub
		return null;
	}}
