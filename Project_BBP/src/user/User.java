package user;

import database.*;

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

	public static User getUserLogin(String email, String password) {
		String hashpassword = null;
//		User u = UserDao.searchUser(email);
//		if (u == null) {
//			return null;
//		}
		try {
			boolean validate = Password.check(password, UserDao.validatePassword(email));
			
			if (validate) {
				return UserDao.searchUser(email);
			}
			else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//return UserDao.searchUserWithPw(email, hashpassword);
		return null;
		

	}
	
	public static User getUser (int user_id) {
		return UserDao.searchUser(user_id);
	}

	public static User createUser(String email, String name, String firstname, String password, int role_id) {
		String hashpassword = null;
		if (UserDao.searchUser(email) != null) {
			return null;
		}
		try {
			 hashpassword = Password.getSaltedHash(password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return UserDao.safeUser(email, name, firstname, hashpassword, role_id);

	}
	
	


}
