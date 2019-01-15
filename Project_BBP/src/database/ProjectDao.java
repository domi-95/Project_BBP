package database;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.*;

import project.Project;
import project.State;

public class ProjectDao {

	public static boolean safeProject(String title, String category, String shortDescription, String description,
			String location, String investmentGrade, String phoneNumber, String period, int anonymous,
			InputStream picture, int user_id) {
		Connection con = null;

		try {
			con = ConnectionProvider.getCon();
			String sql = "INSERT INTO project (title, category, short_description, description, location, period, investment_grade, picture, phone_number, anonymous, state_id, stamp_created, user_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, title);
			st.setString(2, category);
			st.setString(3, shortDescription);
			st.setString(4, description);
			st.setString(5, location);
			st.setString(6, period);
			st.setString(7, investmentGrade);
			st.setBlob(8, picture);
			st.setString(9, phoneNumber);
			st.setInt(10, anonymous);
			st.setInt(11, 1);
			st.setTimestamp(12, new Timestamp(new Date().getTime()));
			st.setInt(13, user_id);

			st.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error while inserting project");
			e.printStackTrace();
		} /*finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception while closing DB Connection");
			}

		}*/

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
				return resultSetCreateProject(myRs);
			else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error while selecting project");
		}

		/*finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception while closing DB Connection");
			}

		}*/
		return null;
	}

	public static List<Project> getAllProject(int state_id) {
		List<Project> result = new LinkedList<Project>();
		Connection con = null;
		try {  
			 //System.out.println("Start getConnectionProvder: "+ System.currentTimeMillis());
			con = ConnectionProvider.getCon();
			//System.out.println("End getConnectionProvder: "+ System.currentTimeMillis());
			
			Statement myst = con.createStatement();
			//System.out.println("Start Executequery: "+ System.currentTimeMillis());
			ResultSet myRs = myst.executeQuery(
					"SELECT * from project p, state s where s.id = " + state_id + " and p.state_id = s.id ");
			//System.out.println("End Executequery: "+ System.currentTimeMillis());
			while (myRs.next()) {
				result.add(resultSetCreateProject(myRs));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("Error while selecting all projects");
			e.printStackTrace();
		}

		/*finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception while closing DB Connection");
			}

		}*/
		return null;
	}
	
	public static Map<Integer, Integer> getAllVotes(int user_id) {
		Map <Integer, Integer> result = new HashMap<Integer, Integer>();
		Connection con = null;
		try {  
			con = ConnectionProvider.getCon();
			
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery(
					"SELECT * from vote where user_id = " + user_id+ "");
			while (myRs.next()) {
				result.put(myRs.getInt("project_id"), myRs.getInt("user_id"));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("Error while selecting votes from users");
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	public static int countVotes (int project_id) {
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery(
					"SELECT COUNT(project_id) from vote WHERE project_id = '"+project_id+"'");
			if (myRs.next()) {
				return myRs.getInt("count(project_id)");
			}
			
		} catch (SQLException e) {
			System.out.println("Error while selecting all projects");
			e.printStackTrace();
		}

		/*finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception while closing DB Connection");
			}

		}*/
		return 0;
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
		}/* finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception while closing DB Connection");
			}

		}*/

		return false;
	}
	
	public static boolean projectVote(int user_id, int project_id) {
		Connection con = null;

		try {
			con = ConnectionProvider.getCon();
			String sql = "INSERT INTO vote (project_id, user_id) VALUES (?,?)";
			PreparedStatement st = con.prepareStatement(sql);

			st.setInt(1, project_id);
			st.setInt(2, user_id);

			st.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error while inserting vote");
			e.printStackTrace();
		} /*finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception while closing DB Connection");
			}

		}*/

		return true;

	}
	
	public static boolean updateComment(Project project ,String comment) {
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();
			String sql = "UPDATE project SET comment = '" + comment + "' WHERE id = '" + project.getId() + "'";
			Statement st = con.createStatement();
			st.execute(sql);

		} catch (Exception e) {
			System.out.println("Exception while updating comment");
			e.printStackTrace();
		} /*finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception while closing DB Connection");
			}

		}*/

		return false;
	}

	public static Project resultSetCreateProject (ResultSet myRs) {
		try {
		return new Project(myRs.getInt("p.id"), myRs.getString("p.title"), myRs.getString("p.category"),
				myRs.getString("p.short_description"), myRs.getString("p.description"),
				myRs.getString("p.location"), myRs.getString("p.period"), myRs.getString("investment_grade"),
				myRs.getString("p.phone_number"), myRs.getBoolean("p.anonymous"),
				new State(myRs.getInt("s.id"), myRs.getString("s.description")),
				myRs.getString("stamp_created"), myRs.getString("stamp_updated"), ProjectDao.countVotes(myRs.getInt("p.id")),
				myRs.getString("comment"), UserDao.searchUser(myRs.getInt("user_id")));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error while creating project object");
		}
		return null;
	}
	
	

}
