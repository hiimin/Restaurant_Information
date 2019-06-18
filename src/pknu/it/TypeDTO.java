package pknu.it;

public class TypeDTO {
	int tno;
	String tname;
	
	public TypeDTO(int tno, String tname) {
		this.setTno(tno);
		this.setTname(tname);
	}

	public void setTno(int tno) {
		this.tno = tno;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	@Override
	public String toString() {
		return "TypeDTO [tno=" + tno + ", tname=" + tname + "]";
	}

	public int getTno() {
		return tno;
	}

	public String getTname() {
		return tname;
	}

	
}
