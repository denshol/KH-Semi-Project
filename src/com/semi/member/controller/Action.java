package com.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
}


public Action router(String cmd) {
	if (cmd.equals("home")) {
		// 회원가입 페이지로 이동
		return new ProductAction(); // Board의 목록
	}else if(cmd.equals("price")) {
		return new PriceAction();
	}
	return null;
}


