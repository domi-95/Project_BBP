package database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import file.File;

public class FileDao {

	public static File searchFile (int id, int select) {
	Connection con = null;
	String where = null;
		if (select == 1) {
			where = "project";
		}
		if (select == 2) {
			where = "opinion_poll";
		}

	try {
		con = ConnectionProvider.getCon();
		Statement myst = con.createStatement();

		ResultSet myRs = myst
				.executeQuery("SELECT picture from "+where+" where id = '" + id + "'");

		if (myRs.next())
			return new File(myRs.getBytes("picture"));
		else {
			return null;
		}

	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("Error while selecting file");
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
}
