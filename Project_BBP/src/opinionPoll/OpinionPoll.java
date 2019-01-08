package opinionPoll;

import java.io.InputStream;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import database.OpinionPollDao;

public class OpinionPoll {
	
	int id;
	String title;
	String category;
	String short_description;
	String description;
	Timestamp date_from;
	Timestamp date_to;
	List<String> header = new LinkedList<String>();
	
	
	
	public static boolean createProject (String title, String short_description, String description, InputStream is, List<String> header, String date_from, String date_to, int user_id) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = null;
		Date endDate = null;
		try {
			//Weiterverarbeitung mit Datumsobjekt durchführen
			 startDate = sdf.parse(date_from);
			 endDate = sdf.parse(date_to);
		} catch (ParseException e) {
			e.printStackTrace();
			System.out.println("Error while parsing String to Date");
		}
		return OpinionPollDao.safeOpinionPoll(title, short_description, description, is, startDate, endDate, header, user_id);
		
		
		
}
}