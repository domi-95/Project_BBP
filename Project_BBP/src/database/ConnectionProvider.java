package database;

import java.sql.*;
import java.util.*;
import java.util.concurrent.TimeUnit;
import statechanger.StateChanger;
import static database.Provider.*;

public class ConnectionProvider extends TimerTask {
	private static Connection con = null;
	
	static {
		connect(); 					
		ConnectionProvider.startSchedule(); 	//start schedule to reestaablishes the db connection
		StateChanger.startSchedule();			// start scheduled StateChanger
	}

	public static void connect() { 				// method to get the connection
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Connection to database failed");
		}
	}

	public static Connection getCon() {
		return con;								//returns the db connection to the DAO classes
	}
	
	public static void startSchedule () {
		Timer timer = new Timer();
		timer.scheduleAtFixedRate(new ConnectionProvider(),20000,TimeUnit.MILLISECONDS.convert(10, TimeUnit.MINUTES));
	}

	public void run() { // thread reestablishes the db connection after 5 minutes, otherwise it will be

		try {
			con.close(); // disconnected from the db-server
		} catch (SQLException e) {
			System.out.println("Error while closing connection");
			e.printStackTrace();
		}
		System.out.println("database connection updated");
		connect();
	}

}
