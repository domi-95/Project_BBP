package database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import user.Role;
import user.User;

public class UserDao {

	// for login without hashcode

	public static User searchUserWithPw(String email, String password) {
		Connection con = null;

		try {
			con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();

			ResultSet myRs = myst.executeQuery("SELECT * from user u, role r where u.email = '" + email
					+ "' and u.password = '" + password + "' and u.role_id = r.id");

			if (myRs.next())
				return new User(myRs.getInt("u.id"), myRs.getString("u.email"), myRs.getString("u.firstname"),
						myRs.getString("u.name"), new Role(myRs.getInt("r.id"), myRs.getString("r.description")));

			else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error while search user with password");
		}

		return null;
	}

	// safe user

	public static boolean safeUser(String email, String name, String firstname, String password, int role_id) {
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();
			String sql = "INSERT INTO user (firstname, name, email, password, role_id)" + "VALUES ('" + firstname
					+ "','" + name + "', '" + email + "', '" + password + "'," + role_id + ")";
			Statement st = con.createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("Error while inserting user");
			e.printStackTrace();
		}

		return true;
	}

	// serach specific user by id

	public static User searchUser(int id) {
		Connection con = null;

		try {
			con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();

			ResultSet myRs = myst
					.executeQuery("SELECT * from user u, role r where u.id = '" + id + "' and u.role_id = r.id");

			if (myRs.next())
				return new User(myRs.getInt("u.id"), myRs.getString("u.email"), myRs.getString("u.firstname"),
						myRs.getString("u.name"), new Role(myRs.getInt("r.id"), myRs.getString("r.description")));

			else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error while searching user with email");
		}

		return null;
	}

	// fetch the hashcode by email

	public static String getHash(String email) {
		Connection con = null;

		try {
			con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();

			ResultSet myRs = myst.executeQuery("SELECT * from user WHERE email = '" + email + "'");

			if (myRs.next())
				return myRs.getString("password");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error while searching user with email");
		}
		return null;
	}

	// serach specific user by email

	public static User searchUser(String email) {
		Connection con = null;

		try {
			con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();

			ResultSet myRs = myst
					.executeQuery("SELECT * from user u, role r where u.email = '" + email + "' and u.role_id = r.id");

			if (myRs.next())
				return new User(myRs.getInt("u.id"), myRs.getString("u.email"), myRs.getString("u.firstname"),
						myRs.getString("u.name"), new Role(myRs.getInt("r.id"), myRs.getString("r.description")));

			else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error while searching user with email");
		}

		return null;
	}

}
