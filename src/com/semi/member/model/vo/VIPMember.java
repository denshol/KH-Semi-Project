package com.semi.member.model.vo;

public class VIPMember extends Member{
	
	private String agentId; //담당 직원,상담사 아이디
	double saleRatio;  //특별 할인
	protected VIPMember() {
		super();
		memberPoint = 0.1;
		
		System.out.println("VIPMember 생성");
	}
	
	public String getAgentId() {
		return agentId;
	}

}
