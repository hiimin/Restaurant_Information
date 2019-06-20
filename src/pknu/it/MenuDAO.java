package pknu.it;

import java.sql.*;
import java.util.ArrayList;

import com.sun.org.apache.xml.internal.security.keys.content.RetrievalMethod;

public class MenuDAO {
	private String url;
	private String user;
	private String pass;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MenuDAO() {
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
	
	public ArrayList<MenuDTO> getAllData(){
		ArrayList<MenuDTO> list = new ArrayList<>();
		String sql = "select * from menu"; 
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int rno = rs.getInt("rno");
				String mname = rs.getString("mname");
				int price = rs.getInt("price");
				
				list.add(new MenuDTO(rno, mname, price));
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return list;
	}
	
	public ArrayList<MenuDTO> restaurantMenu(String rno){
		ArrayList<MenuDTO> list = new ArrayList<>();
		String sql = "select * from menu where rno = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int rnum = rs.getInt("rno");
				String mname = rs.getString("mname");
				int price = rs.getInt("price");
				
				list.add(new MenuDTO(rnum, mname, price));
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
		return list;
	}
}
