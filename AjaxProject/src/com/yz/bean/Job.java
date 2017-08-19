package com.yz.bean;

public class Job {
	private int id;
	private String jname;
	private String jduty;
	private String jrequest;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getJname() {
		return jname;
	}

	public void setJname(String jname) {
		this.jname = jname;
	}

	public String getJduty() {
		return jduty;
	}

	public void setJduty(String jduty) {
		this.jduty = jduty;
	}

	public String getJrequest() {
		return jrequest;
	}

	public void setJrequest(String jrequest) {
		this.jrequest = jrequest;
	}

	@Override
	public String toString() {
		return "Job [id=" + id + ", jname=" + jname + ", jduty=" + jduty
				+ ", jrequest=" + jrequest + "]";
	}

}
