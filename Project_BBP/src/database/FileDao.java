package database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import project.File;

public class FileDao {

	public static File searchFile (int project_id) {
	Connection con = null;

	try {
		con = ConnectionProvider.getCon();
		Statement myst = con.createStatement();

		ResultSet myRs = myst
				.executeQuery("SELECT picture from project where id = '" + project_id + "'");

		if (myRs.next())
			return new File(myRs.getBytes("picture"));
		else {
			return null;
		}

	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("Error while selecting file");
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
