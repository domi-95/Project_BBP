package project;

public class State {
	
	//this class is used to image the status of a project

	private int id;
	private String description;

	public State(int id, String description) {
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

}
