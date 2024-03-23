package jdbcGradedProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DeleteRecord {

	public static void main(String[] args) throws SQLException {
		String driver = "com.mysql.cj.jdbc.Driver";

		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
			return;
		}
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GL?useSSL=false", "root",
				"?CongreAnomaly@357");

		Statement st = con.createStatement();

		String query = "delete from employee where id in (3,4) ";
		try {
			int noOfRowsUpdated = st.executeUpdate(query);
            System.out.println("number of records deleted = " + noOfRowsUpdated);
			System.out.println("Delete Successful");

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			st.close();
			con.close();

		}

	}

}
