package pknu.it;

import java.sql.*;
import java.util.ArrayList;

public class MemberDAO {
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	
	public ArrayList<MemberDTO> getAllData(){
		ArrayList<MemberDTO> list = new ArrayList();
		
		Connection connect = null;
		Statement state = null;
		ResultSet result = null;
		
		try {
			connect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "test", "test");
			state = connect.createStatement();
			result = state.executeQuery("select * from member");
			
			while(result.next()) {
				int mno = result.getInt("mno");
				String mid = result.getString("mid");
				String mpass = result.getString("mpass");
				String mclass = result.getString("mclass");
				
				list.add(new MemberDTO(mno, mid, mpass, mclass));
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(connect!=null)connect.close();
				if(state!=null)state.close();
				if(result!=null)result.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
		return list;
	}
}
