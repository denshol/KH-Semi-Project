package com.semi.kakaoapi.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.semi.common.JDBCTemplate;
import com.semi.member.model.vo.Member;

//싱글톤 패턴
//Dao
public class memberRepository {
	
	private static final String TAG="memberRepository : ";
	private static memberRepository instance=new memberRepository();
	private memberRepository(){}
	public static memberRepository getInstance() {
		return instance;
	}
	
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	public int save(member member) {
		final String SQL="";
		try {
			conn=JDBCTemplate.getConnection();
			pstmt = conn.prepareStatement(SQL);
			//물음표 완성하기
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG+"save : "+e.getMessage());
		}finally {
			JDBCTemplate.close(conn, pstmt);
		}
		
		return -1;
	}
	
	public int update(member member) {
		final String SQL="";
		try {
			conn=JDBCTemplate.getConnection();
			pstmt = conn.prepareStatement(SQL);
			//물음표 완성하기
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG+"update : "+e.getMessage());
		}finally {
			JDBCTemplate.close(conn, pstmt);
		}
		
		return -1;
	}
	
	public int deleteByID(int id) {
		final String SQL="";
		try {
			conn=JDBCTemplate.getConnection();
			pstmt = conn.prepareStatement(SQL);
			//물음표 완성하기
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG+"deleteByID : "+e.getMessage());
		}finally {
			JDBCTemplate.close(conn, pstmt);
		}
		
		return -1;
	}
	
	public List<Member> findAll() {
		final String SQL="";
		List<Member> member=new ArrayList<>();
		try {
			conn=JDBCTemplate.getConnection();
			pstmt = conn.prepareStatement(SQL);
			//물음표 완성하기
			
			
			//while
			return member;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG+"findAll : "+e.getMessage());
		}finally {
			JDBCTemplate.close(conn, pstmt);
		}
		
		return null;
	}
	
	public member findById(int id) {
		final String SQL="";
		member member=new member();
		try {
			conn=JDBCTemplate.getConnection();
			pstmt = conn.prepareStatement(SQL);
			//물음표 완성하기
			
			
			//if -> rs
			return member;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG+"findAll : "+e.getMessage());
		}finally {
			JDBCTemplate.close(conn, pstmt);
		}
		
		return null;
	}
	
	
	


	public int save(Member member) {
		final String SQL="insert into member (id,membername,password,email,address,memberrole,createdate) values(member_SEQ.nextval,?,?,?,?,?,sysdate) ";
		try {
			conn=JDBCTemplate.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, member.getmembername());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getmemberRole());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG+"save : "+e.getMessage());
		}finally {
			JDBCTemplate.close(conn, pstmt);
		}
		
		return -1;
	}
}