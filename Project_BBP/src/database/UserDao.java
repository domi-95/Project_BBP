package database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import user.Role;
import user.User;

public class UserDao {

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

		finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception while closing DB Connection");
			}

		}
		return null;
	}

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

		finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception while closing DB Connection");
			}

		}

		return true;
	}

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

		finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception while closing DB Connection");
			}

		}
		return null;
	}

}
