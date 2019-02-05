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

	// safe project

	public static Project safeProject(String title, String category, String shortDescription, String description,
			String location, String investmentGrade, String phoneNumber, String period, int anonymous,
			InputStream picture, int user_id, int state_id) {
		Connection con = null;

		try {
			con = ConnectionProvider.getCon();
			String sql = "INSERT INTO project (title, category, short_description, description, location, period, investment_grade, picture, phone_number, anonymous, state_id, stamp_created, user_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

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
			st.setInt(11, state_id);
			st.setTimestamp(12, new Timestamp(new Date().getTime()));
			st.setInt(13, user_id);

			st.executeUpdate();
			ResultSet myRs = st.getGeneratedKeys();
			if (myRs.next()) {
				return searchProject(myRs.getInt(1));
			}
		} catch (Exception e) {
			System.out.println("Error while inserting project");
			e.printStackTrace();
		}

		return null;
	}

	// search a specific project

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

		return null;
	}

	// fetch project by user_id

	public static List<Project> searchProjectCreator(int user_id) {
		Connection con = null;
		List<Project> result = new LinkedList<Project>();

		try {
			con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();

			ResultSet myRs = myst.executeQuery(
					"SELECT * from project p, state s where p.user_id = " + user_id + " and p.state_id = s.id ");

			while (myRs.next()) {
				result.add(resultSetCreateProject(myRs));
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error while selecting project");
		}

		return null;
	}

	// fetch all projects by state

	public static List<Project> getAllProject(int state_id) {
		List<Project> result = new LinkedList<Project>();
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();

			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * from project p, state s where s.id = " + state_id
					+ " and p.state_id = s.id ORDER BY stamp_created desc");
			while (myRs.next()) {
				result.add(resultSetCreateProject(myRs));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("Error while selecting all projects");
			e.printStackTrace();
		}

		return null;
	}

	// fetch project by filter criteria

	public static List<Project> getAllProject(int state_id, String category, String title) {
		String sql = null;
		String sqlCategory = "";
		String sqlTitle = "";
		String sqlState_id = "";
		String orderby = "stamp_created desc";
		if (category != null && !(category.equals("*"))) {
			sqlCategory = "AND p.category = '" + category + "' ";
		}
		if (title != null) {
			sqlTitle = "AND p.title LIKE '" + title + "%' ";
		}
		if (state_id != 0) {
			sqlState_id = "s.id = " + state_id + " AND";
			if (state_id == 2 ) {
				//orderby = "stamp_expirydate is null, id asc";
				orderby = "ISNULL(stamp_expirydate) ASC, stamp_expirydate ASC;";
			}
		}
		// create sql

		List<Project> result = new LinkedList<Project>();
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();

			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * from project p, state s where " + sqlState_id
					+ " p.state_id = s.id " + sqlCategory + sqlTitle + " ORDER BY "+orderby+" ");
			while (myRs.next()) {
				result.add(resultSetCreateProject(myRs));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("Error while selecting filtered projects");
			e.printStackTrace();
		}

		return null;
	}

	// to check if citizen already has voted on projects

	public static Map<Integer, Integer> getAllVotesHash(int user_id) {
		Map<Integer, Integer> result = new HashMap<Integer, Integer>();
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();

			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * from vote where user_id = " + user_id + "");
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

	// for myoverview for citizen to look what happened with projects they already
	// voted

	public static List<Project> getAllVotesList(int user_id) {
		List<Project> result = new LinkedList<Project>();
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();

			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery(
					"SELECT * from vote v, project p, state s where p.state_id = s.id and p.id = v.project_id and v.user_id = "
							+ user_id + "");
			while (myRs.next()) {
				result.add(resultSetCreateProject(myRs));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("Error while selecting votes from users");
			e.printStackTrace();
		}
		return null;
	}

	// private method to count votes

	private static int countVotes(int project_id) {
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();
			ResultSet myRs = myst
					.executeQuery("SELECT COUNT(project_id) from vote WHERE project_id = '" + project_id + "'");
			if (myRs.next()) {
				return myRs.getInt("count(project_id)");
			}

		} catch (SQLException e) {
			System.out.println("Error while selecting all projects");
			e.printStackTrace();
		}

		return 0;
	}

	// update the state of a specific project

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
		}
		return false;
	}

	// insert a vote from a citizen

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
		}

		return true;

	}

	// special case when the project has as many votes as 1,5 percent of the total
	// population an expiry date  3 months after today will updated in the db

	public static boolean projectVoteWithExpiryDate(int user_id, int project_id, Calendar expiryDate) {
		ProjectDao.projectVote(user_id, project_id);
		Connection con = null;

		try {
			con = ConnectionProvider.getCon();
			String sql = "update project set stamp_expirydate = ? WHERE id  = '" + project_id + "'";
			PreparedStatement st = con.prepareStatement(sql);

			st.setTimestamp(1, new Timestamp(expiryDate.getTimeInMillis()));

			st.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error while inserting vote");
			e.printStackTrace();
			return false;
		}

		return true;

	}

	// insert an comment for declined cases

	public static boolean updateComment(Project project, String comment) {
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();
			String sql = "UPDATE project SET comment = '" + comment + "' WHERE id = '" + project.getId() + "'";
			Statement st = con.createStatement();
			st.execute(sql);

		} catch (Exception e) {
			System.out.println("Exception while updating comment");
			e.printStackTrace();
		}

		return false;
	}

	// private method for creating an project object

	private static Project resultSetCreateProject(ResultSet myRs) {
		try {
			return new Project(myRs.getInt("p.id"), myRs.getString("p.title"), myRs.getString("p.category"),
					myRs.getString("p.short_description"), myRs.getString("p.description"),
					myRs.getString("p.location"), myRs.getString("p.period"), myRs.getString("investment_grade"),
					myRs.getString("p.phone_number"), myRs.getBoolean("p.anonymous"),
					new State(myRs.getInt("s.id"), myRs.getString("s.description")), myRs.getString("stamp_created"),
					myRs.getString("stamp_updated"), ProjectDao.countVotes(myRs.getInt("p.id")),
					myRs.getString("comment"), UserDao.searchUser(myRs.getInt("user_id")),
					myRs.getString("stamp_expiryDate"));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error while creating project object");
		}
		return null;
	}

}
