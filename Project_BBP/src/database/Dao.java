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
	
	public static boolean safeUser (String email, String name, String firstname, String password, int role_id) {
		try{
			 Connection con = ConnectionProvider.getCon();
				String sql ="INSERT INTO user (firstname, name, email, password, role_id)" + "VALUES ('"+ firstname +"','" + name + "', '" + email + "', '"+ password +"',"+role_id+")";
				Statement st = con.createStatement();
				st.executeUpdate(sql);
				}
				catch (Exception e) {
					System.out.println("Fehler beim Einfügen des Users");
					e.printStackTrace();
				}		

		return true;
	}
	
	public static User searchUser (String email) {
		
		try {
			Connection con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();

			ResultSet myRs = myst.executeQuery(
					"SELECT * from user u, role r where u.email = '"+ email + "' and u.role_id = r.id");

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
	
	//public static uploadFile ()
		


	
	
	

	
	public static void main(String[] args) {
	
	//System.out.println(Dao.login("max.mustermann@bbp.de", "1234"));
	//System.out.println(Dao.searchUser("max.mustermann@bbp.de"));
//	System.out.println(Dao.safeUser("test@test.de", "Test", "Test", "test123", 1));
	System.out.println(User.createUser("test@test.de", "Test", "Test", "test123", 1));
	//new File 
	}

}
