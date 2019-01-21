package project;

import user.*;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;

import database.*;
import emailsender.EmailSend;

public class Project {

	private int id;
	private String title;
	private String category;
	private String short_description;
	private String description;
	private String location;
	private String period;
	private String investment_grade;
	private String phone_numer;
	private boolean anonymous;
	private State state;
	private String stamp_created;
	private String stamp_updated;
	private int vote;
	private String comment;
	private User user;

	public Project(int id, String title, String category, String short_description, String description, String location,
			String period, String investment_grade, String phone_numer, boolean anonymous, State state,
			String stamp_created, String stamp_updated, int vote, String comment, User user) {
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
		this.user = user;
	}

	public User getUser() {
		return user;
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

	public String getPeriod() {
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

	public static boolean Vote(int user_id, int project_id) {
		return ProjectDao.projectVote(user_id, project_id);

	}

	public String getComment() {
		return comment;
	}

	private void setComment(String comment) {
		this.comment = comment;
		ProjectDao.updateComment(this, comment);
	}

	/*public static List<Project> getAll(int state_id) {
		return ProjectDao.getAllProject(state_id);
	}*/
	
	public static List<Project> getAllWithCreator (int user_id){
		return ProjectDao.searchProjectCreator(user_id);
	}

	public static Project getProject(int id) {
		return ProjectDao.searchProject(id);
	}
	
	public static List<Project> getCreatedProjects () {
		return ProjectDao.getAllProject(1);
	}
	
	public static List<Project> getApprovedAdministrationProjects () {
		return ProjectDao.getAllProject(2);
	}
	
	public static List<Project> getDeclinedAdministrationProjects () {
		return ProjectDao.getAllProject(3);
	}
	
	public static List<Project> getCheckedCouncilProjects () {
		return ProjectDao.getAllProject(4);
		
	}
	
	public static List<Project> getDeclinedCouncilProjects () {
		return ProjectDao.getAllProject(5);
	}
	
	public static List<Project> getApprovedCouncilProjects () {
		return ProjectDao.getAllProject(6);
	}

	public void approveAdministration() {
		this.setState(new State(2, "freigegeben verwaltung"));
	}

	public void declineAdministration(String comment) {
		this.setComment(comment);
		this.setState(new State(3, "abgelehnt verwaltung"));
	}

	public void checkedCouncil() {
		this.setState(new State(4, "geprüft gemeinderat"));
	}

	public void declineCouncil(String comment, State state) {
		this.setComment(comment);
		this.setState(new State(5, "abgelehnt gemeinderat"));
	}

	public void approveCouncil(String comment, State stete) {
		this.setComment(comment);
		this.setState(new State(6, "freigegeben gemeinderat"));
	}

	public static boolean createProject(String title, String category, String shortDescription, String description,
			String location, String investmentGrade, String phoneNumber, String period, int anonymous,
			InputStream picture, int user_id) {
		Project project = ProjectDao.safeProject(title, category, shortDescription, description, location,
				investmentGrade, phoneNumber, period, anonymous, picture, user_id, 1);
		if (project != null) {
			EmailSend.sendSubmitted(project);
			return true;
		} else {
			return false;
		}
	}


}
