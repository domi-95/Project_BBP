package database;

import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import database.*;
import user.*;

public class Dao {
	
	public static User login (String email, String password) {

		try {
			Connection con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();

			ResultSet myRs = myst.executeQuery(
					"SELECT * from User where email = '"+ email + "' and password = '" + password + "'");

			if (myRs.next())
				return new User(myRs.getInt("id"), myRs.getString("email"), myRs.getString("firstname"), myRs.getString("name"), role);

			else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Connection failed");
		}
		return null;
	}
	
	public static void main(String[] args) {
	
	Dao.login("max.mustermann@bbp.de", "1234");
		
	
	}

}
