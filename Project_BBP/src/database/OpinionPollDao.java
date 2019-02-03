package database;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import opinionPoll.*;
import project.Project;
import user.User;

public class OpinionPollDao {
	
	//safe an opinion poll

	public static boolean safeOpinionPoll(String title, String short_description, String description,
			InputStream picture, Date date_from, Date date_to, List<String> header, int user_id, int state_op_id,
			int anonymous) {
		Connection con = null;
		int choice_header_id = insertChoiceHeader(header);
		if (choice_header_id == -1) {
			System.out.println("Error while inserting choice_header");
			return false;
		}

		try {
			con = ConnectionProvider.getCon();
			String sql = "INSERT INTO opinion_poll (title, short_description, description, picture, max_choice, date_from, date_to, choice_header_id, user_id, state_op_id, anonymous) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, title);
			st.setString(2, short_description);
			st.setString(3, description);
			st.setBlob(4, picture);
			st.setInt(5, 1);
			st.setTimestamp(6, new Timestamp(date_from.getTime()));
			st.setTimestamp(7, new Timestamp(date_to.getTime()));
			st.setInt(8, choice_header_id);
			st.setInt(9, user_id);
			st.setInt(10, state_op_id);
			st.setInt(11, anonymous);

			st.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error while inserting opinion poll");
			e.printStackTrace();
		}

		return true;
	}
	
	//private method to safe the selection options

	private static int insertChoiceHeader(List<String> header) {
		Connection con = null;

		try {
			con = ConnectionProvider.getCon();
			String sql = "INSERT INTO choice_header (choice1, choice2, choice3, choice4, choice5, choice6, choice7, choice8, choice9, choice10) VALUES (?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			for (int i = 0; i < 10; i++) {
				st.setString(i + 1, header.get(i));
			}

			st.executeUpdate();
			ResultSet myRs = st.getGeneratedKeys();
			if (myRs.next()) {
				return myRs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("Error while inserting choice_header");
			e.printStackTrace();
		}

		return -1;
	}
	
	//fetch all opinion polls an returns a list of it

	public static List<OpinionPoll> getAllOp(int state_id) {
		List<OpinionPoll> result = new LinkedList<OpinionPoll>();
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery(
					"SELECT * FROM opinion_poll op, state_op st WHERE op.state_op_id = st.id and op.state_op_id = '"
							+ state_id + "'");
			while (myRs.next()) {
				result.add(resultSetCreateOpinionPoll(myRs));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("Error while selecting all projects");
			e.printStackTrace();
		}

		return null;
	}
	
	//so that in my overview citizens can see all the opinion polls they have voted on

	public static List<OpinionPoll> getAllOpByChoice(int user_id) {
		List<OpinionPoll> result = new LinkedList<OpinionPoll>();
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery(
					"SELECT * FROM opinion_poll op, choice c, state_op st WHERE op.id = c.opinion_poll_id AND st.id = op.state_op_id AND c.user_id = '"
							+ user_id + "'");
			while (myRs.next()) {
				result.add(resultSetCreateOpinionPoll(myRs));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("Error while selecting all projects");
			e.printStackTrace();
		}

		return null;
	}
	
	//so that in my overview councils can see all the opinion polls they have created.

	public static List<OpinionPoll> getAllOpByUser(int user_id) {
		List<OpinionPoll> result = new LinkedList<OpinionPoll>();
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery(
					"SELECT * FROM opinion_poll op, choice c, state_op st WHERE op.user_id = '" + user_id + "'");
			while (myRs.next()) {
				result.add(resultSetCreateOpinionPoll(myRs));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("Error while selecting all projects");
			e.printStackTrace();
		}

		return null;
	}
	
	//for only one specific opinion poll

	public static OpinionPoll getOp(int op_id) {
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery(
					"SELECT * FROM opinion_poll op, state_op st WHERE op.state_op_id = st.id and op.id = '" + op_id
							+ "'");
			if (myRs.next()) {
				return resultSetCreateOpinionPoll(myRs);
			}

		} catch (SQLException e) {
			System.out.println("Error while selecting all projects");
			e.printStackTrace();
		}

