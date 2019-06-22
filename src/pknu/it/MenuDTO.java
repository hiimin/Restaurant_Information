package pknu.it;

public class MenuDTO {
	int rno;
	String mname;
	int price;
	
	public MenuDTO(int rno, String mname, int price) {
		this.setRno(rno);
		this.setMname(mname);
		this.setPrice(price);
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getRno() {
		return rno;
	}

	public String getMname() {
		return mname;
	}

	public int getPrice() {
		return price;
	}

	@Override
	public String toString() {
		return "MenuDTO [rno=" + rno + ", mname=" + mname + ", price=" + price + "]";
	}

	
}
