package opinionPoll;

import java.io.InputStream;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import database.OpinionPollDao;
import user.*;

public class OpinionPoll {

	private int id;
	private String title;
	private String short_description;
	private String description;
	private byte[] picture;
	private int max_choice;
	private Timestamp date_from;
	private Timestamp date_to;
	private Timestamp created;
	private List<String> header = new LinkedList<String>();
	private User creator;
	private OpChoice choice;
	private StateOp stateOp;
	private int nostatistic;

	public OpinionPoll(int id, String title, String short_description, String description, byte[] picture,
			int max_choice, Timestamp date_from, Timestamp date_to, Timestamp created, List<String> header,
			User creator, OpChoice choice, StateOp stateOp, int nostatistic) {
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
		this.stateOp = stateOp;
		this.nostatistic = nostatistic;
	}

	public int getNostatistic() {
		return nostatistic;
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

	public Timestamp getDate_from_timestamp() {
		return date_from;

	}

	public Timestamp getDate_to_timestamp() {
		return date_to;

	}

	public String getDate_from() {
		DateFormat f = new SimpleDateFormat("dd.MM.yyyy' 'HH:mm 'Uhr'"); // timstamp converted to readable string
		return f.format(date_from);

	}

	public String getDate_to() {
		DateFormat f = new SimpleDateFormat("dd.MM.yyyy' 'HH:mm 'Uhr'"); // timstamp converted to readable string
		return f.format(date_to);

	}

	public String getCreated() {
		DateFormat f = new SimpleDateFormat("dd.MM.yyyy' 'HH:mm 'Uhr'"); // timstamp converted to readable string
		return f.format(created);
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

	public StateOp getStateOp() {
		return stateOp;
	}

	//fetch all opinion polls where a certain citizen has ever hit a choice on
	
	public static List<OpinionPoll> getCitizenOp(int user_id) {		
		return OpinionPollDao.getAllOpByChoice(user_id);
	}
	
	//fetch all opinion polls by creator user_id
	
	public static List<OpinionPoll> getCouncilOp (int user_id){
		return OpinionPollDao.getAllOpByUser(user_id);
	}
	
	//update state

	public void setStateOp(StateOp stateOp) {
		this.stateOp = stateOp;
		OpinionPollDao.updateState(this);
	}
	
	//fetch op by id

	public static OpinionPoll getOp(int op_id) {
		return OpinionPollDao.getOp(op_id);
	}
	
	//insert an opinion poll

	public static boolean createOpinionPoll(String title, String short_description, String description, InputStream is,
			List<String> header, String date_from, String date_to, int user_id, int nostatistic) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = null;
		Date endDate = null;
		int state_id = 1;
		try {

			startDate = sdf.parse(date_from); // further processing with Date Object
			endDate = sdf.parse(date_to);
		} catch (ParseException e) {
			e.printStackTrace();
			System.out.println("Error while parsing String to Date");
		}

		if (startDate.getDate() == new Date().getDate()) { // check whether the date_from is equal to today
			state_id = 2;
		}
		return OpinionPollDao.safeOpinionPoll(title, short_description, description, is, startDate, endDate, header,
				user_id, state_id, nostatistic);

	}

	//fetch all opinion polls by state
	
	public static List<OpinionPoll> getAll(int state_id) {
		return OpinionPollDao.getAllOp(state_id);
	}

}