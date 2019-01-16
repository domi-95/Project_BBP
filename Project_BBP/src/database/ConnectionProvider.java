package database;

import java.sql.*;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.concurrent.TimeUnit;

import statechanger.StateChanger;

import static database.Provider.*;

public class ConnectionProvider extends Thread {
	private static Connection con = null;
	static {
		connect(); 								// first connection without thread, because thread can be slower than the first
												// access to con
		Thread t = new ConnectionProvider(); 	// start thread to reestaablishes the db connection
		t.start();
		StateChanger.startSchedule();			// start scheduled StateChanger
	}

	public static void connect() { 				// method to get the connection
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			System.out.println("Connection to database failed");
		}
	}

	public static Connection getCon() {
		return con;
	}

	public void run() { 						// thread reestablishes the db connection after 5 minutes, otherwise it will be
						
		while (true) {
			System.out.println("hello");
			try {
				TimeUnit.MINUTES.sleep(10);
				System.out.println("10 minutes are over");
				//Thread.sleep(300000);
			} catch (InterruptedException e) {
				System.out.println("Error while thread are sleeping");
				e.printStackTrace();
			}

			try {
				con.close();					// disconnected from the db-server
			} catch (SQLException e) {
				System.out.println("Error while closing connection");
				e.printStackTrace();
			}
			connect();

		}
	}

}
