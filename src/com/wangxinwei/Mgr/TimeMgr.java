package com.wangxinwei.Mgr;

import java.sql.Timestamp;
import com.wangxinwei.model.*;
import com.wangxinwei.dao.*;

public class TimeMgr {
	//单例模式
	//设置一个静态的对象
	private static TimeMgr tm=null;
	TimeDAO dao=null;
	//静态块构造一个 sm
	static {
		if(tm==null)
		{
			tm=new TimeMgr();
			//you should read the config file to set the specific dao object
			tm.setDAO(new TimeMySqlDAO());
		}
	}
	//构造一个私有的构造方法
	private TimeMgr() {}
	//得到StudentMgr
	public static TimeMgr getInstance() {
		return tm;
	}
	//设置DAO
	public void setDAO(TimeDAO dao)
	{
		this.dao=dao;
	}
	
	/**
	 * 设置志愿填报的时间段
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public boolean setTime(Timestamp startTime,Timestamp endTime)
	{
		return dao.setTime(startTime,endTime);
	}
	
	/**
	 * 获取志愿填报时间段
	 */
	public void getTime(Time time) {
		dao.getTime(time);
	}
}
