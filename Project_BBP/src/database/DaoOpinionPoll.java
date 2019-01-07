package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.mysql.jdbc.Statement;



public class DaoOpinionPoll {
	static final String WRITE_OBJECT_SQL = "INSERT INTO java_objects(name, object_value) VALUES (?, ?)";

	  static final String READ_OBJECT_SQL = "SELECT object_value FROM java_objects WHERE id = ?";

	  public static Connection getConnection() throws Exception {
	    String driver = "org.gjt.mm.mysql.Driver";
	    String url = "jdbc:mysql://localhost/databaseName";
	    String username = "root";
	    String password = "root";
	    Class.forName(driver);
	    Connection conn = DriverManager.getConnection(url, username, password);
	    return conn;
	  }
	  
	  public static long writeJavaObject(Object object) throws Exception {
		  Connection con = null;
		  String className = object.getClass().getName();
		  
		  try {
			  con = ConnectionProvider.getCon();
			  con.setAutoCommit(false);
			  PreparedStatement pstmt = con.prepareStatement(WRITE_OBJECT_SQL, Statement.RETURN_GENERATED_KEYS);
			  pstmt.setString(1, className);
			    pstmt.setObject(2, object);
			    pstmt.executeUpdate();
			    
			    // get the generated key for the id
			    ResultSet rs = pstmt.getGeneratedKeys();
			    int id = -1;
			    if (rs.next()) {
			      id = rs.getInt(1);
			    } 
			    
			    rs.close();
			    pstmt.close();
			    con.commit();
			    System.out.println("writeJavaObject: done serializing: " + className);
			    return id;
			  
		  }catch(Exception e) {
			  e.printStackTrace();
			  System.out.println("Error while uploading object");
		  } finally {
			  con.close();
		  }
		  return 0;
		  }
		 /* String className = object.getClass().getName();
		    PreparedStatement pstmt = conn.prepareStatement(WRITE_OBJECT_SQL);

		    // set input parameters
		    pstmt.setString(1, className);
		    pstmt.setObject(2, object);
		    pstmt.executeUpdate();

		    // get the generated key for the id
		    ResultSet rs = pstmt.getGeneratedKeys();
		    int id = -1;
		    if (rs.next()) {
		      id = rs.getInt(1);
		    }

		    rs.close();
		    pstmt.close();
		    System.out.println("writeJavaObject: done serializing: " + className);
		    return id;
		  }*/
	  
	  public static Object readJavaObject(long id) throws Exception {
		  Connection con = null;
		  try {
			  con = ConnectionProvider.getCon();
			  con.setAutoCommit(false);
			  PreparedStatement pstmt = con.prepareStatement(READ_OBJECT_SQL);
			  pstmt.setLong(1, id);
			  ResultSet rs = pstmt.executeQuery();
			  rs.next();
			  Object object = rs.getObject(1);
			  String className = object.getClass().getName();
			  
			  rs.close();
			  pstmt.close();
			  System.out.println("readJavaObject: done de-serializing: " + className);
			  return object;
		  }catch (Exception e) {
			  e.printStackTrace();
			  System.out.println("Error while selecting object");
		  } finally {
			  con.close();
		  }
		  return null;
		  }
	  
	  
	  public static void main(String args[])throws Exception {
		   /* Connection conn = null;
		    try {
		      conn = getConnection();
		      System.out.println("conn=" + conn);
		      conn.setAutoCommit(false);
		      List<Object> list = new ArrayList<Object>();
		      list.add("This is a short string.");
		      list.add(new Integer(1234));
		      list.add(new Date());

		      long objectID = writeJavaObject(conn, list);
		      conn.commit();
		      System.out.println("Serialized objectID => " + objectID);
		      List listFromDatabase = (List) readJavaObject(conn, objectID);
		      System.out.println("[After De-Serialization] list=" + listFromDatabase);
		    } catch (Exception e) {
		      e.printStackTrace();
		    } finally {
		      conn.close();
		    }*/
		  
		 // System.out.println(DaoOpinionPoll.writeJavaObject(new Date()));
		 // Date date = (Date) readJavaObject(2);
	     // System.out.println("[After De-Serialization] list=" + date);
	      
	      
	      
	      
	      List<Object> list = new ArrayList<Object>();
	      list.add("This is a short string.");
	      list.add(new Integer(1234));
	      list.add(new Date());

	      long objectID = writeJavaObject(list);
	      System.out.println("Serialized objectID => " + objectID);
	      Object object = readJavaObject(objectID);
	      
	      System.out.println("[After De-Serialization] list=" + (object.getClass().getName()));
	  }
}

