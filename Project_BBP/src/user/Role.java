package user;

public class Role {

	// this class represents a role in our user concept

	private int id;
	private String description;

	public Role(int id, String description) {
		super();
		this.id = id;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
