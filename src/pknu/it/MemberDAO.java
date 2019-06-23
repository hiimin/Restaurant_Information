package pknu.it;

import java.sql.*;
import java.util.ArrayList;

public class MemberDAO {
	
	private String url;
	private String user;
	private String pass;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO() {
		
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
	
	public ArrayList<MemberDTO> getAllData(){
		ArrayList<MemberDTO> list = new ArrayList();
		String sql = "select * from member";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int mno = rs.getInt("mno");
				String mid = rs.getString("mid");
				String mpass = rs.getString("mpass");
				String mclass = rs.getString("mclass");
				
				list.add(new MemberDTO(mno, mid, mpass, mclass));
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return list;
	}
	
	public int login(String userID, String userPassword) {
		String sql = "select mpass from member where mid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("mpass").equals(userPassword)) {
					return 1;	//login success
				}
			}else {
				return 0;	//wrong password
			}
			return -1;		//no id
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return -2;			//db error
	}
	
	public String getClass(String userID) {
		String sql = "select mclass from member where mid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			rs.next();
			return rs.getString("mclass");
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
		return null;
	}
}
