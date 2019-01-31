package database;

//definition of database access

public interface Provider {
	// our deployment  database in frankfurt
	String DRIVER = "com.mysql.jdbc.Driver";
	String CONNECTION_URL = "jdbc:mysql://server1.febas.net/bbp-db";
	String USERNAME = "bbp-admin";
	String PASSWORD = "BBPJavaProject";

	
	//localhost
	
//	String DRIVER = "com.mysql.jdbc.Driver";
//	String CONNECTION_URL = "jdbc:mysql://localhost:3306/bbp";
//	String USERNAME = "root";
//	String PASSWORD = "";
}
