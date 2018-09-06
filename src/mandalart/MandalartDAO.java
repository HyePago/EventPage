package mandalart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MandalartDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MandalartDAO() {
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
	
	public int insert(Mandalart mandalart) {		
		String SQL = "INSERT INTO mandalart (firstLeftInput, firstCenterInput, firstRightInput, firstFirstInput,"
				+ "secondLeftInput, secondCenterInput, secondRightInput, secondFirstInput,"
				+ "thirdLeftInput, thirdCenterInput, thirdRightInput, thirdFirstInput, "
				+ "centerLeftInput, centerCenterInput, centerRightInput, centerFirstInput, "
				+ "name, phone, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, mandalart.getFirstLeftInput());
			pstmt.setString(2, mandalart.getFirstCenterInput());
			pstmt.setString(3, mandalart.getFirstRightInput());
			pstmt.setString(4, mandalart.getFirstFirstInput());
			
			pstmt.setString(5, mandalart.getSecondLeftInput());
			pstmt.setString(6, mandalart.getSecondCenterInput());
			pstmt.setString(7, mandalart.getSecondRightInput());
			pstmt.setString(8, mandalart.getSecondFirstInput());

			pstmt.setString(9, mandalart.getThirdLeftInput());
			pstmt.setString(10, mandalart.getThirdCenterInput());
			pstmt.setString(11, mandalart.getThirdRightInput());
			pstmt.setString(12, mandalart.getThirdFirstInput());
			
			pstmt.setString(13, mandalart.getCenterLeftInput());
			pstmt.setString(14, mandalart.getCenterCenterInput());
			pstmt.setString(15, mandalart.getCenterRightInput());
			pstmt.setString(16, mandalart.getCenterFirstInput());
			
			pstmt.setString(17, mandalart.getName());
			pstmt.setString(18, mandalart.getPhone());
			pstmt.setString(19, mandalart.getEmail());
			
			return pstmt.executeUpdate(); // Success
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; // DB ERROR
	}
	
	public int doubleCheck(String email) {
		String SQL = "SELECT name FROM mandalart WHERE email = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return 0; // Email 존재
			} else {
				return 1; // Email 존재 X
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; // DB ERROR
	}
}
