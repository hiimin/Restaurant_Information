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
	
	public void delete(String mname) {
		String sql = "delete from menu where mname = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mname);
			pstmt.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}

	public void add(String rno, String mname, String price) {
		String sql = "insert into menu values(?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rno);
			pstmt.setString(2, mname);
			pstmt.setString(3, price);

			pstmt.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
}
