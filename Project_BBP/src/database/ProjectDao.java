package database;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.*;


import project.Project;
import project.State;

public class ProjectDao {
	
	public static boolean safeProject(String title, String category, String shortDescription, String description,
			String location, String investmentGrade, String phoneNumber, int period, int anonymous,
			InputStream picture) {
		Connection con = null;
	
		try {
			con = ConnectionProvider.getCon();
			String sql = "INSERT INTO project (title, category, short_description, description, location, period, investment_grade, picture, phone_number, anonymous, state_id, stamp_created) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement st = con.prepareStatement(sql);

				st.setString(1, title);
				st.setString(2, category);
				st.setString(3, shortDescription);
				st.setString(4, description);
				st.setString(5, location);
				st.setInt(6, period);
				st.setString(7, investmentGrade);
				st.setBlob(8, picture);
				st.setString(9, phoneNumber);
				st.setInt(10, anonymous);
				st.setInt(11, 1);
				st.setTimestamp(12, new Timestamp(new Date().getTime()));
				
			st.executeUpdate();
		} catch (Exception e) {
			System.out.println("Fehler beim Einf�gen der Anfrage");
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

	public static Project searchProject(int id) {
		Connection con = null;

		try {
			con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();

			ResultSet myRs = myst
					.executeQuery("SELECT * from project p, state s where p.id = " + id + " and p.state_id = s.id ");

			if (myRs.next())
				return new Project(myRs.getInt("p.id"), myRs.getString("p.title"), myRs.getString("p.category"),
						myRs.getString("p.short_description"), myRs.getString("p.description"),
						myRs.getString("p.location"), myRs.getInt("p.period"), myRs.getString("investment_grade"),
						myRs.getBytes("p.picture"), myRs.getString("p.phone_number"), myRs.getBoolean("p.anonymous"),
						new State(myRs.getInt("s.id"), myRs.getString("s.description")), myRs.getString("stamp_created"), 
						myRs.getString("stamp_updated"), myRs.getInt("vote"), myRs.getString("comment"));
			else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Connection failed");
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
	
	public static List<Project> getAllProject(int state_id){
		List<Project> result = new LinkedList<Project>();
		Connection con = ConnectionProvider.getCon();
		try {
			Statement myst = con.createStatement();
			ResultSet myRs = myst
					.executeQuery("SELECT * from project p, state s where s.id = " + state_id + " and p.state_id = s.id ");
			while (myRs.next()) {
				result.add(new Project(myRs.getInt("p.id"), myRs.getString("p.title"), myRs.getString("p.category"),
						myRs.getString("p.short_description"), myRs.getString("p.description"),
						myRs.getString("p.location"), myRs.getInt("p.period"), myRs.getString("investment_grade"),
						myRs.getBytes("p.picture"), myRs.getString("p.phone_number"), myRs.getBoolean("p.anonymous"),
						new State(myRs.getInt("s.id"), myRs.getString("s.description")), myRs.getString("stamp_created"), 
						myRs.getString("stamp_updated"), myRs.getInt("vote"), myRs.getString("comment")));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("FEHLER beim holen der Spende");
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
		return null;
	}
	
	public static boolean updateState(Project p) {
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();
			String sql = "UPDATE project SET state_id = '" + p.getState().getId() + "' WHERE id = '" + p.getId() + "'";
			Statement st = con.createStatement();
			st.execute(sql);

		} catch (Exception e) {
			System.out.println("Exception while updating state");
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception while closing DB Connection");
			}

		}

		return false;
	}

}
