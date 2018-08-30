package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/event";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int join(User user) {
		if(login(user.getUsername(), user.getPassword()) != -1) {
			return -2; // ID 존재
		}
		
		String SQL = "INSERT INTO user (username, password, company) VALUES (?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getCompany());
			
			return pstmt.executeUpdate(); // Success
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; // DB ERROR
	}
	
	public int login(String username, String password) {
		String SQL = "SELECT password FROM user WHERE username = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, username);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(password)) {
					return 1; // 로그인 성공
				} else {
					return 0; // 로그인 실패
				}
			}
			
			return -1; // 아이디 존재 X
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -2; // DB ERROR
	}
}
