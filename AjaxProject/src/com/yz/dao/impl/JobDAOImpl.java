package com.yz.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.yz.bean.Job;
import com.yz.dao.JobDAO;
import com.yz.util.JDBCUtil;


public class JobDAOImpl implements JobDAO {

	

	@Override
	public Job findJobById(int id) {
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs = null;
		Job job = null;
		try {

			conn = JDBCUtil.getConnection();
			String sql = "select * from t_job where id=?";
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, id);
			rs = pstat.executeQuery();

			if (rs.next()) {
				job = new Job();
				job.setId(id);
				job.setJname(rs.getString("name"));
				job.setJduty(rs.getString("duty"));
				job.setJrequest(rs.getString("request"));

			}
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.closeResource(conn, pstat, rs);
		}

		return job;
	}

	

}
