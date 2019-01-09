package opinionPoll;

import database.OpinionPollDao;

public class OpChoice {

	int op_id;
	int[] choice = new int[9];

	

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



	public static boolean voteSingle(int column, int user_id, int opinion_poll_id) {
		return OpinionPollDao.voteSingle(column, user_id, opinion_poll_id);

	}

	public static OpChoice getChoice(int op_id) {
		return OpinionPollDao.getChoice(op_id);
	}
}
