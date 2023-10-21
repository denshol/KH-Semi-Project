package com.semi.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.common.JDBCTemplate;
import com.semi.common.vo.PageInfo;
import com.semi.member.model.dao.MemberDao;
import com.semi.member.model.vo.Coupon;
import com.semi.member.model.vo.Member;
import com.semi.order.model.vo.Payment;

public class MemberService {


	public Member loginMember(String memberId, String memberPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().loginMember(conn,memberId,memberPwd);
		
		//조회는 commit  / rollback 할필요 x
		JDBCTemplate.close(conn);
		
		return m;
	}
	
	public int checkId(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		
		int idCheck = new MemberDao().checkId(conn,memberId);
		
		JDBCTemplate.close(conn);
				
		
		
		return idCheck;
	}
	
	public int insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().insertMember(conn,m);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	
	public String selectId(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		
		
		String srcIdM = new MemberDao().selectId(conn,m);
		
		
		
		JDBCTemplate.close(conn);
		return srcIdM;
	}
	
	public Member searchPwd(Member srcPwdM) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member pwdM = new MemberDao().searchPwd(conn,srcPwdM);
		
		 
		
		
		
		JDBCTemplate.close(conn);
		return pwdM;
	}
	
	//총 회원 수
	public int selMemberAdminCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new MemberDao().selMemberAdminCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}
	
	//상세 검색 회원 수
	public int searchAdminCount(int num, String search) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new MemberDao().searchAdminCount(conn,num,search);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}
	
	//회원 관리 조회
	public ArrayList<Member> selectMemberAdmin(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list = new MemberDao().selectMemberAdmin(conn,pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	//회원 상세조회
	public Member detailMemberAdmin(int umno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().detailMemberAdmin(conn,umno);
		
		JDBCTemplate.close(conn);
				
		return m;
	}
	
	//회원 상세검색
	public ArrayList<Member> searchIdAdmin(String search, PageInfo pi, int num) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list = new MemberDao().searchIdAdmin(conn,search,pi,num);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	//회원 수정
	public int updateMemberAdmin(Member m) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().updateMemberAdmin(conn,m);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	//회원 삭제
	public int deleteMemberAdmin(int delMno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().deleteMemberAdmin(conn,delMno);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	//쿠폰 조회
	public ArrayList<Coupon> selectCoupon(int memNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Coupon> clist = new MemberDao().selectCoupon(conn, memNo);
		
		JDBCTemplate.close(conn);
		
		return clist;
	}
	
	//주문 조회
	public ArrayList<Payment> selectShoppingList(int memNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Payment> list = new MemberDao().selectShoppingList(conn,memNo);
		
		JDBCTemplate.close(conn);

		
		return list;
	}
	
	//주문 상세 조회 모달
	public ArrayList<Payment> selectModal(int orderNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Payment> plist = new MemberDao().selectModal(conn,orderNo);

		JDBCTemplate.close(conn);
		
		return plist;
	}
	
	//회원 탈퇴
	public int deleteMember(String loginId, String loginPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().deleteMember(conn, loginId, loginPwd);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		return result;
	}
	
	//회원 정보 수정
	public Member updateMember(Member m) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().updateMember(conn,m);
		
		Member memUpdate = null;
		
		if(result>0) {
			JDBCTemplate.commit(conn);
			memUpdate = new MemberDao().selectMember(conn,m.getMemberId());
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return memUpdate;
	}
}
