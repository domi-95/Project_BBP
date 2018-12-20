package user;

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
	@Override
	public String toString() {
		return "User [id=" + id + ", email=" + email + ", firstname=" + firstname + ", lastname=" + name + ", role="
				+ role + "]";
	}
	
	
	
	

	
	
	
	

}
