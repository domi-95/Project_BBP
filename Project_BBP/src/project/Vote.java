package project;
import user.*;
import java.util.*;

import database.*;

public class Vote {
	
	private int id;
	private Project project;
	private User user;
	private String timestamp;
	
	public static Map<Integer, Integer> getUserVotesHash (int user_id){
		return ProjectDao.getAllVotesHash(user_id);
	}
	
	public static List<Project> getUserVotesList (int user_id){
		return ProjectDao.getAllVotesList(user_id);
	}
	
}
