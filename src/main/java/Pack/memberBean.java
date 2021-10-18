package Pack;

public class memberBean {
	private String mem_id;
	private String mem_name;
	private String mem_pass;
	private String mem_reg;
	private String mem_tel;
	private String mem_val_date;
	private int mem_cnt;
	private Boolean infoCheck=false;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public String getMem_reg() {
		return mem_reg;
	}
	public void setMem_reg(String mem_reg) {
		this.mem_reg = mem_reg;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_val_date() {
		return mem_val_date;
	}
	public void setMem_val_date(String mem_val_date) {
		this.mem_val_date = mem_val_date;
	}
	public int getMem_cnt() {
		return mem_cnt;
	}
	public void setMem_cnt(int mem_cnt) {
		this.mem_cnt = mem_cnt;
	}
	
	public Boolean getInfoCheck() {
		return infoCheck;
	}
	public void setInfoCheck(Boolean infoCheck) {
		this.infoCheck = infoCheck;
	}
	
}
