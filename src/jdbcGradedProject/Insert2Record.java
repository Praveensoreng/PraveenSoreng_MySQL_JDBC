package jdbcGradedProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Insert2Record {

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

		String q1 = "insert into employee values(6,\"Jagdish\",\"jagdish@gmail.com\",\"9347165433\")";
		String q2 = "insert into employee values(7,\"Atul\",\"atul@gmail.com\",\"7809302728\")";
		

		try {
			st.executeUpdate(q1);
			st.executeUpdate(q2);
			

			System.out.println("Insertion Successful");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			con.close();
			st.close();
		}

	}

}
