package com.yz.dao;

import java.util.List;

import com.yz.bean.Job;


public interface JobDAO {
	
    
    /**
     * ����id��ѯJOb
     * @param id
     * @return
     */
    public Job findJobById(int id);
    

    
}
