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
					"SELECT * from user u, role r where u.email = '"+ email + "' and u.password = '" + password + "' and u.role_id = r.id");

			if (myRs.next())
				return new User(myRs.getInt("u.id"), myRs.getString("u.email"), myRs.getString("u.firstname"), myRs.getString("u.name"), new Role(myRs.getInt("r.id"), myRs.getString("r.description")));

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
	
	System.out.println(Dao.login("max.mustermann@bbp.de", "1234"));
		
	}

}
