package test;

import java.text.SimpleDateFormat;
import java.util.*;

import file.*;
import opinionPoll.*;
import project.Project;
import database.*;
import servlet.*;
import statechanger.StateChanger;
import user.*;

public class TestMain extends Thread{
	public static void main(String[] args) {

		// System.out.println(Dao.login("max.mustermann@bbp.de", "1234"));
		// System.out.println(Dao.searchUser("max.mustermann@bbp.de"));
//	System.out.println(Dao.safeUser("test@test.de", "Test", "Test", "test123", 1));
//	System.out.println(User.createUser("test@test.de", "Test", "Test", "test123", 1));

		//System.out.println(searchRequest(3));
		//System.out.println(ProjectDao.getAllProject(2).get(1).getUser().getFirstname());
		// new File
		//Project project = ProjectDao.searchProject(39);
		//System.out.println(project);
		//List<Project> result = ProjectDao.getAllProject(1);
		//System.out.println(result);
		//project.setState(new State(2, "freigegeben"));
		//System.out.println(ProjectDao.countVotes(45));
		//System.out.println(ProjectDao.getAllProject(1));
		//project.setComment("ein test kommentar wurde eingefügt");
		//System.out.println(ProjectDao.searchProject(39));
		//System.out.println(FileDao.searchFile(39));
		/*List<String>test = new LinkedList<String>();
		test.add("Spalte 1");
		test.add("Spalte 2");
		test.add("Spalte 3");
		test.add("Spalte 4");
		test.add("Spalte 5");
		test.add("Spalte 6");
		test.add("Spalte 7");
		test.add("Spalte 8");
		test.add("Spalte 9");
		test.add("Spalte 10");
		System.out.println(OpinionPollDao.insertChoiceHeader(test));
		
		System.out.println(OpinionPollDao.safeOpinionPoll("hallo", "hallo", "hallo", null, new Date(), new Date(), test, 1));*/
		
		//System.out.println(OpinionPollDao.getAllProject(1));
		
		//System.out.println(OpinionPollDao.getHeader(4));
		//List<String>header = OpinionPollDao.getHeader(5);
		/*System.out.println(header);
		
		for(int i = 0; i<header.size(); i++) {
			System.out.println(header.get(i));
		}*/
		
		//OpinionPollDao.voteSingle(1, 1, 1);
		
		/*File file = File.getFileOp(10);
		System.out.println(file);
		System.out.println(file.getFile());*/
		
	//	List<OpinionPoll> result = OpinionPoll.getAll(1);
		//System.out.println(result);
		/*List<String> header = result.get(1).getHeader();
		
		System.out.print("[");
		for (int i = 0; i<header.size();i++) {
			
			System.out.print("\""+header.get(i)+"\"");
			if(i<header.size()-1) {
			System.out.print(",");
			}
		}
		System.out.print("]");
		//String s = "null";
		//System.out.println(s.equals("null"));
		//System.out.println("test");
		//System.out.println("\"\"");
		//System.out.println(OpChoice.getChoice(1).getChoice()[1]);
		System.out.println();
		
		int [] choice = result.get(6).getChoice().getChoice();
		System.out.print("[");
		for (int i = 0; i < header.size(); i++) {
			System.out.print(choice[i]);
			if(i<header.size()-1) {
				System.out.print(",");
				}
		}
		System.out.print("]");
		
		System.out.println(result.get(6).getId()); */
		//Thread t = new TestMain();
		//t.start();
		
		//Map <Integer, Integer>  result =(ProjectDao.getAllVotes(1));
		//System.out.println(result.get(1));
		
//		List<OpinionPoll> created = OpinionPoll.getAll(1);
//		System.out.println(created.get(1).getId());
////		System.out.println(created.get(1).getDate_from().compareTo(new Date()));
////		System.out.println();
//		Date date_from = created.get(2).getDate_from();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		//Date date_from = sdf.parse(created.get(1).getDate_from());
//		//Date today = new Date()
//		
//		
//		//Date date_from = created.get(1).getDate_from();
//		//date_from.setHours(0);
//		  Calendar cal_date_from = Calendar.getInstance();
//		  cal_date_from.setTime(date_from);
//		  System.out.println(cal_date_from);
//		  cal_date_from.set(Calendar.MINUTE, 0);
//		  cal_date_from.set(Calendar.HOUR_OF_DAY, 0);
//		  cal_date_from.set(Calendar.SECOND, 0);
//		  cal_date_from.set(Calendar.MILLISECOND, 0);
//		  
//		  date_from = cal_date_from.getTime();
//		  System.out.println(date_from);
//		  
//		  
//		  
//		  Calendar cal_date_today = Calendar.getInstance();
//		  System.out.println(cal_date_today);
//		  cal_date_today.set(Calendar.MINUTE, 0);
//		  cal_date_today.set(Calendar.HOUR_OF_DAY, 0);
//		  cal_date_today.set(Calendar.SECOND, 0);
//		  cal_date_today.set(Calendar.MILLISECOND, 0);
//		  Date today;
//		  today = cal_date_today.getTime();
//		  System.out.println(today);
//		  
//		  System.out.println(cal_date_from.compareTo(cal_date_today));
//		  System.out.println(cal_date_today.compareTo(cal_date_from));
		 
		  
		  //date 1.compareTo (date2) = -1 if (date1 <= date 2)
		  //date 2.compareTo (date1) = 1 if (date1 > date 2)
		//List<OpinionPoll> created = OpinionPoll.getAll(1);
		//Calendar cal_date_today = Calendar.getInstance();
		//cal_date_today = getCalenderWithoutTime(cal_date_today);
		
		//created.get(2).setStateOp(new StateOp(2, "eröffnet"));
		//System.out.println(created.get(2).getId());
//		for (OpinionPoll op : created) {
//			System.out.println("ID: " + op.getId());
//			System.out.println("Datum von: " + op.getDate_from());
//			System.out.println("Datum heute: " + new Date());
//			Date date_from = op.getDate_from();
//			Calendar cal_date_from = Calendar.getInstance();
//			cal_date_from.setTime(date_from);
//			cal_date_from = getCalenderWithoutTime(cal_date_from);
//			if (cal_date_from.compareTo(cal_date_today) == 0) {
//				System.out.println("Ist gleich");
//			}
//
//			if (cal_date_from.compareTo(cal_date_today) == -1) {
//
//				System.out.println("Datum to liegt in der Vergangenheit");
//			}
//
//			if (cal_date_from.compareTo(cal_date_today) == 1)
//				System.out.println("Datum from liegt in der Zukunft");
//		}

		
//		List<OpinionPoll> created = OpinionPoll.getAll(1);
//		List<OpinionPoll> opened = OpinionPoll.getAll(2);
//		List<OpinionPoll> closed = OpinionPoll.getAll(3);

		//System.out.println(created);
		//System.out.println(opened);
		//System.out.println(closed);
		
//		System.out.println("--------------created------------------");
//		StateChanger.checkStates(created);
//		System.out.println("--------------opened------------------");
//		StateChanger.checkStates(opened);
//		System.out.println("--------------closed------------------");
//		StateChanger.checkStates(closed);
//		
		
//		Project project = Project.getProject(59);
//		User user = project.getUser();
//		String s = null;
//		
//		s = "Hallo "+ user.getFirstname()+" "+user.getname()+",\n"+"\n"+
//			"folgendes Projekt wurde bei uns Eingereicht: \n"+
//				"Titel: "+project.getTitle()+"\n"+
//				"Kategorie: "+project.getCategory()+"\n"+
//				"Kurzbeschreibung: "+project.getShort_description()+"\n"+
//				"Beschreibung: "+project.getDescription()+"\n"+
//				"Ort: "+project.getLocation()+"\n"+
//				"Zeitraum: "+project.getPeriod()+"\n"+
//				"Investitiongrad: "+project.getInvestment_grade()+"\n"+
//				"Telefonnummer: "+project.getPhone_numer()+"\n"+
//				"Erstellt: "+project.getStamp_created()+"\n";
//		try {
//			Thread.sleep(10000);
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		System.out.println(s);
//		
//	}
	
//	public static Calendar getCalenderWithoutTime (Calendar calendar) {
//		calendar.set(Calendar.MINUTE, 0);
//		calendar.set(Calendar.HOUR_OF_DAY, 0);
//		calendar.set(Calendar.SECOND, 0);
//		calendar.set(Calendar.MILLISECOND, 0);
//		return calendar;
//		  
//	}

	/*public void run() {
		while (true) {
			System.out.println("hallo");
			try {
				Thread.sleep(600000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
		}
		
	}*/
	
	
	

}
