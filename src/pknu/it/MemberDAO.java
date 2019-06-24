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
	public int getMno(String userID) {
		String sql = "select mno from member where mid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			rs.next();
			return rs.getInt("mno");
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
		return -1;
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
	public void add(String mid, String mpass, String mclass) {
		String sql = "insert into member values(mem_seq.nextval,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpass);
			pstmt.setString(3, mclass);
			System.out.println("======result======");
			
			pstmt.executeQuery();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	public void delete(String mno) {
		
	}
}
