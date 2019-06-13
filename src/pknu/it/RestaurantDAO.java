package pknu.it;

import java.sql.*;
import java.util.ArrayList;

public class RestaurantDAO {
	public RestaurantDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	
	public ArrayList<RestaurantDTO> getAllData(){
		ArrayList<RestaurantDTO> list = new ArrayList();
		
		Connection connect = null;
		Statement state = null;
		ResultSet result = null;
		
		try {
			connect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "test", "test");
			state = connect.createStatement();
			result = state.executeQuery("select * from restaurant");
			
			while(result.next()) {
				int rno = result.getInt("rno");
				int type = result.getInt("type");
				String rname = result.getString("rname");
				String addr = result.getString("addr");
				String call = result.getString("call");
				
				list.add(new RestaurantDTO(rno, type, rname, addr, call));
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
