package pknu.it;

public class RestaurantDTO {
	int rno;
	int type;
	String rname;
	String addr;
	String call;
	
	public RestaurantDTO(int rno, int type, String rname, String addr, String call) {
		this.setRno(rno);
		this.setType(type);
		this.setRname(rname);
		this.setAddr(addr);
		this.setCall(call);
	}

	@Override
	public String toString() {
		return "RestaurantDTO [rno=" + rno + ", type=" + type + ", rname=" + rname + ", addr=" + addr + ", call=" + call
				+ "]";
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public void setType(int type) {
		this.type = type;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public int getRno() {
		return rno;
	}

	public int getType() {
		return type;
	}

	public String getRname() {
		return rname;
	}

	public String getAddr() {
		return addr;
	}

	public String getCall() {
		return call;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public void setCall(String call) {
		this.call = call;
	}

	
}
