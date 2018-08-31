package event;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class EventDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public EventDAO() {
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
	
	public int post(Event event) {
		String SQL = "INSERT INTO event (title, content, image, enddate, username) VALUES (?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, event.getTitle());
			pstmt.setString(2, event.getContent());
			pstmt.setString(3, event.getImage());
			pstmt.setString(4, event.getEnddate());
			pstmt.setString(5, event.getUsername());
			
			return pstmt.executeUpdate(); // Success
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; // DB ERROR
	}
	
	public ArrayList<Event> getOnGoingEventList() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //sdf.format(date)
		
		ArrayList<Event> list = new ArrayList<Event>();
		
		String SQL = "SELECT * FROM event WEHRE enddate <= ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, sdf.format(date));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Event event = new Event();
				event.setId(rs.getInt("id"));
				event.setTitle(rs.getString("title"));
				event.setContent(rs.getString("content"));
				event.setImage(rs.getString("image"));
				event.setEnddate(rs.getString("enddate"));
				event.setNumber(rs.getInt("number"));
				event.setUsername(rs.getString("username"));
				event.setTimestamp(rs.getString("timestamp"));
				
				list.add(event);
			}
			
			return list;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
