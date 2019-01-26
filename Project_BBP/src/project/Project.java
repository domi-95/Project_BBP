package project;

import java.io.InputStream;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import database.ProjectDao;
import emailsender.EmailSend;
import parameters.Parameters;
import user.User;

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
	private String stamp_expiryDate;



	public Project(int id, String title, String category, String short_description, String description, String location,
			String period, String investment_grade, String phone_numer, boolean anonymous, State state,
			String stamp_created, String stamp_updated, int vote, String comment, User user, String stamp_expiryDate) {
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
		this.stamp_expiryDate = stamp_expiryDate;
	}
	
	

	public String getStamp_expiryDate() {
		if (this.stamp_expiryDate != null) {
		Timestamp ts = Timestamp.valueOf(this.stamp_expiryDate);
		
		Calendar expiryDate = Calendar.getInstance();
		expiryDate.setTime(ts);
		Calendar today = Calendar.getInstance();
		long differenceinMillis =  expiryDate.getTimeInMillis() - today.getTimeInMillis();
		int differenceinDays = (int)(differenceinMillis / (1000 * 60 * 60 * 24));
		return differenceinDays+" Tage";
		}
		return "";
		//return differenceinMillis+"";
		//return expiryDate.getTime()+"heute: "+ today.getTime();
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
		Timestamp ts = Timestamp.valueOf(stamp_created);
		DateFormat f = new SimpleDateFormat("dd.MM.yyyy' 'HH:mm 'Uhr'");
		f.format(ts);
		return f.format(ts);
	}

	public String getStamp_updated() {
		Timestamp ts = Timestamp.valueOf(stamp_updated);
		DateFormat f = new SimpleDateFormat("dd.MM.yyyy' 'HH:mm 'Uhr'");
		f.format(ts);
		return f.format(ts);
	}

	public int getVote() {
		return vote;
	}

	public static boolean Vote(int user_id, int project_id) {
		if (Project.getProject(project_id).getVote() >= Parameters.EXPIRYDATEPOPULATION) {
			Calendar expiryDate = Calendar.getInstance();
			expiryDate.add(Calendar.MONTH, 3);
			return ProjectDao.projectVoteWithExpiryDate(user_id, project_id, expiryDate);
		} else {
			return ProjectDao.projectVote(user_id, project_id);
		}
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
		this.setState(new State(4, "gepr�ft gemeinderat"));
	}

	public void declineCouncil(String comment) {
		this.setComment(comment);
		this.setState(new State(5, "abgelehnt gemeinderat"));
	}

	public void approveCouncil(String comment) {
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
