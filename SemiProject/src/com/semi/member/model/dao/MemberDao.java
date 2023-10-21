package com.semi.member.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.semi.common.JDBCTemplate;
import com.semi.common.vo.PageInfo;
import com.semi.member.model.vo.Coupon;
import com.semi.member.model.vo.Member;
import com.semi.order.model.vo.Payment;

public class MemberDao {
	
	private Properties prop  = new Properties();
	
	public MemberDao() {
		String filePath = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (InvalidPropertiesFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	//로그인 할 회원 정보 조회 메소드
	public Member loginMember(Connection conn, String memberId, String memberPwd) {
		//SELECT문 - ResultSet 객체 필요 - 0 또는 하나의 유저정보가 나온다면 Member 객체로 담아서 돌아가기
		Member m = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("loginMember");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member ( rset.getInt("MEMBER_NO")
								,rset.getInt("GRADE")
								,rset.getInt("MEMBER_ROLE")
								,rset.getString("MEMBER_ID")
								,rset.getString("MEMBER_PWD")
								,rset.getString("MEMBER_NAME")
								,rset.getString("MEMBER_BIRTH")
								,rset.getString("GENDER")
								,rset.getString("PHONE")
								,rset.getString("EMAIL")
								,rset.getString("ADDRESS")
								,rset.getInt("MEMBER_POINT")
								,rset.getDate("ENROLL_DATE")
								,rset.getDate("MODIFY_DATE")
								,rset.getInt("ATTENDANCE")
								,rset.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return m;
	}

	//중복 아이디 체크 메소드
	public int checkId(Connection conn, String memberId) {
		//select문 조회지만 결과값은 count하나만 받아올것
		int idCheck = 0 ;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("checkId");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next() || memberId.equals("")) {
				idCheck = 0;
			}else {
				idCheck = 1;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return idCheck;
	}


	public int insertMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getMemberBirth());
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getEmail());
			pstmt.setString(8, m.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		
		return result;
	}


	public String selectId(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
				
		String selectId="";
		String sql = prop.getProperty("selectId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberName());
			pstmt.setString(2, m.getMemberBirth());
			pstmt.setString(3, m.getPhone());
			
			
			rset = pstmt.executeQuery();
			System.out.println(rset.next());
			while(rset.next()) {
				selectId = rset.getString("MEMBER_ID");
				System.out.println(selectId);
				System.out.println(rset.getString("MEMBER_ID"));
				System.out.println(rset.getString(1));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(selectId);
		
		
		
		return selectId;
	}

	public Member searchPwd(Connection conn,Member srcPwdM) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, srcPwdM.getMemberId());
			pstmt.setString(2, srcPwdM.getMemberName());
			pstmt.setString(3, srcPwdM.getMemberBirth());
			pstmt.setString(4, srcPwdM.getPhone());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				srcPwdM.setMemberPwd(rset.getString("MEMBER_PWD"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return srcPwdM;
	}

	public int selMemberAdminCount(Connection conn) {
		
		int listCount = 0;
		ResultSet rset = null;
		Statement stmt = null;
		String sql = prop.getProperty("selMemberAdminCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return listCount;
	}

	//상세검색 회원 수
	public int searchAdminCount(Connection conn, int num, String search) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		switch(num){
		case 1 : sql = prop.getProperty("selIdAdminCount");
			break;
		case 2 : sql = prop.getProperty("selNameAdminCount");
			break;
		case 3 : sql = prop.getProperty("selBirthAdminCount");
			break;
		case 4 : sql = prop.getProperty("selPhoneAdminCount");
			break;
		case 5 : sql = prop.getProperty("selEmailAdminCount");
			break;
		case 6 : sql = prop.getProperty("selAddressAdminCount");
			break;
		case 7 : sql = prop.getProperty("selGradeAdminCount");
		
			switch(search.toUpperCase()){
				case "베이직" : search = "1";
					break;
				case "실버" : search = "2";
					break;
				case "골드" : search = "3";
					break;
				case "VIP" : search = "4";
					break;
			}
			
			break;
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			//회원등급 int형 으로 변환
			if((search == "1" || search == "2" || search == "3" || search == "4") && num == 7) {
				//ORA-01722: invalid number 방지
				pstmt.setInt(1, Integer.parseInt(search));
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt("COUNT");
				}
			}else {
				if(num != 7) {
					pstmt.setString(1, search);
					rset = pstmt.executeQuery();
					
					if(rset.next()) {
						listCount = rset.getInt("COUNT");
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}
	
	
	//회원 관리 조회
	public ArrayList<Member> selectMemberAdmin(Connection conn, PageInfo pi) {
		
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdminMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
			int endRow = (startRow + pi.getBoardLimit()) - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("MEMBER_NO")
								   ,rset.getInt("GRADE")
								   ,rset.getInt("MEMBER_ROLE")
								   ,rset.getString("MEMBER_ID")
								   ,rset.getString("MEMBER_PWD")
								   ,rset.getString("MEMBER_NAME")
								   ,rset.getString("MEMBER_BIRTH")
								   ,rset.getString("GENDER")
								   ,rset.getString("PHONE")
								   ,rset.getString("EMAIL")
								   ,rset.getString("ADDRESS")
								   ,rset.getInt("MEMBER_POINT")
								   ,rset.getDate("ENROLL_DATE")
								   ,rset.getDate("MODIFY_DATE")
								   ,rset.getInt("ATTENDANCE")
								   ,rset.getString("STATUS")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}
	
	//회원 상세 검색 조회
		public ArrayList<Member> searchIdAdmin(Connection conn, String search, PageInfo pi, int num) {
			
			ArrayList<Member> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = "";
			switch(num){
			case 1 : sql = prop.getProperty("searchIdAdmin");
				break;
			case 2 : sql = prop.getProperty("searchNameAdmin");
				break;
			case 3 : sql = prop.getProperty("searchBirthAdmin");
				break;
			case 4 : sql = prop.getProperty("searchPhoneAdmin");
				break;
			case 5 : sql = prop.getProperty("searchEmailAdmin");
				break;
			case 6 : sql = prop.getProperty("searchAddressAdmin");
				break;
			case 7 : sql = prop.getProperty("searchGradeAdmin");

				switch(search.toUpperCase()){
					case "베이직" : search = "1";
						break;
					case "실버" : search = "2";
						break;
					case "골드" : search = "3";
						break;
					case "VIP" : search = "4";
						break;
				}
				break;
			}
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
				int endRow = (startRow + pi.getBoardLimit()) - 1;
				
				if((search == "1" || search == "2" || search == "3" || search == "4") && num == 7) {
					//ORA-01722: invalid number 방지
					pstmt.setInt(1, Integer.parseInt(search));
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
					rset = pstmt.executeQuery();
					
					while(rset.next()) {
						list.add(new Member(rset.getInt("MEMBER_NO")
										   ,rset.getInt("GRADE")
										   ,rset.getInt("MEMBER_ROLE")
										   ,rset.getString("MEMBER_ID")
										   ,rset.getString("MEMBER_PWD")
										   ,rset.getString("MEMBER_NAME")
										   ,rset.getString("MEMBER_BIRTH")
										   ,rset.getString("GENDER")
										   ,rset.getString("PHONE")
										   ,rset.getString("EMAIL")
										   ,rset.getString("ADDRESS")
										   ,rset.getInt("MEMBER_POINT")
										   ,rset.getDate("ENROLL_DATE")
										   ,rset.getDate("MODIFY_DATE")
										   ,rset.getInt("ATTENDANCE")
										   ,rset.getString("STATUS")));
					}
				}else {
					if(num != 7) {
						pstmt.setString(1, search);
						pstmt.setInt(2, startRow);
						pstmt.setInt(3, endRow);
						rset = pstmt.executeQuery();
						
						while(rset.next()) {
							list.add(new Member(rset.getInt("MEMBER_NO")
											   ,rset.getInt("GRADE")
											   ,rset.getInt("MEMBER_ROLE")
											   ,rset.getString("MEMBER_ID")
											   ,rset.getString("MEMBER_PWD")
											   ,rset.getString("MEMBER_NAME")
											   ,rset.getString("MEMBER_BIRTH")
											   ,rset.getString("GENDER")
											   ,rset.getString("PHONE")
											   ,rset.getString("EMAIL")
											   ,rset.getString("ADDRESS")
											   ,rset.getInt("MEMBER_POINT")
											   ,rset.getDate("ENROLL_DATE")
											   ,rset.getDate("MODIFY_DATE")
											   ,rset.getInt("ATTENDANCE")
											   ,rset.getString("STATUS")));
						}
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return list;
		}
	
	//회원 상세조회
	public Member detailMemberAdmin(Connection conn, int umno) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("detailAdminMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, umno);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member(rset.getInt("MEMBER_NO")
							   ,rset.getInt("GRADE")
							   ,rset.getInt("MEMBER_ROLE")
							   ,rset.getString("MEMBER_ID")
							   ,rset.getString("MEMBER_PWD")
							   ,rset.getString("MEMBER_NAME")
							   ,rset.getString("MEMBER_BIRTH")
							   ,rset.getString("GENDER")
							   ,rset.getString("PHONE")
							   ,rset.getString("EMAIL")
							   ,rset.getString("ADDRESS")
							   ,rset.getInt("MEMBER_POINT")
							   ,rset.getDate("ENROLL_DATE")
							   ,rset.getDate("MODIFY_DATE")
							   ,rset.getInt("ATTENDANCE")
							   ,rset.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return m;
	}
	
	

	//회원 수정
	public int updateMemberAdmin(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMemberAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getMemberBirth());
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getEmail());
			pstmt.setString(8, m.getAddress());
			pstmt.setInt(9, m.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//회원 삭제
	public int deleteMemberAdmin(Connection conn, int delMno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMemberAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, delMno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	//쿠폰 조회
	public ArrayList<Coupon> selectCoupon(Connection conn, int memNo) {
		
		ArrayList<Coupon> clist = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				clist.add(new Coupon(rset.getInt("COUPON_NO")
										,rset.getString("MEMBER_NO")
										,rset.getString("COUPON_NAME")
										,rset.getInt("COUPON_DC")
										,rset.getDate("COUPON_PERIOD")
										,rset.getDate("COUPON_SDATE")
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
	
	//주문 조회
	public ArrayList<Payment> selectShoppingList(Connection conn, int memNo) {
		ArrayList<Payment> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectShoppingList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Payment(rset.getInt("ORDER_NO"),
									 rset.getString("PRODUCT_NAME"),
									 rset.getString("DEPOSIT_NAME"),
									 rset.getInt("PAYMENT")));
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return list;
	}
	
	//주문 상세 조회 모달
	public ArrayList<Payment> selectModal(Connection conn, int orderNo) {
		ArrayList<Payment> plist = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectModal");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, orderNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				plist.add( new Payment(rset.getInt("PAYMENT_NUMBER"),
										rset.getString("MEMBER_NAME"),
										rset.getDate("CREATED_AT"),
										rset.getInt("PAYMENT"),
										rset.getString("ORDER_REQUEST"),
										rset.getString("BANK_NAME"),
										rset.getString("DEPOSIT_NAME"),
										rset.getString("ADDRESS_NAME"),
										rset.getString("POST"),
										rset.getString("ROAD_ADDRESS"),
										rset.getString("DETAIL_ADDRESS"),
										rset.getString("STATE"),
										rset.getInt("DELIVERY_COST"),
										rset.getInt("ORDER_NO"),
										rset.getString("PRODUCT_NAME"),
										rset.getInt("QUANTITY")
										));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return plist;
	}
	
	//회원 탈퇴
	public int deleteMember(Connection conn, String loginId, String loginPwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginId);
			pstmt.setString(2, loginPwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	//회원 정보 수정
	public int updateMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberPwd());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getMemberBirth());
			pstmt.setString(5, m.getMemberId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	//회원 정보 수정 후 재조회
	public Member selectMember(Connection conn, String memberId) {
		
		Member m = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member ( rset.getInt("MEMBER_NO")
								,rset.getInt("GRADE")
								,rset.getInt("MEMBER_ROLE")
								,rset.getString("MEMBER_ID")
								,rset.getString("MEMBER_PWD")
								,rset.getString("MEMBER_NAME")
								,rset.getString("MEMBER_BIRTH")
								,rset.getString("GENDER")
								,rset.getString("PHONE")
								,rset.getString("EMAIL")
								,rset.getString("ADDRESS")
								,rset.getInt("MEMBER_POINT")
								,rset.getDate("ENROLL_DATE")
								,rset.getDate("MODIFY_DATE")
								,rset.getInt("ATTENDANCE")
								,rset.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return m;
	}
}
