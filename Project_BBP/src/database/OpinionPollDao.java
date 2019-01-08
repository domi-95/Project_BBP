package database;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

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
			String sql = "INSERT INTO opinion_poll (title, short_description, description, picture, max_choice, date_from, date_to, choice_header_id, user_id) VALUES (?,?,?,?,?,?,?,?,?)";
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
	}

