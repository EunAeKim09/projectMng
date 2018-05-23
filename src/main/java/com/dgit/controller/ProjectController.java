package com.dgit.controller;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.Project;
import com.dgit.domain.ProjectContent;
import com.dgit.persistence.ProjectDao;

@Controller
@RequestMapping("/proj/*")
public class ProjectController {
	@Autowired
	private ProjectDao dao;

	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	@RequestMapping(value = "/addproj", method = RequestMethod.GET)
	public String addProject() {
		logger.info("addproj Get..");

		return "/proj/ProjectForm";    
	}

	@ResponseBody
	@RequestMapping(value = "/addproj", method = RequestMethod.POST)
	public ResponseEntity<String> addProjectPost(@RequestBody Project pro, String content) throws Exception {
		logger.info("addprojResult....");
		logger.info(pro.toString());
		logger.info("content :" + content);
		ResponseEntity<String> entity = null;
		try{
			dao.insertProject(pro);
			dao.insertContent(content);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/projectList", method = RequestMethod.GET)
	public void projectList(Model model) throws SQLException {
		logger.info("projectList Get..");
		List<Project> list = dao.selectProList();

		model.addAttribute("list", list);
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(int num, Model model) throws Exception{
		logger.info("detail Get..");
		Project pro = dao.selectBynumProject(num);
		ProjectContent con = dao.selectBynumContent(num);

		model.addAttribute("pro", pro);
		model.addAttribute("con", con);
		logger.info("con : "+con);
		
		return "/proj/ProjectDetail";    
	}
	
	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	public String updateForm(int num, Model model)throws Exception{
		logger.info("detail Get..");
		Project pro = dao.selectBynumProject(num);
		ProjectContent con = dao.selectBynumContent(num);

		model.addAttribute("pro", pro);
		model.addAttribute("con", con);
		
		return "/proj/updateForm";       
	}
	
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<String> update(@RequestBody Project pro, String content)throws Exception{
		logger.info("update Get..");
		ResponseEntity<String> entity = null;
		try{
			logger.info("Project update 전: "+pro.toString());
			dao.updateBynumProject(pro);
			logger.info("Project update 후 : "+pro.toString());
			
			ProjectContent con = new ProjectContent();
			con.setPro_num(pro.getPro_num());
			con.setContent(content);
			logger.info("Content update 전 : "+con.toString());
			dao.updateBynumContent(con);
			logger.info("Content update 후 : "+con.toString());
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<String> deleteProject(int num) throws SQLException {
		logger.info("addproj Get..");
		ResponseEntity<String> entity = null;
		try{
			dao.deleteBynumContent(num);
			dao.deleteBynumProject(num);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
