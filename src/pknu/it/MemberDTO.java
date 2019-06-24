package pknu.it;

public class MemberDTO {
	int mno;
	String mid;
	String mpass;
	String mclass;
	
	public MemberDTO(int mno, String mid, String mpass, String mclass) {
		this.setMno(mno);
		this.setMid(mid);
		this.setMpass(mpass);
		this.setMclass(mclass);
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	@Override
	public String toString() {
		return "MemberDTO [mno=" + mno + ", mid=" + mid + ", mpass=" + mpass + ", mclass=" + mclass + "]";
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public void setMpass(String mpass) {
		this.mpass = mpass;
	}

	public void setMclass(String mclass) {
		this.mclass = mclass;
	}

}
