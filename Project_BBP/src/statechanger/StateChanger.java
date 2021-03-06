package statechanger;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.TimeUnit;

import opinionPoll.*;

// this is a class for changing states (see documentation --> state concept opinion poll)
//  a thread should work as batchjob to change states of opinion polls and project	

// compareTo
//  0 = equal
// -1 = date1  < date2
//  1 = date1  > date2

public class StateChanger extends TimerTask {

	public static void startSchedule() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 24);
		calendar.set(Calendar.MINUTE, 00);
		calendar.set(Calendar.SECOND, 00);
		Date time = calendar.getTime();

		Timer timer = new Timer();
		timer.scheduleAtFixedRate(new StateChanger(), time, TimeUnit.MILLISECONDS.convert(1, TimeUnit.DAYS));
		
	}

	public void run() {
		checkStates(OpinionPoll.getAll(1));
		checkStates(OpinionPoll.getAll(2));
	}

	public static void checkStates(List<OpinionPoll> toCheck) {
		Calendar cal_date_today = Calendar.getInstance();
		cal_date_today = getCalenderWithoutTime(cal_date_today); //today

		for (OpinionPoll op : toCheck) {
			System.out.println("ID: " + op.getId());
			System.out.println("Datum from: " + op.getDate_from());
			System.out.println("Datum to: " + op.getDate_to());
			System.out.println("Datum heute: " + new Date());
			Date date_from = op.getDate_from_timestamp();
			Date date_to = op.getDate_to_timestamp();

			Calendar cal_date_from = Calendar.getInstance();
			Calendar cal_date_to = Calendar.getInstance();

			cal_date_from.setTime(date_from);
			cal_date_to.setTime(date_to);

			cal_date_from = getCalenderWithoutTime(cal_date_from); //date_from
			cal_date_to = getCalenderWithoutTime(cal_date_to);	// date_to

			//----------created--------------
			
			//today is before date_from AND today is before date_to
			
			if(cal_date_today.before(cal_date_from)&& cal_date_today.before(cal_date_to)) {
				System.out.println("Ist gleich: Erstellt");
				op.setStateOp(new StateOp(1, "erstellt"));
				continue;
			}
			
			//----------opened--------------
			
			//today is date_from AND today is before date_to
			
			if (cal_date_today.equals(cal_date_to) && cal_date_today.before(cal_date_to)){
				System.out.println("Ist gleich: Er�ffnet");
				op.setStateOp(new StateOp(2, "er�ffnet"));
				continue;
			}
			
			// today is after date_from AND today is before date_to
			
			if (cal_date_today.after(cal_date_from) && cal_date_today.before(cal_date_to)) {
				System.out.println("Ist gleich: Er�ffnet");
				op.setStateOp(new StateOp(2, "er�ffnet"));
				continue;
			}
			
			//----------closed--------------
			
			//today is after date_from AND today is after date_to
			
			if (cal_date_today.after(cal_date_from) && cal_date_today.after(cal_date_to)) {
				System.out.println("Ist gleich: geschlossen");
				op.setStateOp(new StateOp(3, "abgeschlossen"));
				continue;
			}
			
			// today is after date_from and today is date to
			
			if (cal_date_today.after(cal_date_from) && cal_date_today.equals(cal_date_to)) {
				System.out.println("Ist gleich: geschlossen");
				op.setStateOp(new StateOp(3, "abgeschlossen"));
				continue;
			}
			
		
			System.out.println("--------------------------------");
		}
	}

	private static Calendar getCalenderWithoutTime(Calendar calendar) {
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		return calendar;

	}

}
