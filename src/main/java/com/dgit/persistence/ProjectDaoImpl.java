package com.dgit.persistence;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Project;
import com.dgit.domain.ProjectContent;

@Repository
public class ProjectDaoImpl implements ProjectDao{
	
	@Autowired
	SqlSession session;
	
	public static final String namespace = "com.dgit.mapper.ProjectMapper.";
	
	@Override
	public void insertProject(Project pro) throws SQLException {
		session.insert(namespace+"insertProject", pro);
	}

	@Override
	public void insertContent(String content) throws SQLException {
		session.insert(namespace+"insertContent", content);
	}

	@Override
	public List<Project> selectProList() throws SQLException {
		return session.selectList(namespace+"selectProList");
	}

	@Override
	public Project selectBynumProject(int num) throws SQLException {
		return session.selectOne(namespace+"selectBynumProject", num);
	}

	@Override
	public ProjectContent selectBynumContent(int num) throws SQLException {
		return session.selectOne(namespace+"selectBynumContent", num);
	}

	@Override
	public void updateBynumProject(Project pro) throws SQLException {
		session.update(namespace+"updateBynumProject", pro);
	}

	@Override
	public void updateBynumContent(ProjectContent con) throws SQLException {
		session.update(namespace+"updateBynumContent", con);
	}

	@Override
	public void deleteBynumProject(int num) throws SQLException {
		session.delete(namespace+"deleteBynumProject", num);
	}

	@Override
	public void deleteBynumContent(int num) throws SQLException {
		session.delete(namespace+"deleteBynumContent", num);
	}

}
