package project;
import user.*;
import java.util.*;

import database.*;

public class Vote {
	
	private int id;
	private Project project;
	private User user;
	private String timestamp;
	
	public static Map<Integer, Integer> getUserVotes (int user_id){
		return ProjectDao.getAllVotes(user_id);
	}
	
}
