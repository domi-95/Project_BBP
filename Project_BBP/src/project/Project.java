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
	private byte[] picture;
	private String phone_numer;
	private boolean anonymous;
	private State state;
	private String stamp_created;
	private String stamp_updated;
	private int vote;
	private String comment;

	public Project(int id, String title, String category, String short_description, String description, String location,
			int period, String investment_grade, byte[] picture, String phone_numer, boolean anonymous, State state,
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
		this.picture = picture;
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

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getShort_description() {
		return short_description;
	}

	public void setShort_description(String short_description) {
		this.short_description = short_description;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}

	public String getInvestment_grade() {
		return investment_grade;
	}

	public void setInvestment_grade(String investment_grade) {
		this.investment_grade = investment_grade;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public String getPhone_numer() {
		return phone_numer;
	}

	public void setPhone_numer(String phone_numer) {
		this.phone_numer = phone_numer;
	}

	public boolean isAnonymous() {
		return anonymous;
	}

	public void setAnonymous(boolean anonymous) {
		this.anonymous = anonymous;
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
		ProjectDao.updateState(this);
	}

	public String getStamp_created() {
		return stamp_created;
	}

	public void setStamp_created(String stamp_created) {
		this.stamp_created = stamp_created;
	}

	public String getStamp_updated() {
		return stamp_updated;
	}

	public void setStamp_updated(String stamp_updated) {
		this.stamp_updated = stamp_updated;
	}

	public int getVote() {
		return vote;
	}

	public void setVote(int vote) {
		this.vote = vote;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public static List<Project> getAll(int state_id) {
		return ProjectDao.getAllProject(state_id);
	}

	public static Project getProject(int id) {
		return ProjectDao.searchProject(id);
	}

	public static boolean createProject(String title, String category, String shortDescription, String description,
			String location, String investmentGrade, String phoneNumber, int period, int anonymous,
			InputStream picture) {
		return ProjectDao.safeProject(title, category, shortDescription, description, location, investmentGrade,
				phoneNumber, period, anonymous, picture);
	}

	@Override
	public String toString() {
		return "Project [id=" + id + ", title=" + title + ", category=" + category + ", short_description="
				+ short_description + ", description=" + description + ", location=" + location + ", period=" + period
				+ ", investment_grade=" + investment_grade + ", picture=" + Arrays.toString(picture) + ", phone_numer="
				+ phone_numer + ", anonymous=" + anonymous + ", state=" + state + ", stamp_created=" + stamp_created
				+ ", stamp_updated=" + stamp_updated + ", vote=" + vote + ", comment=" + comment + "]";
	}
	
	


}
