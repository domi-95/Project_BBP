package test;

import java.util.Date;

import java.util.LinkedList;
import java.util.List;
import file.*;
import opinionPoll.*;
import database.*;
import servlet.*;
import user.*;

public class TestMain extends Thread{
	public static void main(String[] args) {

		// System.out.println(Dao.login("max.mustermann@bbp.de", "1234"));
		// System.out.println(Dao.searchUser("max.mustermann@bbp.de"));
//	System.out.println(Dao.safeUser("test@test.de", "Test", "Test", "test123", 1));
//	System.out.println(User.createUser("test@test.de", "Test", "Test", "test123", 1));

		//System.out.println(searchRequest(3));
		//System.out.println(ProjectDao.getAllProject(1));
		// new File
		//Project project = ProjectDao.searchProject(39);
		//System.out.println(project);
		//List<Project> result = ProjectDao.getAllProject(1);
		//System.out.println(result);
		//project.setState(new State(2, "freigegeben"));
		//System.out.println(ProjectDao.countVotes(45));
		System.out.println(ProjectDao.getAllProject(1));
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
		
		
	}

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
