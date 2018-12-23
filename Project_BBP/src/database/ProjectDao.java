package database;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import project.Project;
import project.State;

public class ProjectDao {
	
	public static boolean safeProject(String title, String category, String shortDescription, String description,
			String location, String investmentGrade, String phoneNumber, int period, int anonymous,
			InputStream picture) {
		try {
			Connection con = ConnectionProvider.getCon();
			String sql = "INSERT INTO project (title, category, short_description, description, location, period, investment_grade, picture, phone_number, anonymous, state_id)"
					+ "VALUES ('" + title + "','" + category + "','" + shortDescription + "', '" + description + "', '"
					+ location + "'," + period + ",'" + investmentGrade + "','" + "?" + "','" + phoneNumber + "',"
					+ anonymous + "," + 1 + ")";
			PreparedStatement st = con.prepareStatement(sql);
		//	if (inputStream != null) {
				// fetche den input stream vom bild in ein blob column
				st.setBlob(1, picture);
		//	}
			
		//	Statement st = con.createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("Fehler beim Einf�gen der Anfrage");
			e.printStackTrace();
		}

		return true;
	}

	public static Project searchProject(int id) {

		try {
			Connection con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();

			ResultSet myRs = myst
					.executeQuery("SELECT * from project p, state s where p.id = " + id + " and p.state_id = s.id ");

			if (myRs.next())
				return new Project(myRs.getInt("p.id"), myRs.getString("p.title"), myRs.getString("p.category"),
						myRs.getString("p.short_description"), myRs.getString("p.description"),
						myRs.getString("p.location"), myRs.getInt("p.period"), myRs.getString("investment_grade"),
						myRs.getBytes("p.picture"), myRs.getString("p.phone_number"), myRs.getBoolean("p.anonymous"),
						new State(myRs.getInt("s.id"), myRs.getString("s.description")));
			else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Connection failed");
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
						new State(myRs.getInt("s.id"), myRs.getString("s.description"))));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("FEHLER beim holen der Spende");
			e.printStackTrace();
		}
		return null;
	}

}
