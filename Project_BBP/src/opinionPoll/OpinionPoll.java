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
	private int anonymous;

	public OpinionPoll(int id, String title, String short_description, String description, byte[] picture,
			int max_choice, Timestamp date_from, Timestamp date_to, Timestamp created, List<String> header,
			User creator, OpChoice choice, StateOp stateOp, int anonymous) {
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
		this.anonymous = anonymous;
	}

	public int getAnonymous() {
		return anonymous;
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

	public String getDate_from() {
		DateFormat f = new SimpleDateFormat("dd.MM.yyyy' 'HH:mm 'Uhr'");
		return f.format(created);

	}

	public String getDate_to() {
		DateFormat f = new SimpleDateFormat("dd.MM.yyyy' 'HH:mm 'Uhr'");
		return f.format(created);

	}

	public String getCreated() {
		DateFormat f = new SimpleDateFormat("dd.MM.yyyy' 'HH:mm 'Uhr'");
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

	public static List<OpinionPoll> getMyOps (int user_id) {
		return OpinionPollDao.getAllOpByUser(user_id);
	}
	public void setStateOp(StateOp stateOp) {
		this.stateOp = stateOp;
		OpinionPollDao.updateState(this);
	}

	public static OpinionPoll getOp(int op_id) {
		return OpinionPollDao.getOp(op_id);
	}

	public static boolean createProject(String title, String short_description, String description, InputStream is,
			List<String> header, String date_from, String date_to, int user_id, int anonymous) {
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
				user_id, state_id, anonymous);

	}

	public static List<OpinionPoll> getAll(int state_id) {
		return OpinionPollDao.getAllOp(state_id);
	}

}