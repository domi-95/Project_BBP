package file;

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
		return FileDao.searchFile(project_id, 1);
	}
	
	public static File getFileOp (int op_id) {
		return FileDao.searchFile(op_id, 2);
	}
	
	public static File getFileBlog (int blog_id) {
		return FileDao.searchFile(blog_id, 3);
	}
	
	
	
	
	

}
