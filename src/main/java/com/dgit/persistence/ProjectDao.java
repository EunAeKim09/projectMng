package com.dgit.persistence;

import java.sql.SQLException;
import java.util.List;

import com.dgit.domain.Project;
import com.dgit.domain.ProjectContent;

public interface ProjectDao {
	public void insertProject(Project pro) throws SQLException;
	public void insertContent(String content) throws SQLException;
	
	public List<Project> selectProList() throws SQLException;
	
	public Project selectBynumProject(int num) throws SQLException;
	public ProjectContent selectBynumContent(int num) throws SQLException;
	
	public void updateBynumProject(Project pro) throws SQLException;
	public void updateBynumContent(ProjectContent con) throws SQLException;
	
	public void deleteBynumProject(int num) throws SQLException;
	public void deleteBynumContent(int num) throws SQLException;
}
