package step2_00_loginEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



//DAO (Data Access Object) : 데이터 접근 객체
public class MemberDao {
	
	// SingleTone패턴 
	private MemberDao() {}
	private static MemberDao instance = new MemberDao();
	public static MemberDao getInstance() {
		return instance;
	}
	
	
	private Connection conn 		= null;
	private PreparedStatement pstmt = null;
	private ResultSet rs			= null;
	
	public void getConnection() {
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");	
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login_ex?serverTimezone=UTC", "root", "root");		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void getClose() {
		
		if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
		if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
		if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
	}
	
	public PreparedStatement getPreparedStatement() {
		
		
		
		return pstmt;
	}
	
	
	//Join DAO
	
	public boolean insertMember(MemberDto memberDto) {
		
		boolean isFirstMember = false;
		
		try {
			
			getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE ID = ?");
			pstmt.setString(1, memberDto.getId());
			rs = pstmt.executeQuery();
			
			if (!rs.next()) {
				pstmt = conn.prepareStatement("INSERT INTO MEMBER VALUES (?, ?, ?, NOW())");
				pstmt.setString(1, memberDto.getId());
				pstmt.setString(2, memberDto.getPasswd());
				pstmt.setString(3, memberDto.getName());
				pstmt.executeUpdate();
				
				isFirstMember = true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		
		return isFirstMember;
	}
	
	
	public boolean login (String id, String pw) {
		
		boolean isValidMember = false;
		
		try {
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE ID = ? AND PASSWD = ?");
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isValidMember = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return isValidMember;
	}

	public boolean deleteMember(MemberDto memberDto) {
		
		boolean isDelete = false; 
		
		try {
			
			getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE ID = ? AND PASSWD = ?");
			pstmt.setString(1, memberDto.getId());
			pstmt.setString(2, memberDto.getPasswd());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				pstmt = conn.prepareStatement("DELETE FROM MEMBER WHERE ID = ?");
				pstmt.setString(1, memberDto.getId());
				pstmt.executeUpdate();
				
				isDelete = true; //보고
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return isDelete;
		
	}
	
	
 
}
