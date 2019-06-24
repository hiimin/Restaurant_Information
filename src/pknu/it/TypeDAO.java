package pknu.it;

import java.sql.*;
import java.util.ArrayList;

public class TypeDAO {
	public TypeDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	
	public ArrayList<TypeDTO> getAllData(){
		ArrayList<TypeDTO> list = new ArrayList();
		
		Connection connect = null;
		Statement state = null;
		ResultSet result = null;
		
		try {
			connect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:32781:xe", "test", "test");
			state = connect.createStatement();
			result = state.executeQuery("select * from type");
			
			while(result.next()) {
				int tno = result.getInt("tno");
				String tname = result.getString("tname");
				
				list.add(new TypeDTO(tno, tname));
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
