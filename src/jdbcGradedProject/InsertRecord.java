package jdbcGradedProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertRecord {

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

		String q1 = "insert into employee values(1,\"Aman\",\"aman@gmail.com\",\"9847562403\")";
		String q2 = "insert into employee values(2,\"Karan\",\"karan@gmail.com\",\"7849302741\")";
		String q3 = "insert into employee values(3,\"Sahil\",\"sahil@gmail.com\",\"8940372891\")";
		String q4 = "insert into employee values(4,\"Himanshu\",\"himashu@gmail.com\",\"7839291329\")";
		String q5 = "insert into employee values(5,\"Rohan\",\"rohan@gmail.com\",\"9832749321\")";

		try {
			st.executeUpdate(q1);
			st.executeUpdate(q2);
			st.executeUpdate(q3);
			st.executeUpdate(q4);
			st.executeUpdate(q5);

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
