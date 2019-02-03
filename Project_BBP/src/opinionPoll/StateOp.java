package opinionPoll;

public class StateOp {
	//this class is used to image the status of an opinion poll
	
	int id;
	String description;
	
	
	public StateOp(int id, String description) {
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
