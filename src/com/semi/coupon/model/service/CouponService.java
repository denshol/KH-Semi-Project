package com.semi.coupon.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.common.JDBCTemplate;
import com.semi.coupon.model.dao.CouponDao;
import com.semi.coupon.model.vo.Coupon;

public class CouponService {

	
	
	//쿠폰 아이디, 시퀀스 넘버로 검색
	public ArrayList<Coupon> searchCidAdmin(String search) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Coupon> clist = new CouponDao().searchCidAdmin(conn,search);
		JDBCTemplate.close(conn);
		return clist;
	}

	//쿠폰명으로 검색
	public ArrayList<Coupon> searchCnameAdmin(String search) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Coupon> clist = new CouponDao().searchCnameAdmin(conn,search);
		JDBCTemplate.close(conn);
		return clist;
	}

	public ArrayList<Coupon> searchDcAdmin(String search) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Coupon> clist = new CouponDao().searchDCAdmin(conn,search);
		JDBCTemplate.close(conn);
		return clist;
	}

	public ArrayList<Coupon> searchPeriodAdmin(String search) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Coupon> clist = new CouponDao().searchPeriodAdmin(conn,search);
		JDBCTemplate.close(conn);
		return clist;
	}

	public ArrayList<Coupon> searchEnrollAdmin(String search) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Coupon> clist = new CouponDao().searchEnrollAdmin(conn,search);
		JDBCTemplate.close(conn);
		return clist;
	}

	public ArrayList<Coupon> searchStAdmin(String search) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Coupon> clist = new CouponDao().searchStAdmin(conn,search);
		JDBCTemplate.close(conn);
		return clist;
	}

	//그냥 전체 조회 관리자
	public ArrayList<Coupon> selectCouponAdmin() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Coupon> clist = new CouponDao().selectCouponAdmin(conn);
		JDBCTemplate.close(conn);
		return clist;
	}

	
	//회원번호로 쿠폰조회
	public ArrayList<Coupon> searchMnoAdmin(String search) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Coupon> clist = new CouponDao().searchMnoAdmin(conn,search);
		
		JDBCTemplate.close(conn);
		return clist;
	}

	
	//쿠폰 상세 관리자용 페이지
	public Coupon detailCouponAdmin(int cno) {
		Connection conn = JDBCTemplate.getConnection();
		Coupon cp = new CouponDao().detailCouponAdmin(conn,cno);
		
		
		
		JDBCTemplate.close(conn);
		return cp;
	}

	//관리자용 쿠폰 삭제 메소드
	public int deleteCouponAdmin(int cno) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new CouponDao().deleteCouponAdmin(conn,cno);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	//쿠폰정보 수정 메소드 관리자
	public int updateCouponAdmin(Coupon cp) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new CouponDao().updateCouponAdmin(conn,cp);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);		}
		
		JDBCTemplate.close(conn);
		return result;
	}

}
