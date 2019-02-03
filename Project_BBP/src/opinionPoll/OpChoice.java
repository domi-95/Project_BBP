package opinionPoll;

import database.OpinionPollDao;
import java.util.*;

//class is used to output the diagram

public class OpChoice {

	int op_id;
	int[] choice = new int[9]; //here are the current amount of votes for the opinion poll

	public OpChoice(int op_id, int[] choice) {
		super();
		this.op_id = op_id;
		this.choice = choice;
	}

	public int getOp_id() {
		return op_id;
	}

	public int[] getChoice() {
		return choice;
	}
	
	//servlet use this method to safe a vote

	public static boolean voteSingle(int column, int user_id, int opinion_poll_id) {
		return OpinionPollDao.voteSingle(column, user_id, opinion_poll_id);

	}
	
	//jsp use this method to check if the user already voted

	public static Map<Integer, Integer> getUserChoices(int user_id) {
		return OpinionPollDao.getAllChoices(user_id);
	}
	
	//jsp use this method to get all projects where the current user has voted before

	public static List<OpinionPoll> getMyOps(int user_id) {
		return OpinionPollDao.getAllOpByUser(user_id);

	}
}
