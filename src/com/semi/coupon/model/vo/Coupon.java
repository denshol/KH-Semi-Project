package com.semi.coupon.model.vo;

public class Coupon {
	
	private int couponNo;
	private int memberNo;
	private String couponName;
	private double discount;
	private String cPeriod;
	private String sDate;
	private String status;
	public Coupon() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Coupon(int couponNo, int memberNo, String couponName, double discount, String cPeriod, String sDate,
			String status) {
		super();
		this.couponNo = couponNo;
		this.memberNo = memberNo;
		this.couponName = couponName;
		this.discount = discount;
		this.cPeriod = cPeriod;
		this.sDate = sDate;
		this.status = status;
	}
	public int getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public String getcPeriod() {
		return cPeriod;
	}
	public void setcPeriod(String cPeriod) {
		this.cPeriod = cPeriod;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Coupon [couponNo=" + couponNo + ", memberNo=" + memberNo + ", couponName=" + couponName + ", discount="
				+ discount + ", cPeriod=" + cPeriod + ", sString=" + sDate + ", status=" + status + "]";
	}
	
}
