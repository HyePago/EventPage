package mandalart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	
	public int selected(int id) {
		String SQL = "UPDATE mandalart SET selected = 1 WHERE id = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -2; // DATABASE ERROR
	}
	public int notselected(int id) {
		String SQL = "UPDATE mandalart SET selected = 0 WHERE id = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -2; // DATABASE ERROR
	}
	
	public ArrayList<Mandalart> getList() {
		ArrayList<Mandalart> mandalarts = new ArrayList<>();
		
		String SQL = "SELECT * FROM mandalart";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Mandalart mandalart = new Mandalart();
				mandalart.setId(rs.getInt("id"));
				mandalart.setFirstLeftInput(rs.getString("firstLeftInput"));
				mandalart.setFirstCenterInput(rs.getString("firstCenterInput"));
				mandalart.setFirstRightInput(rs.getString("firstRightInput"));
				mandalart.setFirstFirstInput(rs.getString("firstFirstInput"));
				
				mandalart.setSecondLeftInput(rs.getString("secondLeftInput"));
				mandalart.setSecondCenterInput(rs.getString("secondCenterInput"));
				mandalart.setSecondRightInput(rs.getString("secondRightInput"));
				mandalart.setSecondFirstInput(rs.getString("secondFirstInput"));
				
				mandalart.setThirdLeftInput(rs.getString("thirdLeftInput"));
				mandalart.setThirdCenterInput(rs.getString("thirdCenterInput"));
				mandalart.setThirdRightInput(rs.getString("thirdRightInput"));
				mandalart.setThirdFirstInput(rs.getString("thirdFirstInput"));
				
				mandalart.setCenterLeftInput(rs.getString("centerLeftInput"));
				mandalart.setCenterCenterInput(rs.getString("centerCenterInput"));
				mandalart.setCenterRightInput(rs.getString("centerRightInput"));
				mandalart.setCenterFirstInput(rs.getString("centerFirstInput"));
				
				mandalart.setName(rs.getString("name"));
				mandalart.setPhone(rs.getString("phone"));
				mandalart.setSelected(rs.getInt("selected"));
				mandalart.setEmail(rs.getString("email"));
				
				mandalarts.add(mandalart);
			}
			
			return mandalarts;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public ArrayList<Mandalart> getWinner() {
		ArrayList<Mandalart> mandalarts = new ArrayList<>();
		
		String SQL = "SELECT * FROM mandalart WHERE selected = 1";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Mandalart mandalart = new Mandalart();
				mandalart.setId(rs.getInt("id"));
				mandalart.setFirstLeftInput(rs.getString("firstLeftInput"));
				mandalart.setFirstCenterInput(rs.getString("firstCenterInput"));
				mandalart.setFirstRightInput(rs.getString("firstRightInput"));
				mandalart.setFirstFirstInput(rs.getString("firstFirstInput"));
				
				mandalart.setSecondLeftInput(rs.getString("secondLeftInput"));
				mandalart.setSecondCenterInput(rs.getString("secondCenterInput"));
				mandalart.setSecondRightInput(rs.getString("secondRightInput"));
				mandalart.setSecondFirstInput(rs.getString("secondFirstInput"));
				
				mandalart.setThirdLeftInput(rs.getString("thirdLeftInput"));
				mandalart.setThirdCenterInput(rs.getString("thirdCenterInput"));
				mandalart.setThirdRightInput(rs.getString("thirdRightInput"));
				mandalart.setThirdFirstInput(rs.getString("thirdFirstInput"));
				
				mandalart.setCenterLeftInput(rs.getString("centerLeftInput"));
				mandalart.setCenterCenterInput(rs.getString("centerCenterInput"));
				mandalart.setCenterRightInput(rs.getString("centerRightInput"));
				mandalart.setCenterFirstInput(rs.getString("centerFirstInput"));
				
				mandalart.setName(rs.getString("name"));
				mandalart.setPhone(rs.getString("phone"));
				mandalart.setSelected(rs.getInt("selected"));
				mandalart.setEmail(rs.getString("email"));
				
				mandalarts.add(mandalart);
			}
			
			return mandalarts;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
