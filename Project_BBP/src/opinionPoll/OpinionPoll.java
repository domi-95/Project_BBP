package opinionPoll;

import java.io.InputStream;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import database.OpinionPollDao;
import user.*;

public class OpinionPoll {
	
	int id;
	String title;
	String short_description;
	String description;
	byte[] picture;
	int max_choice;
	Timestamp date_from;
	Timestamp date_to;
	Timestamp created;
	List<String> header = new LinkedList<String>();
	User creator;
	OpChoice choice;
	
	
	
	
	
	public OpinionPoll(int id, String title, String short_description, String description, byte[] picture,
			int max_choice, Timestamp date_from, Timestamp date_to, Timestamp created, List<String> header,
			User creator, OpChoice choice) {
		super();
		this.id = id;
		this.title = title;
		this.short_description = short_description;
		this.description = description;
		this.picture = picture;
		this.max_choice = max_choice;
		this.date_from = date_from;
		this.date_to = date_to;
		this.created = created;
		this.header = header;
		this.creator = creator;
		this.choice = choice;
	}
	
	

	public int getId() {
		return id;
	}



	public String getTitle() {
		return title;
	}



	public String getShort_description() {
		return short_description;
	}



	public String getDescription() {
		return description;
	}



	public byte[] getPicture() {
		return picture;
	}



	public int getMax_choice() {
		return max_choice;
	}



	public Timestamp getDate_from() {
		return date_from;
	}



	public Timestamp getDate_to() {
		return date_to;
	}



	public Timestamp getCreated() {
		return created;
	}



	public List<String> getHeader() {
		return header;
	}



	public User getCreator() {
		return creator;
	}

	


	public OpChoice getChoice() {
		return choice;
	}



	public static boolean createProject(String title, String short_description, String description, InputStream is,
			List<String> header, String date_from, String date_to, int user_id) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = null;
		Date endDate = null;
		int state_id = 1;
		try {
			// Weiterverarbeitung mit Datumsobjekt durchführen
			startDate = sdf.parse(date_from);
			endDate = sdf.parse(date_to);
		} catch (ParseException e) {
			e.printStackTrace();
			System.out.println("Error while parsing String to Date");
		}
		if (startDate.getDate() == new Date().getDate()) {
			state_id = 2;
		}
		return OpinionPollDao.safeOpinionPoll(title, short_description, description, is, startDate, endDate, header,
				user_id, state_id);

	}
	
	public static List<OpinionPoll> getAll (int state_id) {
		return OpinionPollDao.getAllOp(state_id);
	}

	
	
	
	
}