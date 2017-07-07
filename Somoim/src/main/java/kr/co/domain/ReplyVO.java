package kr.co.domain;

public class ReplyVO {

	private int re_no;
	private String	mid;
	private int sg_no;
	private int	sb_no;
	private String re_content;
	private String re_writeday;
	private String name;
	
	public ReplyVO() {
		// TODO Auto-generated constructor stub
	}

	public ReplyVO(int re_no, String mid, int sg_no, int sb_no, String re_content, String re_writeday, String name) {
		super();
		this.re_no = re_no;
		this.mid = mid;
		this.sg_no = sg_no;
		this.sb_no = sb_no;
		this.re_content = re_content;
		this.re_writeday = re_writeday;
		this.name = name;
	}

	public int getRe_no() {
		return re_no;
	}

	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getSg_no() {
		return sg_no;
	}

	public void setSg_no(int sg_no) {
		this.sg_no = sg_no;
	}

	public int getSb_no() {
		return sb_no;
	}

	public void setSb_no(int sb_no) {
		this.sb_no = sb_no;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public String getRe_writeday() {
		return re_writeday;
	}

	public void setRe_writeday(String re_writeday) {
		this.re_writeday = re_writeday;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "ReplyVO [re_no=" + re_no + ", mid=" + mid + ", sg_no=" + sg_no + ", sb_no=" + sb_no + ", re_content="
				+ re_content + ", re_writeday=" + re_writeday + ", name=" + name + "]";
	}
	
}
