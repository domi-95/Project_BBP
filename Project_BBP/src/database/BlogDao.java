package database;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import blog.Blog;

public class BlogDao {
	
	public static boolean safeBlog(String title, String category, String content, int user_id, InputStream picture) {
		Connection con = null;

		try {
			con = ConnectionProvider.getCon();
			String sql = "INSERT INTO blog (title, category, content, picture, user_id) VALUES (?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, title);
			st.setString(2, category);
			st.setString(3, content);
			st.setBlob(4, picture);
			st.setInt(5, user_id);

			st.executeUpdate();
			return true;
			
		} catch (Exception e) {
			System.out.println("Error while inserting blog");
			e.printStackTrace();
		}

		return false;
	}
	
	public static List<Blog> getAll (){
		List<Blog> result = new LinkedList<Blog>();
		Connection con = null;
		try {
			con = ConnectionProvider.getCon();

			Statement myst = con.createStatement();
			ResultSet myRs = myst.executeQuery(
					"SELECT * from blog ORDER BY stamp_created desc");
			while (myRs.next()) {
				result.add(resultSetCreateBlog(myRs));
			}
			return result;
		} catch (SQLException e) {
			System.out.println("Error while selecting all projects");
			e.printStackTrace();
		}

		return null;
	}
	
	public static Blog resultSetCreateBlog (ResultSet myRs) {
		try {
			return new Blog(myRs.getInt("id"), myRs.getString("title"), myRs.getString("category"), myRs.getString("content"), myRs.getString("stamp_created"), UserDao.searchUser(myRs.getInt("user_id"))
					);
		} catch (SQLException e) {
			System.out.println("Error while creating blog user");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


}
