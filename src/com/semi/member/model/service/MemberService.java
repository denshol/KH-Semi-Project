package com.semi.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.common.JDBCTemplate;
import com.semi.member.model.dao.MemberDao;
import com.semi.member.model.vo.Member;
import com.semi.member.model.vo.Payment;

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
	
	public ArrayList<Payment> selectShoppingList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Payment> list = new MemberDao().selectShoppingList(conn);
		
		JDBCTemplate.close(conn);

		
		return list;
	}
	
	//회원 관리 조회
	public ArrayList<Member> selectMemberAdmin() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list = new MemberDao().selectMemberAdmin(conn);
		
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
	
	//아이디로 검색
	public ArrayList<Member> searchIdAdmin(String search) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list = new MemberDao().searchIdAdmin(conn,search);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	//이름으로 검색
	public ArrayList<Member> searchNameAdmin(String search) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list = new MemberDao().searchNameAdmin(conn,search);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	//생년월일로 검색
	public ArrayList<Member> searchBirthAdmin(String search) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list = new MemberDao().searchBirthAdmin(conn,search);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	//전화번호로 검색
	public ArrayList<Member> searchPhoneAdmin(String search) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list = new MemberDao().searchPhoneAdmin(conn,search);
		
		JDBCTemplate.close(conn);
		
		return list;		
	}

	//이메일로 검색
	public ArrayList<Member> searchEmailAdmin(String search) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list = new MemberDao().searchEmailAdmin(conn,search);
		
		JDBCTemplate.close(conn);
		
		return list;	
	}

	//주소로 검색
	public ArrayList<Member> searchAddressAdmin(String search) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list = new MemberDao().searchAddressAdmin(conn,search);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	//회원등급으로 검색
	public ArrayList<Member> searchGradeAdmin(String search) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list = new MemberDao().searchGradeAdmin(conn,search);
		
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
}
