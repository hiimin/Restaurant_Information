package pknu.it;

import java.sql.*;
import java.util.ArrayList;

import com.sun.xml.internal.ws.Closeable;

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
	
	public ArrayList<RestaurantDTO> typeRestaurant(String tno){
		ArrayList<RestaurantDTO> list = new ArrayList<>();
		String sql = "select * from restaurant where type = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int rno = rs.getInt("rno");
				int type = rs.getInt("type");
				String rname = rs.getString("rname");
				String addr = rs.getString("addr");
				String call = rs.getString("call");
				
				list.add(new RestaurantDTO(rno, type, rname, addr, call));
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
		return list;
	}
	
	public RestaurantDTO info(String rno) {
		System.out.println(rno);
		String sql = "select * from restaurant where rno = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rno);
			rs = pstmt.executeQuery();
			
			
			rs.next();
			int rNo = rs.getInt("rno");
			int type = rs.getInt("type");
			String rname = rs.getString("rname");
			String addr = rs.getString("addr");
			String call = rs.getString("call");
				
			return new RestaurantDTO(rNo, type, rname, addr, call);
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	public void close() {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
