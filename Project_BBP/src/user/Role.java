package user;

public class Role {
	
	private int id;
	private String bezeichnung;
	

	
	public Role(int id, String bezeichnung) {
		super();
		this.id = id;
		this.bezeichnung = bezeichnung;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBezeichnung() {
		return bezeichnung;
	}
	public void setBezeichnung(String bezeichnung) {
		this.bezeichnung = bezeichnung;
	}
	
	@Override
	public String toString() {
		return "Role [id=" + id + ", bezeichnung=" + bezeichnung + "]";
	} 
	
	
	
	

}
