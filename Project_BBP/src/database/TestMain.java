package database;

import project.*;

public class TestMain {
	public static void main(String[] args) {

		// System.out.println(Dao.login("max.mustermann@bbp.de", "1234"));
		// System.out.println(Dao.searchUser("max.mustermann@bbp.de"));
//	System.out.println(Dao.safeUser("test@test.de", "Test", "Test", "test123", 1));
//	System.out.println(User.createUser("test@test.de", "Test", "Test", "test123", 1));

		//System.out.println(searchRequest(3));
		//System.out.println(ProjectDao.getAllProject(1));
		// new File
		Project project = ProjectDao.searchProject(25);
		System.out.println(project.getPicture().toString());
		project.setState(new State(2, "freigegeben"));
		
	}

}
