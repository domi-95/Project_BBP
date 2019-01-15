package database;

import java.sql.*;
import static database.Provider.*;

/*public class ConnectionProvider {
	private static Connection con = null;
	static {
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			System.out.println("Verbindung zur Datenbank nicht m�glich");
		}
	}

	public static Connection getCon() {
		return con;
	}

}*/

public class ConnectionProvider extends Thread{
	private static Connection con = null;
	static {
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			System.out.println("Verbindung zur Datenbank nicht m�glich");
		}
		Thread t = new ConnectionProvider ();
		t.start();
	}

	public static Connection getCon() {
		return con;
	}
	
	public void run() {
		while (true) {

			System.out.println("connection fetched");
			try {
				Class.forName(DRIVER);
				con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
			} catch (Exception e) {
				System.out.println("Verbindung zur Datenbank nicht m�glich");
			}
			try {
				Thread.sleep(300000);
			} catch (InterruptedException e) {
				System.out.println("Error while thread are sleeping");
				e.printStackTrace();
			}
			
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Error while closing connection");
				e.printStackTrace();
			}
		}
	}

/*public class ConnectionProvider {
	private static Connection con = null;
	static {
		
	}

	public static Connection getCon() {
		try {
			Class.forName(DRIVER);
			return DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			System.out.println("Verbindung zur Datenbank nicht m�glich");
		}
		return null;
	}*/

}