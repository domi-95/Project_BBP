package user;

import database.UserDao;
import parameters.Parameters;

public class User {

	private int id;
	private String email;
	private String firstname;
	private String name;
	private Role role;

	public User(int id, String email, String firstname, String name, Role role) {
		super();
		this.id = id;
		this.email = email;
		this.firstname = firstname;
		this.name = name;
		this.role = role;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}
	

	public static boolean getUserLogin(String email, String password) {
		if (Parameters.HASHENABLE) {
			try {
				return Password.check(password, UserDao.getHash(email));
			} catch (Exception e) {
				System.out.println("Error while checking password");
				e.printStackTrace();
			}
		} else {
			if (UserDao.searchUserWithPw(email, password) != null) {
				return true;
			} else {
				return false;
			}
		}
		return false;

	}
	
	public static User getUser (int user_id) {
		return UserDao.searchUser(user_id);
	}
	
	public static User getUser (String email) {
		return UserDao.searchUser(email);
	}

	public static boolean createUser(String email, String name, String firstname, String password, int role_id) {

		if (UserDao.searchUser(email) != null) {
			return false;
		}
		if (Parameters.HASHENABLE) {
			try {
				password = Password.getSaltedHash(password);
			} catch (Exception e) {
				System.out.println("Error while hashing password");
				e.printStackTrace();
			}
		}
		return UserDao.safeUser(email, name, firstname, password, role_id);

	}


}
