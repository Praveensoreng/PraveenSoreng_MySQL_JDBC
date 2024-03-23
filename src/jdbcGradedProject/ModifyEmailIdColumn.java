package jdbcGradedProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class ModifyEmailIdColumn {

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

		String query = "alter table employee modify email_id varchar(30) not null ";
		try {
			st.execute(query);

			System.out.println("Modification Successful");

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			st.close();
			con.close();

		}

	}

}
