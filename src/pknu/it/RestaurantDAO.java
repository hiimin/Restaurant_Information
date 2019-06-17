package pknu.it;

import java.sql.*;
import java.util.ArrayList;

public class RestaurantDAO {
	
	private String url;
	private String user;
	private String pass;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public RestaurantDAO() {
		
		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "test";
		pass = "test";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	
	public ArrayList<RestaurantDTO> getAllData(){
		ArrayList<RestaurantDTO> list = new ArrayList<>();
		String sql = "select * from restaurant";
				
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int rno = rs.getInt("rno");
				int type = rs.getInt("type");
				String rname = rs.getString("rname");
				String addr = rs.getString("addr");
				String call = rs.getString("call");
				
				list.add(new RestaurantDTO(rno, type, rname, addr, call));
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return list;
	}
}
