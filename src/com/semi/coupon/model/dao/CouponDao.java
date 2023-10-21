package com.semi.coupon.model.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.common.JDBCTemplate;
import com.semi.coupon.model.vo.Coupon;

public class CouponDao {
	
	private Properties prop = new Properties();
	
	public CouponDao() {
		try {
			String filePath = Coupon.class.getResource("/sql/coupon/coupon-mapper.xml").getPath();
			
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Coupon> searchCidAdmin(Connection conn, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Coupon> clist = new ArrayList<>();
		
		String sql = prop.getProperty("searchCidAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(search));
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				System.out.println("쿠폰아이디로검색 getrow : "+rset.getRow());
				clist.add(new Coupon(rset.getInt("COUPON_NO")
						  			 ,rset.getInt("MEMBER_NO")
						  			 ,rset.getString("COUPON_NAME")
						  			 ,rset.getDouble("COUPON_DC")
						  			 ,rset.getString("COUPON_PERIOD")
						  			 ,rset.getString("COUPON_SDATE")
						  			 ,rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return clist;
	}

	//쿠폰명으로 검색 관리자.
	public ArrayList<Coupon> searchCnameAdmin(Connection conn, String search) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<Coupon> clist = new ArrayList<>();
		String sql = prop.getProperty("searchCnameAdmin");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				clist.add(new Coupon(rset.getInt(1)
						   	   		,rset.getInt(2)
						   	   		,rset.getString(3)
						   	   		,rset.getDouble(4)
						   	   		,rset.getString(5)
						   	   		,rset.getString(6)
						   	   		,rset.getString(7)));
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return clist;
	}
	
	//dc 할인율로 쿠폰검색 관리자.
	public ArrayList<Coupon> searchDCAdmin(Connection conn, String search) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<Coupon> clist = new ArrayList<>();
		String sql = prop.getProperty("searchDCAdmin");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, Double.parseDouble(search));
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				clist.add(new Coupon(rset.getInt(1)
						   	   		,rset.getInt(2)
						   	   		,rset.getString(3)
						   	   		,rset.getDouble(4)
						   	   		,rset.getString(5)
						   	   		,rset.getString(6)
						   	   		,rset.getString(7)));
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return clist;
	}

	
	//쿠폰 유효기간으로 검색
	public ArrayList<Coupon> searchPeriodAdmin(Connection conn, String search) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<Coupon> clist = new ArrayList<>();
		String sql = prop.getProperty("searchPeriodAdmin");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				clist.add(new Coupon(rset.getInt(1)
						   	   		,rset.getInt(2)
						   	   		,rset.getString(3)
						   	   		,rset.getDouble(4)
						   	   		,rset.getString(5)
						   	   		,rset.getString(6)
						   	   		,rset.getString(7)));
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return clist;
	}

	public ArrayList<Coupon> searchEnrollAdmin(Connection conn, String search) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<Coupon> clist = new ArrayList<>();
		String sql = prop.getProperty("searchEnrollAdmin");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				clist.add(new Coupon(rset.getInt(1)
						   	   		,rset.getInt(2)
						   	   		,rset.getString(3)
						   	   		,rset.getDouble(4)
						   	   		,rset.getString(5)
						   	   		,rset.getString(6)
						   	   		,rset.getString(7)));
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return clist;
	}

	public ArrayList<Coupon> searchStAdmin(Connection conn, String search) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<Coupon> clist = new ArrayList<>();
		String sql = prop.getProperty("searchStAdmin");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				clist.add(new Coupon(rset.getInt(1)
						   	   		,rset.getInt(2)
						   	   		,rset.getString(3)
						   	   		,rset.getDouble(4)
						   	   		,rset.getString(5)
						   	   		,rset.getString(6)
						   	   		,rset.getString(7)));
			}
			
					
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return clist;
	}

	public ArrayList<Coupon> selectCouponAdmin(Connection conn) {
		ArrayList<Coupon> clist = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM COUPON";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
		
			
			
			while(rset.next()) {
				clist.add(new Coupon(rset.getInt("COUPON_NO")
							   	    ,rset.getInt("MEMBER_NO")
							   	    ,rset.getString("COUPON_NAME")
							   	    ,rset.getDouble("COUPON_DC")
							   	    ,rset.getString("COUPON_PERIOD")
							   	    ,rset.getString("COUPON_SDATE")
							   	    ,rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return clist;
	}

	//회원번호로 쿠폰조회 관리자
	public ArrayList<Coupon> searchMnoAdmin(Connection conn, String search) {
		ArrayList<Coupon> clist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchMnoAdmin");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(search));
			
			rset = pstmt.executeQuery();
					
			while(rset.next()) {
				clist.add(new Coupon(rset.getInt(1)
						            ,rset.getInt(2)
						            ,rset.getString(3)
						            ,rset.getDouble(4)
						            ,rset.getString(5)
						            ,rset.getString(6)
						            ,rset.getString(7)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return clist;
	}

	public Coupon detailCouponAdmin(Connection conn, int cno) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Coupon cp = null;
		String sql = prop.getProperty("detailCouponAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,cno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				cp = new Coupon(rset.getInt(1)
								,rset.getInt(2)
								,rset.getString(3)
								,rset.getDouble(4)
								,rset.getString(5)
								,rset.getString(6)
								,rset.getString(7));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return cp;
	}

	
	// 쿠폰 삭제 메소드
	public int deleteCouponAdmin(Connection conn, int cno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteCouponAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	//쿠폰 정보 수정 관리자용 메소드 다오
	public int updateCouponAdmin(Connection conn, Coupon cp) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateCouponAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,cp.getMemberNo());
			pstmt.setString(2, cp.getCouponName());
			pstmt.setDouble(3, cp.getDiscount());
			pstmt.setString(4, cp.getcPeriod());
			pstmt.setString(5, cp.getsDate());
			pstmt.setString(6, cp.getStatus());
			pstmt.setInt(7,cp.getMemberNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
