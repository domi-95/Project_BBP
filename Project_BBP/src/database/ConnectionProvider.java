package database;

import java.sql.*;
import static database.Provider.*;

public class ConnectionProvider {
	private static Connection con = null;
	static {
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			System.out.println("Verbindung zur Datenbank nicht möglich");
		}
	}

	public static Connection getCon() {
		return con;
	}

}