package com.dgit.domain;

public class ProjectContent {
	private int pro_num;
	private String content;
	
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return String.format("ContentDVO [pro_num=%s, content=%s]", pro_num, content);
	}
	
	
}
