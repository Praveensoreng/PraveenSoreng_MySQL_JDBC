package jdbcGradedProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class CreateTableEmployee {

	public static void main(String[] args) throws SQLException {
		
              String driver = "com.mysql.cj.jdbc.Driver";
		
		try {
			Class.forName(driver);  
		} catch(ClassNotFoundException e) {
			System.out.println(e.getMessage());
			return;
		}
		
		Connection con = null;
		Statement st = null;
		
		 try {
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GL?useSSL=false",
					 "root",
					 "?CongreAnomaly@357"
					 );
			 st = con.createStatement(); 
			 
			 String query = "create table employee(id int primary key,Name varchar(50) not null,Email_id varchar(50) not null,Phone_Number varchar(20))";
			 st.execute(query);
			 System.out.println("Table created successfully");
		 } catch(SQLException e) {
			 System.out.println(e.getMessage());
			 e.printStackTrace();
		 } finally {
			 con.close();
			 st.close();
			 }


	}

}
