package kr.co.domain;


public class sGalleryVO {

	private int sg_no;
	private int	cno;
	private String mid;
	private String sg_picture;
	private String sg_writeday;
	private String name;
	
	 public sGalleryVO() {
		// TODO Auto-generated constructor stub
	 }

	public sGalleryVO(int sg_no, int cno, String mid, String sg_picture, String sg_writeday, String name) {
		super();
		this.sg_no = sg_no;
		this.cno = cno;
		this.mid = mid;
		this.sg_picture = sg_picture;
		this.sg_writeday = sg_writeday;
		this.name = name;
	}

	public int getSg_no() {
		return sg_no;
	}

	public void setSg_no(int sg_no) {
		this.sg_no = sg_no;
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

	public String getSg_picture() {
		return sg_picture;
	}

	public void setSg_picture(String sg_picture) {
		this.sg_picture = sg_picture;
	}

	public String getSg_writeday() {
		return sg_writeday;
	}

	public void setSg_writeday(String sg_writeday) {
		this.sg_writeday = sg_writeday;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "sGalleryVO [sg_no=" + sg_no + ", cno=" + cno + ", mid=" + mid + ", sg_picture=" + sg_picture
				+ ", sg_writeday=" + sg_writeday + ", name=" + name + "]";
	}
	
	 
}
