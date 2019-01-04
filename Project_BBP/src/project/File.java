package project;

import database.FileDao;

public class File {
	
	private byte[] file;

	public File(byte[] file) {
		super();
		this.file = file;
	}

	public byte[] getFile() {
		return file;
	}
	
	public static File getFileProject (int project_id) {
		return FileDao.searchFile(project_id);
	}
	
	
	
	
	

}
