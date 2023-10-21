package com.semi.kakaoapi.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class Script {

	public static void back(String msg, HttpServletResponse response) {
		try {
		PrintWriter out=response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		out.println("<script>");
		out.println("alert('"+msg+".');");
		out.println("history.back();");
		out.println("</script>");
		}catch (Exception e) {
			// TODO: handle exception
		}

	}
	
	public static void href(String msg, String uri, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			 
			out.println("<script>");
			out.println("alert('"+msg+"');");
			out.println("location.href='"+uri+"';");
			out.println("</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
  ////history.back 함수를 사용해서 돌아가면 입력한 정보가 그대로 돌아가게 되지만, 재요청을 하게 될 경우 입력한 값이 남지 않기 때문에 불편한 코드가 된다.

 