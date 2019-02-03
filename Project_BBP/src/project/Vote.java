package project;
import user.*;
import java.util.*;

import database.*;

public class Vote {
	
	//this method is used to get a map back to check later directly on the index whether the citizen has already voted on a project
	
	public static Map<Integer, Integer> getUserVotesHash (int user_id){
		return ProjectDao.getAllVotesHash(user_id);
	}
	
	
	
	//this method is used to give back all projects that a citizen votes on
	
	public static List<Project> getUserVotesList (int user_id){
		return ProjectDao.getAllVotesList(user_id);
	}
	
}