		return null;
	}
	
	//private method to count the votes on an opinion poll

	private static OpChoice getChoice(int op_id) {

		Connection con = null;

		try {
			con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery(
					"SELECT opinion_poll_id, sum(choice1), sum(choice2), sum(choice3), sum(choice4), sum(choice5), sum(choice6), sum(choice7),sum(choice8), sum(choice9), sum(choice10) FROM choice WHERE opinion_poll_id = '"
							+ op_id + "' GROUP BY opinion_poll_id");
			if (myRs.next()) {
				int[] choice = { myRs.getInt("sum(choice1)"), myRs.getInt("sum(choice2)"), myRs.getInt("sum(choice3)"),
						myRs.getInt("sum(choice4)"), myRs.getInt("sum(choice5)"), myRs.getInt("sum(choice6)"),
						myRs.getInt("sum(choice7)"), myRs.getInt("sum(choice8)"), myRs.getInt("sum(choice9)"),
						myRs.getInt("sum(choice10)") };
				return new OpChoice(myRs.getInt("opinion_poll_id"), choice);

			}
			int[] choice = new int[9];
			return new OpChoice(op_id, choice);
		} catch (SQLException e) {
			System.out.println("Error while selecting choice");
			e.printStackTrace();
		}

		return null;
	}
	
	//fetch selection options

	public static List<String> getHeader(int header_id) {
		List<String> result = new LinkedList<String>();
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * from choice_header WHERE id = '" + header_id + "'");
			if (myRs.next()) {
				for (int i = 1; i < 11; i++) {
					String h = myRs.getString("choice" + i);
					if (h == null) {
						return result;
					}
					result.add(h);
				}
			}
			return result;

		} catch (SQLException e) {
			System.out.println("Error while selecting choice_header");
			e.printStackTrace();
		}

		return null;
	}
	
	//to check if a citizen has already hit a choice

	public static Map<Integer, Integer> getAllChoices(int user_id) {
		Map<Integer, Integer> result = new HashMap<Integer, Integer>();
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();

			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery("SELECT * from choice where user_id = " + user_id + "");
			while (myRs.next()) {
				result.put(myRs.getInt("opinion_poll_id"), myRs.getInt("user_id"));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("Error while selecting choices from users");
			e.printStackTrace();
		}
		return null;
	}
	
	//private method to create a opinion poll object

	private static OpinionPoll resultSetCreateOpinionPoll(ResultSet myRs) {
		try {
			return new OpinionPoll(myRs.getInt("op.id"), myRs.getString("op.title"),
					myRs.getString("op.short_description"), myRs.getString("op.description"),
					myRs.getBytes("op.picture"), myRs.getInt("op.max_choice"), myRs.getTimestamp("op.date_from"),
					myRs.getTimestamp("op.date_to"), myRs.getTimestamp("op.created"),
					getHeader(myRs.getInt("op.choice_header_id")), UserDao.searchUser(myRs.getInt("op.user_id")),
					getChoice(myRs.getInt("op.id")),
					new StateOp(myRs.getInt("st.id"), myRs.getString("st.description")), myRs.getInt("anonymous"));
		} catch (SQLException e) {
			System.out.println("Error while creating opinionPoll object");
			e.printStackTrace();
		}
		return null;
	}
	
	//when a citizen hit a choice on a opinion poll

	public static boolean voteSingle(int column, int user_id, int opinion_poll_id) {
		Connection con = null;
		column++;
		try {
			con = ConnectionProvider.getCon();
			String sql = "INSERT INTO choice (choice" + column + ", user_id, opinion_poll_id) VALUES (?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);

			st.setInt(1, 1);
			st.setInt(2, user_id);
			st.setInt(3, opinion_poll_id);

			st.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("Error while inserting op vote");
			e.printStackTrace();
		}

		return false;
	}
	
	//for updating the status of a opinion poll with the statechanger class

	public static boolean updateState(OpinionPoll op) {
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();
			String sql = "UPDATE opinion_poll SET state_op_id = '" + op.getStateOp().getId() + "' WHERE id = '"
					+ op.getId() + "'";
			Statement st = con.createStatement();
			st.execute(sql);

		} catch (Exception e) {
			System.out.println("Exception while updating op_state");
			e.printStackTrace();
		}

		return false;
	}
}
