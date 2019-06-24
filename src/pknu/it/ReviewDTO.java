package pknu.it;

public class ReviewDTO {
	int mno;
	int rno;
	int vno;
	int grade;
	
	public ReviewDTO(int mno, int rno, int vno, int grade) {
		this.setRno(mno);
		this.setMno(rno);
		this.setVno(vno);
		this.setGrade(grade);
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	@Override
	public String toString() {
		return "ReviewDTO [mno=" + mno + ", rno=" + rno + ", vno=" + vno + ", grade=" + grade + "]";
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public void setVno(int vno) {
		this.vno = vno;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public int getMno() {
		return mno;
	}
	
	public int getRno() {
		return rno;
	}
	
	public int getVno() {
		return vno;
	}
	
	public int getGrade() {
		return grade;
	}
}
