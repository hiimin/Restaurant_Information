package pknu.it;

import java.sql.*;
import java.util.ArrayList;

public class MenuDAO {
	public MenuDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	
	public ArrayList<MenuDTO> getAllData(){
		ArrayList<MenuDTO> list = new ArrayList();
		
		Connection connect = null;
		Statement state = null;
		ResultSet result = null;
		
		try {
			connect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "test", "test");
			state = connect.createStatement();
			result = state.executeQuery("select * from menu");
			
			while(result.next()) {
				int rno = result.getInt("rno");
				String mname = result.getString("mname");
				int price = result.getInt("price");
				
				list.add(new MenuDTO(rno, mname, price));
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
