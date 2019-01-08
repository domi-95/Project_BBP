package database;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import opinionPoll.*;
import user.User;

public class OpinionPollDao {
	
	public static boolean safeOpinionPoll(String title, String short_description, 
			String description, InputStream picture, Date date_from, Date date_to, List<String> header, int user_id) {
		Connection con = null;
		int choice_header_id = insertChoiceHeader(header);
		if(choice_header_id == -1) {
			System.out.println("Error while inserting choice_header");
			return false;
		}

		try {
			con = ConnectionProvider.getCon();
			String sql = "INSERT INTO opinion_poll (title, short_description, description, picture, max_choice, date_from, date_to, choice_header_id, user_id, state_op_id) VALUES (?,?,?,?,?,?,?,?,?,?)";
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
			st.setInt(10, 1);

			st.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error while inserting opinion poll");
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception while closing DB Connection");
			}

		}

		return true;
	}
	
	public static int insertChoiceHeader (List<String> header) {
		Connection con = null;

		try {
			con = ConnectionProvider.getCon();
			String sql = "INSERT INTO choice_header (choice1, choice2, choice3, choice4, choice5, choice6, choice7, choice8, choice9, choice10) VALUES (?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			for (int i = 0; i<10; i++) {
			st.setString(i+1, header.get(i));
			}
			

			st.executeUpdate();
			ResultSet myRs = st.getGeneratedKeys();
			if (myRs.next()) {
				return myRs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("Error while inserting choice_header");
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception while closing DB Connection");
			}

		}

		return -1;
	}
	
	public static List<OpinionPoll> getAllProject(int state_id) {
		List<OpinionPoll> result = new LinkedList<OpinionPoll>();
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery(
					"SELECT * FROM opinion_poll op, state st WHERE op.state_op_id = st.id and op.state_op_id = '"+state_id+"'");
			while (myRs.next()) {
				result.add(resultSetCreateOpinionPoll(myRs));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("Error while selecting all projects");
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
	
	public static List<String> getHeader (int header_id) {
		List<String> result = new LinkedList<String>();
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();
			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery(
					"SELECT * from choice_header WHERE id = '"+header_id+"'");
			if (myRs.next()) {
				for (int i = 1; i<11; i++) {
					result.add(myRs.getString("choice"+i));
				}
			}
			return result;
			
		} catch (SQLException e) {
			System.out.println("Error while selecting choice_header");
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
	
	public static OpinionPoll resultSetCreateOpinionPoll(ResultSet myRs) {
		try {
			return new OpinionPoll(myRs.getInt("id"), 
					myRs.getString("title"), 
					myRs.getString("short_description"), 
					myRs.getString("description"), 
					myRs.getBytes("picture"), 
					myRs.getInt("max_choice"), 
					myRs.getTimestamp("date_from"),
					myRs.getTimestamp("date_to"), 
					myRs.getTimestamp("created"), 
					getHeader(myRs.getInt("choice_header_id")),
					UserDao.searchUser(myRs.getInt("user_id")));
		} catch (SQLException e) {
			System.out.println("Error while creating opinionPoll object");
			e.printStackTrace();
		}
		return null;
	}
	
	}

	

