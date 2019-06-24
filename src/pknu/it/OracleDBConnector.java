package pknu.it;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleDBConnector {
	//private static OracleDBConnector instance = new OracleDBConnector();
	private static OracleDBConnector orclDBC;
	
	private OracleDBConnector() {}
	
	public static OracleDBConnector getInstance() {
		if(orclDBC == null) {
			orclDBC = new OracleDBConnector();
		}
		return orclDBC;
	}
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "test";
		String password = "test";
		Connection conn = DriverManager.getConnection(url, user, password);
		return conn;
	}
}
