package database;

import java.util.List;

import project.Project;

public class TestMain {
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
		//System.out.println(ProjectDao.countVotes(46));
		//System.out.println(ProjectDao.getAllProject(1));
		//project.setComment("ein test kommentar wurde eingefügt");
		//System.out.println(ProjectDao.searchProject(39));
		System.out.println(FileDao.searchFile(39));
	}

}
