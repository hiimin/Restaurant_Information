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
		url = "jdbc:oracle:thin:@localhost:32781:xe";
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
	public int getRno(String rname) {
		String sql = "select * from restaurant where rname = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rname);
			rs = pstmt.executeQuery();
			
			rs.next();
			return rs.getInt("rno");
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
		return -1;
	}
	
	public void delete(String rno) {
		String sql = "delete from restaurant where rno = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rno);
			pstmt.executeQuery();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	
	public void add(String type, String rname, String addr, String call) {
		String sql = "insert into restaurant values(res_seq.nextval, ?,?,?,?)";
		
		/*rname= "\'"+rname +"\'";
		addr = "\'"+addr +"\'";
		call = "\'"+call +"\'";*/
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			pstmt.setString(2, rname);
			pstmt.setString(3, addr);
			pstmt.setString(4, call);
			
			pstmt.executeQuery();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
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
