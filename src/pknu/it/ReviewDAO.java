package pknu.it;

import java.sql.*;
import java.util.ArrayList;

public class ReviewDAO {
	
	private String url;
	private String user;
	private String pass;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ReviewDAO() {
		
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
	
	public ArrayList<ReviewDTO> getAllData(){
		ArrayList<ReviewDTO> list = new ArrayList();
		String sql = "select * from review";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int mno = rs.getInt("mno");
				int rno = rs.getInt("rno");
				int vno = rs.getInt("vno");
				int grade = rs.getInt("grade");
				
				list.add(new ReviewDTO(mno, rno, vno, grade));
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return list;
	}
	
	public ArrayList<ReviewDTO> restaurantReview(String rno){
		ArrayList<ReviewDTO> list = new ArrayList<>();
		String sql = "select * from review where rno = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int mno = rs.getInt("mno");
				int rnum = rs.getInt("rno");
				int vno = rs.getInt("vno");
				int grade = rs.getInt("grade");
				
				list.add(new ReviewDTO(mno, rnum, vno, grade));
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
		return list;
	}
	public void add(int mno, int rno, int grade) {
		String sql = "insert into review values(?,?,review_seq.nextval,?)";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			pstmt.setInt(2, rno);
			pstmt.setInt(3, grade);
			
			pstmt.executeQuery();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	
}
