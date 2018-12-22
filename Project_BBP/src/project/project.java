package project;

public class project {

	private int id;
	private String title;
	private String category;
	private String short_description;
	private String description;
	private String location;
	private int period;
	private String investment_grade;
	private byte picture;
	private String phone_numer;
	private boolean anonymous;
	private state state;

	public project(int id, String title, String category, String short_description, String description, String location,
			int period, String investment_grade, byte picture, String phone_numer, boolean anonymous,
			state state) {
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

	public byte getPicture() {
		return picture;
	}

	public void setPicture(byte picture) {
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

	public state getState() {
		return state;
	}

	public void setState(state state) {
		this.state = state;
	}
	
//	public static createProject ()
	

	@Override
	public String toString() {
		return "project [id=" + id + ", title=" + title + ", category=" + category + ", short_description="
				+ short_description + ", description=" + description + ", location=" + location + ", period=" + period
				+ ", investment_grade=" + investment_grade + ", picture=" + picture + ", phone_numer=" + phone_numer
				+ ", anonymous=" + anonymous + ", state=" + state + "]";
	}
	
	
	
	
	
	

}
