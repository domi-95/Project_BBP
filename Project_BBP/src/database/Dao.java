package database;

import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;


import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;



import database.*;
import user.*;
import project.*;

public class Dao {
	
	public static User searchUserWithPw (String email, String password) {

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
					System.out.println("Fehler beim Einf�gen des Users");
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
		
	public static boolean createRequest (String title, String category, String shortDescription, String description, String location, String investmentGrade, String phoneNumber, int period, int anonymous, InputStream picture) {
		try{
			 Connection con = ConnectionProvider.getCon();
				String sql ="INSERT INTO project (title, category, short_description, description, location, period, investment_grade, picture, phone_number, anonymous, state_id)" + 
							"VALUES ('"+ title +"','" + category + "','" + shortDescription + "', '" + description + "', '"+ location +"'," + period + ",'"+ investmentGrade +"','"+ picture +"','" + phoneNumber + "'," + anonymous + "," + 1 + ")";
				Statement st = con.createStatement();
				st.executeUpdate(sql);
				}
				catch (Exception e) {
					System.out.println("Fehler beim Einf�gen der Anfrage");
					e.printStackTrace();
				}		

		return true;
	}

public static Project searchRequest (int id) {
		
		try {
			Connection con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();

			ResultSet myRs = myst.executeQuery(
					"SELECT * from project p, state s where p.id = "+ id +" and p.state_id = s.id ");

			if (myRs.next())
				return new Project(myRs.getInt("p.id"), myRs.getString("p.title"), myRs.getString("p.category"), myRs.getString("p.short_description"), myRs.getString("p.description"), myRs.getString("p.location"), myRs.getInt("p.period"), myRs.getString("investment_grade"), myRs.getBytes("p.picture"), myRs.getString("p.phone_number"), myRs.getBoolean("p.anonymous"), new State(myRs.getInt("s.id"), myRs.getString("s.description")));
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
	
	//System.out.println(Dao.login("max.mustermann@bbp.de", "1234"));
	//System.out.println(Dao.searchUser("max.mustermann@bbp.de"));
//	System.out.println(Dao.safeUser("test@test.de", "Test", "Test", "test123", 1));
//	System.out.println(User.createUser("test@test.de", "Test", "Test", "test123", 1));
	
	System.out.println(searchRequest(3));
	//new File 
	}

}
