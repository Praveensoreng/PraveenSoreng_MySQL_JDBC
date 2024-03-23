package jdbcGradedProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class RemoveAllRecord {

	public static void main(String[] args) throws SQLException {
		String driver = "com.mysql.cj.jdbc.Driver";

		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
			return;
		}

		Connection con = null;
		Statement st = null;

		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GL?useSSL=false", "root",
					"?CongreAnomaly@357");
			st = con.createStatement();

			String query = "truncate table employee";
			st.execute(query);
			System.out.println("All records removed successfully");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			con.close();
			st.close();
		}

	}

}
