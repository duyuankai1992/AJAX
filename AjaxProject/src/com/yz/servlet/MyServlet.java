package com.yz.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.yz.bean.Job;
import com.yz.dao.impl.JobDAOImpl;

public class MyServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       request.setCharacterEncoding("utf-8");
       response.setContentType("text/html;charset=utf-8");
       PrintWriter out=response.getWriter();
       
       //获取请求参数
       String id=request.getParameter("id");
       
       if(id!=null||!"".equals(id)){
       JobDAOImpl jobImpl=new JobDAOImpl();
       Job job=jobImpl.findJobById(Integer.parseInt(id));
       //将job对象转成jsonString
       /*Gson gson=new Gson();
       String jsonString=gson.toJson(job);*/
       String jsonString=JSON.toJSONString(job);
       System.out.println(jsonString);
       out.println(jsonString);
       }else{
    	  out.println("id错误！"); 
    	   
       }
       
       out.close();
	}
}
