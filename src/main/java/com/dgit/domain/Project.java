package com.dgit.domain;

import java.util.Date;

public class Project {
	private int pro_num;
	private String name;
	private Date startdate;
	private Date enddate;
	private String state;
	
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return String.format("Project [pro_num=%s, name=%s, startdate=%s, enddate=%s, state=%s]", pro_num, name,
				startdate, enddate, state);
	}        
}
