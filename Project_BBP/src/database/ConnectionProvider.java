package database;

import java.sql.*;
import static database.Provider.*;

public class ConnectionProvider {
	private static Connection con = null;
	static {
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection("jdbc:mysql://server1.febas.net/bbp-db","bbp-admin","BBPJavaProject");
		} catch (Exception e) {
			System.out.println("Verbindung zur Datenbank nicht möglich");
		}
	}

	public static Connection getCon() {
		return con;
	}

}