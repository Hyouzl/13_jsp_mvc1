package step2_00_loginEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



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
	
	public Connection getConnection() {
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");	
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login_ex?serverTimezone=UTC", "root", "root");		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public PreparedStatement getPreparedStatement() {
		
		
		
		return pstmt;
	}
	

	
	
 
}
