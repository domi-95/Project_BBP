package opinionPoll;

import database.OpinionPollDao;

public class OpChoice {

	int id;
	int choice1 = 0;
	int choice2 = 0;
	int choice3 = 0;
	int choice5 = 0;
	int choice6 = 0;
	int choice7 = 0;
	int choice8 = 0;
	int choice9 = 0;
	int choice10 = 0;

	public OpChoice(int id, int choice1, int choice2, int choice3, int choice5, int choice6, int choice7, int choice8,
			int choice9, int choice10) {
		super();
		this.id = id;
		this.choice1 = choice1;
		this.choice2 = choice2;
		this.choice3 = choice3;
		this.choice5 = choice5;
		this.choice6 = choice6;
		this.choice7 = choice7;
		this.choice8 = choice8;
		this.choice9 = choice9;
		this.choice10 = choice10;
	}
	
	public static boolean voteSingle (int column, int user_id, int opinion_poll_id) {
		return OpinionPollDao.voteSingle(column, user_id, opinion_poll_id);
		
		
	}
}
