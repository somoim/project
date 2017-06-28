package kr.co.domain;

public class StatusVO {
	private int sno;
	private int sl_no;
	private int cno;
	private String mid;
	public StatusVO() {
		// TODO Auto-generated constructor stub
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getSl_no() {
		return sl_no;
	}
	public void setSl_no(int sl_no) {
		this.sl_no = sl_no;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + sno;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		StatusVO other = (StatusVO) obj;
		if (sno != other.sno)
			return false;
		return true;
	}
	public StatusVO(int sno, int sl_no, int cno, String mid) {
		super();
		this.sno = sno;
		this.sl_no = sl_no;
		this.cno = cno;
		this.mid = mid;
	}
	@Override
	public String toString() {
		return "StatusVO [sno=" + sno + ", sl_no=" + sl_no + ", cno=" + cno + ", mid=" + mid + "]";
	}
	

}
