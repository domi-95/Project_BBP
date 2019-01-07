package opinionPoll;

import java.sql.Timestamp;
import java.util.List;

public class OpinionPoll {
	
	int id;
	String title;
	String category;
	String short_description;
	String description;
	Timestamp date_from;
	Timestamp date_to;
	
	
	public static boolean createProject (String title, String category, String short_description, String description, List<String> header) {
	return false;
}
}