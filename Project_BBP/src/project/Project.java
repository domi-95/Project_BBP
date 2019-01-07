package project;

import java.io.InputStream;
import java.util.Arrays;
import java.util.List;

import database.*;

public class Project {

	private int id;
	private String title;
	private String category;
	private String short_description;
	private String description;
	private String location;
	private int period;
	private String investment_grade;
	private String phone_numer;
	private boolean anonymous;
	private State state;
	private String stamp_created;
	private String stamp_updated;
	private int vote;
	private String comment;

	public Project(int id, String title, String category, String short_description, String description, String location,
			int period, String investment_grade, String phone_numer, boolean anonymous, State state,
			String stamp_created, String stamp_updated, int vote, String comment) {
		super();
		this.id = id;
		this.title = title;
		this.category = category;
		this.short_description = short_description;
		this.description = description;
		this.location = location;
		this.period = period;
		this.investment_grade = investment_grade;
		this.phone_numer = phone_numer;
		this.anonymous = anonymous;
		this.state = state;
		this.stamp_created = stamp_created;
		this.stamp_updated = stamp_updated;
		this.vote = vote;
		this.comment = comment;
	}

	public int getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public String getCategory() {
		return category;
	}

	public String getShort_description() {
		return short_description;
	}

	public String getDescription() {
		return description;
	}

	public String getLocation() {
		return location;
	}

	public int getPeriod() {
		return period;
	}

	public String getInvestment_grade() {
		return investment_grade;
	}


	public String getPhone_numer() {
		return phone_numer;
	}

	public boolean isAnonymous() {
		return anonymous;
	}

	public State getState() {
		return state;
	}

	private void setState(State state) {
		this.state = state;
		ProjectDao.updateState(this);
	}

	public String getStamp_created() {
		return stamp_created;
	}

	public String getStamp_updated() {
		return stamp_updated;
	}

	public int getVote() {
		return vote;
	}

	public void Vote(int user_id, int project_id) {
		ProjectDao.projectVote(user_id, project_id);
		this.vote++;
	}

	public String getComment() {
		return comment;
	}

	private void setComment(String comment) {
		this.comment = comment;
		ProjectDao.updateComment(this, comment);
	}

	public static List<Project> getAll(int state_id) {
		return ProjectDao.getAllProject(state_id);
	}

	public static Project getProject(int id) {
		return ProjectDao.searchProject(id);
	}

	public void decline(String comment, State state) {
		this.setComment(comment);
		this.setState(state);
	}
	
	public void approve (State state) {
		this.setState(state);
	}
	
	

	public static boolean createProject(String title, String category, String shortDescription, String description,
			String location, String investmentGrade, String phoneNumber, int period, int anonymous,
			InputStream picture, int user_id) {
		return ProjectDao.safeProject(title, category, shortDescription, description, location, investmentGrade,
				phoneNumber, period, anonymous, picture, user_id);
	}

	

}
