package kr.co.domain;

public class ChattingVO {
	private int ch_no;
	private String mid;
	private int cno;
	private String ch_date;
	private String msg;
	
	public ChattingVO() {
		// TODO Auto-generated constructor stub
	}

	public ChattingVO(int ch_no, String mid, int cno, String ch_date, String msg) {
		super();
		this.ch_no = ch_no;
		this.mid = mid;
		this.cno = cno;
		this.ch_date = ch_date;
		this.msg = msg;
	}
	
	public int getCh_no() {
		return ch_no;
	}
	public void setCh_no(int ch_no) {
		this.ch_no = ch_no;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCh_date() {
		return ch_date;
	}
	public void setCh_date(String ch_date) {
		this.ch_date = ch_date;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}

	
	
}
