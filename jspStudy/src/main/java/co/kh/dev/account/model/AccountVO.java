package co.kh.dev.account.model;

import java.sql.Date;

public class AccountVO {
	private int no; // number(5,0) not null,
	private String name;// varchar2(20) not null,
	private String id;// varchar2(20) not null,
	private String pwd;// varchar2(20) not null,
	private Date regdate;// date not null

	public AccountVO() {
		super();
	}

	public AccountVO(int no, String name, String id, String pwd, Date regdate) {
		super();
		this.no = no;
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.regdate = regdate;
	}

	public AccountVO(String name, String id, String pwd) {
		super();
		this.name = name;
		this.id = id;
		this.pwd = pwd;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "MemberVO [no=" + no + ", name=" + name + ", id=" + id + ", pwd=" + pwd + ", regdate=" + regdate + "]";
	}
}
